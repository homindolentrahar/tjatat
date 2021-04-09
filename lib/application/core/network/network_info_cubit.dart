import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tjatat/domain/core/i_network_info.dart';
import 'package:tjatat/domain/core/network_failure.dart';

part 'network_info_cubit.freezed.dart';
part 'network_info_state.dart';

@injectable
class NetworkInfoCubit extends Cubit<NetworkInfoState> {
  final INetworkInfo _networkInfo;

  NetworkInfoCubit(this._networkInfo)
      : super(const NetworkInfoState.initial()) {
    _networkInfo.onConnectionChange.listen((either) {
      either.fold(
        (failure) => emit(NetworkInfoState.disconnected(failure)),
        (info) => emit(NetworkInfoState.connected(info)),
      );
    });
  }
}
