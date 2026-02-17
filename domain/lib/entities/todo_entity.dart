import 'package:domain/entities/sub_todo_entity.dart';

class ToDoEntity {
  final int id;
  final String title;
  final List<SubToDoEntity> subTodos;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  ToDoEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.subTodos,
    required this.createdAt,
    required this.updatedAt,
  });
}
