import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>((event, emit) {
      final count = state.count;
      final incrementedCount = count + 1;
      print('''
COUNT = $count\nINCREMENTED COUNT = $incrementedCount
''');
      emit(CounterIncrementState(incrementedCount: incrementedCount));
    });
  }
}
