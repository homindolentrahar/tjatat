import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjatat/common/themes/app_color.dart';

typedef CustomTextFieldValidator = String Function(String value);

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscure;
  final ValueChanged<String> onChanged;
  final CustomTextFieldValidator validator;

  const CustomTextField({
    Key key,
    @required this.label,
    this.obscure = false,
    @required this.onChanged,
    @required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColor.light,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          labelText: label,
          labelStyle: GoogleFonts.ptSans(
            color: AppColor.grey,
            fontSize: 16,
          ),
        ),
        style: GoogleFonts.ptSans(
          color: AppColor.dark,
          fontSize: 16,
        ),
        onChanged: (value) => onChanged(value),
        validator: (value) => validator(value),
      ),
    );
  }
}
