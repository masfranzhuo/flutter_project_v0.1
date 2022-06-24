// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_detail_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserDetailPageStateTearOff {
  const _$UserDetailPageStateTearOff();

  _UserDetailPageState call(
      {Failure? failure,
      bool isLoading = false,
      User? user,
      List<Post> userPosts = const [],
      bool isFriend = false,
      bool isLiked = false,
      int postPages = 0}) {
    return _UserDetailPageState(
      failure: failure,
      isLoading: isLoading,
      user: user,
      userPosts: userPosts,
      isFriend: isFriend,
      isLiked: isLiked,
      postPages: postPages,
    );
  }
}

/// @nodoc
const $UserDetailPageState = _$UserDetailPageStateTearOff();

/// @nodoc
mixin _$UserDetailPageState {
  Failure? get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<Post> get userPosts => throw _privateConstructorUsedError;
  bool get isFriend => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  int get postPages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDetailPageStateCopyWith<UserDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailPageStateCopyWith<$Res> {
  factory $UserDetailPageStateCopyWith(
          UserDetailPageState value, $Res Function(UserDetailPageState) then) =
      _$UserDetailPageStateCopyWithImpl<$Res>;
  $Res call(
      {Failure? failure,
      bool isLoading,
      User? user,
      List<Post> userPosts,
      bool isFriend,
      bool isLiked,
      int postPages});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserDetailPageStateCopyWithImpl<$Res>
    implements $UserDetailPageStateCopyWith<$Res> {
  _$UserDetailPageStateCopyWithImpl(this._value, this._then);

  final UserDetailPageState _value;
  // ignore: unused_field
  final $Res Function(UserDetailPageState) _then;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isLoading = freezed,
    Object? user = freezed,
    Object? userPosts = freezed,
    Object? isFriend = freezed,
    Object? isLiked = freezed,
    Object? postPages = freezed,
  }) {
    return _then(_value.copyWith(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userPosts: userPosts == freezed
          ? _value.userPosts
          : userPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      isFriend: isFriend == freezed
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      postPages: postPages == freezed
          ? _value.postPages
          : postPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$UserDetailPageStateCopyWith<$Res>
    implements $UserDetailPageStateCopyWith<$Res> {
  factory _$UserDetailPageStateCopyWith(_UserDetailPageState value,
          $Res Function(_UserDetailPageState) then) =
      __$UserDetailPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Failure? failure,
      bool isLoading,
      User? user,
      List<Post> userPosts,
      bool isFriend,
      bool isLiked,
      int postPages});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$UserDetailPageStateCopyWithImpl<$Res>
    extends _$UserDetailPageStateCopyWithImpl<$Res>
    implements _$UserDetailPageStateCopyWith<$Res> {
  __$UserDetailPageStateCopyWithImpl(
      _UserDetailPageState _value, $Res Function(_UserDetailPageState) _then)
      : super(_value, (v) => _then(v as _UserDetailPageState));

  @override
  _UserDetailPageState get _value => super._value as _UserDetailPageState;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isLoading = freezed,
    Object? user = freezed,
    Object? userPosts = freezed,
    Object? isFriend = freezed,
    Object? isLiked = freezed,
    Object? postPages = freezed,
  }) {
    return _then(_UserDetailPageState(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userPosts: userPosts == freezed
          ? _value.userPosts
          : userPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      isFriend: isFriend == freezed
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      postPages: postPages == freezed
          ? _value.postPages
          : postPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UserDetailPageState extends _UserDetailPageState {
  _$_UserDetailPageState(
      {this.failure,
      this.isLoading = false,
      this.user,
      this.userPosts = const [],
      this.isFriend = false,
      this.isLiked = false,
      this.postPages = 0})
      : super._();

  @override
  final Failure? failure;
  @JsonKey()
  @override
  final bool isLoading;
  @override
  final User? user;
  @JsonKey()
  @override
  final List<Post> userPosts;
  @JsonKey()
  @override
  final bool isFriend;
  @JsonKey()
  @override
  final bool isLiked;
  @JsonKey()
  @override
  final int postPages;

  @override
  String toString() {
    return 'UserDetailPageState(failure: $failure, isLoading: $isLoading, user: $user, userPosts: $userPosts, isFriend: $isFriend, isLiked: $isLiked, postPages: $postPages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDetailPageState &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.userPosts, userPosts) &&
            const DeepCollectionEquality().equals(other.isFriend, isFriend) &&
            const DeepCollectionEquality().equals(other.isLiked, isLiked) &&
            const DeepCollectionEquality().equals(other.postPages, postPages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(userPosts),
      const DeepCollectionEquality().hash(isFriend),
      const DeepCollectionEquality().hash(isLiked),
      const DeepCollectionEquality().hash(postPages));

  @JsonKey(ignore: true)
  @override
  _$UserDetailPageStateCopyWith<_UserDetailPageState> get copyWith =>
      __$UserDetailPageStateCopyWithImpl<_UserDetailPageState>(
          this, _$identity);
}

abstract class _UserDetailPageState extends UserDetailPageState {
  factory _UserDetailPageState(
      {Failure? failure,
      bool isLoading,
      User? user,
      List<Post> userPosts,
      bool isFriend,
      bool isLiked,
      int postPages}) = _$_UserDetailPageState;
  _UserDetailPageState._() : super._();

  @override
  Failure? get failure;
  @override
  bool get isLoading;
  @override
  User? get user;
  @override
  List<Post> get userPosts;
  @override
  bool get isFriend;
  @override
  bool get isLiked;
  @override
  int get postPages;
  @override
  @JsonKey(ignore: true)
  _$UserDetailPageStateCopyWith<_UserDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
