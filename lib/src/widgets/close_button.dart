import 'package:flutter/material.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../core/constant/colors.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({
    Key? key,
    this.centerButton = false,
  }) : super(key: key);
  final bool centerButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        mainAxisAlignment:
            centerButton ? MainAxisAlignment.center : MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.light.withOpacity(0.5),
            child: const Icon(
              Icons.close,
              size: 11.43,
              color: AppColors.light,
            ),
          ),
          const Spacing.smallWidth(),
          const Text(
            'Close',
            style: TextStyle(
              color: AppColors.light,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
