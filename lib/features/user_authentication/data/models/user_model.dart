import 'package:test2/features/user_authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required int id,
      String? name,
      required String email,
      required String password,
      int? pin})
      : super(id: id, email: email, password: password, pin: pin);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      pin: json['pin']);
}
