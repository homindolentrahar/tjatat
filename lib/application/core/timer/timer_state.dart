part of 'timer_cubit.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState.ready(int duration) = _Ready;

  const factory TimerState.running(int duration) = _Running;

  const factory TimerState.finished() = _Finished;
}
