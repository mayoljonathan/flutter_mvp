import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasource/auth_remote_datasource.dart';
import 'data/datasource/post_remote_datasource.dart';
import 'data/repository/api_service.dart';
import 'data/repository/auth_repository.dart';
import 'data/repository/auth_repository_impl.dart';
import 'data/repository/post_repository.dart';
import 'data/repository/post_repository_impl.dart';
import 'flavor.dart';
import 'provider/user_provider.dart';

final locator = GetIt.instance;

void setup(Flavor _flavor) {
  final _apiService = ApiService(
    baseApiUrl: _flavor.baseApiUrl,
    httpClient: http.Client(),
    defaultHeaders: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );

  locator.registerSingleton<ApiService>(_apiService);

  // Repositories
  locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(remoteDataSource: AuthRemoteDataSource(_apiService)),
  );

  locator.registerSingleton<PostRepository>(
    PostRepositoryImpl(remoteDataSource: PostRemoteDataSource(_apiService)),
  );

  // Providers
  locator.registerSingleton<UserProvider>(UserProvider());
}
