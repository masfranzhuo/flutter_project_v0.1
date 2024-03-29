import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/failure.dart';
import 'package:flutter_project/src/entities/user.dart';
import 'package:flutter_project/src/use_cases/get_users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'users_page_cubit.freezed.dart';

@singleton
class UsersPageCubit extends Cubit<UsersPageState> {
  final GetUsers _getUsers;

  UsersPageCubit({
    required GetUsers getUsers,
  })  : _getUsers = getUsers,
        super(UsersPageState());

  void getUsers({bool isReload = false}) async {
    emit(state.copyWith(
      isLoading: true,
      failure: null,
      page: isReload ? 0 : state.page,
      users: isReload ? [] : state.users,
    ));

    final result = await _getUsers(page: state.page);

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (users) {
        if (users.isEmpty) {
          emit(state.copyWith(
            failure: const UnexpectedFailure(
              code: 'NO_DATA_FAILURE',
              message: 'No more data available',
            ),
            isLoading: false,
          ));
          return;
        }
        emit(state.copyWith(
          isLoading: false,
          page: state.page + 1,
          users: [...state.users, ...users],
        ));
      },
    );
  }
}

@freezed
class UsersPageState with _$UsersPageState {
  const UsersPageState._();
  factory UsersPageState({
    Failure? failure,
    @Default(false) bool isLoading,
    @Default([]) List<User> users,
    @Default(0) int page,
  }) = _UsersPageState;
}
