part of 'user_authentication_bloc.dart';

enum UserAuthenticationStatus { initial, loading, loaded, error }

sealed class UserAuthenticationState extends Equatable {
  const UserAuthenticationState();
}

final class UserAuthenticationInitial extends UserAuthenticationState {
  @override
  List<Object> get props => [];
}

final class Loading extends UserAuthenticationState {
  @override
  List<Object> get props => [];
}

final class Loaded extends UserAuthenticationState {
  final String message;
  final UserEntity? userEntity;

  const Loaded({required this.message, this.userEntity});
  @override
  List<Object> get props => [message];
}

final class Error extends UserAuthenticationState {
  final String message;

  const Error({required this.message});
  @override
  List<Object> get props => [message];
}
