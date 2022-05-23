import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/constants/colors.dart';
import 'package:for_your_head/src/core/constants/images.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/widgets/app_big_button.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_dialog.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AppDialog(
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
                              const Text(
                                'Number of teams',
                                style: TextStyle(
                                  color: AppColors.dark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacing.height(18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(),
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          color: AppColors.dark,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacing.width(21),
                                  Container(
                                    width: 86,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(),
                                      color: const Color(0xffE2E2E2)
                                          .withOpacity(0.29),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                          color: Color(0xff175B73),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacing.width(21),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(),
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          color: AppColors.dark,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacing.tinyHeight(),
                              Text(
                                'MAX:4',
                                style: TextStyle(
                                  color: AppColors.dark.withOpacity(0.47),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacing.height(25),
                              const Text(
                                'Game rounds',
                                style: TextStyle(
                                  color: AppColors.dark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacing.height(18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(),
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          color: AppColors.dark,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacing.width(21),
                                  Container(
                                    width: 86,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(),
                                      color: const Color(0xffE2E2E2)
                                          .withOpacity(0.29),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                          color: Color(0xff175B73),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacing.width(21),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(),
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          color: AppColors.dark,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacing.tinyHeight(),
                              Text(
                                'MAX:7',
                                style: TextStyle(
                                  color: AppColors.dark.withOpacity(0.47),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacing.height(41),
                              AppButton(
                                text: 'CONTINUE',
                                fontSize: 16,
                                backgroundColor: const Color(0xffEFA83C),
                                textColor: AppColors.dark,
                                borderColor: AppColors.dark,
                                height: 48,
                                onPressed: () => Navigator.pushNamed(
                                    context, Routes.teamDetails),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
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
