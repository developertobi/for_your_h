import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/spacing.dart';
import 'package:for_your_head/src/widgets/team_n_color.dart';

import '../core/constant/colors.dart';

class FinalScoreboardContainer extends StatelessWidget {
  const FinalScoreboardContainer({
    Key? key,
    required this.position,
    required this.teamName,
    this.teamColor,
    required this.noOfCards,
    this.medalIcon,
  }) : super(key: key);
  final int position;
  final String teamName;
  final Color? teamColor;
  final int noOfCards;
  final Widget? medalIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        color: AppColors.light,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (medalIcon != null) medalIcon!,
                  const Spacing.width(26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '$position',
                        style: const TextStyle(
                          color: Color(0xff312244),
                          fontSize: 14.78,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacing.smallWidth(),
                      TeamNColor(
                        teamName: teamName,
                        teamColor: teamColor,
                      ),
                    ],
                  ),
                ],
              ),
              AppButton(
                height: 24,
                width: null,
                text: '$noOfCards Cards',
                fontSize: 12,
                textColor: const Color(0xff312244),
                backgroundColor: AppColors.dark.withOpacity(0.09),
              )
            ],
          ),
        ),
      ),
    );
  }
}
