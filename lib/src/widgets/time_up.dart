import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';

class TimeUp extends StatelessWidget {
  TimeUp({required this.onFinished});
  final void Function()? onFinished;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleAnimatedTextKit(
        scalingFactor: 1.5,
        text: ['TIME UP'],
        totalRepeatCount: 1,
        textStyle: kNunitoTextStyle.copyWith(
          fontSize: 70,
          fontWeight: FontWeight.w900,
        ),
        onFinished: onFinished,
        //     () {
        //   SystemChrome.setPreferredOrientations([
        //     DeviceOrientation.portraitUp,
        //     DeviceOrientation.portraitDown,
        //   ]);
        //
        //   // Navigator.of(context).pushNamedAndRemoveUntil(
        //   //   HomeScreen.routeName,
        //   //   (route) => false,
        //   //   arguments: {
        //   //     'results': "",
        //   //   },
        //   // );
        // },
      ),
    );
  }
}
