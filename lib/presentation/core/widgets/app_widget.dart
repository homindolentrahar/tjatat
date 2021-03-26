import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercharged/supercharged.dart';
import 'package:tjatat/application/auth/auth_cubit.dart';
import 'package:tjatat/common/animations/page_transitions.dart';
import 'package:tjatat/common/themes/theme.dart';
import 'package:tjatat/injection.dart';
import 'package:tjatat/presentation/auth/landing_page.dart';
import 'package:tjatat/presentation/notes/main_page.dart';
import 'package:tjatat/presentation/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => getIt<AuthCubit>()..checkAuthStatus(),
        ),
      ],
      child: MaterialApp(
        title: "Tjatat",
        theme: appTheme,
        navigatorKey: _navigatorKey,
        builder: (builderCtx, child) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (ctx, state) {
              state.maybeMap(
                authenticated: (authenticated) => Future.delayed(
                  3000.milliseconds,
                  () {
                    dev.log("Authenticated");
                    _navigator?.pushAndRemoveUntil(
                      SlideLeft(page: MainPage()),
                      (route) => false,
                    );
                  },
                ),
                unauthenticated: (_) => Future.delayed(
                  3000.milliseconds,
                  () {
                    dev.log("Unauthenticated");
                    _navigator?.pushAndRemoveUntil(
                      SlideLeft(page: LandingPage()),
                      (route) => false,
                    );
                  },
                ),
                orElse: () {
                  dev.log("Impossible to happen");
                },
              );
            },
            child: child,
          );
        },
        onGenerateRoute: (_) => FadeIn(page: SplashPage()),
      ),
    );
  }
}
