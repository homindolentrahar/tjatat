import 'package:flutter/widgets.dart';

enum BarType { success, error, warning, info }

class Constant {
  static const USERS_COLLECTION = "users";
  static const NOTES_COLLECTION = "notes";
  static const TODOS_COLLECTION = "todos";

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
