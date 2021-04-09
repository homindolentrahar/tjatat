import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tjatat/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:tjatat/application/core/timer/timer_cubit.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/presentation/auth/widgets/auth_form_field.dart';
import 'package:tjatat/presentation/core/widgets/app_back_button.dart';
import 'package:tjatat/presentation/core/widgets/rounded_icon_button.dart';
import 'package:tjatat/utils/helpers/dialog_helper.dart';
import 'package:tjatat/utils/helpers/format_helper.dart';
import 'package:tjatat/utils/helpers/snackbar_helper.dart';

class ForgotPasswordForm extends StatelessWidget {
  final _emailController = TextEditingController();

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
                title: Constant.failedToSendEmail,
                message: failure.maybeMap(
                  failedToSendForgotPasswordEmail: (_) =>
                      Constant.errorSendingEmail,
                  networkUnavailable: (_) => Constant.networkUnavailable,
                  orElse: () => "",
                ),
                onTap: (snackbar) {},
                onStatusChanged: (status) {},
              );
            },
            (_) {
              Navigator.pop(context);
              SnackbarHelper.success(
                context: context,
                title: "Email sent successfully",
                message:
                    "An email to reset password has been sent to your inbox",
                onTap: (snackbar) {},
                onStatusChanged: (status) {},
              );
              //  Start the timer
              context.read<TimerCubit>().start(duration);
              _emailController.clear();
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
            _ForgotPasswordFormHeader(),
            const SizedBox(height: 30),
            _ForgotPasswordFormFormArea(emailController: _emailController),
            const SizedBox(height: 60),
            _ForgotPasswordFormFooter(),
          ],
        ),
      ),
    );
  }
}

class _ForgotPasswordFormHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset("assets/images/forgot_password.svg"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 10),
            Text(
              "It’s okay if you forgot that, just let us know by providing your email",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        )
      ],
    );
  }
}

class _ForgotPasswordFormFormArea extends StatelessWidget {
  final TextEditingController emailController;

  const _ForgotPasswordFormFormArea({required this.emailController});

  Widget _buildButton(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      bloc: context.read<TimerCubit>(),
      builder: (ctx, state) => RoundedIconButton(
        width: Constant.screenWidth(context) * 0.5,
        text: "Send",
        icon: SvgPicture.asset(
          "assets/images/ic_send.svg",
          width: 24,
          height: 24,
        ),
        onPressed: state.map(
          ready: (ready) {
            return () =>
                context.read<SignInFormCubit>().sendForgotPasswordEmail();
          },
          running: (running) => null,
          finished: (finished) {
            return () =>
                context.read<SignInFormCubit>().sendForgotPasswordEmail();
          },
        ),
      ),
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              inputType: AuthFormFieldInput.email,
              action: TextInputAction.done,
              hintText: "Email",
              icon: SvgPicture.asset("assets/images/ic_email.svg"),
              onChanged: (value) {
                context.read<SignInFormCubit>().emailChanged(value);
              },
            ),
            const SizedBox(height: 30),
            _buildButton(context),
          ],
        ),
      ),
    );
  }
}

class _ForgotPasswordFormFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      bloc: context.read<TimerCubit>(),
      builder: (ctx, state) {
        final minuteStr = state.maybeMap(
          running: (running) =>
              FormatHelper.formatTimerMinutes(running.duration),
          orElse: () => "",
        );
        final secondStr = state.maybeMap(
          running: (running) =>
              FormatHelper.formatTimerSeconds(running.duration),
          orElse: () => "",
        );

        return state.maybeMap(
          running: (running) => Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Try again in $minuteStr:$secondStr",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
