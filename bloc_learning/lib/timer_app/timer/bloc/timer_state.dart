part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState({required this.time});
  final int time;
  @override
  List<Object?> get props => [time];
}

final class TimerInitial extends TimerState {
  const TimerInitial({required super.time});
}

final class DecreasingTimerState extends TimerState {
  const DecreasingTimerState({required super.time});
}

final class PausedTimerState extends TimerState {
  const PausedTimerState({required super.time});
}
