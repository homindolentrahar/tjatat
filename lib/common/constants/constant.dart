import 'package:flutter/widgets.dart';

enum BarType { success, error, warning, info }

class Constant {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
