import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tjatat/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:tjatat/injection.dart';
import 'package:tjatat/presentation/auth/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider<SignInFormCubit>(
          create: (_) => getIt<SignInFormCubit>(),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
