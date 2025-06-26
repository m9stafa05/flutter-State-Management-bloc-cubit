part of 'counter_cubit.dart';

@immutable
sealed class CounterState extends Equatable {
  final int count;

  const CounterState({required this.count});

  @override
  List<Object?> get props => [count];
}

class CounterInit extends CounterState {
  const CounterInit() : super(count: 0);
}

class CounterUpdate extends CounterState {
  const CounterUpdate(int count) : super(count: count);
}
