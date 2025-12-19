part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

/// METHOD TO EXECUTE WHEN USER WANTS TO INCREASE COUNTER.
final class CounterIncrementEvent extends CounterEvent {}
