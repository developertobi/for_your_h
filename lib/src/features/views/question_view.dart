import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_your_head/src/core/constants/colors.dart';
import 'package:for_your_head/src/widgets/app_button.dart';

import '../../core/constants/images.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key}) : super(key: key);

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  bool timerVisible = false;
  static const maxSeconds = 60;
  Duration duration = const Duration(seconds: 60);
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      const removeSeconds = 1;
      if (duration.inSeconds > 0) {
        setState(() {
          int seconds = duration.inSeconds - removeSeconds;

          duration = Duration(seconds: seconds);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ])
        // .then((value) => startTimer())
        ;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.dark, width: 2),
          image: const DecorationImage(
            image: AssetImage(AppImages.playBackground),
            opacity: 0.05,
          ),
        ),
        margin: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'CAPTAIN AMERICA',
                    style: TextStyle(
                      color: AppColors.light,
                      fontSize: 68,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '$minutes:$seconds',
                    style: const TextStyle(
                      color: AppColors.light,
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 46, left: 41),
              child: AppButton(
                width: 56,
                height: 56,
                text: '',
                icon: Icon(
                  Icons.close,
                  color: AppColors.dark,
                ),
                backgroundColor: AppColors.light,
                borderColor: AppColors.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
