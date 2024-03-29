import 'package:firebase_auth/firebase_auth.dart';
import 'package:test2/core/errors/exceptions.dart';
import 'package:test2/features/user_authentication/data/models/user_model.dart';

abstract class UserAuthFirebaseDataSource {
  Future<UserModel> registerUser(String email, String password);

  Future<UserModel> loginUser(String email, String password);

  Future<void> logoutUser();
}

class UserAuthFirebaseDataSourceImp implements UserAuthFirebaseDataSource {
  final FirebaseAuth _client;

  UserAuthFirebaseDataSourceImp({FirebaseAuth? client})
      : _client = client ?? FirebaseAuth.instance;

  @override
  Future<UserModel> loginUser(String email, String password) =>
      _authenticateUser(
          _client.signInWithEmailAndPassword(email: email, password: password));

  @override
  Future<UserModel> registerUser(String email, String password) =>
      _authenticateUser(_client.createUserWithEmailAndPassword(
          email: email, password: password));

  @override
  Future<void> logoutUser() async {
    await _client.signOut();
  }

  Future<UserModel> _authenticateUser(
      Future<UserCredential> userCredential) async {
    UserCredential credential = await userCredential;
    if (credential.user != null) {
      UserModel user = UserModel.fromFirebase(credential.user!);
      return user;
    } else {
      throw FireBaseException();
    }
  }
}
