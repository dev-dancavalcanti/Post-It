import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos/models/todo_model.dart';
import 'package:todos/services/todo_interface.dart';

class SharedRepository implements IToDoDataSource {
  late SharedPreferences _prefs;
  final String _key = 'ToDoList';

  @override
  Future<ToDoModel> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await firstInit();
    String? jsonEncode = _prefs.getString(_key);
    return ToDoModel.fromJson(jsonDecode(jsonEncode!));
  }

  @override
  Future<void> updateData(ToDoModel toDoList) async {
    try {
      await _prefs.setString(_key, jsonEncode(toDoList));
    } catch (e) {}
  }

  @override
  Future<void> firstInit() async {
    if (_prefs.get(_key) == null) {
      Map<String, dynamic> toDoList = {
        "toDo": [
          {"title": "Shared Preference", "enabled": true, "intColor": 4},
          {"title": "Create another app", "enabled": false, "intColor": 2},
          {"title": "Update Linkdin", "enabled": false, "intColor": 6}
        ]
      };
      await _prefs.setString(_key, jsonEncode(toDoList));
    }
  }
}
