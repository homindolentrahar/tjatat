import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjatat/common/themes/app_color.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final String text;
  final Color textColor;
  final Color background;
  final VoidCallback onPressed;

  const CustomButton({
    Key key,
    this.width = 144,
    this.height = 52,
    this.radius = 8,
    @required this.text,
    this.textColor = AppColor.white,
    this.background = AppColor.primaryColor,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      minWidth: width,
      height: height,
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.ptSans(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
