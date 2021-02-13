import 'package:auto_route/auto_route.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjatat/application/auth/auth_cubit.dart';
import 'package:tjatat/common/themes/app_color.dart';
import 'package:tjatat/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      cubit: BlocProvider.of<AuthCubit>(context),
      listener: (ctx, state) {
        Future.delayed(2500.milliseconds, () {
          state.map(
            initial: (_) {},
            authenticated: (_) =>
                ExtendedNavigator.of(context).replace(Routes.notePage),
            unauthenticated: (_) =>
                ExtendedNavigator.of(context).replace(Routes.loginPage),
          );
        });
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/splash.svg",
                width: 128,
                height: 128,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                "tjatat",
                style: GoogleFonts.ptSerif(
                  color: AppColor.black,
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 45),
              const SpinKitFadingCube(
                size: 28,
                color: AppColor.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
