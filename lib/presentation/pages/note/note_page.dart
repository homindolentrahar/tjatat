import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjatat/application/auth/auth_cubit.dart';
import 'package:tjatat/common/themes/app_color.dart';
import 'package:tjatat/presentation/routes/router.gr.dart';
import 'package:tjatat/presentation/widgets/custom_icon_button.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          cubit: BlocProvider.of<AuthCubit>(context),
          listenWhen: (previous, current) => previous != current,
          buildWhen: (previous, current) => previous != current,
          listener: (ctx, state) {
            state.maybeMap(
              unauthenticated: (_) =>
                  ExtendedNavigator.of(context).replace(Routes.loginPage),
              orElse: () {},
            );
          },
          builder: (ctx, state) {
            final authUserEmail = state.maybeWhen(
              authenticated: (authUser) => authUser.email.getOrCrash(),
              orElse: () => "No Email",
            );

            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome $authUserEmail",
                    style: GoogleFonts.ptSans(
                      color: AppColor.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomIconButton(
                    icon: FluentIcons.sign_out_24_regular,
                    text: "Logout",
                    onPressed: () {
                      //  Logout
                      BlocProvider.of<AuthCubit>(context).signOut();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
