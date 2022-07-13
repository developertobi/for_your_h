import 'package:flutter/material.dart';

import '../core/constants.dart';

class Status extends StatelessWidget {
  final bool isCorrect;

  const Status({
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        isCorrect ? 'Correct!' : 'Pass!',
        style: kNunitoTextStyle.copyWith(
          fontSize: 68,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
