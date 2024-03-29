part of 'user_authentication_bloc.dart';

sealed class UserAuthenticationEvent extends Equatable {
  const UserAuthenticationEvent();
}

class RegisterUserEvent extends UserAuthenticationEvent {
  final String emailString;
  final String passwordString;

  const RegisterUserEvent(
      {required this.emailString, required this.passwordString});
  @override
  List<Object?> get props => [emailString, passwordString];
}

class LoginUserEvent extends UserAuthenticationEvent {
  final String emailString;
  final String passwordString;

  const LoginUserEvent(
      {required this.emailString, required this.passwordString});
  @override
  List<Object?> get props => [emailString, passwordString];
}

class LogoutUserEvent extends UserAuthenticationEvent {
  @override
  List<Object?> get props => [];
}
