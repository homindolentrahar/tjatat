import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Connectivity get dataConnectionChecker => Connectivity();
}
