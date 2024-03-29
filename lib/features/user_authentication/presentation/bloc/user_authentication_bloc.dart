import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2/core/use_cases/use_case.dart';
import 'package:test2/features/user_authentication/domain/entities/user_entity.dart';
import 'package:test2/features/user_authentication/domain/use_cases/register_user.dart'
    as register;
import 'package:test2/features/user_authentication/domain/use_cases/login_user.dart'
    as login;

import '../../../../core/errors/failures.dart';
import '../../domain/use_cases/login_user.dart';
import '../../domain/use_cases/logout_user.dart';
import '../../domain/use_cases/register_user.dart';

part 'user_authentication_event.dart';
part 'user_authentication_state.dart';

class UserAuthenticationBloc
    extends Bloc<UserAuthenticationEvent, UserAuthenticationState> {
  final RegisterUser registerUser;
  final LoginUser loginUser;
  final LogoutUser logoutUser;

  UserAuthenticationBloc(this.logoutUser,
      {required this.registerUser, required this.loginUser})
      : super(UserAuthenticationInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit.call(Loading());
      final failureOrUser = await registerUser.call(register.Params(
          email: event.emailString, password: event.passwordString));
      emit.call(
        failureOrUser.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (userEntity) => Loaded(
              message: 'Created successfully !!', userEntity: userEntity),
        ),
      );
    });
    on<LoginUserEvent>((event, emit) async {
      emit.call(Loading());
      final failureOrUser = await loginUser.call(login.Params(
          email: event.emailString, password: event.passwordString));
      emit.call(
        failureOrUser.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (userEntity) => Loaded(
              message: 'Logged in successfully !!', userEntity: userEntity),
        ),
      );
    });
    on<LogoutUserEvent>((event, emit) async {
      emit.call(Loading());
      final failureOrVoid = await logoutUser.call(NoParams());
      emit.call(failureOrVoid.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (empty) => const Loaded(message: 'Success'),
      ));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return "Internet Error";
      case FireBaseFailure:
        return "Firebase Error";
      default:
        return 'Unexpected Error';
    }
  }
}
