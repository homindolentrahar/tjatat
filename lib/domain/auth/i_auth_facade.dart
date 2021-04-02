import 'package:dartz/dartz.dart';
import 'package:tjatat/domain/auth/auth_failure.dart';
import 'package:tjatat/domain/auth/auth_user.dart';
import 'package:tjatat/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  bool get isUserVerified;

  Future<Option<AuthUser>> getSignedInUser();

  Future<void> signOut();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required Username username,
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<Either<AuthFailure, Unit>> sendForgotPasswordEmail({
    required EmailAddress emailAddress,
  });

  Future<Either<AuthFailure, Unit>> verifyEmailAddress();
}
