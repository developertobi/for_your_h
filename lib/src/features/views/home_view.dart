import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/features/models/team_details_arg.dart';
import 'package:for_your_head/src/services/navigation_service.dart';
import 'package:for_your_head/src/widgets/app_big_button.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_dialog.dart';
import 'package:for_your_head/src/widgets/spacing.dart';
import 'package:for_your_head/src/widgets/versus_selection.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/images.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int noOfTeams = 2;
  int gameRounds = 1;
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 80,
                color: AppColors.light,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(AppImages.appLogo),
                    AppButton(
                      text: '🤔 How to play?',
                      borderColor: AppColors.dark,
                      width: null,
                      fontSize: 14,
                      height: 36,
                      textColor: const Color(0xff484444),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Spacing.height(40),
              AppBigButton(
                title: 'Quickplay',
                subTitle: 'Start a quick game',
                color1: const Color(0xffEFA83C),
                color2: const Color(0xffCF534A),
                logo: const Icon(
                  Icons.star,
                  color: Color(0xffF2B709),
                ),
                onTap: () => Navigator.pushNamed(
                  context,
                  Routes.home,
                ),
              ),
              const Spacing.height(17),
              AppBigButton(
                title: 'Versus',
                subTitle: 'Compete against friends',
                color1: const Color(0xff9064EC),
                color2: const Color(0xff39187E),
                logo: Image.asset(AppImages.diamond),
                onTap: () {
                  ref.read(navigationServiceProvider).navigateToNamed(
                        Routes.play,
                        arguments: List.generate(100, (index) => 'Word $index'),
                      );
/*
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) => AppDialog(
                          backgroundColor: AppColors.light,
                          title: Container(
                            height: 104,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff9064EC),
                                  Color(0xff39187E),
                                ],
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Versus',
                                      style: TextStyle(
                                        color: AppColors.light,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      'Select Number of teams and rounds',
                                      style: TextStyle(
                                        color: Color(0xffE1E1E1),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, right: 15),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            AppColors.light.withOpacity(0.2),
                                        radius: 12,
                                        child: const Icon(
                                          Icons.close,
                                          color: AppColors.light,
                                          size: 9,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          content: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                VersusSelection(
                                  title: 'Number of teams',
                                  number: noOfTeams,
                                  maximum: 4,
                                  onReduceTapped: () {
                                    setState(() {
                                      if (noOfTeams > 2) {
                                        noOfTeams--;
                                      }
                                    });
                                  },
                                  onIncreaseTapped: () {
                                    setState(() {
                                      if (noOfTeams < 4) {
                                        noOfTeams++;
                                      }
                                    });
                                  },
                                ),
                                const Spacing.height(25),
                                VersusSelection(
                                  title: 'Game rounds',
                                  number: gameRounds,
                                  maximum: 7,
                                  onReduceTapped: () {
                                    setState(() {
                                      if (gameRounds > 1) {
                                        gameRounds--;
                                      }
                                    });
                                  },
                                  onIncreaseTapped: () {
                                    setState(() {
                                      if (gameRounds < 7) {
                                        gameRounds++;
                                      }
                                    });
                                  },
                                ),
                                const Spacing.height(41),
                                AppButton(
                                  text: 'CONTINUE',
                                  fontSize: 16,
                                  backgroundColor: const Color(0xffEFA83C),
                                  textColor: AppColors.dark,
                                  borderColor: AppColors.dark,
                                  height: 48,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                      context,
                                      Routes.teamDetails,
                                      arguments: TeamDetailsArg(
                                        noOfTeams: noOfTeams,
                                        gameRounds: gameRounds,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
*/
                },
              ),
              const Spacing.height(34),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                height: 225,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        text: 'What’s New! 🎉',
                        backgroundColor: AppColors.dark.withOpacity(0.22),
                        width: null,
                        height: 32,
                      ),
                      const Text(
                        'New decks\navailable!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.light,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(8),
                          ),
                        ),
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'VIEW DECKS',
                                style: TextStyle(
                                  color: AppColors.light,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 14,
                                color: AppColors.light,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
