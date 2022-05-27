import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/constants/colors.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../core/constants/images.dart';
import 'app_dialog.dart';
import 'close_button.dart';

class DeckInfoDialog extends StatelessWidget {
  const DeckInfoDialog({
    Key? key,
    required this.imageUrl,
    this.onAddDeckPressed,
  }) : super(key: key);
  final String imageUrl;
  final void Function()? onAddDeckPressed;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: Container(
        color: Colors.transparent,
        child: const Padding(
          padding: EdgeInsets.only(bottom: 27),
          child: AppCloseButton(centerButton: true),
        ),
      ),
      content: Container(
        height: 504.67,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.46),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageUrl),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: AppButton(
                text: 'ADD DECK',
                backgroundColor: AppColors.dark,
                fontSize: 16,
                onPressed: onAddDeckPressed,
                // width: null,
              ),
            ),
            const Spacing.height(33),
            const AppButton(
              text: ' Share Deck',
              backgroundColor: AppColors.light,
              textColor: AppColors.dark,
              fontSize: 16,
              width: null,
              height: 38.83,
              icon: Icon(
                Icons.share,
                size: 12.5,
                color: AppColors.dark,
              ),
            ),
            const Spacing.height(62.83),
          ],
        ),
      ),
    );
  }
}
