import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_text_field.dart';
import 'package:for_your_head/src/widgets/selected_team_container.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../../core/constants/colors.dart';

class SelectedTeamsConfirmationView extends StatelessWidget {
  const SelectedTeamsConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff484444)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Teams',
          style: TextStyle(
            color: Color(0xff484444),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                SelectedTeamContainer(
                  teamName: 'The Party Animals',
                  teamColor: Colors.blueGrey,
                ),
                Spacing.height(36),
                SelectedTeamContainer(
                  teamName: 'Ajebo Hustlers',
                  teamColor: Colors.blue,
                ),
                Spacing.height(36),
                SelectedTeamContainer(
                  teamName: 'Lasgidi Babes',
                  teamColor: Colors.greenAccent,
                ),
                Spacing.height(36),
                SelectedTeamContainer(
                  teamName: 'Wow !',
                  teamColor: Colors.purple,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  height: 48,
                  text: 'CONFIRM',
                  borderColor: AppColors.dark,
                  backgroundColor: const Color(0xffEFA83C),
                  borderRadius: 50,
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.creatingTeams),
                ),
                AppButton(
                  height: 48,
                  text: 'EDIT',
                  textColor: AppColors.dark,
                  onPressed: () {},
                ),
                const Spacing.height(84),
              ],
            )
          ],
        ),
      ),
    );
  }
}
