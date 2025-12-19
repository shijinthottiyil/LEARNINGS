part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState({required this.count});

  final int count;

  @override
  List<Object> get props => [count];
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(count: 0);
}

final class CounterIncrementState extends CounterState {
  const CounterIncrementState({required int incrementedCount})
    : super(count: incrementedCount);
}
