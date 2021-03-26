import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supercharged/supercharged.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/common/themes/app_color.dart';

class SplashPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final progressController =
        useAnimationController(duration: 3000.milliseconds)..forward();
    final progressAnimation =
        useAnimation<int>(0.tweenTo(200).animate(progressController));

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tjatat",
                style: Theme.of(context).textTheme.overline,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: Constant.screenWidth(context) * 0.6,
                child: Text(
                  "Write it, you can’t remember everything",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const SizedBox(height: 45),
              SizedBox(
                width: 200,
                child: FAProgressBar(
                  size: 3,
                  currentValue: progressAnimation,
                  backgroundColor: AppColor.lightTwo,
                  progressColor: AppColor.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
