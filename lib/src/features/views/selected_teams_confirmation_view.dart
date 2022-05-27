import 'dart:math';

import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/features/models/selected_team_details_arg.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_text_field.dart';
import 'package:for_your_head/src/widgets/selected_team_container.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../../core/constants/colors.dart';

class SelectedTeamsConfirmationView extends StatelessWidget {
  final SelectedTeamDetailsArg args;
  final List<Color> colors = [
    Colors.blue,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.purple,
    Colors.lightGreenAccent,
    Colors.indigo,
    Colors.orange,
    Colors.yellow
  ];

  SelectedTeamsConfirmationView({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    colors.shuffle();
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
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: args.teamsNames.length,
                itemBuilder: (context, index) {
                  return SelectedTeamContainer(
                    teamName: args.teamsNames[index],
                    // teamColor: colors[Random().nextInt(colors.length)],
                    teamColor: colors[index],
                  );
                },
                separatorBuilder: (context, _) => const Spacing.height(36),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  height: 48,
                  text: 'CONFIRM',
                  borderColor: AppColors.dark,
                  textColor: AppColors.dark,
                  backgroundColor: const Color(0xffEFA83C),
                  borderRadius: 50,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    Routes.gameRounds,
                    arguments: args.gameRounds,
                  ),
                ),
                AppButton(
                  height: 48,
                  text: 'EDIT',
                  textColor: AppColors.dark,
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
