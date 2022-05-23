import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_text_field.dart';
import 'package:for_your_head/src/widgets/image_container.dart';
import 'package:for_your_head/src/widgets/selected_team_container.dart';
import 'package:for_your_head/src/widgets/spacing.dart';
import 'package:for_your_head/src/widgets/team_n_color.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';
import '../../widgets/add_deck_container.dart';

class TeamPreviewView extends StatelessWidget {
  const TeamPreviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 51),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Spacing.height(33),
                  Text(
                    'Round 1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff175B73),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacing.height(33),
                  Text(
                    'DECK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 12,
                      color: Color(0xff727171),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacing.mediumHeight(),
                  ImageContainer(
                    height: 238.5,
                    width: 159,
                    imageString: AppStrings.ronaldo,
                    hasShadow: true,
                  ),
                  Spacing.height(40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29),
                    child: Divider(
                      thickness: 3,
                    ),
                  ),
                  Spacing.height(40),
                  Text(
                    'STARTING TEAM',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 12,
                      color: Color(0xff727171),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacing.mediumHeight(),
                  SizedBox(
                    height: 88,
                    width: double.maxFinite,
                    child: Card(
                      color: AppColors.light,
                      elevation: 5,
                      child: TeamNColor(
                        teamName: 'The Party Animals',
                        teamColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const AppButton(
                text: 'CONTINUE',
                borderColor: AppColors.dark,
                backgroundColor: Color(0xffEFA83C),
                textColor: Color(0xff484444),
              )
            ],
          ),
        ),
      ),
    );
  }
}
