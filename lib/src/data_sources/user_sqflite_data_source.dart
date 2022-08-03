import 'package:flutter_project/core/services/sqflite.dart';
import 'package:flutter_project/core/utils/failure.dart';
import 'package:flutter_project/src/entities/user.dart';
import 'package:injectable/injectable.dart';

abstract class UserSqfliteDataSource {
  Future<void> setUsers({required List<User> users});
  Future<void> setUser({required User user});
  Future<List<User>> getUsers();
  Future<User> getUser({required String id});
  Future<void> deleteUser({required String id});
  Future<void> deleteAllUser();
}

@LazySingleton(as: UserSqfliteDataSource)
class UserSqfliteDataSourceImpl implements UserSqfliteDataSource {
  final SqfliteService sqfliteService;
  final String _table = 'User';
  final List<String> _column = [
    'id',
    'title',
    'firstName',
    'lastName',
    'picture',
    'gender',
    'email',
    'phone',
    'dateOfBirth',
    'registerDate',
    'location',
  ];

  UserSqfliteDataSourceImpl({required this.sqfliteService});

  @override
  Future<User> getUser({required String id}) async {
    try {
      final result = await sqfliteService.get(
        table: _table,
        id: id,
        columns: _column,
      );

      return User.fromJson(result as Map<String, dynamic>);
    } on Exception catch (e) {
      throw LocalStorageFailure(message: e.toString());
    }
  }

  @override
  Future<List<User>> getUsers() async {
    try {
      final result = await sqfliteService.getList(
        table: _table,
        columns: _column,
      );

      final data = List<dynamic>.from(result ?? []).toList();

      return List<Map<String, dynamic>>.from(data)
          .map((item) => User.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    } on Exception catch (e) {
      throw LocalStorageFailure(message: e.toString());
    }
  }

  @override
  Future<void> setUser({required User user}) async {
    try {
      await sqfliteService.insert(table: _table, map: user.toJson());
      return;
    } on Exception catch (e) {
      throw LocalStorageFailure(message: e.toString());
    }
  }

  @override
  Future<void> setUsers({required List<User> users}) async {
    try {
      final List<Map<String, dynamic>> maps =
          users.map((e) => e.toJson()).toList();
      await sqfliteService.insertBulk(table: _table, maps: maps);
      return;
    } on Exception catch (e) {
      throw LocalStorageFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteUser({required String id}) async {
    try {
      await sqfliteService.delete(table: _table, id: id);
      return;
    } on Exception catch (e) {
      throw LocalStorageFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteAllUser() async {
    try {
      await sqfliteService.deleteAll(table: _table);
      return;
    } on Exception catch (e) {
      throw LocalStorageFailure(message: e.toString());
    }
  }
}
