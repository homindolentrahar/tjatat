// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthUserDto _$AuthUserDtoFromJson(Map<String, dynamic> json) {
  return _AuthUserDto.fromJson(json);
}

/// @nodoc
class _$AuthUserDtoTearOff {
  const _$AuthUserDtoTearOff();

  _AuthUserDto call(
      {@JsonKey(ignore: true) String? id,
      required String username,
      required String emailAddress,
      required int lastSignedIn}) {
    return _AuthUserDto(
      id: id,
      username: username,
      emailAddress: emailAddress,
      lastSignedIn: lastSignedIn,
    );
  }

  AuthUserDto fromJson(Map<String, Object> json) {
    return AuthUserDto.fromJson(json);
  }
}

/// @nodoc
const $AuthUserDto = _$AuthUserDtoTearOff();

/// @nodoc
mixin _$AuthUserDto {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  int get lastSignedIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthUserDtoCopyWith<AuthUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserDtoCopyWith<$Res> {
  factory $AuthUserDtoCopyWith(
          AuthUserDto value, $Res Function(AuthUserDto) then) =
      _$AuthUserDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String username,
      String emailAddress,
      int lastSignedIn});
}

/// @nodoc
class _$AuthUserDtoCopyWithImpl<$Res> implements $AuthUserDtoCopyWith<$Res> {
  _$AuthUserDtoCopyWithImpl(this._value, this._then);

  final AuthUserDto _value;
  // ignore: unused_field
  final $Res Function(AuthUserDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? emailAddress = freezed,
    Object? lastSignedIn = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      lastSignedIn: lastSignedIn == freezed
          ? _value.lastSignedIn
          : lastSignedIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AuthUserDtoCopyWith<$Res>
    implements $AuthUserDtoCopyWith<$Res> {
  factory _$AuthUserDtoCopyWith(
          _AuthUserDto value, $Res Function(_AuthUserDto) then) =
      __$AuthUserDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String username,
      String emailAddress,
      int lastSignedIn});
}

/// @nodoc
class __$AuthUserDtoCopyWithImpl<$Res> extends _$AuthUserDtoCopyWithImpl<$Res>
    implements _$AuthUserDtoCopyWith<$Res> {
  __$AuthUserDtoCopyWithImpl(
      _AuthUserDto _value, $Res Function(_AuthUserDto) _then)
      : super(_value, (v) => _then(v as _AuthUserDto));

  @override
  _AuthUserDto get _value => super._value as _AuthUserDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? emailAddress = freezed,
    Object? lastSignedIn = freezed,
  }) {
    return _then(_AuthUserDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      lastSignedIn: lastSignedIn == freezed
          ? _value.lastSignedIn
          : lastSignedIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AuthUserDto extends _AuthUserDto {
  const _$_AuthUserDto(
      {@JsonKey(ignore: true) this.id,
      required this.username,
      required this.emailAddress,
      required this.lastSignedIn})
      : super._();

  factory _$_AuthUserDto.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthUserDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String username;
  @override
  final String emailAddress;
  @override
  final int lastSignedIn;

  @override
  String toString() {
    return 'AuthUserDto(id: $id, username: $username, emailAddress: $emailAddress, lastSignedIn: $lastSignedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthUserDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.lastSignedIn, lastSignedIn) ||
                const DeepCollectionEquality()
                    .equals(other.lastSignedIn, lastSignedIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(lastSignedIn);

  @JsonKey(ignore: true)
  @override
  _$AuthUserDtoCopyWith<_AuthUserDto> get copyWith =>
      __$AuthUserDtoCopyWithImpl<_AuthUserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthUserDtoToJson(this);
  }
}

abstract class _AuthUserDto extends AuthUserDto {
  const factory _AuthUserDto(
      {@JsonKey(ignore: true) String? id,
      required String username,
      required String emailAddress,
      required int lastSignedIn}) = _$_AuthUserDto;
  const _AuthUserDto._() : super._();

  factory _AuthUserDto.fromJson(Map<String, dynamic> json) =
      _$_AuthUserDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get emailAddress => throw _privateConstructorUsedError;
  @override
  int get lastSignedIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthUserDtoCopyWith<_AuthUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
