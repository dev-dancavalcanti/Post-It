import 'package:domain/entities/sub_todo_entity.dart';
import 'package:vaden_core/vaden_core.dart';

@DTO()
class SubToDoDto {
  final int id;
  final int todoId;
  final String title;
  final bool isCompleted;

  SubToDoDto({
    required this.id,
    required this.todoId,
    required this.isCompleted,
    required this.title,
  });

  factory SubToDoDto.fromEntity(SubToDoEntity entity) {
    return SubToDoDto(
      id: entity.id,
      todoId: entity.todoId,
      isCompleted: entity.isCompleted,
      title: entity.title,
    );
  }

  factory SubToDoDto.fromJson(Map<String, dynamic> json) {
    return SubToDoDto(
      id: json['id'],
      todoId: json['todoId'],
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todoId': todoId,
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}
