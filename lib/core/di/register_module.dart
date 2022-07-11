import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named('baseUrl')
  String get baseUrl => 'https://dummyapi.io/data/v1/';

  Dio dio(@Named('baseUrl') String baseUrl) =>
      Dio(BaseOptions(baseUrl: baseUrl));

  Future<Box<dynamic>> get hive async => Hive.box('box');
}
