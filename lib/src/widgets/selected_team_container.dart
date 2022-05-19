import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class SelectedTeamContainer extends StatelessWidget {
  const SelectedTeamContainer({
    Key? key,
    required this.teamName,
    required this.teamColor,
  }) : super(key: key);
  final String teamName;
  final Color teamColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.light,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 9,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            decoration: BoxDecoration(
              color: teamColor,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(4),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Text(
                teamName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff484444),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
