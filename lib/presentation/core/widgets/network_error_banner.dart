import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/common/themes/app_color.dart';

class NetworkErrorBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: 0,
      left: 0,
      right: 0,
      duration: const Duration(milliseconds: 600),
      child: Container(
        width: Constant.screenWidth(context),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/images/ic_disconnected.svg",
              width: 24,
              height: 24,
              color: AppColor.white,
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Network Error",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: AppColor.white, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  "Internet connection unavailable",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColor.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
