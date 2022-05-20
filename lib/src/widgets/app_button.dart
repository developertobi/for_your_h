import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import '../core/constants/strings.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color borderColor;
  final String text;
  final Color? textColor;
  final double borderRadius;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool isLoading;
  final bool hasIcon;
  final Widget? icon;

  const AppButton({
    Key? key,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    required this.text,
    this.textColor = AppColors.light,
    this.borderRadius = 50,
    this.width = double.maxFinite,
    this.height = 48,
    this.fontSize = 16,
    this.isLoading = false,
    this.hasIcon = false,
    this.icon,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      disabledColor: Colors.grey,
      child: SizedBox(
        width: width,
        height: height,
        child: OutlinedButton.icon(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: BorderSide(color: borderColor, width: 2),
            backgroundColor: backgroundColor,
          ),
          label: Text(
            isLoading ? AppStrings.loading : text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            ),
          ),
          icon: hasIcon ? icon! : Container(),
        ),
      ),
    );
  }
}
