import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:tjatat/domain/core/errors.dart';
import 'package:tjatat/domain/core/failures.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    return value.fold(
      (failure) => throw UnexpectedValueError(failure),
      id,
    );
  }

  bool isValid() => value.isRight();

  @override
  String toString() => "ValueObject($value)";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(Right(Uuid().v1()));
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(Right(uniqueId));
  }

  const UniqueId._(this.value);
}
