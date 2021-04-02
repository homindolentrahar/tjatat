import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tjatat/application/auth/auth_cubit.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/presentation/core/widgets/rounded_button.dart';
import 'package:tjatat/utils/helpers/dialog_helper.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: Constant.screenWidth(context),
          height: Constant.screenHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Main Page"),
              const SizedBox(height: 10),
              Text(
                context.read<AuthCubit>().state.maybeMap(
                      authenticated: (auth) =>
                          auth.authUser.username.getOrCrash(),
                      orElse: () => "Unknown",
                    ),
              ),
              const SizedBox(height: 45),
              RoundedButton(
                width: Constant.screenWidth(context) * 0.8,
                text: "Logout",
                onPressed: () {
                  context
                      .read<AuthCubit>()
                      .signOut()
                      .then((_) => DialogHelper.loading(context));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
