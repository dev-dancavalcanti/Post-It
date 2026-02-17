class SubToDoEntity {
  final int id;
  final int todoId;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubToDoEntity({
    required this.id,
    required this.todoId,
    required this.isCompleted,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });
}
