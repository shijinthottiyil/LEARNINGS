import 'package:bloc_learning/timer_app/timer/bloc/timer_bloc.dart';
import 'package:bloc_learning/timer_app/timer/view/timer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => TimerBloc())],
        child: TimerView(),
      ),
    );
  }
}
