import 'package:backend/config/drift/app_database.dart';
import 'package:backend/src/data/extension/todo_extension.dart';
import 'package:domain/dtos/create_todo.dart';
import 'package:domain/dtos/update_todo.dart';
import 'package:domain/entities/todo_entity.dart';
import 'package:domain/repositories/todo_repository.dart';
import 'package:drift/drift.dart';
import 'package:vaden/vaden.dart';

@Repository()
class DriftToDoRepository implements ToDoRepository {
  final AppDatabase _db;

  DriftToDoRepository(this._db);
  @override
  Future<ToDoEntity> create(CreateToDo createToDo) async {
    final toDoCreate =
        await _db //
            .managers
            .toDoTable
            .create((t) => t(title: createToDo.title));

    if (createToDo.subTodos.isNotEmpty) {
      await _db //
          .managers
          .subToDoTable
          .bulkCreate(
            (e) => createToDo.subTodos.map(
              (s) => e(title: s.title, todoId: toDoCreate),
            ),
          );
    }

    return get(toDoCreate);
  }

  @override
  Future<void> delete(int id) async {
    await _db //
        .transaction(() async {
          await _db //
              .managers
              .subToDoTable
              .filter((e) => e.todoId.id.equals(id))
              .delete();
          await _db //
              .managers
              .toDoTable
              .filter((e) => e.id.equals(id))
              .delete();
        });
  }

  @override
  Future<ToDoEntity> get(int id) async {
    final toDo =
        await _db //
            .managers
            .toDoTable
            .filter((e) => e.id.equals(id))
            .getSingleOrNull();

    if (toDo == null) {
      throw ResponseException.notFound('ToDo not found');
    }

    final toDos = await _db.managers.subToDoTable
        .filter((e) => e.todoId.id.equals(id))
        .get();

    final aggregate = (toDo: toDo, toDos: toDos);

    return aggregate.toEntity();
  }

  @override
  Future<List<ToDoEntity>> getAll() async {
    final allToDos = await _db.managers.toDoTable.get();
    if (allToDos.isEmpty) return [];

    final allSubToDos = await _db.managers.subToDoTable.get();

    return allToDos.map((toDo) {
      final toDos = allSubToDos.where((sub) => sub.todoId == toDo.id).toList();

      final aggregate = (toDo: toDo, toDos: toDos);

      return aggregate.toEntity();
    }).toList();
  }

  @override
  Future<ToDoEntity> update(UpdateToDo updateToDo, int id) async {
    return _db //
        .transaction(() async {
          await _db //
              .managers
              .toDoTable
              .filter((e) => e.id.equals(id))
              .update((e) {
                return e(
                  title: updateToDo.title != null
                      ? Value(updateToDo.title!)
                      : Value.absent(),
                  isCompleted: updateToDo.isCompleted != null
                      ? Value(updateToDo.isCompleted!)
                      : Value.absent(),
                  updatedAt: Value(DateTime.now()),
                );
              });

          return await get(id);
        });
  }
}
