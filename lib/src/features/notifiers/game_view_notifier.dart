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
import '../models/response.dart';

enum TiltAction {
  up,
  down,
}

class GameViewNotifier extends ChangeNotifier {
  final Reader _reader;

  GameViewNotifier(this._reader);

  bool _contentIsStatus = false;
  bool get contentIsStatus => _contentIsStatus;

  bool _permissionLoading = false;
  bool get permissionLoading => _permissionLoading;

  late CameraController _cameraController;
  CameraController get cameraController => _cameraController;

  late PermissionStatus _cameraPermissionStatus;
  late PermissionStatus _micPermissionStatus;
  late PermissionStatus _storagePermissionStatus;

  late int _wordsIndex;
  int get wordIndex => _wordsIndex;

  List<String> _words = [];
  List<String> get words => _words;

  final List<Response> _responses = [];
  List<Response> get responses => _responses;

  late TiltUtil _tilt;

  int _score = 0;
  int get score => _score;

  late StreamSubscription _streamSubscription;

  Color _backgroundColor = Colors.blue;
  Color get backgroundColor => _backgroundColor;

  String _videoPath = '';
  String get videoPath => _videoPath;

  bool _gameStarted = false;

  final player = AudioPlayer();

  bool _showCountdown = false;
  bool get showCountdown => _showCountdown;

  // int _maxSeconds = 3;
  // int get maxSeconds => _maxSeconds;
  int _seconds = 3;
  int get seconds => _seconds;

  final bool _soundEnabled = true; //TODO: Get this from the appropriate place
  Duration _duration = const Duration(
      seconds: 60); // TODO: Get seconds from the appropriate place

  bool _isInitialContent = true;
  bool get isInitialContent => _isInitialContent;

  bool _timeUp = false;
  bool get timeUp => _timeUp;

  bool _showQuestion = false;
  bool get showQuestion => _showQuestion;

  bool _isLast5Seconds = false;
  bool get isLast5Seconds => _isLast5Seconds;

  bool _isCorrect = false;
  bool get isCorrect => _isCorrect;

  late List<CameraDescription> _cameras;
  List<CameraDescription> get cameras => _cameras;

  void startListeningForHorizontalPhonePosition() {
    const gravity = 9.80665;
    _streamSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) async {
      print('AccelerometerEvent x::: ${event.x}');
      print('AccelerometerEvent y::: ${event.y}');
      print('AccelerometerEvent z::: ${event.z}');
      print('AccelerometerEvent x - gravity::: ${event.x - gravity}');
      // if ((event.x - gravity).abs() < 2) {
      if ((event.x - gravity) > 1) {
        startGame();
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
        _contentIsStatus = false;
        _showQuestion = true;
        _changeBackgroundColor(Colors.blue);
      },
    );
  }

  void onTilt(TiltAction direction) {
    _contentIsStatus = true;
    _showQuestion = false;
    _isCorrect = direction == TiltAction.down;
    notifyListeners();

    if (direction == TiltAction.up) {
      _changeBackgroundColor(kPassColor);
      playSound(path: 'assets/pass-sound.wav');
    } else if (direction == TiltAction.down) {
      _changeBackgroundColor(kCorrectColor);
      playSound(path: 'assets/correct-sound.wav');
    } else {}

    _responses.add(
      Response(
        isCorrect: direction == TiltAction.down,
        word: _words[_wordsIndex],
      ),
    );

    _words.removeAt(_wordsIndex);
    _randomizeWordIndex();
  }

  void initWords({required List<String> words}) {
    _words = words;
    _randomizeWordIndex();
  }

  void _randomizeWordIndex() {
    Random random = Random();
    _wordsIndex = random.nextInt(_words.length);
  }

  void startGame() {
    if (!_gameStarted) {
      _isInitialContent = false;
      _showCountdown = true;
      _gameStarted = true;
      playSound(path: 'assets/3-sec-countdown-sound.wav');
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_seconds > 0) {
          _seconds--;
        }
        if (_seconds == 0) {
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
    // I want to show question immediately the timer starts
    _showQuestion = true;
    Timer.periodic(
      const Duration(seconds: 1),
      (t) async {
        if (_duration.inSeconds < 1) {
          _streamSubscription.cancel();
          _contentIsStatus = false;
          _showQuestion = false;
          _gameStarted = false;
          _timeUp = true;
          t.cancel();
          _tilt.stopListening();
          _cameraController.stopVideoRecording().then((value) {
            _videoPath = value.path;
          });

          HapticFeedback.vibrate();
          playSound(path: 'assets/timeup-sound.wav');
          _changeBackgroundColor(kTimeUpColor);
        } else {
          final sec = _duration.inSeconds - 1;
          if (_duration.inSeconds > 0) {
            _duration = Duration(seconds: sec);
          }
          // _timeLeft -= 1;

          // if (_timeLeft < 6) {
          if (_duration.inSeconds < 6) {
            _isLast5Seconds = true;
            if (_duration.inSeconds == 4) {
              // if (_timeLeft == 4) {
              playSound(path: 'assets/5-sec-countdown-sound.wav');
            }
            HapticFeedback.vibrate();
          }
        }
        notifyListeners();
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

    if (_cameraPermissionStatus.isGranted && _micPermissionStatus.isGranted) {
      print('Camera controller initializer...');
      // Init camera
      _cameraController =
          CameraController(_cameras[1], ResolutionPreset.medium);
      _cameraController.initialize().then((_) {
        print('Camera controller initialized...');
        notifyListeners();
      });
    }
    _permissionLoading = false;
    notifyListeners();
  }

  String durationRemaining() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(_duration.inMinutes.remainder(60));
    final seconds = twoDigits(_duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  void _changeBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }

  void playSound({required String path}) {
    if (_soundEnabled) {
      player.setAsset(path);
      player.play();
    }
  }
}

final gameNotifierProvider = ChangeNotifierProvider<GameViewNotifier>(
    (ref) => GameViewNotifier(ref.read));
