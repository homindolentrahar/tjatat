import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:tjatat/domain/auth/auth_failure.dart';
import 'package:tjatat/domain/auth/auth_user.dart';
import 'package:tjatat/domain/auth/i_auth_facade.dart';
import 'package:tjatat/domain/auth/value_objects.dart';
import 'package:tjatat/domain/core/i_network_info.dart';
import 'package:tjatat/utils/mappers/firebase_data_mapper.dart';
import 'package:tjatat/utils/mappers/firestore_data_mapper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;
  final INetworkInfo _networkInfo;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this._firestore,
    this._networkInfo,
  );

  @override
  bool get isUserVerified => _firebaseAuth.currentUser!.emailVerified;

  @override
  Future<Option<AuthUser>> getSignedInUser() async =>
      optionOf(await _firebaseAuth.currentUser?.toDomain());

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);

  @override
  Future<void> reload() async {
    await _firebaseAuth.currentUser!.reload();
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required Username username,
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final usernameStr = username.getOrCrash();
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    final isConnected = await _networkInfo.isConnected;

    return isConnected.fold(
      (failure) => left(const AuthFailure.networkUnavailable()),
      (info) async {
        dev.log("Connected on : ${info.host} / ${info.ipAddress}");
        //  This section will be checking if username is taken or not
        // If it's taken, then we will notify user to take another username
        final collectionRef = _firestore.usersCollection;
        final usernameTaken = await collectionRef
            .where("username", isEqualTo: usernameStr)
            .get()
            .then((querySnapshot) => querySnapshot.docs.isNotEmpty);

        if (usernameTaken) {
          return left(const AuthFailure.usernameAlreadyTaken());
        }

        try {
          await _firebaseAuth
              .createUserWithEmailAndPassword(
                email: emailAddressStr,
                password: passwordStr,
              )
              .then(
                (userCredential) => userCredential.storeUserData(usernameStr),
              );

          return right(unit);
        } on FirebaseAuthException catch (e) {
          logException(e.message, e.code, e);
          if (e.code == 'email-already-in-use') {
            return left(const AuthFailure.emailAlreadyInUse());
          } else {
            return left(const AuthFailure.serverError());
          }
        }
      },
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    final isConnected = await _networkInfo.isConnected;

    return isConnected.fold(
      (failure) => left(const AuthFailure.networkUnavailable()),
      (info) async {
        dev.log("Connected on : ${info.host} / ${info.ipAddress}");

        try {
          await _firebaseAuth
              .signInWithEmailAndPassword(
                email: emailAddressStr,
                password: passwordStr,
              )
              .then((userCredential) => userCredential.updateLastSignedIn());

          return right(unit);
        } on FirebaseAuthException catch (e) {
          logException(e.message, e.code, e);
          if (e.code == 'wrong-password' || e.code == 'user-not-found') {
            return left(const AuthFailure.invalidEmailAndPassword());
          } else {
            return left(const AuthFailure.serverError());
          }
        }
      },
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    final isConnected = await _networkInfo.isConnected;

    return isConnected.fold(
      (failure) => left(const AuthFailure.networkUnavailable()),
      (info) async {
        dev.log("Connected on : ${info.host} / ${info.ipAddress}");

        try {
          final googleUser = await _googleSignIn.signIn();

          if (googleUser == null) {
            return left(const AuthFailure.cancelledByUser());
          }

          final googleAuth = await googleUser.authentication;
          final credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          );

          return _firebaseAuth.signInWithCredential(credential).then(
            (userCredential) async {
              //  When user signed in with Google, we don't know what kind of
              //  username that user want. So we just set email as username, so that user
              //  can change their username later.
              final placeholderUsername = userCredential.user!.email!;

              if (await userCredential.checkIfUserExisted()) {
                userCredential.updateLastSignedIn();
              } else {
                userCredential.storeUserData(placeholderUsername);
              }
              return right(unit);
            },
          );
        } on FirebaseException catch (e) {
          logException(e.message, e.code, e);
          return left(const AuthFailure.serverError());
        }
      },
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> verifyEmailAddress() async {
    final isConnected = await _networkInfo.isConnected;

    return isConnected.fold(
      (failure) => left(const AuthFailure.networkUnavailable()),
      (info) async {
        dev.log("Connected on : ${info.host} / ${info.ipAddress}");

        try {
          final currentUser = _firebaseAuth.currentUser;
          if (currentUser != null) {
            await currentUser.sendEmailVerification();

            return right(unit);
          } else {
            return left(const AuthFailure.userNotSignedIn());
          }
        } on FirebaseAuthException catch (e) {
          logException(e.message, e.code, e);
          return left(const AuthFailure.emailVerificationFailed());
        }
      },
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> sendForgotPasswordEmail({
    required EmailAddress emailAddress,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();

    final isConnected = await _networkInfo.isConnected;

    return isConnected.fold(
      (failure) => left(const AuthFailure.networkUnavailable()),
      (info) async {
        dev.log("Connected on : ${info.host} / ${info.ipAddress}");

        try {
          await _firebaseAuth.sendPasswordResetEmail(email: emailAddressStr);

          return right(unit);
        } on FirebaseAuthException catch (e) {
          logException(e.message, e.code, e);
          if (e.code == "user-not-found") {
            return right(unit);
          } else {
            return left(const AuthFailure.failedToSendForgotPasswordEmail());
          }
        }
      },
    );
  }

  void logException(String? message, String code, Exception e) {
    dev.log("Message : $message", name: code, error: e);
  }
}
