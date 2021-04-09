// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'network_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NetworkInfoStateTearOff {
  const _$NetworkInfoStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Connected connected(NetworkConnectionInfo connectionInfo) {
    return _Connected(
      connectionInfo,
    );
  }

  _Disconnected disconnected(NetworkFailure networkFailure) {
    return _Disconnected(
      networkFailure,
    );
  }
}

/// @nodoc
const $NetworkInfoState = _$NetworkInfoStateTearOff();

/// @nodoc
mixin _$NetworkInfoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(NetworkConnectionInfo connectionInfo) connected,
    required TResult Function(NetworkFailure networkFailure) disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(NetworkConnectionInfo connectionInfo)? connected,
    TResult Function(NetworkFailure networkFailure)? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkInfoStateCopyWith<$Res> {
  factory $NetworkInfoStateCopyWith(
          NetworkInfoState value, $Res Function(NetworkInfoState) then) =
      _$NetworkInfoStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkInfoStateCopyWithImpl<$Res>
    implements $NetworkInfoStateCopyWith<$Res> {
  _$NetworkInfoStateCopyWithImpl(this._value, this._then);

  final NetworkInfoState _value;
  // ignore: unused_field
  final $Res Function(NetworkInfoState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$NetworkInfoStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'NetworkInfoState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(NetworkConnectionInfo connectionInfo) connected,
    required TResult Function(NetworkFailure networkFailure) disconnected,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(NetworkConnectionInfo connectionInfo)? connected,
    TResult Function(NetworkFailure networkFailure)? disconnected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NetworkInfoState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ConnectedCopyWith<$Res> {
  factory _$ConnectedCopyWith(
          _Connected value, $Res Function(_Connected) then) =
      __$ConnectedCopyWithImpl<$Res>;
  $Res call({NetworkConnectionInfo connectionInfo});
}

/// @nodoc
class __$ConnectedCopyWithImpl<$Res>
    extends _$NetworkInfoStateCopyWithImpl<$Res>
    implements _$ConnectedCopyWith<$Res> {
  __$ConnectedCopyWithImpl(_Connected _value, $Res Function(_Connected) _then)
      : super(_value, (v) => _then(v as _Connected));

  @override
  _Connected get _value => super._value as _Connected;

  @override
  $Res call({
    Object? connectionInfo = freezed,
  }) {
    return _then(_Connected(
      connectionInfo == freezed
          ? _value.connectionInfo
          : connectionInfo // ignore: cast_nullable_to_non_nullable
              as NetworkConnectionInfo,
    ));
  }
}

/// @nodoc
class _$_Connected implements _Connected {
  const _$_Connected(this.connectionInfo);

  @override
  final NetworkConnectionInfo connectionInfo;

  @override
  String toString() {
    return 'NetworkInfoState.connected(connectionInfo: $connectionInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Connected &&
            (identical(other.connectionInfo, connectionInfo) ||
                const DeepCollectionEquality()
                    .equals(other.connectionInfo, connectionInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(connectionInfo);

  @JsonKey(ignore: true)
  @override
  _$ConnectedCopyWith<_Connected> get copyWith =>
      __$ConnectedCopyWithImpl<_Connected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(NetworkConnectionInfo connectionInfo) connected,
    required TResult Function(NetworkFailure networkFailure) disconnected,
  }) {
    return connected(connectionInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(NetworkConnectionInfo connectionInfo)? connected,
    TResult Function(NetworkFailure networkFailure)? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(connectionInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected implements NetworkInfoState {
  const factory _Connected(NetworkConnectionInfo connectionInfo) = _$_Connected;

  NetworkConnectionInfo get connectionInfo =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ConnectedCopyWith<_Connected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DisconnectedCopyWith<$Res> {
  factory _$DisconnectedCopyWith(
          _Disconnected value, $Res Function(_Disconnected) then) =
      __$DisconnectedCopyWithImpl<$Res>;
  $Res call({NetworkFailure networkFailure});

  $NetworkFailureCopyWith<$Res> get networkFailure;
}

/// @nodoc
class __$DisconnectedCopyWithImpl<$Res>
    extends _$NetworkInfoStateCopyWithImpl<$Res>
    implements _$DisconnectedCopyWith<$Res> {
  __$DisconnectedCopyWithImpl(
      _Disconnected _value, $Res Function(_Disconnected) _then)
      : super(_value, (v) => _then(v as _Disconnected));

  @override
  _Disconnected get _value => super._value as _Disconnected;

  @override
  $Res call({
    Object? networkFailure = freezed,
  }) {
    return _then(_Disconnected(
      networkFailure == freezed
          ? _value.networkFailure
          : networkFailure // ignore: cast_nullable_to_non_nullable
              as NetworkFailure,
    ));
  }

  @override
  $NetworkFailureCopyWith<$Res> get networkFailure {
    return $NetworkFailureCopyWith<$Res>(_value.networkFailure, (value) {
      return _then(_value.copyWith(networkFailure: value));
    });
  }
}

/// @nodoc
class _$_Disconnected implements _Disconnected {
  const _$_Disconnected(this.networkFailure);

  @override
  final NetworkFailure networkFailure;

  @override
  String toString() {
    return 'NetworkInfoState.disconnected(networkFailure: $networkFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Disconnected &&
            (identical(other.networkFailure, networkFailure) ||
                const DeepCollectionEquality()
                    .equals(other.networkFailure, networkFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(networkFailure);

  @JsonKey(ignore: true)
  @override
  _$DisconnectedCopyWith<_Disconnected> get copyWith =>
      __$DisconnectedCopyWithImpl<_Disconnected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(NetworkConnectionInfo connectionInfo) connected,
    required TResult Function(NetworkFailure networkFailure) disconnected,
  }) {
    return disconnected(networkFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(NetworkConnectionInfo connectionInfo)? connected,
    TResult Function(NetworkFailure networkFailure)? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(networkFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _Disconnected implements NetworkInfoState {
  const factory _Disconnected(NetworkFailure networkFailure) = _$_Disconnected;

  NetworkFailure get networkFailure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$DisconnectedCopyWith<_Disconnected> get copyWith =>
      throw _privateConstructorUsedError;
}
