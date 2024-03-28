import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String? name;
  final String email;
  final String password;
  final int? pin;

  const UserEntity({
    required this.id,
    this.name,
    required this.email,
    required this.password,
    this.pin,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        pin,
      ];
}
