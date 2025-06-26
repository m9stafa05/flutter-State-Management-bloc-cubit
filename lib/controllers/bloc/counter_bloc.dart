import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInit()) {
    on<CounterIncrement>((event, emit) {
      emit(CounterUpdate(state.count + 1));
    });
    on<CounterDecrement>((event, emit) {
      if (state.count == 0) return;
      emit(CounterUpdate(state.count - 1));
    });
  }
}
