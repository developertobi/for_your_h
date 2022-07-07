import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/features/models/response.dart';
import 'package:for_your_head/src/features/models/result_arg.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_text_field.dart';
import 'package:for_your_head/src/widgets/image_container.dart';
import 'package:for_your_head/src/widgets/score_holder.dart';
import 'package:for_your_head/src/widgets/selected_team_container.dart';
import 'package:for_your_head/src/widgets/spacing.dart';
import 'package:for_your_head/src/widgets/team_n_color.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/colors.dart';
import '../../widgets/deck_container.dart';
import '../../widgets/responses.dart';
import '../../widgets/video_preview.dart';

class RoundScoreView extends StatelessWidget {
  const RoundScoreView({
    Key? key,
    required this.args,
  }) : super(key: key);
  final ResultArg args;

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
                ScoreHolder(score: args.score),
                const Spacing.mediumHeight(),
                Container(
                  width: 310,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Card(
                    child: Responses(responses: args.response),
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
                        RotationTransition(
                          turns: const AlwaysStoppedAnimation(356 / 360),
                          child: Text(
                            'Game Playback',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: GoogleFonts.caveat().fontFamily,
                              color: AppColors.light,
                              fontSize: 42.83,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            margin: const EdgeInsets.fromLTRB(17, 0, 17, 17),
                            child: VideoPreview(args.videoFile),
                            // const Center(child: Text('Video player here')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacing.height(80),
                AppButton(
                  text: 'NEXT TEAM',
                  borderColor: AppColors.dark,
                  backgroundColor: const Color(0xffEFA83C),
                  textColor: const Color(0xff484444),
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.finalScoreboard),
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
