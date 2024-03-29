import 'package:dartz/dartz.dart';
import 'package:test2/core/errors/exceptions.dart';
import 'package:test2/core/errors/failures.dart';
import 'package:test2/features/user_authentication/data/data_sources/user_auth_firebase_data_source.dart';
import 'package:test2/features/user_authentication/domain/entities/user_entity.dart';
import 'package:test2/features/user_authentication/domain/repositories/user_authentication_repository.dart';

import '../../../../core/network/network_info.dart';

typedef _RegisterOrLogInChooser = Future<UserEntity> Function();

class UserAuthenticationRepositoryImpl implements UserAuthenticationRepository {
  final UserAuthFirebaseDataSource firebaseDataSource;
  final NetworkInfo networkInfo;

  UserAuthenticationRepositoryImpl(
      {required this.firebaseDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserEntity>> loginUser(
      String email, String password) async {
    return await _authenticateUser(
        () => firebaseDataSource.loginUser(email, password));
  }

  @override
  Future<Either<Failure, UserEntity>> registerUser(
      String email, String password) async {
    return await _authenticateUser(
        () => firebaseDataSource.registerUser(email, password));
  }

  @override
  Future<Either<Failure, void>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await firebaseDataSource.logoutUser());
      } on FireBaseException {
        return Left(FireBaseFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, UserEntity>> _authenticateUser(
      _RegisterOrLogInChooser registerOrLogin) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await registerOrLogin();
        return Right(user);
      } on FireBaseException {
        return Left(FireBaseFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
