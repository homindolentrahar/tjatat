import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjatat/application/auth/auth_cubit.dart';
import 'package:tjatat/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:tjatat/common/animations/page_transitions.dart';
import 'package:tjatat/common/constants/constants.dart';
import 'package:tjatat/common/themes/app_color.dart';
import 'package:tjatat/injection.dart';
import 'package:tjatat/presentation/pages/auth/register_page.dart';
import 'package:tjatat/presentation/routes/router.gr.dart';
import 'package:tjatat/presentation/widgets/custom_icon_button.dart';
import 'package:tjatat/presentation/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          "assets/images/notes.svg",
          fit: BoxFit.cover,
          height: Constants.screenHeight(context) * 0.2,
        ),
        const SizedBox(height: 15),
        Text(
          "tjatat",
          style: GoogleFonts.ptSerif(
            color: AppColor.black,
            fontSize: 40,
          ),
        ),
        Text(
          "Write it down, in case you forget it",
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
              final message = failure.map(
                cancelByUser: (_) => "Cancelled By User",
                serverError: (_) => "Server Error",
                emailAlreadyInUse: (_) => "Email already in use",
                invalidEmailAndPassword: (_) => "Invalid email or password",
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
              //  Change AuthState into Authenticated because user is available
              BlocProvider.of<AuthCubit>(context).authCheckRequest();
              ExtendedNavigator.of(context).replace(Routes.notePage);
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
                _cubit.confirmPasswordChange(value);
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
            const SizedBox(height: 30),
            CustomIconButton(
              icon: FluentIcons.fingerprint_24_regular,
              text: "Login",
              onPressed: () {
                _cubit.signInWithEmailAndPassword();
              },
            ),
            const SizedBox(height: 15),
            Text(
              "or login with",
              style: GoogleFonts.ptSans(
                color: AppColor.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 15),
            CustomIconButton(
              icon: FluentIcons.bot_24_regular,
              text: "Google",
              textColor: AppColor.dark,
              background: AppColor.light,
              onPressed: () {
                _cubit.signInWithGoogle();
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "don\'t have any account?",
                  style: GoogleFonts.ptSans(
                    color: AppColor.dark,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, SlideLeft(page: RegisterPage()));
                  },
                  child: Text(
                    "register",
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
