// Mocks generated by Mockito 5.2.0 from annotations
// in flutter_project/test/src/data_sources/user_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dio/dio.dart' as _i2;
import 'package:flutter_project/core/services/http_client.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeResponse_0<T> extends _i1.Fake implements _i2.Response<T> {}

/// A class which mocks [HttpClientService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClientService extends _i1.Mock implements _i3.HttpClientService {
  MockHttpClientService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Response<dynamic>> get(
          {String? path,
          Map<String, dynamic>? queryParameters,
          _i2.Options? options}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [], {
                #path: path,
                #queryParameters: queryParameters,
                #options: options
              }),
              returnValue: Future<_i2.Response<dynamic>>.value(
                  _FakeResponse_0<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);
}
