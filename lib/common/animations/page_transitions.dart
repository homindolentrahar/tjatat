import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class SlideUp extends PageRouteBuilder {
  final Widget page;

  SlideUp({required this.page})
      : super(
          transitionDuration: 600.milliseconds,
          reverseTransitionDuration: 600.milliseconds,
          pageBuilder: (ctx, anim, secondAnim) => page,
          transitionsBuilder: (ctx, anim, secondAnim, child) => SlideTransition(
            position: const Offset(0, 1).tweenTo(Offset.zero).animate(anim),
            child: child,
          ),
        );
}

class SlideDown extends PageRouteBuilder {
  final Widget page;

  SlideDown({required this.page})
      : super(
          transitionDuration: 600.milliseconds,
          reverseTransitionDuration: 600.milliseconds,
          pageBuilder: (ctx, anim, secondAnim) => page,
          transitionsBuilder: (ctx, anim, secondAnim, child) => SlideTransition(
            position: const Offset(0, -1).tweenTo(Offset.zero).animate(anim),
            child: child,
          ),
        );
}

class SlideLeft extends PageRouteBuilder {
  final Widget page;

  SlideLeft({required this.page})
      : super(
          transitionDuration: 600.milliseconds,
          reverseTransitionDuration: 600.milliseconds,
          pageBuilder: (ctx, anim, secondAnim) => page,
          transitionsBuilder: (ctx, anim, secondAnim, child) => SlideTransition(
            position: const Offset(1, 0).tweenTo(Offset.zero).animate(anim),
            child: child,
          ),
        );
}

class FadeIn extends PageRouteBuilder {
  final Widget page;

  FadeIn({required this.page})
      : super(
          transitionDuration: 600.milliseconds,
          reverseTransitionDuration: 600.milliseconds,
          pageBuilder: (ctx, anim, secondAnim) => page,
          transitionsBuilder: (ctx, anim, secondAnim, child) => FadeTransition(
            opacity: 0.0.tweenTo(1.0).animate(anim).curve(Curves.easeIn),
            child: child,
          ),
        );
}

class FadeOut extends PageRouteBuilder {
  final Widget page;

  FadeOut({required this.page})
      : super(
          transitionDuration: 600.milliseconds,
          reverseTransitionDuration: 600.milliseconds,
          pageBuilder: (ctx, anim, secondAnim) => page,
          transitionsBuilder: (ctx, anim, secondAnim, child) => FadeTransition(
            opacity: 1.0.tweenTo(0.0).animate(anim).curve(Curves.easeOut),
            child: child,
          ),
        );
}
