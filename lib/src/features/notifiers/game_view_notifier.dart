import 'dart:async';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../utils/tilt.dart';
import '../../core/constants.dart';
import '../../core/routes.dart';
import '../../services/navigation_service.dart';
import '../../widgets/status.dart';
import '../../widgets/time_up.dart';
import '../../widgets/word.dart';
import '../models/response.dart';
import '../models/result_arg.dart';

enum TiltAction {
  up,
  down,
}

class GameViewNotifier extends ChangeNotifier {
  final Reader _reader;
  GameViewNotifier(this._reader);
  bool contentIsStatus = false;
  bool _permissionLoading = false;
  bool get permissionLoading => _permissionLoading;
  late CameraController _cameraController;
  CameraController get cameraController => _cameraController;
  late PermissionStatus _cameraPermissionStatus;
  late PermissionStatus _micPermissionStatus;
  late PermissionStatus _storagePermissionStatus;
  late int wordsIndex;
  List words = [];
  final List<Response> _responses = [];
  late TiltUtil _tilt;
  int timeLeft = 60;
  int _score = 0;
  late StreamSubscription _streamSubscription;
  Color _backgroundColor = Colors.blue;
  Color get backgroundColor => _backgroundColor;
  String _videoPath = '';
  bool _gameStarted = false;
  final player = AudioPlayer();

  bool timerVisible = false;
  bool _showCountdown = false;
  bool get showCountdown => _showCountdown;
  // int _maxSeconds = 3;
  // int get maxSeconds => _maxSeconds;
  int _seconds = 3;
  int get seconds => _seconds;
  Widget? _content;
  Widget? get content => _content;

  late List<CameraDescription> _cameras;
  List<CameraDescription> get cameras => _cameras;

  void setContent(Widget content) {
    _content = content;
    notifyListeners();
  }

