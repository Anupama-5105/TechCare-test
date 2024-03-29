import 'package:firebase_auth/firebase_auth.dart';
import 'package:test2/features/user_authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required int id,
    String? email,
  }) : super(id: id, email: email);

  factory UserModel.fromFirebase(User user) => UserModel(
        id: int.parse(user.uid),
        email: user.email,
      );
}
