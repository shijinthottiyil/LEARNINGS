import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Timer? _timer;
  static const _timerLimt = 10;
  int _time = _timerLimt;

  TimerBloc() : super(TimerInitial(time: _timerLimt)) {
    on<StartTimerEvent>((event, emit) => _startTimer(timerEvent: event));

    on<UpdateTimerEvent>((event, emit) {
      final time = event.time;
      if (time >= 0) {
        emit(DecreasingTimerState(time: time));
        return;
      }
      _time = 10;
      emit(TimerInitial(time: _timerLimt));
    });

    on<PauseTimerEvent>((event, emit) {
      _timer?.cancel();
      final time = state.time;
      emit(PausedTimerState(time: time));
    });

    on<ResumeTimerEvent>((event, emit) => _startTimer(timerEvent: event));
  }

  void _startTimer({required TimerEvent timerEvent}) {
    if (timerEvent is StartTimerEvent) _time = _timerLimt;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _time--;
      add(UpdateTimerEvent(time: _time));
      if (_time < 0) timer.cancel();
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
