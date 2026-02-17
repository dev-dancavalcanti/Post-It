import 'package:backend/config/drift/app_database.dart';
import 'package:backend/src/data/extension/sub_todo_extension.dart';
import 'package:domain/dtos/create_sub_todo.dart';
import 'package:domain/dtos/update_sub_todo.dart';
import 'package:domain/entities/sub_todo_entity.dart';
import 'package:domain/repositories/sub_todo_repository.dart';
import 'package:drift/drift.dart';
import 'package:vaden/vaden.dart';

@Repository()
class DriftSubToDoRepository implements SubToDoRepository {
  final AppDatabase _db;

  DriftSubToDoRepository(this._db);

  @override
  Future<SubToDoEntity> create(CreateSubToDo createSubToDo, int id) async {
    final subToDoCreate =
        await _db //
            .managers
            .subToDoTable
            .create((e) => e(title: createSubToDo.title, todoId: id));

    return get(subToDoCreate);
  }

  @override
  Future<void> delete(int id) async {
    await _db //
        .managers
        .toDoTable
        .filter((e) => e.id.equals(id))
        .delete();
  }

  @override
  Future<SubToDoEntity> update(UpdateSubToDo updateToDo, int id) async {
    final subToDoUpdate =
        await _db //
            .managers
            .subToDoTable
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

    return await get(subToDoUpdate);
  }

  @override
  Future<SubToDoEntity> get(int id) async {
    final subToDo =
        await _db //
            .managers
            .subToDoTable
            .filter((e) => e.id.equals(id))
            .getSingleOrNull();

    if (subToDo == null) {
      throw ResponseException.notFound('SubToDo not found');
    }

    return subToDo.toEntity();
  }
}
