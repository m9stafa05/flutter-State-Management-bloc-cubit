import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(CounterInit());

  void increment() {
    emit(state.copyWith(count: state.count + 1));
  }

  void decrement() {
    if (state.count == 0) return;
    emit(state.copyWith(count: state.count - 1));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterUpdate(json['count']);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return {'count': state.count};
  }
}
