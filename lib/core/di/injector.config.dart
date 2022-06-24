// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/data_sources/user_data_source.dart' as _i5;
import '../../src/repositories/user_repository.dart' as _i6;
import '../../src/state_managers/user_detail_page_cubit/user_detail_page_cubit.dart'
    as _i10;
import '../../src/state_managers/users_page_cubit/users_page_cubit.dart'
    as _i11;
import '../../src/use_cases/get_user.dart' as _i7;
import '../../src/use_cases/get_user_posts.dart' as _i8;
import '../../src/use_cases/get_users.dart' as _i9;
import '../services/http_client.dart' as _i4;
import 'register_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.HttpClientService>(
      () => _i4.HttpClientServiceImpl(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i5.UserDataSource>(
      () => _i5.UserDataSourceImpl(client: get<_i4.HttpClientService>()));
  gh.lazySingleton<_i6.UserRepository>(
      () => _i6.UserRepositoryImpl(dataSource: get<_i5.UserDataSource>()));
  gh.lazySingleton<_i7.GetUser>(
      () => _i7.GetUser(repository: get<_i6.UserRepository>()));
  gh.lazySingleton<_i8.GetUserPosts>(
      () => _i8.GetUserPosts(repository: get<_i6.UserRepository>()));
  gh.lazySingleton<_i9.GetUsers>(
      () => _i9.GetUsers(repository: get<_i6.UserRepository>()));
  gh.singleton<_i10.UserDetailPageCubit>(_i10.UserDetailPageCubit(
      getUser: get<_i7.GetUser>(), getUserPosts: get<_i8.GetUserPosts>()));
  gh.singleton<_i11.UsersPageCubit>(
      _i11.UsersPageCubit(getUsers: get<_i9.GetUsers>()));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
