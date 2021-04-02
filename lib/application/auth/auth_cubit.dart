import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tjatat/domain/auth/auth_user.dart';
import 'package:tjatat/domain/auth/i_auth_facade.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final IAuthFacade _authFacade;

  AuthCubit(this._authFacade) : super(const AuthState.initial());

  Future<void> checkAuthStatus() async {
    final userOption = await _authFacade.getSignedInUser();

    emit(
      userOption.fold(
        () => const AuthState.unauthenticated(),
        (authUser) {
          final isVerified = _authFacade.isUserVerified;
          if (isVerified) {
            return AuthState.authenticated(authUser: authUser);
          } else {
            //  Send verification email
            _verifyAccount();
            return AuthState.unverified(authUser: authUser);
          }
        },
      ),
    );
  }

  Future<void> signOut() async {
    await _authFacade.signOut();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _verifyAccount() async {
    await _authFacade.verifyEmailAddress();
  }
}
