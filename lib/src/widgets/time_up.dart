import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';

class TimeUp extends StatelessWidget {
  const TimeUp({required this.onFinished});
  final void Function()? onFinished;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleAnimatedTextKit(
        scalingFactor: 1.5,
        text: const ['Time up!'],
        totalRepeatCount: 1,
        textStyle: kNunitoTextStyle.copyWith(
          fontSize: 68,
          fontWeight: FontWeight.w700,
        ),
        onFinished: onFinished,
      ),
    );
  }
}
