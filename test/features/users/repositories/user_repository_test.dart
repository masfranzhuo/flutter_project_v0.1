import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/base/exception/exception.dart';
import 'package:flutter_project/features/users/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/helpers.dart';

void main() {
  late UserRepositoryImpl repository;
  late MockInternetConnectionService mockInternetConnectionService;
  late MockUserDataSource mockUserDataSource;
  late MockUserLocalDataSource mockUserLocalDataSource;
  // late MockUserSqfliteDataSource mockUserSqfliteDataSource;

  setUp(() {
    mockInternetConnectionService = MockInternetConnectionService();
    mockUserDataSource = MockUserDataSource();
    mockUserLocalDataSource = MockUserLocalDataSource();
    // mockUserSqfliteDataSource = MockUserSqfliteDataSource();
    repository = UserRepositoryImpl(
      internetConnectionService: mockInternetConnectionService,
      dataSource: mockUserDataSource,
      localDataSource: mockUserLocalDataSource,
      // sqfliteDataSource: mockUserSqfliteDataSource,
    );
  });

  group('getUsers', () {
    test('should return AppException(), when catch exception', () async {
      when(mockInternetConnectionService.checkConnection())
          .thenAnswer((_) async => unit);
      when(mockUserDataSource.getUsers(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
      )).thenThrow(Exception());

      final result = await repository.getUsers(page: 1, limit: 10);

      expect((result as Left).value, isA<AppException>());

      verifyInOrder([
        mockInternetConnectionService.checkConnection(),
        mockUserDataSource.getUsers(page: 1, limit: 10),
      ]);
    });

    test('should return AppException(), when catch app exception', () async {
      when(mockInternetConnectionService.checkConnection())
          .thenAnswer((_) async => unit);
      when(mockUserDataSource.getUsers(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
      )).thenThrow(const AppException());

      final result = await repository.getUsers(page: 1, limit: 10);

      expect((result as Left).value, isA<AppException>());

      verifyInOrder([
        mockInternetConnectionService.checkConnection(),
        mockUserDataSource.getUsers(page: 1, limit: 10),
      ]);
    });

    test(
        'should return LocalStorageException(), when catch local data source error',
        () async {
      when(mockInternetConnectionService.checkConnection())
          .thenAnswer((_) async => unit);
      when(mockUserDataSource.getUsers(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
      )).thenAnswer((_) async => users);
      when(mockUserLocalDataSource.setUsers(
        users: anyNamed('users'),
      )).thenThrow(const LocalStorageException());

      final result = await repository.getUsers(page: 1, limit: 10);

      expect((result as Left).value, isA<LocalStorageException>());

      verifyInOrder([
        mockInternetConnectionService.checkConnection(),
        mockUserDataSource.getUsers(page: 1, limit: 10),
        mockUserLocalDataSource.setUsers(users: users),
      ]);
    });

    test(
        'should return InternetConnectionException(), when catch internet connection error and empty local data source',
        () async {
      when(mockInternetConnectionService.checkConnection())
          .thenThrow(const InternetConnectionException());
      when(mockUserLocalDataSource.getUsers(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
      )).thenAnswer((_) async => []);

      final result = await repository.getUsers(page: 1, limit: 10);

      expect((result as Left).value, isA<InternetConnectionException>());

      verifyInOrder([
        mockInternetConnectionService.checkConnection(),
      ]);
    });

    test(
        'should return list of users, when catch internet connection error and local data source has data',
        () async {
      when(mockInternetConnectionService.checkConnection())
          .thenThrow(const InternetConnectionException());
      when(mockUserLocalDataSource.getUsers(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
      )).thenAnswer((_) async => users);

      final result = await repository.getUsers(page: 1, limit: 10);

      expect((result as Right).value, users);

      verifyInOrder([
        mockInternetConnectionService.checkConnection(),
      ]);
    });

    test('should return list of users', () async {
      when(mockInternetConnectionService.checkConnection())
          .thenAnswer((_) async => unit);
      when(mockUserDataSource.getUsers(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
      )).thenAnswer((_) async => users);
      when(mockUserLocalDataSource.setUsers(
        users: anyNamed('users'),
      )).thenAnswer((_) async => unit);

      final result = await repository.getUsers(page: 1, limit: 10);

      expect((result as Right).value, users);

      verifyInOrder([
        mockInternetConnectionService.checkConnection(),
        mockUserDataSource.getUsers(page: 1, limit: 10),
        mockUserLocalDataSource.setUsers(users: users),
      ]);
    });
  });

  group('getUser', () {
    test('should return AppException(), when catch exception', () async {
      when(mockInternetConnectionService.checkConnection())
          .thenAnswer((_) async => unit);
      when(mockUserDataSource.getUser(
        id: anyNamed('id'),
      )).thenThrow(Exception());

      final result = await repository.getUser(id: 'anyId');

      expect((result as Left).value, isA<AppException>());

      verifyInOrder([
        mockInternetConnectionService.checkConnection(),
        mockUserDataSource.getUser(id: 'anyId'),
      ]);
    });

    test('should return AppException(), when catch app exception', () async {
      when(mockInternetConnectionService.checkConnection())
          .thenAnswer((_) async => unit);
      when(mockUserDataSource.getUser(
        id: anyNamed('id'),
      )).thenThrow(const AppException());

      final result = await repository.getUser(id: 'anyId');

      expect((result as Left).value, isA<AppException>());

      verifyInOrder([
        mockInternetConnectionService.checkConnection(),
        mockUserDataSource.getUser(id: 'anyId'),
      ]);
    });

    test(
        'should return LocalStorageException(), when catch local data source error',
        () async {
      when(mockInternetConnectionService.checkConnection())
          .thenAnswer((_) async => unit);
      when(mockUserDataSource.getUser(
        id: anyNamed('id'),
      )).thenAnswer((_) async => user);
      when(mockUserLocalDataSource.setUser(
        user: anyNamed('user'),
      )).thenThrow(const LocalStorageException());

      final result = await repository.getUser(id: 'anyId');

      expect((result as Left).value, isA<LocalStorageException>());

      verifyInOrder([
        mockInternetConnectionService.checkConnection(),
        mockUserDataSource.getUser(id: 'anyId'),
        mockUserLocalDataSource.setUser(user: user),
      ]);
    });

    test(
        'should return InternetConnectionException(), when catch internet connection error and empty local data source',
        () async {
      when(mockInternetConnectionService.checkConnection())
          .thenThrow(const InternetConnectionException());

      final result = await repository.getUser(id: 'anyId');

      expect((result as Left).value, isA<InternetConnectionException>());

      verify(mockInternetConnectionService.checkConnection());
    });

    test('should return user', () async {
      when(mockUserDataSource.getUser(
        id: anyNamed('id'),
      )).thenAnswer((_) async => user);
      when(mockUserLocalDataSource.setUser(
        user: anyNamed('user'),
      )).thenAnswer((_) async => user);

      final result = await repository.getUser(id: 'anyId');

      expect((result as Right).value, user);

      verifyInOrder([
        mockInternetConnectionService.checkConnection(),
        mockUserDataSource.getUser(id: 'anyId'),
        mockUserLocalDataSource.setUser(user: user)
      ]);
    });
  });
}
