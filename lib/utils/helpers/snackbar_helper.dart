import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supercharged/supercharged.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/common/themes/app_color.dart';

class SnackbarHelper {
  static void error({
    required BuildContext context,
    required String title,
    required String message,
    required ValueChanged<Flushbar> onTap,
    required ValueChanged<FlushbarStatus?> onStatusChanged,
  }) {
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: AppColor.black,
      borderRadius: BorderRadius.circular(16),
      onStatusChanged: onStatusChanged,
      onTap: onTap,
      blockBackgroundInteraction: true,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      duration: 3000.milliseconds,
      animationDuration: 700.milliseconds,
      icon: SvgPicture.asset(
        "assets/images/ic_error.svg",
        width: 28,
        height: 28,
      ),
      titleText: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: AppColor.white),
      ),
      messageText: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: AppColor.white),
      ),
      shouldIconPulse: true,
    ).show(context);
  }

  static void success({
    required BuildContext context,
    required String title,
    required String message,
    required ValueChanged<Flushbar> onTap,
    required ValueChanged<FlushbarStatus?> onStatusChanged,
  }) {
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: AppColor.black,
      borderRadius: BorderRadius.circular(16),
      onStatusChanged: onStatusChanged,
      onTap: onTap,
      blockBackgroundInteraction: true,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      duration: 2500.milliseconds,
      animationDuration: 600.milliseconds,
      icon: SvgPicture.asset(
        "assets/images/ic_success.svg",
        width: 28,
        height: 28,
      ),
      titleText: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: AppColor.white),
      ),
      messageText: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: AppColor.white),
      ),
      shouldIconPulse: true,
    ).show(context);
  }

  static void general({
    required BuildContext context,
    required String title,
    required String message,
    required ValueChanged<Flushbar> onTap,
    required ValueChanged<FlushbarStatus?> onStatusChanged,
  }) {
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: AppColor.black,
      borderRadius: BorderRadius.circular(16),
      onStatusChanged: onStatusChanged,
      onTap: onTap,
      blockBackgroundInteraction: true,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      duration: 2500.milliseconds,
      animationDuration: 600.milliseconds,
      icon: SvgPicture.asset(
        "assets/images/ic_notification.svg",
        width: 28,
        height: 28,
      ),
      titleText: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: AppColor.white),
      ),
      messageText: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: AppColor.white),
      ),
      shouldIconPulse: true,
    ).show(context);
  }

  static void networkError({required BuildContext context}) => Flushbar(
        isDismissible: false,
        flushbarStyle: FlushbarStyle.FLOATING,
        backgroundColor: AppColor.black,
        borderRadius: BorderRadius.circular(16),
        blockBackgroundInteraction: true,
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        duration: 5.seconds,
        animationDuration: 600.milliseconds,
        icon: SvgPicture.asset(
          "assets/images/ic_disconnected.svg",
          width: 28,
          height: 28,
          color: AppColor.white,
        ),
        titleText: Text(
          Constant.networkError,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: AppColor.white),
        ),
        messageText: Text(
          Constant.networkUnavailable,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: AppColor.white),
        ),
        shouldIconPulse: true,
      ).show(context);
}
