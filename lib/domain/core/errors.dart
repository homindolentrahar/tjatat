import 'package:tjatat/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() =>
      Error.safeToString("Unexpected Error. Failure was $valueFailure");
}
