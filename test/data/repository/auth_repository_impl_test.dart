import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvp/core/exceptions/exceptions.dart';
import 'package:flutter_mvp/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_mvp/data/model/user.dart';
import 'package:flutter_mvp/data/repository/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';

class MockRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  AuthRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = AuthRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('login()', () {
    final tUsername = 'tester321';
    final tPassword = 'tester321';
    final tUserModel = User.fromJson(jsonDecode(fixture('user')));

    test(
      'should return User when the call to remote data source is succesful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.login(
            username: anyNamed('username'),
            password: anyNamed('password'),
          ),
        ).thenAnswer((_) async => tUserModel);
        // act
        final result = await repository.login(username: tUsername, password: tPassword);

        // assert
        verify(mockRemoteDataSource.login(username: tUsername, password: tPassword));
        expect(result, equals(tUserModel));
      },
    );

    test(
      'should throw Failure when a BadCredentialsException was thrown',
      () async {
        // arrange
        when(
          mockRemoteDataSource.login(
            username: anyNamed('username'),
            password: anyNamed('password'),
          ),
        ).thenThrow(BadCredentialsException());

        // act
        final call = repository.login(username: '', password: '');

        // assert
        expect(() => call, throwsA(isA<Failure>()));
      },
    );

    test(
      'should throw Failure when a SocketException was thrown',
      () async {
        // arrange
        when(
          mockRemoteDataSource.login(
            username: anyNamed('username'),
            password: anyNamed('password'),
          ),
        ).thenThrow(SocketException(''));

        // act
        final call = repository.login(username: '', password: '');

        // assert
        expect(() => call, throwsA(isA<Failure>()));
      },
    );

    test(
      'should throw Failure when a ServerException was thrown',
      () async {
        // arrange
        when(
          mockRemoteDataSource.login(
            username: anyNamed('username'),
            password: anyNamed('password'),
          ),
        ).thenThrow(ServerException());

        // act
        final call = repository.login(username: '', password: '');

        // assert
        expect(() => call, throwsA(isA<Failure>()));
      },
    );
  });
}
