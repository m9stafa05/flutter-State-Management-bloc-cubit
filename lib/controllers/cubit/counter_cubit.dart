import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInit());

  void increment() {
    emit(CounterUpdate(state.count + 1));
  }

  void decrement() {
    if (state.count == 0) return;
    emit(CounterUpdate(state.count - 1));
  }
}
