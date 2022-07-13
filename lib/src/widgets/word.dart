import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';

class Word extends StatelessWidget {
  final String answer;

  final String timeLeft;
  final bool isLast5Seconds;

  const Word({
    required this.answer,
    required this.timeLeft,
    this.isLast5Seconds = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          answer,
          style: kNunitoTextStyle.copyWith(
            fontSize: 68,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          timeLeft,
          style: kNunitoTextStyle.copyWith(fontSize: isLast5Seconds ? 48 : 48),
        ),
      ],
    );
  }
}
