part of 'sign_in_form_cubit.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required Username username,
    required bool isSubmitting,
    required bool showErrorMessage,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(""),
        password: Password(""),
        username: Username(""),
        isSubmitting: false,
        showErrorMessage: false,
        authFailureOrSuccessOption: none(),
      );
}
