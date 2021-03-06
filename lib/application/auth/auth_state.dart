part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.authenticated({required AuthUser authUser}) =
      _Authenticated;

  const factory AuthState.unverified({required AuthUser authUser}) =
      _Unverified;

  const factory AuthState.unauthenticated() = _Unauthenticated;
}
