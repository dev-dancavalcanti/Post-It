import 'package:vaden_core/vaden_core.dart';

enum UserRole { leader, member }

@DTO()
class UserEntity {
  final int id;
  final String name;
  final String email;
  final String password;
  final UserRole role;
  final bool isApproved;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.isApproved,
    required this.createdAt,
    required this.updatedAt,
  });
}
