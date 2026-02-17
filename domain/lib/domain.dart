/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'package:domain/dtos/create_sub_todo.dart';
import 'package:domain/dtos/create_todo.dart';
import 'package:domain/dtos/sub_todo_dto.dart';
import 'package:domain/dtos/todo_dto.dart';
import 'package:domain/dtos/update_sub_todo.dart';
import 'package:domain/dtos/update_todo.dart';
import 'package:domain/entities/sub_todo_entity.dart';
import 'package:domain/entities/todo_entity.dart';
import 'package:vaden_core/vaden_core.dart';

@VadenModule([
  CreateSubToDo,
  CreateToDo,
  SubToDoDto,
  ToDoDto,
  UpdateSubToDo,
  UpdateToDo,
  SubToDoEntity,
  ToDoEntity,
])
class DomainModule {}
