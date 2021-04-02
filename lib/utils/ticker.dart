import 'package:supercharged/supercharged.dart';

class Ticker {
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(1.seconds, (x) => ticks - x - 1).take(ticks);
  }
}
