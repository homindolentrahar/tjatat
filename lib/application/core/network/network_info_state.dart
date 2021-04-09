part of 'network_info_cubit.dart';

@freezed
class NetworkInfoState with _$NetworkInfoState {
  const factory NetworkInfoState.initial() = _Initial;

  const factory NetworkInfoState.connected(
    NetworkConnectionInfo connectionInfo,
  ) = _Connected;

  const factory NetworkInfoState.disconnected(
    NetworkFailure networkFailure,
  ) = _Disconnected;
}
