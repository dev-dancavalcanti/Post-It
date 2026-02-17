import 'package:domain/dtos/create_todo.dart';
import 'package:domain/dtos/update_todo.dart';
import 'package:domain/entities/todo_entity.dart';

abstract class ToDoRepository {
  Future<ToDoEntity> get(int id);
  Future<List<ToDoEntity>> getAll();
  Future<ToDoEntity> create(CreateToDo createToDo);
  Future<ToDoEntity> update(UpdateToDo updateToDo, int id);
  Future<void> delete(int id);
}
