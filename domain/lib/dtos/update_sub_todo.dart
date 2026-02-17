import 'package:vaden_core/vaden_core.dart';

@DTO()
class UpdateSubToDo {
  String? title;
  bool? isCompleted;

  UpdateSubToDo({this.title, this.isCompleted});
}
