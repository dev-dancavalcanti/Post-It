import 'package:domain/dtos/create_sub_todo.dart';
import 'package:domain/dtos/update_sub_todo.dart';
import 'package:domain/entities/sub_todo_entity.dart';

abstract class SubToDoRepository {
  Future<SubToDoEntity> create(CreateSubToDo createSubToDo, int id);
  Future<SubToDoEntity> update(UpdateSubToDo updateToDo, int id);
  Future<void> delete(int id);
  Future<SubToDoEntity> get(int id);
}
