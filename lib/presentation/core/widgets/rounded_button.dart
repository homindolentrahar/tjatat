import 'package:flutter/material.dart';
import 'package:tjatat/common/themes/app_color.dart';

class RoundedButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;

  const RoundedButton({
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
      color: AppColor.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.button?.copyWith(
              color: AppColor.white,
            ),
      ),
    );
  }
}
