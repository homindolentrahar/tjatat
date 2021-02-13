import 'package:firebase_auth/firebase_auth.dart';
import 'package:tjatat/domain/auth/auth_user.dart';
import 'package:tjatat/domain/auth/value_objects.dart';
import 'package:tjatat/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  AuthUser toDomain() {
    return AuthUser(
      id: UniqueId.fromUniqueString(uid),
      email: EmailAddress(email),
      loginAt: metadata.lastSignInTime,
    );
  }
}
