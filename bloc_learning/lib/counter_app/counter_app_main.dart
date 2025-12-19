import 'package:bloc_learning/counter_app/counter/bloc/counter_bloc.dart';
import 'package:bloc_learning/counter_app/counter/view/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyCounterApp());
}

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CounterBloc())],
      child: MaterialApp(home: CounterView()),
    );
  }
}
