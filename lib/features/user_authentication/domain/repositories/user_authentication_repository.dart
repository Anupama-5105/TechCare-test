import 'package:dartz/dartz.dart';
import 'package:test2/core/errors/failures.dart';

import '../entities/user_entity.dart';

abstract class UserAuthenticationRepository {
  Future<Either<Failure, UserEntity>> registerUser(
      String name, String email, String password);
  Future<Either<Failure, UserEntity>> loginUser(String email, String password);
}
