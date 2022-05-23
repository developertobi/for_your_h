import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/constants/images.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_text_field.dart';
import 'package:for_your_head/src/widgets/image_container.dart';
import 'package:for_your_head/src/widgets/score_holder.dart';
import 'package:for_your_head/src/widgets/selected_team_container.dart';
import 'package:for_your_head/src/widgets/spacing.dart';
import 'package:for_your_head/src/widgets/team_n_color.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';
import '../../widgets/add_deck_container.dart';

class RoundScoreView extends StatelessWidget {
  const RoundScoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacing.height(33),
                const Text(
                  'Round 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacing.bigHeight(),
                const TeamNColor(
                  teamName: 'Ajebo Hustlers',
                  teamColor: Colors.blue,
                ),
                const Spacing.height(54),
                const Text(
                  'YOU GOT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacing.mediumHeight(),
                const ScoreHolder(score: 3),
                const Spacing.mediumHeight(),
                Container(
                  width: 310,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Card(
                    child: Column(
                      children: [
                        const Text(
                          'Squid Game',
                          style: TextStyle(
                            color: Color(0xff0F96C5),
                            fontSize: 42,
                          ),
                        ),
                        const Text(
                          '007',
                          style: TextStyle(
                            color: Color(0xff85828E),
                            fontSize: 42,
                          ),
                        ),
                        const Text(
                          'Eternals',
                          style: TextStyle(
                            color: Color(0xff0F96C5),
                            fontSize: 42,
                          ),
                        ),
                        const Text(
                          'Avatar',
                          style: TextStyle(
                            color: Color(0xff0F96C5),
                            fontSize: 42,
                          ),
                        ),
                        const Text(
                          'Black Panther',
                          style: TextStyle(
                            color: Color(0xff0F96C5),
                            fontSize: 42,
                          ),
                        ),
                        const Spacing.height(32),
                        Container(
                          height: 3,
                          color: const Color(0xff0F96C5),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacing.height(26),
                SizedBox(
                  height: 256,
                  child: Card(
                    color: const Color(0xff0F96C5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Game Playback',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: GoogleFonts.caveat().fontFamily,
                            color: AppColors.light,
                            fontSize: 42.83,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            margin: const EdgeInsets.fromLTRB(17, 0, 17, 17),
                            child:
                                const Center(child: Text('Video player here')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacing.height(80),
                const AppButton(
                  text: 'NEXT TEAM',
                  borderColor: AppColors.dark,
                  backgroundColor: Color(0xffEFA83C),
                  textColor: Color(0xff484444),
                ),
                const Spacing.height(20),
                Visibility(
                  visible: true,
                  child: Container(
                    height: 32,
                    width: 176,
                    decoration: BoxDecoration(
                      color: const Color(0xff16BFBF).withOpacity(.11),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const TeamNColor(
                      teamName: 'Ajebo Hustlers',
                      teamColor: Colors.blue,
                    ),
                  ),
                ),
                const Spacing.height(48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
