import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_failure.freezed.dart';

@freezed
class NetworkFailure with _$NetworkFailure {
  const factory NetworkFailure.connectionUnavailable() = _ConnectionUnavailable;

  const factory NetworkFailure.unexpected() = _Unexpected;
}
