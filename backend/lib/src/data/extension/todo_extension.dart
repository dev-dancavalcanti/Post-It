import 'package:backend/config/drift/app_database.dart';
import 'package:backend/src/data/extension/sub_todo_extension.dart';
import 'package:domain/entities/todo_entity.dart';

typedef ToDoAggregate = ({ToDoTableData toDo, List<SubToDoTableData> toDos});

extension ToDoExtension on ToDoAggregate {
  ToDoEntity toEntity() {
    return ToDoEntity(
      id: toDo.id,
      title: toDo.title,
      isCompleted: toDo.isCompleted,
      subTodos: toDos.map((e) => e.toEntity()).toList(),
      createdAt: toDo.createdAt,
      updatedAt: toDo.updatedAt,
    );
  }
}
