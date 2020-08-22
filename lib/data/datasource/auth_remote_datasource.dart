import 'dart:convert';
import 'dart:io';

import '../../core/exceptions/exceptions.dart';
import '../model/user.dart';
import '../repository/api_service.dart';
import '../repository/auth_repository.dart';

class AuthRemoteDataSource implements AuthRepository {
  final ApiService _apiService;

  AuthRemoteDataSource(this._apiService);

  @override
  Future<User> login({String username, String password}) async {
    const String url = '/api/v1/user/login';
    final Map<String, dynamic> payload = {
      'username': username,
      'password': password,
    };

    final response = await _apiService.post(url, body: json.encode(payload));

    if (response.statusCode != 200) {
      if (response.statusCode == 401) throw BadCredentialsException();
      if (response.statusCode >= 500) throw ServerException();

      throw HttpException('An error has occured in logging in. [Code: ${response.statusCode}]');
    } else {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    }
  }

  @override
  Future<User> register({String displayName, String username, String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
