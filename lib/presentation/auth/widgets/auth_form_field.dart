import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supercharged/supercharged.dart';
import 'package:tjatat/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:tjatat/common/constants/constant.dart';
import 'package:tjatat/common/themes/app_color.dart';
import 'package:tjatat/domain/core/value_objects.dart';

typedef AuthFormFieldValidator = String? Function(String? value);

enum AuthFormFieldInput { email, password, username }

class AuthFormField extends HookWidget {
  final AuthFormFieldInput inputType;
  final String hintText;
  final Widget icon;
  final TextInputType keyboardType;
  final TextInputAction action;
  final bool obscure;
  final int maxLines;
  final ValueChanged<String> onChanged;

  const AuthFormField({
    Key? key,
    required this.inputType,
    required this.hintText,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.action = TextInputAction.next,
    this.obscure = false,
    this.maxLines = 1,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _validator = useState("");
    final _errorContainer = useState(0.0);
    final _isHide = useState(true);
    final _showHideIcons = useState(
      SvgPicture.asset(
        "assets/images/ic_show.svg",
      ),
    );

    late bool _obscureText;
    if (inputType == AuthFormFieldInput.password) {
      _obscureText = _isHide.value;
    } else {
      _obscureText = false;
    }

    // final _errorSizeAnimationController = useAnimationController(
    //   duration: 400.milliseconds,
    // );
    // final _errorSizeAnimation = useAnimation(
    //   0.0.tweenTo(48.0).animate(_errorSizeAnimationController),
    // );

    useEffect(() {
      if (_validator.value != "") {
        // _errorSizeAnimationController.forward();
        _errorContainer.value = 56.0;
      } else {
        // _errorSizeAnimationController.reverse();
        _errorContainer.value = 0.0;
      }
    }, [_validator.value]);

    return Column(
      children: [
        Container(
          width: Constant.screenWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: _validator.value == ""
                ? BorderRadius.circular(8)
                : const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
            border: Border.all(color: AppColor.black, width: 2),
          ),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 15),
              Expanded(
                child: TextFormField(
                  keyboardType: keyboardType,
                  textInputAction: action,
                  obscureText: _obscureText,
                  maxLines: maxLines,
                  cursorColor: Theme.of(context).primaryColor,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColor.gray,
                        ),
                  ),
                  onChanged: onChanged,
                  validator: (value) {
                    late ValueObject validationData;
                    final currentState = context.read<SignInFormCubit>().state;

                    switch (inputType) {
                      case AuthFormFieldInput.email:
                        validationData = currentState.emailAddress;
                        break;
                      case AuthFormFieldInput.password:
                        validationData = currentState.password;
                        break;
                      case AuthFormFieldInput.username:
                        validationData = currentState.username;
                        break;
                    }

                    final errorMessage = validationData.value.fold(
                      (failure) => failure.map(
                        invalidEmail: (_) => "Invalid email address format",
                        invalidPassword: (_) =>
                            "Password must be more than 8 characters length",
                        invalidUsername: (_) =>
                            "Username must be more than 8 characters length",
                      ),
                      (_) => "",
                    );

                    // dev.log(value!);
                    _validator.value = errorMessage;

                    return null;
                  },
                ),
              ),
              if (inputType == AuthFormFieldInput.password)
                GestureDetector(
                  onTap: () {
                    _isHide.value = !_isHide.value;
                    _showHideIcons.value = _isHide.value
                        ? SvgPicture.asset(
                            "assets/images/ic_show.svg",
                          )
                        : SvgPicture.asset(
                            "assets/images/ic_hide.svg",
                          );
                  },
                  child: AnimatedSwitcher(
                    duration: 400.milliseconds,
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    transitionBuilder: (child, animation) {
                      return Transform.scale(
                        scale: animation.value,
                        child: child,
                      );
                    },
                    child: _showHideIcons.value,
                  ),
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
        AnimatedContainer(
          duration: 400.milliseconds,
          width: Constant.screenWidth(context),
          height: _errorContainer.value,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          decoration: BoxDecoration(
            color: AppColor.black,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            border: Border.all(color: AppColor.black, width: 2),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/ic_warning_outline.svg",
                width: 20,
                height: 20,
                color: AppColor.red,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  _validator.value,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColor.red,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
