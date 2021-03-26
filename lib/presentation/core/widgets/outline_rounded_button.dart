import 'package:flutter/material.dart';
import 'package:tjatat/common/themes/app_color.dart';

class OutlineRoundedButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;

  const OutlineRoundedButton({
    Key? key,
    this.width = 0,
    this.height = 56,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      minWidth: width,
      height: height,
      color: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(width: 2, color: AppColor.black),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
