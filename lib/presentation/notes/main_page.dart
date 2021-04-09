import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tjatat/application/auth/auth_cubit.dart';
import 'package:tjatat/application/core/network/network_info_cubit.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/presentation/core/widgets/rounded_button.dart';
import 'package:tjatat/utils/helpers/dialog_helper.dart';

class MainPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final networkErrorBannerPosition = useState(-100.0);

    return BlocListener<NetworkInfoCubit, NetworkInfoState>(
      bloc: context.read<NetworkInfoCubit>(),
      listener: (ctx, state) {
        state.map(
          initial: (initial) {},
          connected: (connected) => networkErrorBannerPosition.value = -100.0,
          disconnected: (disconnected) =>
              networkErrorBannerPosition.value = 0.0,
        );
      },
      child: SafeArea(
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
      ),
    );
  }
}
