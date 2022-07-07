import 'package:flutter/material.dart';

import '../core/constant/colors.dart';
import '../core/constant/images.dart';

class GameAlert extends StatelessWidget {
  const GameAlert({
    Key? key,
    this.color = Colors.blue,
    required this.text,
  }) : super(key: key);
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.dark, width: 2),
        // image: const DecorationImage(
        //   image: AssetImage(AppImages.playBackground),
        //   opacity: 0.05,
        // ),
      ),
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.cartoon),
            opacity: 0.2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.light,
              fontSize: 68,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
