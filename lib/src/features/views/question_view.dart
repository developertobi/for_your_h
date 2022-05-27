import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_your_head/src/core/constants/colors.dart';

class PlayView extends StatefulWidget {
  const PlayView({Key? key}) : super(key: key);

  @override
  State<PlayView> createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  bool timerVisible = false;
  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            timerVisible
                ? Container()
                : const Text(
                    'PLACE ON FOREHEAD',
                    style: TextStyle(
                      color: AppColors.light,
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
            timerVisible
                ? Container()
                : GestureDetector(
                    onTap: () {
                      startTimer();
                      setState(() {
                        timerVisible = true;
                      });
                    },
                    child: const Text(
                      'OR TAP SCREEN TO START',
                      style: TextStyle(
                        color: AppColors.light,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
            !timerVisible
                ? Container()
                : Text(
                    '$seconds',
                    style: const TextStyle(
                      color: AppColors.light,
                      fontSize: 88.14,
                    ),
                  ),
            !timerVisible
                ? Container()
                : const Text(
                    'GET READY',
                    style: TextStyle(
                      color: AppColors.light,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
