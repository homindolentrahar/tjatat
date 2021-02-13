import 'package:dartz/dartz.dart';
import 'package:tjatat/domain/core/failures.dart';
import 'package:tjatat/domain/core/value_validators.dart';
import 'package:tjatat/domain/core/value_objects.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(validatePassword(input));
  }

  const Password._(this.value);
}

class ConfirmPassword extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ConfirmPassword(String input, String password) {
    assert(input != null);
    assert(password != null);
    return ConfirmPassword._(validateConfirmPassword(password, input));
  }

  const ConfirmPassword._(this.value);
}
