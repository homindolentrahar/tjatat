import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tjatat/common/animations/page_transitions.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/presentation/auth/login_page.dart';
import 'package:tjatat/presentation/auth/register_page.dart';
import 'package:tjatat/presentation/core/widgets/outline_rounded_button.dart';
import 'package:tjatat/presentation/core/widgets/rounded_button.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/images/landing.svg",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yo!",
                    style: Theme.of(context).textTheme.overline,
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: Constant.screenWidth(context) * 0.6,
                    child: Text(
                      "Tjatat is yet another notes app to help you manage and organize your activities",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  const SizedBox(height: 45),
                  Row(
                    children: [
                      Expanded(
                        child: OutlineRoundedButton(
                          text: "Register",
                          onPressed: () {
                            //  Navigate to Register page
                            Navigator.push(
                                context, SlideLeft(page: RegisterPage()));
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: RoundedButton(
                          text: "Login",
                          onPressed: () {
                            //  Navigate to Login page
                            Navigator.push(
                                context, SlideLeft(page: LoginPage()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
