part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final String title;

  const AddTaskEvent({required this.title});
}

class RemoveTaskEvent extends TaskEvent {
  final String id;
  const RemoveTaskEvent({required this.id});
}

class ToggleTaskEvent extends TaskEvent {
  final String id;
  const ToggleTaskEvent({required this.id});
}
