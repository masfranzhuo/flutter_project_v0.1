import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/core/services/http_client.dart';
import 'package:flutter_project/core/config/general_config.dart';
import 'package:flutter_project/core/utils/failure.dart';
import 'package:flutter_project/src/entities/user.dart';
import 'package:injectable/injectable.dart';

abstract class UserDataSource {
  Future<List<User>> getUsers({
    required int page,
    int limit = Pagination.limit,
  });
  Future<User> getUser({required String id});
}

@LazySingleton(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  final HttpClientService client;

  UserDataSourceImpl({required this.client});

  @override
  Future<List<User>> getUsers({
    required int page,
    int limit = Pagination.limit,
  }) async {
    try {
      final result = await client.get(
        path: 'user',
        queryParameters: {'limit': limit, 'page': page},
        options: Options(
          headers: <String, dynamic>{'app-id': dotenv.env['APP_ID']},
        ),
      );

      final data = List<dynamic>.from(result.data['data'] ?? []).toList();

      return List<Map<String, dynamic>>.from(data)
          .map((item) => User.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    } on InternetConnectionFailure {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<User> getUser({required String id}) async {
    try {
      final result = await client.get(
        path: 'user/$id',
        options: Options(
          headers: <String, dynamic>{'app-id': dotenv.env['APP_ID']},
        ),
      );

      return User.fromJson(result.data as Map<String, dynamic>);
    } on InternetConnectionFailure {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
