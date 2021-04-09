import 'package:dartz/dartz.dart';
import 'package:tjatat/domain/core/network_failure.dart';

class NetworkConnectionInfo {
  final String ipAddress;
  final String host;

  NetworkConnectionInfo(this.ipAddress, this.host);
}

abstract class INetworkInfo {
  Future<Either<NetworkFailure, NetworkConnectionInfo>> get isConnected;

  Stream<Either<NetworkFailure, NetworkConnectionInfo>> get onConnectionChange;
}
