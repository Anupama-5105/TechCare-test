import 'package:dartz/dartz.dart';
import 'package:test2/core/use_cases/use_case.dart';
import 'package:test2/features/user_authentication/domain/repositories/user_authentication_repository.dart';

import '../../../../core/errors/failures.dart';

abstract class LogoutUser implements UseCase<void, NoParams> {
  final UserAuthenticationRepository repository;
  LogoutUser(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.logout();
  }
}
