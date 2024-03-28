import 'package:dartz/dartz.dart';
import 'package:test2/core/errors/failures.dart';
import 'package:test2/features/user_authentication/domain/entities/user_entity.dart';
import 'package:test2/features/user_authentication/domain/repositories/user_authentication_repository.dart';

class UserAuthenticationRepositoryImpl implements UserAuthenticationRepository {
  @override
  Future<Either<Failure, UserEntity>> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> registerUser(
      String name, String email, String password) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
