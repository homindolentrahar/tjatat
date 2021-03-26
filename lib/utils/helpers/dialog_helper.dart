import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tjatat/common/themes/app_color.dart';

class DialogHelper {
  static void loading(BuildContext context) {
    showDialog(
      useSafeArea: false,
      barrierDismissible: false,
      context: context,
      builder: (ctx) => WillPopScope(
        onWillPop: () async => false,
        child: const AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: SpinKitFadingCube(
            size: 28,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}
