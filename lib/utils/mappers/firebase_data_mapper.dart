import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tjatat/domain/auth/auth_user.dart';
import 'package:tjatat/domain/auth/value_objects.dart';
import 'package:tjatat/domain/core/value_objects.dart';
import 'package:tjatat/infrastructure/auth/auth_user_dto.dart';
import 'package:tjatat/injection.dart';
import 'package:tjatat/utils/mappers/firestore_data_mapper.dart';

extension FirebaseUserX on User {
  Future<AuthUser> toDomain() async {
    final userDocument = getIt<FirebaseFirestore>().userDocument(uid);
    final username = await userDocument
        .get()
        .then((snapshot) => snapshot.get("username").toString());

    return AuthUser(
      id: UniqueId.fromUniqueString(uid),
      username: Username(username),
      emailAddress: EmailAddress(email!),
      lastSignedIn: metadata.lastSignInTime!,
    );
  }
}

extension FirebaseUserCredentialX on UserCredential {
  Future<bool> checkIfUserExisted() async {
    final userDocument = getIt<FirebaseFirestore>().userDocument(user!.uid);
    final snapshot = await userDocument.get();

    return snapshot.exists;
  }

  void updateLastSignedIn() {
    final userDocument = getIt<FirebaseFirestore>().userDocument(user!.uid);
    final lastSignedIn = user!.metadata.lastSignInTime!.millisecondsSinceEpoch;
    final updatedLastSignedIn = {'lastSignedIn': lastSignedIn};

    userDocument.update(updatedLastSignedIn);
  }

  void storeUserData(String username) {
    final userDocument = getIt<FirebaseFirestore>().userDocument(user!.uid);
    final userDataJson = AuthUserDto(
      username: username,
      emailAddress: user!.email!,
      lastSignedIn: user!.metadata.lastSignInTime!.millisecondsSinceEpoch,
    ).toJson();

    userDocument.set(userDataJson);
  }
}
