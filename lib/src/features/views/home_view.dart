import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/services/navigation_service.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/constant/colors.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    _requestAllPermissions(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  Future<void> _requestAllPermissions(BuildContext context) async {
    if (await Permission.camera.isDenied ||
        await Permission.microphone.isDenied ||
        await Permission.storage.isDenied ||
        await Permission.photos.isDenied) {
      Flushbar(
        messageText: const Text(
          'Your camera, mic or storage is disabled for this app',
          style: TextStyle(color: Colors.white),
        ),
        mainButton: FlatButton(
          onPressed: () => openAppSettings(),
          child: const Text(
            'Grant permission',
            style: TextStyle(
                color: AppColors.persimmon,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        flushbarStyle: FlushbarStyle.GROUNDED,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 500),
      ).show(context);
    }

    await [
      Permission.camera,
      Permission.microphone,
      Permission.storage,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: OutlinedButton(
          onPressed: () => ref.read(navigationServiceProvider).navigateToNamed(
                Routes.play,
                arguments: List.generate(100, (index) => 'Word $index'),
              ),
          child: const Text('Play Game')),
    ));
  }
}
