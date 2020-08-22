import 'dart:io';

import 'package:flutter_mvp/core/exceptions/exceptions.dart';
import 'package:flutter_mvp/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_mvp/data/model/user.dart';
import 'package:flutter_mvp/data/repository/api_service.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import '../../fixtures/fixture_reader.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  MockClient mockHttpClient;
  ApiService apiService;
  AuthRemoteDataSource dataSource;

  setUp(() {
    mockHttpClient = MockClient();
    apiService = ApiService(baseApiUrl: 'http://192.168.254.102:3000', httpClient: mockHttpClient);
    dataSource = AuthRemoteDataSource(apiService);
  });
  group('login()', () {
    final url = '/api/v1/user/login';
    test(
      'should return a User if statusCode is 200',
      () async {
        // arrange
        when(
          apiService.post(
            url,
            body: anyNamed('body'),
          ),
        ).thenAnswer(
          (_) async => http.Response(fixture('user'), 200),
        );

        // act
        final result = await dataSource.login(username: 'tester321', password: 'tester321');
        // assert
        expect(result, isA<User>());
      },
    );

    test(
      'should throw a BadCredentialsException if statusCode is 401',
      () async {
        // arrange
        when(
          apiService.post(
            url,
            body: anyNamed('body'),
          ),
        ).thenAnswer(
          (_) async => http.Response('', 401),
        );
        // act
        final call = dataSource.login;
        // assert
        expect(() => call(), throwsA(isA<BadCredentialsException>()));
      },
    );

    test(
      'should throw a ServerException if statusCode is 500 or above',
      () async {
        // arrange
        when(
          apiService.post(
            url,
            body: anyNamed('body'),
          ),
        ).thenAnswer(
          (_) async => http.Response('', 500),
        );
        // act
        final call = dataSource.login;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a HttpException if statusCode is not 200/401/500 or above',
      () async {
        // arrange
        when(
          apiService.post(
            url,
            body: anyNamed('body'),
          ),
        ).thenAnswer(
          (_) async => http.Response('', 404),
        );
        // act
        final call = dataSource.login;
        // assert
        expect(() => call(), throwsA(isA<HttpException>()));
      },
    );
  });
}
