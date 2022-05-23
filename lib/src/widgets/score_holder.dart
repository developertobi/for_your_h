import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import '../core/constants/images.dart';

class ScoreHolder extends StatelessWidget {
  const ScoreHolder({
    Key? key,
    required this.score,
  }) : super(key: key);
  final int score;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 284,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 216,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Image.asset(
            AppImages.cartoon,
            width: 149.33,
            height: 226.97,
            alignment: Alignment.bottomCenter,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 133.64,
              width: 235.84,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 123.84,
                    width: 235.84,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(
                        color: AppColors.light,
                        width: 4.55,
                      ),
                      borderRadius: BorderRadius.circular(10.93),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$score',
                          style: const TextStyle(
                            color: AppColors.light,
                            fontSize: 58.28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'Cards!',
                          style: TextStyle(
                            color: AppColors.light,
                            fontSize: 32.78,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        AppImages.hand,
                        // alignment: Alignment.topRight,
                        // height: 44.11,
                        width: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        AppImages.hand,
                        // alignment: Alignment.topRight,
                        // height: 44.11,
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
