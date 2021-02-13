import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tjatat/domain/auth/i_auth_facade.dart';
import 'package:tjatat/domain/auth/auth_user.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final IAuthFacade _authFacade;

  AuthCubit(this._authFacade) : super(const AuthState.initial());

  Future<void> authCheckRequest() async {
    final userOption = await _authFacade.getSignedInUser();

    userOption.fold(
      () => emit(const AuthState.unauthenticated()),
      (authUser) => emit(AuthState.authenticated(authUser)),
    );
  }

  Future<void> signOut() async {
    await _authFacade.signOut();
    emit(const AuthState.unauthenticated());
  }
}
