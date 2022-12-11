import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todos/models/todo_model.dart';
import 'package:todos/services/todo_interface.dart';

class HiveRepository implements IToDoDataSource {
  late Box<dynamic> myBox;
  final String _key = 'ToDoList';

  @override
  Future<ToDoModel> initialize() async {
    await Hive.initFlutter();
    myBox = await Hive.openBox("myBox");
    await firstInit();
    String getKey = myBox.get(_key);
    return ToDoModel.fromJson(jsonDecode(getKey));
  }

  @override
  Future<void> updateData(ToDoModel toDoList) async {
    await myBox.put(_key, jsonEncode(toDoList));
  }

  @override
  Future<void> firstInit() async {
    if (myBox.get(_key) == null) {
      Map<String, dynamic> toDoList = {
        "toDo": [
          {"title": "Hive", "enabled": true, "intColor": 4},
          {"title": "Create another app", "enabled": false, "intColor": 2},
          {"title": "Update Linkdin", "enabled": false, "intColor": 6}
        ]
      };
      await myBox.put(_key, jsonEncode(toDoList));
    }
  }
}
