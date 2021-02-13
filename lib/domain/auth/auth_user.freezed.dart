// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthUserTearOff {
  const _$AuthUserTearOff();

// ignore: unused_element
  _User call(
      {@required UniqueId id,
      @required EmailAddress email,
      @required DateTime loginAt}) {
    return _User(
      id: id,
      email: email,
      loginAt: loginAt,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthUser = _$AuthUserTearOff();

/// @nodoc
mixin _$AuthUser {
  UniqueId get id;
  EmailAddress get email;
  DateTime get loginAt;

  @JsonKey(ignore: true)
  $AuthUserCopyWith<AuthUser> get copyWith;
}

/// @nodoc
abstract class $AuthUserCopyWith<$Res> {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) then) =
      _$AuthUserCopyWithImpl<$Res>;
  $Res call({UniqueId id, EmailAddress email, DateTime loginAt});
}

/// @nodoc
class _$AuthUserCopyWithImpl<$Res> implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._value, this._then);

  final AuthUser _value;
  // ignore: unused_field
  final $Res Function(AuthUser) _then;

  @override
  $Res call({
    Object id = freezed,
    Object email = freezed,
    Object loginAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      email: email == freezed ? _value.email : email as EmailAddress,
      loginAt: loginAt == freezed ? _value.loginAt : loginAt as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $AuthUserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, EmailAddress email, DateTime loginAt});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$AuthUserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object id = freezed,
    Object email = freezed,
    Object loginAt = freezed,
  }) {
    return _then(_User(
      id: id == freezed ? _value.id : id as UniqueId,
      email: email == freezed ? _value.email : email as EmailAddress,
      loginAt: loginAt == freezed ? _value.loginAt : loginAt as DateTime,
    ));
  }
}

/// @nodoc
class _$_User implements _User {
  const _$_User(
      {@required this.id, @required this.email, @required this.loginAt})
      : assert(id != null),
        assert(email != null),
        assert(loginAt != null);

  @override
  final UniqueId id;
  @override
  final EmailAddress email;
  @override
  final DateTime loginAt;

  @override
  String toString() {
    return 'AuthUser(id: $id, email: $email, loginAt: $loginAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.loginAt, loginAt) ||
                const DeepCollectionEquality().equals(other.loginAt, loginAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(loginAt);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements AuthUser {
  const factory _User(
      {@required UniqueId id,
      @required EmailAddress email,
      @required DateTime loginAt}) = _$_User;

  @override
  UniqueId get id;
  @override
  EmailAddress get email;
  @override
  DateTime get loginAt;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith;
}
