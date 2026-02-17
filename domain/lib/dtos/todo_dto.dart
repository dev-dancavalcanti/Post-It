import 'package:domain/dtos/sub_todo_dto.dart';
import 'package:domain/entities/todo_entity.dart';
import 'package:vaden_core/vaden_core.dart';

@DTO()
class ToDoDto {
  final int id;
  final String title;
  final List<SubToDoDto> subTodos;
  final bool isCompleted;

  ToDoDto({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.subTodos,
  });

  factory ToDoDto.fromEntity(ToDoEntity entity) {
    return ToDoDto(
      id: entity.id,
      title: entity.title,
      isCompleted: entity.isCompleted,
      subTodos: entity.subTodos.map((e) => SubToDoDto.fromEntity(e)).toList(),
    );
  }

  factory ToDoDto.fromJson(Map<String, dynamic> json) {
    return ToDoDto(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
      subTodos: json['subTodos'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subTodos': subTodos,
      'isCompleted': isCompleted,
    };
  }
}
