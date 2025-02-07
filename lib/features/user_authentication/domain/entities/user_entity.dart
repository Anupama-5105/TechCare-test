import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String? email;

  const UserEntity({
    required this.id,
    this.email,
  });

  @override
  List<Object?> get props => [
        id,
        email,
      ];
}
