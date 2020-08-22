import '../model/user.dart';

abstract class AuthRepository {
  Future<User> login({String username, String password});
  Future<User> register({String displayName, String username, String password});
}
