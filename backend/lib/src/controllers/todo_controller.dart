import 'package:domain/dtos/create_todo.dart';
import 'package:domain/dtos/todo_dto.dart';
import 'package:domain/dtos/update_todo.dart';
import 'package:domain/repositories/todo_repository.dart';
import 'package:vaden/vaden.dart';

@Api(tag: 'ToDo', description: 'Operations related to ToDo')
@Controller('/todo')
class ToDoController {
  final ToDoRepository _toDoRepository;
  ToDoController(this._toDoRepository);

  @ApiOperation(summary: 'Create a new ToDo')
  @ApiResponse(
    201,
    description: 'ToDo created successfully',
    content: ApiContent(type: 'json/application', schema: ToDoDto),
  )
  @Post('/create')
  Future<ToDoDto> create(@Body() CreateToDo createToDo) async {
    final entity = await _toDoRepository.create(createToDo);
    return ToDoDto.fromEntity(entity);
  }

  @ApiOperation(summary: 'Get ToDo by ID')
  @ApiResponse(
    200,
    description: 'ToDo retrieved successfully',
    content: ApiContent(type: 'json/application', schema: ToDoDto),
  )
  @Get('/<id>')
  Future<ToDoDto> get(@Param() int id) async {
    final entity = await _toDoRepository.get(id);
    return ToDoDto.fromEntity(entity);
  }

  @ApiOperation(summary: 'Update ToDo')
  @ApiResponse(
    200,
    description: 'ToDo updated successfully',
    content: ApiContent(type: 'json/application', schema: ToDoDto),
  )
  @Patch('/<id>/update')
  Future<ToDoDto> update(@Param() int id, @Body() UpdateToDo update) async {
    final entity = await _toDoRepository.update(update, id);
    return ToDoDto.fromEntity(entity);
  }

  @ApiOperation(summary: 'Get all ToDo')
  @ApiResponse(
    200,
    description: 'ToDo retrieved successfully',
    content: ApiContent(type: 'json/application', schema: List<ToDoDto>),
  )
  @Get('/')
  Future<List<ToDoDto>> getAll() async {
    final entities = await _toDoRepository.getAll();
    return entities.map((e) => ToDoDto.fromEntity(e)).toList();
  }

  @ApiOperation(summary: 'Delete ToDo')
  @ApiResponse(
    204,
    description: 'ToDo deleted successfully',
    content: ApiContent(type: 'json/application'),
  )
  @Delete('/<id>/delete')
  Future<void> delete(@Param() int id) async {
    await _toDoRepository.delete(id);
  }
}