  void startListeningForHorizontalPhonePosition() {
    const gravity = 9.80665;
    _streamSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) async {
      print('AccelerometerEvent x::: ${event.x}');
      print('AccelerometerEvent y::: ${event.y}');
      print('AccelerometerEvent z::: ${event.z}');
      print('AccelerometerEvent x - gravity::: ${event.x - gravity}');
      if ((event.x - gravity) > 1) {
        startGame();
        // startGame();
        _streamSubscription.cancel();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('Dispose callleddddddddd');
    _streamSubscription.cancel();
    _tilt.stopListening();
    _cameraController.dispose();
    super.dispose();
  }

  void initTilt() {
    _tilt = TiltUtil.waitForStart(
      offset: 1.0,
      onTiltUp: () => onTilt(TiltAction.up),
      onTiltDown: () {
        onTilt(TiltAction.down);
        _score++;
      },
      onNormal: () {
        contentIsStatus = false;
        setContent(
          Word(
            answer: words[wordsIndex],
            timeLeft: toTwoDigits(timeLeft),
            isLast5Seconds: timeLeft < 6,
          ),
        );
        _changeBackgroundColor(Colors.blue);
      },
    );
  }

  void onTilt(TiltAction direction) {
    contentIsStatus = true;

    setContent(Status(isCorrect: direction == TiltAction.down));

    if (direction == TiltAction.up) {
      _changeBackgroundColor(kPassColor);
      player.setAsset('assets/pass-sound.wav');
      player.play();
    } else if (direction == TiltAction.down) {
      _changeBackgroundColor(kCorrectColor);
      player.setAsset('assets/correct-sound.wav');
      player.play();
    }

    _responses.add(
      Response(
        isCorrect: direction == TiltAction.down,
        word: words[wordsIndex],
      ),
    );

    words.removeAt(wordsIndex);
    _randomizeWordIndex();
  }

  void initWords({required List<String> words}) {
    this.words = words;
    _randomizeWordIndex();
  }

  void _randomizeWordIndex() {
    Random random = Random();
    wordsIndex = random.nextInt(words.length);
  }

  // // This method is separate because I can start game in mre than one way...
  // void startGame() {
  //   startTimer();
  //   player.setAsset('assets/3-sec-countdown-sound.wav');
  //   player.play();
  // }

  // void startTimer() {
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (seconds > 0) {
  //       seconds--;
  //       if (seconds == 0) {
  //         timer.cancel();
  //         _reader(navigationServiceProvider).navigateToNamed(Routes.question);
  //         // Navigator.pushNamed(context, Routes.question);
  //       }
  //       // Navigator.pushNamed(context, Routes.question);
  //       notifyListeners();
  //     }
  //   });
  // }
  void startGame() {
    if (!_gameStarted) {
      _gameStarted = true;
      notifyListeners();
      player.setAsset('assets/3-sec-countdown-sound.wav');
      player.play();
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_seconds > 0) {
          _seconds--;
          _showCountdown = true;
        }
        if (_seconds == 0) {
          setContent(
            Word(
              answer: words[wordsIndex],
              timeLeft: toTwoDigits(timeLeft),
              isLast5Seconds: false,
            ),
          );
          _showCountdown = false;
          timer.cancel();
          HapticFeedback.vibrate();
          _startTimerCountdown();
          _tilt.startListening();
          _cameraController.startVideoRecording();
        }
        notifyListeners();
      });
    }
  }

  void _startTimerCountdown() {
    Timer.periodic(
      const Duration(seconds: 1),
      (t) async {
        if (timeLeft < 1) {
          _gameStarted = false;
          notifyListeners();
          t.cancel();
          _tilt.stopListening();
          _cameraController.stopVideoRecording().then((value) {
            _videoPath = value.path;
          });

          HapticFeedback.vibrate();
          player.setAsset('assets/timeup-sound.wav');
          player.play();
          setContent(
            TimeUp(
              onFinished: () {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
                // TODO: Send the necessary arguments along...
                _reader(navigationServiceProvider).navigateToNamed(
                  Routes.roundScore,
                  arguments: ResultArg(
                      response: _responses,
                      score: _score,
                      videoFile: _videoPath),
                );
              },
            ),
          );
          _changeBackgroundColor(kTimeUpColor);
        } else {
          timeLeft -= 1;
          bool isLast5sec = false;

          if (timeLeft < 6) {
            if (timeLeft == 4) {
              player.setAsset('assets/5-sec-countdown-sound.wav');
              player.play();
            }
            HapticFeedback.vibrate();
            isLast5sec = true;
          }

          if (!contentIsStatus) {
            setContent(
              Word(
                answer: words[wordsIndex],
                timeLeft: toTwoDigits(timeLeft),
                isLast5Seconds: isLast5sec,
              ),
            );
          }
        }
      },
    );
  }

  Future<void> getCameras() async {
    _cameras = await availableCameras();
  }

  Future<void> initCameraRequirements() async {
    _permissionLoading = true;

    _cameraPermissionStatus = await Permission.camera.status;
    _micPermissionStatus = await Permission.microphone.status;
    _storagePermissionStatus = await Permission.storage.status;

    print('_cameraPermissionStatus: $_cameraPermissionStatus');
    print('_micPermissionStatus: $_micPermissionStatus');
    print('_storagePermissionStatus: $_storagePermissionStatus');

    // Provider.of<Results>(context, listen: false).permissionStatuses = {
    //   'camera': _cameraPermissionStatus,
    //   'microphone': _micPermissionStatus,
    //   'storage': _storagePermissionStatus,
    // };

    if (_cameraPermissionStatus.isGranted && _micPermissionStatus.isGranted) {
      print('Camera controller initializer...');
      // Init camera
      _cameraController =
          CameraController(_cameras[1], ResolutionPreset.medium);
      _cameraController.initialize().then((_) {
        print('Camera controller initialized...');
        // if (!mounted) {
        //   return;
        // }
        notifyListeners();
      });
    }
    _permissionLoading = false;
    notifyListeners();
  }

  String toTwoDigits(int num) {
    if ((num / 10).floor() == 0) return '0${num.toString()}';
    return num.toString();
  }

  void _changeBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }
}

final gameNotifierProvider = ChangeNotifierProvider<GameViewNotifier>(
    (ref) => GameViewNotifier(ref.read));
