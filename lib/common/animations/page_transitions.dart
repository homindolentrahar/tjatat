import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class SlideLeft extends PageRouteBuilder {
  final Widget page;

  SlideLeft({@required this.page})
      : super(
          pageBuilder: (ctx, anim, secondAnim) => page,
          transitionsBuilder: (ctx, anim, secondAnim, child) => SlideTransition(
            position: const Offset(1.0, 0.0).tweenTo(Offset.zero).animate(anim),
            child: child,
          ),
          transitionDuration: 800.milliseconds,
          reverseTransitionDuration: 800.milliseconds,
        );
}
