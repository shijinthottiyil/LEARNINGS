import 'package:bloc_learning/timer_app/timer/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TimerBloc, TimerState>(
              builder: (context, state) {
                return Text(
                  '${state.time}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 200),
            BlocBuilder<TimerBloc, TimerState>(
              builder: (context, state) {
                if (state is TimerInitial) {
                  return GestureDetector(
                    onTap: () =>
                        context.read<TimerBloc>().add(StartTimerEvent()),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.green,
                      ),
                      child: Center(child: Icon(Icons.play_arrow)),
                    ),
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 50,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (state is DecreasingTimerState) {
                          context.read<TimerBloc>().add(PauseTimerEvent());
                        } else {
                          context.read<TimerBloc>().add(ResumeTimerEvent());
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: state is DecreasingTimerState
                              ? Icon(Icons.pause)
                              : Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          context.read<TimerBloc>().add(StartTimerEvent()),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.green,
                        ),
                        child: Center(child: Icon(Icons.repeat)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
