part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  final List<TaskModel> tasksList;
  const TaskState(this.tasksList);

  @override
  List<Object> get props => [tasksList];
}

final class InitialTask extends TaskState {
  const InitialTask() : super(const []);
}

final class UpdateTask extends TaskState {
  const UpdateTask(super.tasksList);
}
