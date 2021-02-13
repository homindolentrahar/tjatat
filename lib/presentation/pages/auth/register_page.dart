import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjatat/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:tjatat/common/constants/constants.dart';
import 'package:tjatat/common/themes/app_color.dart';
import 'package:tjatat/injection.dart';
import 'package:tjatat/presentation/routes/router.gr.dart';
import 'package:tjatat/presentation/widgets/custom_icon_button.dart';
import 'package:tjatat/presentation/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  SignInFormCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<SignInFormCubit>();

    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();

    super.dispose();
  }

  Widget _buildHeader() {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/images/register.svg",
          fit: BoxFit.cover,
          height: Constants.screenHeight(context) * 0.2,
        ),
        const SizedBox(height: 15),
        Text(
          "register",
          style: GoogleFonts.ptSerif(
            color: AppColor.black,
            fontSize: 40,
          ),
        ),
        Text(
          "Register first, then you can proceed",
          style: GoogleFonts.ptSans(
            color: AppColor.dark,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return BlocConsumer<SignInFormCubit, SignInFormState>(
      cubit: _cubit,
      listenWhen: (previous, current) => previous != current,
      buildWhen: (previous, current) => previous != current,
      listener: (ctx, state) {
        state.authFailureOrSuccessOption.fold(
          () => {},
          (either) => either.fold(
            (failure) {
              final message = failure.maybeMap(
                serverError: (_) => "Server Error",
                emailAlreadyInUse: (_) => "Email already in use",
                orElse: () {},
              );
              Constants.showBar(
                context: context,
                icon: FluentIcons.error_circle_24_regular,
                title: "Error occurred",
                message: message,
                type: BarType.ERROR,
              );
            },
            (_) {
              Constants.showBar(
                context: context,
                icon: FluentIcons.signed_24_regular,
                title: "Success",
                message: "Account created!",
                type: BarType.SUCCESS,
                actionAfterDismissed: () {
                  ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.notePage,
                    (route) => false,
                  );
                },
              );
            },
          ),
        );
      },
      builder: (ctx, state) => Form(
        autovalidateMode: state.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Column(
          children: [
            CustomTextField(
              label: "Email",
              onChanged: (value) {
                _cubit.emailChanged(value);
              },
              validator: (value) {
                return _cubit.state.emailAddress.value.fold(
                  (failure) => failure.maybeMap(
                    invalidEmail: (_) => "Invalid email",
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              },
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: "Password",
              obscure: true,
              onChanged: (value) {
                _cubit.passwordChanged(value);
              },
              validator: (value) {
                return _cubit.state.password.value.fold(
                  (failure) => failure.maybeMap(
                    shortPassword: (_) => "Invalid password",
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              },
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: "Confirm Password",
              obscure: true,
              onChanged: (value) {
                _cubit.confirmPasswordChange(value);
              },
              validator: (value) {
                return _cubit.state.confirmPassword.value.fold(
                  (failure) => failure.maybeMap(
                    confirmPasswordNotMatch: (_) =>
                        "Confirm password not matching password",
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              },
            ),
            const SizedBox(height: 30),
            CustomIconButton(
              icon: FluentIcons.signature_24_regular,
              text: "Register",
              onPressed: () {
                _cubit.registerWithEmailAndPassword();
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "already have an account?",
                  style: GoogleFonts.ptSans(
                    color: AppColor.dark,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "login",
                    style: GoogleFonts.ptSans(
                      color: AppColor.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 30),
              _buildHeader(),
              const SizedBox(height: 30),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }
}
