import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjatat/common/themes/app_color.dart';

enum BarType { SUCCESS, ERROR, INFO }

class Constants {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static void showBar({
    @required BuildContext context,
    @required IconData icon,
    @required String title,
    @required String message,
    @required BarType type,
    VoidCallback actionAfterDismissed,
  }) {
    final Map<BarType, Color> backgroundColor = {
      BarType.SUCCESS: AppColor.success,
      BarType.ERROR: AppColor.error,
      BarType.INFO: AppColor.black,
    };

    Flushbar(
      icon: Icon(
        icon,
        color: AppColor.white,
        size: 28,
      ),
      titleText: Text(
        title,
        style: GoogleFonts.ptSans(
          color: AppColor.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.ptSans(
          color: AppColor.white,
          fontSize: 14,
        ),
      ),
      duration: 2000.milliseconds,
      animationDuration: 700.milliseconds,
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(15),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: true,
      backgroundColor: backgroundColor[type],
      barBlur: 5,
      onStatusChanged: (status) {
        if (status == FlushbarStatus.DISMISSED) {
          actionAfterDismissed();
        }
      },
    ).show(context);
  }
}
