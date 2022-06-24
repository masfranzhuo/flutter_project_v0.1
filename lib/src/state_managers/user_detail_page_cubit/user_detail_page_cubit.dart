import 'package:bloc/bloc.dart';
import 'package:flutter_project/core/utils/failure.dart';
import 'package:flutter_project/src/entities/post.dart';
import 'package:flutter_project/src/entities/user.dart';
import 'package:flutter_project/src/use_cases/get_user.dart';
import 'package:flutter_project/src/use_cases/get_user_posts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_detail_page_cubit.freezed.dart';

@singleton
class UserDetailPageCubit extends Cubit<UserDetailPageState> {
  final GetUser _getUser;
  final GetUserPosts _getUserPosts;

  UserDetailPageCubit({
    required GetUser getUser,
    required GetUserPosts getUserPosts,
  })  : _getUser = getUser,
        _getUserPosts = getUserPosts,
        super(UserDetailPageState());

  void getUser({required String id}) async {
    emit(UserDetailPageState().copyWith(isLoading: true));

    final result = await _getUser(id);

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (user) {
        emit(state.copyWith(
          isLoading: false,
          user: user,
        ));
      },
    );
  }

  void getUserPosts({required String id, bool isReload = false}) async {
    emit(state.copyWith(
      isLoading: true,
      failure: null,
      postPages: isReload ? 0 : state.postPages,
      userPosts: isReload ? [] : state.userPosts,
    ));

    final result = await _getUserPosts(Params(
      id: id,
      pages: state.postPages,
    ));

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (userPosts) {
        if (userPosts.isEmpty) {
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
          postPages: state.postPages + 1,
          userPosts: [...state.userPosts, ...userPosts],
        ));
      },
    );
  }
}

@freezed
class UserDetailPageState with _$UserDetailPageState {
  const UserDetailPageState._();
  factory UserDetailPageState({
    Failure? failure,
    @Default(false) bool isLoading,
    User? user,
    @Default([]) List<Post> userPosts,
    @Default(false) bool isFriend,
    @Default(false) bool isLiked,
    @Default(0) int postPages,
  }) = _UserDetailPageState;
}
