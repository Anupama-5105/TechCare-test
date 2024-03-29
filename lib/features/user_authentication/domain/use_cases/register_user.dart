import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test2/core/use_cases/use_case.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/user_authentication_repository.dart';

class RegisterUser implements UseCase<UserEntity, Params> {
  final UserAuthenticationRepository repository;
  RegisterUser(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await repository.registerUser(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password});
  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
