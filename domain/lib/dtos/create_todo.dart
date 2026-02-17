import 'package:domain/dtos/create_sub_todo.dart';
import 'package:vaden_core/vaden_core.dart';

@DTO()
class CreateToDo {
  final String title;
  final List<CreateSubToDo> subTodos;

  CreateToDo({required this.title, required this.subTodos});
}
