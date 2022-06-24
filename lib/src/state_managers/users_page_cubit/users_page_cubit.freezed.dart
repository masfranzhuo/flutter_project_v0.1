// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'users_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UsersPageStateTearOff {
  const _$UsersPageStateTearOff();

  _UsersPageState call(
      {Failure? failure,
      bool isLoading = false,
      List<User> users = const [],
      int pages = 0}) {
    return _UsersPageState(
      failure: failure,
      isLoading: isLoading,
      users: users,
      pages: pages,
    );
  }
}

/// @nodoc
const $UsersPageState = _$UsersPageStateTearOff();

/// @nodoc
mixin _$UsersPageState {
  Failure? get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<User> get users => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsersPageStateCopyWith<UsersPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersPageStateCopyWith<$Res> {
  factory $UsersPageStateCopyWith(
          UsersPageState value, $Res Function(UsersPageState) then) =
      _$UsersPageStateCopyWithImpl<$Res>;
  $Res call({Failure? failure, bool isLoading, List<User> users, int pages});
}

/// @nodoc
class _$UsersPageStateCopyWithImpl<$Res>
    implements $UsersPageStateCopyWith<$Res> {
  _$UsersPageStateCopyWithImpl(this._value, this._then);

  final UsersPageState _value;
  // ignore: unused_field
  final $Res Function(UsersPageState) _then;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isLoading = freezed,
    Object? users = freezed,
    Object? pages = freezed,
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
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UsersPageStateCopyWith<$Res>
    implements $UsersPageStateCopyWith<$Res> {
  factory _$UsersPageStateCopyWith(
          _UsersPageState value, $Res Function(_UsersPageState) then) =
      __$UsersPageStateCopyWithImpl<$Res>;
  @override
  $Res call({Failure? failure, bool isLoading, List<User> users, int pages});
}

/// @nodoc
class __$UsersPageStateCopyWithImpl<$Res>
    extends _$UsersPageStateCopyWithImpl<$Res>
    implements _$UsersPageStateCopyWith<$Res> {
  __$UsersPageStateCopyWithImpl(
      _UsersPageState _value, $Res Function(_UsersPageState) _then)
      : super(_value, (v) => _then(v as _UsersPageState));

  @override
  _UsersPageState get _value => super._value as _UsersPageState;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isLoading = freezed,
    Object? users = freezed,
    Object? pages = freezed,
  }) {
    return _then(_UsersPageState(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UsersPageState extends _UsersPageState {
  _$_UsersPageState(
      {this.failure,
      this.isLoading = false,
      this.users = const [],
      this.pages = 0})
      : super._();

  @override
  final Failure? failure;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final List<User> users;
  @JsonKey()
  @override
  final int pages;

  @override
  String toString() {
    return 'UsersPageState(failure: $failure, isLoading: $isLoading, users: $users, pages: $pages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsersPageState &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.users, users) &&
            const DeepCollectionEquality().equals(other.pages, pages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(users),
      const DeepCollectionEquality().hash(pages));

  @JsonKey(ignore: true)
  @override
  _$UsersPageStateCopyWith<_UsersPageState> get copyWith =>
      __$UsersPageStateCopyWithImpl<_UsersPageState>(this, _$identity);
}

abstract class _UsersPageState extends UsersPageState {
  factory _UsersPageState(
      {Failure? failure,
      bool isLoading,
      List<User> users,
      int pages}) = _$_UsersPageState;
  _UsersPageState._() : super._();

  @override
  Failure? get failure;
  @override
  bool get isLoading;
  @override
  List<User> get users;
  @override
  int get pages;
  @override
  @JsonKey(ignore: true)
  _$UsersPageStateCopyWith<_UsersPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
