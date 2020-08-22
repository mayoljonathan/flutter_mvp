import 'dart:io';

import 'package:meta/meta.dart';

import '../../core/common/error_messages.dart';
import '../../core/exceptions/exceptions.dart';
import '../datasource/auth_remote_datasource.dart';
import '../model/user.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<User> login({String username, String password}) async {
    try {
      return await remoteDataSource.login(username: username, password: password);
    } on BadCredentialsException {
      throw Failure(ErrorMessages.INVALID_LOGIN_CREDENTIALS);
    } on SocketException {
      throw Failure(ErrorMessages.NO_CONNECTION);
    } on ServerException {
      throw Failure(ErrorMessages.SERVER_ERROR);
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<User> register({String displayName, String username, String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
