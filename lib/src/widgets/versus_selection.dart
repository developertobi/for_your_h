import 'package:flutter/material.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../core/constant/colors.dart';

class VersusSelection extends StatelessWidget {
  const VersusSelection({
    Key? key,
    required this.title,
    required this.number,
    required this.maximum,
    this.onReduceTapped,
    this.onIncreaseTapped,
  }) : super(key: key);

  final String title;
  final int number;
  final int maximum;
  final void Function()? onReduceTapped;
  final void Function()? onIncreaseTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.dark,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacing.height(18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onReduceTapped,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Text(
                    '-',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const Spacing.width(21),
            Container(
              width: 86,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(),
                color: const Color(0xffE2E2E2).withOpacity(0.29),
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: const TextStyle(
                    color: Color(0xff175B73),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const Spacing.width(21),
            GestureDetector(
              onTap: onIncreaseTapped,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacing.tinyHeight(),
        Text(
          'MAX:$maximum',
          style: TextStyle(
            color: AppColors.dark.withOpacity(0.47),
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
