import 'package:bloc_learning/counter_app/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              '${state.count}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterBloc.add(CounterIncrementEvent()),
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}
