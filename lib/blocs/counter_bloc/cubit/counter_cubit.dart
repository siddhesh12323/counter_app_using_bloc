import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0, changeFactor: 0));

  void increment() => emit(CounterState(count: state.count+1, changeFactor: 1));

  void decrement() => emit(CounterState(count: state.count-1, changeFactor: -1));

  void clear() => emit(CounterState(count: 0, changeFactor: 0));
}
