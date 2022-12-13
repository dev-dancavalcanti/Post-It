import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todos/models/todo_model.dart';
import 'package:todos/services/todo_interface.dart';

class ToDoController extends ChangeNotifier {
  final IToDoDataSource _db;
  ToDoController(this._db) {
    initialize();
  }

  TextEditingController textController = TextEditingController();

  Future<void> initialize() async {
    toggleLoading();
    toDoList = await _db.initialize();
    await listIsEmpty();
    toggleLoading();
  }

  late ToDoModel toDoList;
  bool isLoading = false;
  bool toDoIsEmpty = false;

  Future<void> toggleLoading() async {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<bool> listIsEmpty() async {
    if (toDoList.toDo.isEmpty) {
      return toDoIsEmpty = true;
    } else {
      return toDoIsEmpty = false;
    }
  }

  Future<void> checkBoxChanged(bool? value, int index) async {
    try {
      ToDoModel listdb = toDoList;
      listdb.toDo[index].enabled = !listdb.toDo[index].enabled;
      await _db.updateData(listdb);
      toDoList = listdb;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  Future<void> saveNewTask() async {
    await toggleLoading();
    int color = Random().nextInt(Colors.primaries.length);
    toDoList.toDo
        .add(ToDo(title: textController.text, enabled: false, intColor: color));
    await _db.updateData(toDoList);
    await toggleLoading();
    listIsEmpty();
    textController.clear();
  }

  Future<void> deletedTask(int index) async {
    await toggleLoading();
    toDoList.toDo.removeAt(index);
    await _db.updateData(toDoList);
    await toggleLoading();
    listIsEmpty();
  }
}
