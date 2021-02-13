import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure{
  factory AuthFailure.cancelByUser() = CancelByUser;
  factory AuthFailure.serverError() = ServerError;
  factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  factory AuthFailure.invalidEmailAndPassword() = InvalidEmailAndPassword;
}