import 'package:flutter/material.dart';
import 'package:tjatat/common/themes/app_color.dart';

final appTheme = ThemeData(
  primaryColor: AppColor.colorPrimary,
  accentColor: AppColor.colorAccent,
  brightness: Brightness.light,
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    overline: TextStyle(
      color: AppColor.black,
      fontSize: 44,
      fontWeight: FontWeight.bold,
    ),
    subtitle1: TextStyle(
      color: AppColor.black,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    subtitle2: TextStyle(
      color: AppColor.black,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    headline1: TextStyle(
      color: AppColor.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: AppColor.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      color: AppColor.black,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    button: TextStyle(
      color: AppColor.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
);
