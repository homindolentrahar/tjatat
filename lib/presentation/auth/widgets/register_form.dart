import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tjatat/application/auth/auth_cubit.dart';
import 'package:tjatat/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:tjatat/common/animations/page_transitions.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/common/themes/app_color.dart';
import 'package:tjatat/presentation/auth/login_page.dart';
import 'package:tjatat/presentation/auth/widgets/auth_form_field.dart';
import 'package:tjatat/presentation/core/widgets/app_back_button.dart';
import 'package:tjatat/presentation/core/widgets/rounded_button.dart';
import 'package:tjatat/utils/helpers/dialog_helper.dart';
import 'package:tjatat/utils/helpers/snackbar_helper.dart';

class RegisterForm extends StatelessWidget {
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
                title: AuthConstant.registrationFailed,
                message: failure.maybeMap(
                  emailAlreadyInUse: (_) => AuthConstant.emailHasAlreadyUsed,
                  serverError: (_) => Constant.serverError,
                  usernameAlreadyTaken: (_) =>
                      AuthConstant.usernameHasAlreadyTaken,
                  networkUnavailable: (_) => Constant.networkUnavailable,
                  orElse: () => "",
                ),
                onTap: (snackbar) {},
                onStatusChanged: (status) {},
              );
            },
            (_) {
              //  User registration success
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
            _RegisterFormHeader(),
            const SizedBox(height: 45),
            _RegisterFormFormArea(),
            const SizedBox(height: 60),
            _RegisterFormFooter(),
          ],
        ),
      ),
    );
  }
}

class _RegisterFormHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Register",
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 10),
        Text(
          "We’re happy to see you want to join our platform!",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}

class _RegisterFormFormArea extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget _buildButtons(BuildContext context) {
    return RoundedButton(
      width: Constant.screenWidth(context) * 0.8,
      text: "Register",
      onPressed: () {
        context.read<SignInFormCubit>().registerWithEmailAndPassword();
      },
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
              controller: usernameController,
              inputType: AuthFormFieldInput.username,
              keyboardType: TextInputType.name,
              hintText: "Username",
              icon: SvgPicture.asset("assets/images/ic_user.svg"),
              onChanged: (value) {
                context.read<SignInFormCubit>().usernameChanged(value);
              },
            ),
            const SizedBox(height: 30),
            AuthFormField(
              controller: emailController,
              inputType: AuthFormFieldInput.email,
              hintText: "Email",
              icon: SvgPicture.asset("assets/images/ic_email.svg"),
              onChanged: (value) {
                context.read<SignInFormCubit>().emailChanged(value);
              },
            ),
            const SizedBox(height: 30),
            AuthFormField(
              controller: passwordController,
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
            const SizedBox(height: 45),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }
}

class _RegisterFormFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.subtitle2,
          children: [
            const TextSpan(text: "Good that you already have one!  "),
            TextSpan(
              text: "Login",
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: AppColor.colorPrimary,
                    fontWeight: FontWeight.bold,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //  Navigate to Login Page
                  Navigator.pushReplacement(
                    context,
                    SlideDown(page: LoginPage()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
