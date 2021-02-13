import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tjatat/application/auth/auth_cubit.dart';
import 'package:tjatat/injection.dart';
import 'package:tjatat/presentation/routes/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureInjection(Environment.prod);
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<AuthCubit>()..authCheckRequest()),
      ],
      child: MaterialApp(
        title: "Tjatat",
        builder: ExtendedNavigator.builder<AppRouter>(router: AppRouter()),
      ),
    );
  }
}
