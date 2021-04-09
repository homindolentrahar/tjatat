import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tjatat/application/auth/auth_cubit.dart';
import 'package:tjatat/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:tjatat/application/core/timer/timer_cubit.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/common/themes/app_color.dart';
import 'package:tjatat/utils/helpers/dialog_helper.dart';
import 'package:tjatat/utils/helpers/format_helper.dart';
import 'package:tjatat/utils/helpers/snackbar_helper.dart';

class EmailVerificationForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    Timer? timer;

    useEffect(
      () {
        timer = Timer.periodic(const Duration(seconds: 10), (timer) {
          dev.log("Running every 10 seconds");
          context.read<AuthCubit>().checkVerifiedStatus();
        });

        return timer?.cancel;
      },
      [],
    );

    return BlocListener<SignInFormCubit, SignInFormState>(
      bloc: context.read<SignInFormCubit>(),
      listener: (ctx, state) {
        if (state.isSubmitting) {
          DialogHelper.loading(context);
        }

        state.authFailureOrSuccessOption.fold(
          () => null,
          (either) => either.fold(
            (failure) {
              Navigator.pop(context);
              SnackbarHelper.error(
                context: context,
                title: Constant.failedToSendEmail,
                message: failure.maybeMap(
                  userNotSignedIn: (_) => AuthConstant.userIsNotSignedIn,
                  failedToSendForgotPasswordEmail: (_) =>
                      Constant.failedToSendEmail,
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
                    "An email to verify account has been sent to your inbox",
                onTap: (snackbar) {},
                onStatusChanged: (status) {},
              );
              //  Start the timer
              context.read<TimerCubit>().start(duration);
            },
          ),
        );
      },
      child: Container(
        width: Constant.screenWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => context
                    .read<AuthCubit>()
                    .signOut()
                    .then((_) => DialogHelper.loading(context)),
                child: SvgPicture.asset("assets/images/ic_back.svg"),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Verification",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: Constant.screenWidth(context) * 0.75,
                    child: Text(
                      "We’ve sent you verification email to confirm your account. Check it please...and come back here 😺\nPlease wait around 10 secs after you verify your email before getting redirected...",
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            BlocBuilder<TimerCubit, TimerState>(
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

                return RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.subtitle2,
                    children: [
                      const TextSpan(
                        text: "Didn’t receive any email from us?  ",
                      ),
                      state.maybeMap(
                        running: (running) => TextSpan(
                          text: "$minuteStr:$secondStr",
                        ),
                        orElse: () => TextSpan(
                          text: "Resend",
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                    color: AppColor.colorPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //  Resend the email
                              context
                                  .read<SignInFormCubit>()
                                  .verifyEmailAddress();
                            },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
