import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_your_head/src/core/constants/colors.dart';
import 'package:for_your_head/src/core/constants/images.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

class PlayView extends StatefulWidget {
  const PlayView({Key? key}) : super(key: key);

  @override
  State<PlayView> createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  bool timerVisible = false;
  static const maxSeconds = 3;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
          if (seconds == 0) Navigator.pushNamed(context, Routes.question);
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
        child: Center(
          child: timerVisible
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 164.6,
                      height: 164.6,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            value: seconds / maxSeconds,
                            valueColor:
                                const AlwaysStoppedAnimation(AppColors.light),
                            backgroundColor: Colors.grey,
                            color: AppColors.blueGreen,
                            strokeWidth: 10,
                          ),
                          Center(
                            child: Text(
                              seconds.toString(),
                              style: const TextStyle(
                                color: AppColors.light,
                                fontSize: 88.14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacing.height(28),
                    const Text(
                      'GET READY',
                      style: TextStyle(
                        color: AppColors.light,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'PLACE ON FOREHEAD',
                      style: TextStyle(
                        color: AppColors.light,
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
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
// !timerVisible
//     ? Container()
//     : Text(
//         '$seconds',
//         style: const TextStyle(
//           color: AppColors.light,
//           fontSize: 88.14,
//         ),
//       ),
// !timerVisible
//     ? Container()
//     : Stack(
//         fit: StackFit.expand,
//         children: [
//           CircularProgressIndicator(
//             value: seconds / maxSeconds,
//             valueColor:
//                 const AlwaysStoppedAnimation(AppColors.light),
//             backgroundColor: Colors.grey,
//             color: AppColors.blueGreen,
//             strokeWidth: 30,
//           ),
//           Text(
//             '$seconds',
//             style: const TextStyle(
//               color: AppColors.light,
//               fontSize: 88.14,
//             ),
//           ),
//         ],
//       ),
                  ],
                ),
        ),
      ),
    );
  }
}
