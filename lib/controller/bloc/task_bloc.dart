import 'package:equatable/equatable.dart';
import 'package:flutter_state_management/models/task_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uuid/uuid.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(InitialTask()) {
    on<AddTaskEvent>((event, emit) {
      final model = TaskModel(
        title: event.title,
        isCompleted: false,
        id: Uuid().v1(),
      );
      // emit(UpdateTask(List.from(state.tasks)..add(model)));
      emit(UpdateTask([...state.tasksList, model]));
    });

    on<RemoveTaskEvent>((event, emit) {
      final List<TaskModel> newList = state.tasksList.where((task) {
        return task.id != event.id;
      }).toList();
      emit(UpdateTask(newList));
    });

    on<ToggleTaskEvent>((event, emit) {
      final List<TaskModel> newList = state.tasksList.map((task) {
        if (task.id == event.id) {
          return task.copyWith(isCompleted: !task.isCompleted);
        }
        return task;
      }).toList();
      emit(UpdateTask(newList));
    });
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    final tasksJson = json['todoList'] as List<dynamic>?;
    if (tasksJson == null) return InitialTask();
    final tasks = tasksJson
        .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return UpdateTask(tasks);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return {
      'todoList': state.tasksList
          .map((todo) => todo.toJson())
          .toList(),
    };
  }
}
