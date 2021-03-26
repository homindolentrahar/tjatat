import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tjatat/application/auth/auth_cubit.dart';
import 'package:tjatat/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:tjatat/common/animations/page_transitions.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/common/themes/app_color.dart';
import 'package:tjatat/presentation/auth/register_page.dart';
import 'package:tjatat/presentation/auth/widgets/auth_form_field.dart';
import 'package:tjatat/presentation/core/widgets/app_back_button.dart';
import 'package:tjatat/presentation/core/widgets/outline_rounded_icon_button.dart';
import 'package:tjatat/presentation/core/widgets/rounded_button.dart';
import 'package:tjatat/utils/helpers/dialog_helper.dart';
import 'package:tjatat/utils/helpers/snackbar_helper.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInFormCubit, SignInFormState>(
      bloc: context.read<SignInFormCubit>(),
      listener: (ctx, state) {
        if (state.isSubmitting) {
          DialogHelper.loading(context);
        }

        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              Navigator.pop(context);
              SnackbarHelper.error(
                context: context,
                title: "Authentication Error",
                message: failure.maybeMap(
                  invalidEmailAndPassword: (_) => "Invalid email and password",
                  cancelledByUser: (_) => "User cancel login with Google",
                  serverError: (_) => "Something wrong with the server",
                  orElse: () => "",
                ),
                onTap: (snackbar) {},
                onStatusChanged: (status) {},
              );
            },
            (_) {
              //  User authentication success
              //  Navigate to Notes Page
              context.read<AuthCubit>().checkAuthStatus();
            },
          ),
        );
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBackButton(),
            const SizedBox(height: 30),
            _LoginFormHeader(),
            const SizedBox(height: 45),
            _LoginFormFormArea(),
            const SizedBox(height: 60),
            _LoginFormFooter(),
          ],
        ),
      ),
    );
  }
}

class _LoginFormHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login",
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 10),
        Text(
          "Just like any other platform, fill the blank first before you continue",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}

class _LoginFormFormArea extends StatelessWidget {
  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        RoundedButton(
          width: Constant.screenWidth(context) * 0.8,
          text: "Login",
          onPressed: () {
            context.read<SignInFormCubit>().signInWithEmailAndPassword();
          },
        ),
        const SizedBox(height: 10),
        Text(
          "or",
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        OutlineRoundedIconButton(
          width: Constant.screenWidth(context) * 0.8,
          text: "Google",
          icon: SvgPicture.asset("assets/images/ic_google.svg"),
          onPressed: () {
            context.read<SignInFormCubit>().signInWithGoogle();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormCubit, SignInFormState>(
      bloc: context.read<SignInFormCubit>(),
      builder: (ctx, state) => Form(
        autovalidateMode: state.showErrorMessage
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Column(
          children: [
            AuthFormField(
              inputType: AuthFormFieldInput.email,
              hintText: "Email",
              icon: SvgPicture.asset("assets/images/ic_email.svg"),
              onChanged: (value) {
                context.read<SignInFormCubit>().emailChanged(value);
              },
            ),
            const SizedBox(height: 30),
            AuthFormField(
              inputType: AuthFormFieldInput.password,
              obscure: true,
              keyboardType: TextInputType.visiblePassword,
              action: TextInputAction.done,
              hintText: "Password",
              icon: SvgPicture.asset("assets/images/ic_password.svg"),
              onChanged: (value) {
                context.read<SignInFormCubit>().passwordChanged(value);
              },
            ),
            // const SizedBox(height: 15),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Text(
            //       "Forgot Password?",
            //       style: Theme.of(context).textTheme.subtitle2,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 30),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }
}

class _LoginFormFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.subtitle2,
          children: [
            const TextSpan(text: "Welp, you don’t have account?  "),
            TextSpan(
              text: "Register",
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: AppColor.colorPrimary,
                    fontWeight: FontWeight.bold,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //  Navigate to Register Page
                  Navigator.pushReplacement(
                    context,
                    SlideUp(page: RegisterPage()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
