import 'package:domain/dtos/update_sub_todo.dart';
import 'package:vaden_core/vaden_core.dart';

@DTO()
class UpdateToDo {
  String? title;
  List<UpdateSubToDo>? subTodos;
  bool? isCompleted;

  UpdateToDo({this.title, this.isCompleted, this.subTodos});
}
