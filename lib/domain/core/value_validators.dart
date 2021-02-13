import 'package:dartz/dartz.dart';
import 'package:tjatat/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return Right(input);
  } else {
    return Left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 8) {
    return Right(input);
  } else {
    return Left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateConfirmPassword(
  String password,
  String input,
) {
  return password == input && input.length >= 8
      ? Right(input)
      : Left(
          ValueFailure.confirmPasswordNotMatch(failedValue: input),
        );
}
