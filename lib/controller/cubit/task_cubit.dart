import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/models/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(InitialTask());

  void addTask(TaskModel model) {
    // emit(UpdateTask(List.from(state.tasks)..add(model)));
    emit(UpdateTask([...state.tasksList, model]));
  }

  void removeTask(int id) {
    final List<TaskModel> newList = state.tasksList.where((task) {
      return task.id != id;
    }).toList();
    emit(UpdateTask(newList));
  }

  void toggleTask(int id) {
    final List<TaskModel> newList = state.tasksList.map((task) {
      if (task.id == id) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
    emit(UpdateTask(newList));
  }
}
