import 'package:backend/config/drift/app_database.dart';
import 'package:domain/entities/sub_todo_entity.dart';

extension SubToDoExtension on SubToDoTableData {
  SubToDoEntity toEntity() {
    return SubToDoEntity(
      id: id,
      todoId: todoId,
      isCompleted: isCompleted,
      title: title,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
