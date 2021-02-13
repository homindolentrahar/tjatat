import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  factory ValueFailure.invalidEmail({@required String failedValue}) =
  InvalidEmail<T>;

  factory ValueFailure.shortPassword({@required String failedValue}) =
  ShortPassword<T>;

  factory ValueFailure.confirmPasswordNotMatch({@required String failedValue}) = ConfirmPasswordNotMatch<T>;
}