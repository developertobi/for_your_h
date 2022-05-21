import 'package:flutter/material.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../core/constants/colors.dart';

class AppCheckbox extends StatelessWidget {
  final String text;
  final bool checked;
  final void Function(bool?)? onChanged;
  final Color activeColor;
  final Color checkColor;

  const AppCheckbox({
    Key? key,
    required this.text,
    required this.checked,
    required this.onChanged,
    this.activeColor = AppColors.grey,
    this.checkColor = AppColors.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 16,
          width: 16,
          child: Checkbox(
            value: checked,
            onChanged: onChanged,
            activeColor: activeColor,
            checkColor: checkColor,
            shape: const CircleBorder(),
          ),
        ),
        const Spacing.smallWidth(),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xff727171),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
