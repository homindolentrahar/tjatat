import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tjatat/domain/auth/auth_failure.dart';
import 'package:tjatat/domain/auth/i_auth_facade.dart';
import 'package:tjatat/domain/auth/value_objects.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_cubit.freezed.dart';

@injectable
class SignInFormCubit extends Cubit<SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormCubit(this._authFacade) : super(SignInFormState.initial());

  void emailChanged(String email) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(email),
        authFailureOrSuccessOption: const None(),
      ),
    );
  }

  void passwordChanged(String password) {
    emit(
      state.copyWith(
        password: Password(password),
        authFailureOrSuccessOption: const None(),
      ),
    );
  }

  void confirmPasswordChange(String confirmPassword) {
    emit(
      state.copyWith(
        confirmPassword: ConfirmPassword(
          confirmPassword,
          state.password.getOrCrash(),
        ),
        authFailureOrSuccessOption: const None(),
      ),
    );
  }

  void registerWithEmailAndPassword() {
    _performActionOnAuthFacadeWithEmailAndPassword(
        _authFacade.registerWithEmailAndPassword);
  }

  void signInWithEmailAndPassword() {
    _performActionOnAuthFacadeWithEmailAndPassword(
        _authFacade.signInWithEmailAndPassword);
  }

  Future<void> signInWithGoogle() async {
    emit(
      state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: const None(),
      ),
    );
    final failureOrSuccess = await _authFacade.signInWithGoogle();
    emit(
      state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: Some(failureOrSuccess),
      ),
    );
  }

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      @required EmailAddress emailAddress,
      @required Password password,
    })
        forwardCall,
  ) async {
    Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    final isConfirmPasswordValid = state.confirmPassword.isValid();

    if (isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid &&
        state.password.getOrCrash() == state.confirmPassword.getOrCrash()) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: const None(),
        ),
      );
      failureOrSuccess = await forwardCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
