import 'package:domain/dtos/create_sub_todo.dart';
import 'package:domain/dtos/sub_todo_dto.dart';
import 'package:domain/dtos/update_sub_todo.dart';
import 'package:domain/repositories/sub_todo_repository.dart';
import 'package:vaden/vaden.dart';

@Api(tag: 'SubToDo', description: 'Operations related to ToDo')
@Controller('/subtodo')
class SubToDoController {
  final SubToDoRepository _subToDoRepository;
  SubToDoController(this._subToDoRepository);

  @ApiOperation(summary: 'Create a new SubToDo')
  @ApiResponse(
    201,
    description: 'SubToDo created successfully',
    content: ApiContent(type: 'json/application', schema: SubToDoDto),
  )
  @Post('/create')
  Future<SubToDoDto> create(
    @Body() CreateSubToDo createToDo,
    @Param() int id,
  ) async {
    final entity = await _subToDoRepository.create(createToDo, id);
    return SubToDoDto.fromEntity(entity);
  }

  @ApiOperation(summary: 'Get SubToDoDto by ID')
  @ApiResponse(
    200,
    description: 'SubToDoDto retrieved successfully',
    content: ApiContent(type: 'json/application', schema: SubToDoDto),
  )
  @Get('/<id>')
  Future<SubToDoDto> get(@Param() int id) async {
    final entity = await _subToDoRepository.get(id);
    return SubToDoDto.fromEntity(entity);
  }

  @ApiOperation(summary: 'Update SubToDoDto')
  @ApiResponse(
    200,
    description: 'ToDo updated successfully',
    content: ApiContent(type: 'json/application', schema: SubToDoDto),
  )
  @Patch('/<id>/update')
  Future<SubToDoDto> update(
    @Param() int id,
    @Body() UpdateSubToDo update,
  ) async {
    final entity = await _subToDoRepository.update(update, id);
    return SubToDoDto.fromEntity(entity);
  }

  @ApiOperation(summary: 'Delete SubToDoDto')
  @ApiResponse(
    204,
    description: 'SubToDoDto deleted successfully',
    content: ApiContent(type: 'json/application'),
  )
  Future<void> delete(@Param() int id) async {
    await _subToDoRepository.delete(id);
  }
}
