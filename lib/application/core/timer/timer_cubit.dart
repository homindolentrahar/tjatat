import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tjatat/utils/ticker.dart';

part 'timer_cubit.freezed.dart';
part 'timer_state.dart';

const int duration = 60;

@injectable
class TimerCubit extends Cubit<TimerState> {
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  TimerCubit(this._ticker) : super(const TimerState.ready(duration));

  void start(int duration) {
    emit(TimerState.running(duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: duration).listen((duration) {
      _tick(duration);
    });
  }

  void _tick(int duration) {
    emit(duration > 0
        ? TimerState.running(duration)
        : const TimerState.finished());
  }

  @override
  Future<void> close() async {
    _tickerSubscription?.cancel();
    super.close();
  }
}
