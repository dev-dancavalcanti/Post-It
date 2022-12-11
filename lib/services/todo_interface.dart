import 'package:todos/models/todo_model.dart';

abstract class IToDoDataSource {
  Future initialize() async {}

  Future<void> updateData(ToDoModel toDoList) async {}

  Future<void> firstInit() async {}
}
