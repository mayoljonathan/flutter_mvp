import 'dart:io';

import 'package:http/http.dart' as http;

import 'data/datasource/auth_remote_datasource.dart';
import 'data/repository/api_service.dart';
import 'data/repository/auth_repository.dart';
import 'data/repository/auth_repository_impl.dart';
import 'flavor.dart';

class Injector {
  static final Injector _injector = Injector._internal();
  factory Injector() => _injector;
  Injector._internal();

  static Flavor _flavor;
  static void configure(Flavor flavor) => _flavor = flavor;

  ApiService _apiService = ApiService(
    baseApiUrl: _flavor.baseApiUrl,
    httpClient: http.Client(),
    defaultHeaders: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );

  AuthRepository get authRepository {
    return AuthRepositoryImpl(remoteDataSource: AuthRemoteDataSource(_apiService));
  }
}
