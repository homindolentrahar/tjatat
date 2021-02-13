import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:tjatat/domain/auth/auth_failure.dart';
import 'package:tjatat/domain/auth/i_auth_facade.dart';
import 'package:tjatat/domain/auth/auth_user.dart';
import 'package:tjatat/domain/auth/value_objects.dart';
import 'package:tjatat/infrastructure/auth/firebase_user_mapper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Future<Option<AuthUser>> getSignedInUser() =>
      Future.value(optionOf(_firebaseAuth.currentUser?.toDomain()));

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    EmailAddress emailAddress,
    Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );

      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return Left(AuthFailure.emailAlreadyInUse());
      } else {
        return Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    EmailAddress emailAddress,
    Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );

      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password" || e.code == "user-not-found") {
        return Left(AuthFailure.invalidEmailAndPassword());
      } else {
        return Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Left(AuthFailure.cancelByUser());
      }

      final googleAuthentication = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      return _firebaseAuth.signInWithCredential(credential).then(
            (_) => const Right(unit),
          );
    } on FirebaseAuthException catch (_) {
      return Left(AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);
}
