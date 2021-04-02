import 'package:injectable/injectable.dart';
import 'package:tjatat/utils/ticker.dart';

@module
abstract class AppModule {
  @lazySingleton
  Ticker get ticker => Ticker();
}
