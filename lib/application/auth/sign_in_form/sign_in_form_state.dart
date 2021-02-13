part of 'sign_in_form_cubit.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    @required EmailAddress emailAddress,
    @required Password password,
    @required ConfirmPassword confirmPassword,
    @required bool isSubmitting,
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
    @required bool showErrorMessages,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(""),
        password: Password(""),
        confirmPassword: ConfirmPassword("", ""),
        isSubmitting: false,
        authFailureOrSuccessOption: const None(),
        showErrorMessages: false,
      );
}
