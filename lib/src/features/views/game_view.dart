import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock/wakelock.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/images.dart';
import '../notifiers/game_view_notifier.dart';

class GameView extends ConsumerStatefulWidget {
  const GameView({Key? key, required this.words}) : super(key: key);
  final List<String> words;

  @override
  ConsumerState<GameView> createState() => _GameViewState();
}

class _GameViewState extends ConsumerState<GameView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      SystemChrome.setPreferredOrientations([
        Platform.isIOS
            ? DeviceOrientation.landscapeRight
            : DeviceOrientation.landscapeLeft,
      ]);
      await ref.read(gameNotifierProvider).getCameras();
      await ref.read(gameNotifierProvider).initCameraRequirements();
      ref.read(gameNotifierProvider).startListeningForHorizontalPhonePosition();
      ref.read(gameNotifierProvider).initTilt();
      ref.read(gameNotifierProvider).initWords(words: widget.words);
      ref.read(gameNotifierProvider).setContent(GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              ref.read(gameNotifierProvider).startGame();
            },
            child: FractionallySizedBox(
                heightFactor: 0.75,
                widthFactor: 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'PLACE ON FOREHEAD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'OR TAP SCREEN TO START',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )),
          ));
      Wakelock.enable();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameNotifier = ref.watch(gameNotifierProvider);
    return WillPopScope(
      onWillPop: () async => false,
      child: gameNotifier.permissionLoading
          ? const CircularProgressIndicator()
          : Stack(
              children: [
                Positioned.fill(
                  child: gameNotifier.cameraController.value.isInitialized
                      ? RotatedBox(
                          quarterTurns: 4,
                          child: AspectRatio(
                            aspectRatio:
                                gameNotifier.cameraController.value.aspectRatio,
                            child: CameraPreview(gameNotifier.cameraController),
                          ),
                        )
                      : Container(),
                ),
                Opacity(
                  opacity: 0.85,
                  child: Scaffold(
                    // backgroundColor: gameNotifier.backgroundColor,
                    body: GestureDetector(
                      // behavior: HitTestBehavior.opaque,
                      // onTap: () {
                      //   print('TTTTTTTTTTTTTTTTTTTTTTT');
                      //   gameNotifier.startGame();
                      // },
                      child: Container(
                        decoration: BoxDecoration(
                          color: gameNotifier.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.dark, width: 2),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.playBackground),
                            opacity: 0.05,
                          ),
                        ),
                        margin: const EdgeInsets.all(8),
                        child: Center(
                          child: FractionallySizedBox(
                            heightFactor: 0.8,
                            widthFactor: 0.8,
                            alignment: Alignment.center,
                            child: gameNotifier.showCountdown
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
                                              value: gameNotifier.seconds / 3,
                                              valueColor:
                                                  const AlwaysStoppedAnimation(
                                                      Colors.white),
                                              backgroundColor: Colors.grey,
                                              color: Color(0x66008EB1),
                                              strokeWidth: 10,
                                            ),
                                            Center(
                                              child: Text(
                                                gameNotifier.seconds.toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 88.14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 28),
                                      const Text(
                                        'GET READY',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                        ),
                                      )
                                    ],
                                  )
                                : gameNotifier.content,
//                     Center(
//                       child: gameNotifier.timerVisible
//                           ? Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 SizedBox(
//                                   width: 164.6,
//                                   height: 164.6,
//                                   child: Stack(
//                                     fit: StackFit.expand,
//                                     children: [
//                                       CircularProgressIndicator(
//                                         value: gameNotifier.seconds / 3,
//                                         valueColor: const AlwaysStoppedAnimation(
//                                             AppColors.light),
//                                         backgroundColor: Colors.grey,
//                                         color: AppColors.blueGreen,
//                                         strokeWidth: 10,
//                                       ),
//                                       Center(
//                                         child: Text(
//                                           gameNotifier.seconds.toString(),
//                                           style: const TextStyle(
//                                             color: AppColors.light,
//                                             fontSize: 88.14,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const Spacing.height(28),
//                                 const Text(
//                                   'GET READY',
//                                   style: TextStyle(
//                                     color: AppColors.light,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 24,
//                                   ),
//                                 )
//                               ],
//                             )
//                           : Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   'PLACE ON FOREHEAD',
//                                   style: TextStyle(
//                                     color: AppColors.light,
//                                     fontSize: 48,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     gameNotifier.startTimer();
//                                   },
//                                   child: const Text(
//                                     'OR TAP SCREEN TO START',
//                                     style: TextStyle(
//                                       color: AppColors.light,
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ),
// // !timerVisible
// //     ? Container()
// //     : Text(
// //         '$seconds',
// //         style: const TextStyle(
// //           color: AppColors.light,
// //           fontSize: 88.14,
// //         ),
// //       ),
// // !timerVisible
// //     ? Container()
// //     : Stack(
// //         fit: StackFit.expand,
// //         children: [
// //           CircularProgressIndicator(
// //             value: seconds / maxSeconds,
// //             valueColor:
// //                 const AlwaysStoppedAnimation(AppColors.light),
// //             backgroundColor: Colors.grey,
// //             color: AppColors.blueGreen,
// //             strokeWidth: 30,
// //           ),
// //           Text(
// //             '$seconds',
// //             style: const TextStyle(
// //               color: AppColors.light,
// //               fontSize: 88.14,
// //             ),
// //           ),
// //         ],
// //       ),
//                               ],
//                             ),
//                     ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

// Stream<QuerySnapshot<Object?>>? fetchAllMessages(
//     {required var senderId, required var receiverId}) {
//   generateId(senderId: senderId, receiverId: receiverId);
//   firestoreInstance
//       .collection('chats/$chatId/messages')
//       .get()
//       .then((snapshot) {
//     for (DocumentSnapshot documentSnapshot in snapshot.docs) {
//       if (documentSnapshot.get('text') == 'Hello') {}
//     }
//   });
//
//   return firestoreInstance
//       .collection('chats/$chatId/messages')
//       .orderBy('timeStamp')
//   // .where('text' == 'hello')
//       .snapshots();
// }
