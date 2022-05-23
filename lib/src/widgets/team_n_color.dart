import 'package:flutter/material.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

class TeamNColor extends StatelessWidget {
  const TeamNColor({
    Key? key,
    required this.teamName,
    required this.teamColor,
  }) : super(key: key);
  final String teamName;
  final Color? teamColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: teamColor,
        ),
        const Spacing.width(19),
        Text(
          teamName,
          style: const TextStyle(
            color: Color(0xff484444),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
