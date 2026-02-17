import 'package:domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> getByEmail(String email);
}
