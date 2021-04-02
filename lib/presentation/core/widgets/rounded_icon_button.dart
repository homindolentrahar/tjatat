import 'package:flutter/material.dart';
import 'package:tjatat/common/themes/app_color.dart';

class RoundedIconButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Widget icon;
  final VoidCallback? onPressed;

  const RoundedIconButton({
    Key? key,
    this.width = double.infinity,
    this.height = 56,
    required this.text,
    required this.icon,
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
      disabledColor: AppColor.gray,
      disabledElevation: 0,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 20),
          Text(
            text,
            style: Theme.of(context).textTheme.button?.copyWith(
                  color: AppColor.white,
                ),
          ),
        ],
      ),
    );
  }
}
