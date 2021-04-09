import 'dart:developer';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tjatat/domain/core/i_network_info.dart';
import 'package:tjatat/domain/core/network_failure.dart';

@LazySingleton(as: INetworkInfo)
class NetworkInfo implements INetworkInfo {
  final Connectivity _connectivity;

  NetworkInfo(this._connectivity);

  @override
  Future<Either<NetworkFailure, NetworkConnectionInfo>> get isConnected async {
    late Either<NetworkFailure, NetworkConnectionInfo> connection;
    final connectivityResult = await _connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final networkResult = await InternetAddress.lookup("google.com");

        if (networkResult.isNotEmpty &&
            networkResult[0].rawAddress.isNotEmpty) {
          final ipAddress = networkResult[0].address;
          final host = networkResult[0].host;

          connection = right(NetworkConnectionInfo(ipAddress, host));
        } else {
          connection = left(const NetworkFailure.connectionUnavailable());
        }
      } on SocketException catch (_) {
        connection = left(const NetworkFailure.connectionUnavailable());
      }
    } else {
      connection = left(const NetworkFailure.connectionUnavailable());
    }

    return connection;
  }

  @override
  Stream<Either<NetworkFailure, NetworkConnectionInfo>>
      get onConnectionChange async* {
    final connectivityResult = await _connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      yield left(const NetworkFailure.connectionUnavailable());
      log(connectivityResult.toString());
    }

    await for (final ConnectivityResult connectivityResult
        in _connectivity.onConnectivityChanged) {
      log(connectivityResult.toString());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        try {
          final networkResult = await InternetAddress.lookup("google.com");

          if (networkResult.isNotEmpty &&
              networkResult[0].rawAddress.isNotEmpty) {
            final ipAddress = networkResult[0].address;
            final host = networkResult[0].host;

            yield right(NetworkConnectionInfo(ipAddress, host));
          } else {
            yield left(const NetworkFailure.connectionUnavailable());
          }
        } on SocketException catch (_) {
          yield left(const NetworkFailure.connectionUnavailable());
        }
      } else if (connectivityResult == ConnectivityResult.none) {
        yield left(const NetworkFailure.connectionUnavailable());
      } else {
        yield left(const NetworkFailure.unexpected());
      }
    }
  }
}
