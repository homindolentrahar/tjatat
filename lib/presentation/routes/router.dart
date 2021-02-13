import 'package:auto_route/auto_route_annotations.dart';
import 'package:tjatat/presentation/pages/auth/login_page.dart';
import 'package:tjatat/presentation/pages/note/note_page.dart';
import 'package:tjatat/presentation/pages/auth/register_page.dart';
import 'package:tjatat/presentation/pages/splash_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: LoginPage),
  MaterialRoute(page: RegisterPage),
  MaterialRoute(page: NotePage),
], generateNavigationHelperExtension: true)
class $AppRouter {}
