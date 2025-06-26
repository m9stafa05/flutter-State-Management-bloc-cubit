import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  const TaskModel(this.title, this.isCompleted, {required this.id});
  final int id;
  final String? title;
  final bool isCompleted;

  TaskModel copyWith({int? id, String? title, bool? isCompleted}) {
    return TaskModel(
      id: id ?? this.id,
      title ?? this.title,
      isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [id, title, isCompleted];
}
