import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tjatat/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:tjatat/application/core/network/network_info_cubit.dart';
import 'package:tjatat/injection.dart';
import 'package:tjatat/presentation/auth/widgets/login_form.dart';
import 'package:tjatat/utils/helpers/snackbar_helper.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkInfoCubit, NetworkInfoState>(
      listener: (ctx, state) {
        state.maybeMap(
          disconnected: (disconnected) =>
              SnackbarHelper.networkError(context: context),
          orElse: () {},
        );
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider<SignInFormCubit>(
            create: (_) => getIt<SignInFormCubit>(),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
