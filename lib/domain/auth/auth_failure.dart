import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = _CancelledByUser;

  const factory AuthFailure.serverError() = _ServerError;

  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;

  const factory AuthFailure.invalidEmailAndPassword() =
      _InvalidEmailAndPassword;

  const factory AuthFailure.insufficientPermission() = _InsufficientPermission;

  const factory AuthFailure.failedToSendForgotPasswordEmail() =
      _FailedToSendForgotPasswordEmail;

  const factory AuthFailure.emailVerificationFailed() =
      _EmailVerificationFailed;

  const factory AuthFailure.userNotSignedIn() = _UserNotSignedIn;

  const factory AuthFailure.usernameAlreadyTaken() = _UsernameAlreadyTaken;

  const factory AuthFailure.unexpected() = _Unexpected;
}
