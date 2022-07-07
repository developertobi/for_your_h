import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_dialog.dart';
import 'package:for_your_head/src/widgets/deck_container.dart';
import 'package:for_your_head/src/widgets/final_scoreboard_container.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/images.dart';
import '../../core/constant/svgs.dart';
import '../../core/routes.dart';

class FinalScoreboardView extends StatelessWidget {
  const FinalScoreboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 140,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(bottom: 23),
                  decoration: const BoxDecoration(
                    color: Color(0xffAC0B0B),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff0F96C5),
                        Color(0xff054289),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 50,
                        child: SvgPicture.asset(AppSvgs.star),
                      ),
                      Positioned(
                        left: 200,
                        top: 20,
                        child: Icon(
                          Icons.star,
                          color: AppColors.light.withOpacity(0.5),
                          size: 4,
                        ),
                      ),
                      Positioned(
                        left: 130,
                        top: 80,
                        child: Icon(
                          Icons.star,
                          color: AppColors.light.withOpacity(0.5),
                          size: 5,
                        ),
                      ),
                      Positioned(
                        left: 190,
                        bottom: 0,
                        child: Icon(
                          Icons.star,
                          color: AppColors.light.withOpacity(0.5),
                          size: 7,
                        ),
                      ),
                      Positioned(
                        right: 100,
                        top: 50,
                        child: Icon(
                          Icons.star,
                          color: AppColors.light.withOpacity(0.5),
                          size: 7,
                        ),
                      ),
                      Positioned(
                        right: -15,
                        child: SvgPicture.asset(
                          AppSvgs.star,
                          width: 36,
                          height: 36,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Final Scoreboard',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.light,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FinalScoreboardContainer(
                        medalIcon: Image.asset(AppImages.gold),
                        position: 1,
                        teamName: 'The Party Animals',
                        noOfCards: 6,
                      ),
                      const Spacing.height(35.76),
                      FinalScoreboardContainer(
                        medalIcon: Image.asset(AppImages.silver),
                        position: 2,
                        teamName: 'Ajebo Hustlers',
                        noOfCards: 5,
                      ),
                      const Spacing.height(35.76),
                      FinalScoreboardContainer(
                        medalIcon: Image.asset(AppImages.bronze),
                        position: 3,
                        teamName: 'Wow!',
                        noOfCards: 3,
                      ),
                      const Spacing.height(35.76),
                      const FinalScoreboardContainer(
                        position: 4,
                        teamName: 'Last Last',
                        noOfCards: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: AppButton(
                    text: 'CONTINUE',
                    borderColor: AppColors.dark,
                    backgroundColor: const Color(0xffEFA83C),
                    textColor: const Color(0xff484444),
                    onPressed: () => Navigator.pushNamed(
                        context, Routes.selectedTeamsDetails),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 22, 16, 46),
                  child: AppButton(
                    text: 'GO HOME',
                    borderColor: AppColors.dark,
                    backgroundColor: AppColors.light,
                    textColor: const Color(0xff484444),
                    onPressed: () => Navigator.pushNamed(context, Routes.home),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}

class DismissDialogContent extends StatelessWidget {
  const DismissDialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 54,
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff6C1D1D),
                    Color(0xffEF473C),
                  ],
                ),
              ),
              child: const Icon(
                Icons.close,
                color: AppColors.light,
                size: 30,
              ),
            ),
          ),
          const Spacing.height(31),
          const Text(
            'Are you sure you want to cancel?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
          const Spacing.height(52),
          AppButton(
            text: 'YES',
            backgroundColor: const Color(0xff0F96C5),
            borderColor: AppColors.dark,
            onPressed: () {},
          ),
          const Spacing.tinyHeight(),
          AppButton(
            text: 'NO',
            textColor: AppColors.dark,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
