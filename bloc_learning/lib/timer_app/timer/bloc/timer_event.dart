part of 'timer_bloc.dart';

sealed class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

final class StartTimerEvent extends TimerEvent {}

final class PauseTimerEvent extends TimerEvent {}

final class UpdateTimerEvent extends TimerEvent {
  const UpdateTimerEvent({required this.time});
  final int time;
}

final class ResumeTimerEvent extends TimerEvent {}
