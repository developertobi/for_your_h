import 'package:flutter/material.dart';
import 'package:for_your_head/src/widgets/color_container.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../core/constants/colors.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final String? Function(String?)? validator;
  final double borderRadius;
  final TextInputType? keyboardType;
  final String? hintText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final void Function()? onSelectColorTapped;
  // final Color selectedColor;
  final Key? theKey;

  const AppTextField({
    Key? key,
    this.title = '',
    this.validator,
    this.borderRadius = 50,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.maxLines,
    this.onSelectColorTapped,
    this.theKey,
    // required this.selectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.dark,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacing.smallHeight(),
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            validator: validator,
            obscureText: obscureText,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(16),
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 14),
              suffixIcon: suffixIcon,
              // GestureDetector(
              //   onTap: onSelectColorTapped,
              //   child: Container(
              //     key: theKey,
              //     margin: const EdgeInsets.only(right: 30, top: 18, bottom: 18),
              //     padding:
              //         const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              //     height: 28,
              //     width: 61,
              //     decoration: BoxDecoration(
              //       color: AppColors.light,
              //       borderRadius: BorderRadius.circular(50),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey.withOpacity(0.5),
              //           spreadRadius: 1,
              //           blurRadius: 9,
              //           offset: Offset(0, 2),
              //         ),
              //       ],
              //     ),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         ColorContainer(
              //           height: 14.21,
              //           width: 14.21,
              //           color: selectedColor,
              //           hasBorder: true,
              //         ),
              //         const Icon(
              //           Icons.keyboard_arrow_down_outlined,
              //           color: Color(0xff2E3A59),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(),
              ),
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
