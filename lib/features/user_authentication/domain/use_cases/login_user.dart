import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test2/core/use_cases/use_case.dart';
import 'package:test2/features/user_authentication/domain/entities/user_entity.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/user_authentication_repository.dart';

abstract class LoginUser implements UseCase<UserEntity, Params> {
  final UserAuthenticationRepository repository;
  LoginUser(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await repository.loginUser(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
