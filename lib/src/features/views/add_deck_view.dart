import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/constants/colors.dart';
import 'package:for_your_head/src/widgets/add_deck_container.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_dialog.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

class AddDeckView extends StatelessWidget {
  const AddDeckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 157,
                  decoration: const BoxDecoration(color: Color(0xffAC0B0B)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Add a deck for every round to continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.light,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacing.smallHeight(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: AppButton(
                          text: 'Dismiss',
                          height: 38,
                          backgroundColor: AppColors.light.withOpacity(0.3),
                          borderColor: AppColors.light,
                          onPressed: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return const AppDialog(
                                  backgroundColor: AppColors.light,
                                  content: DismissDialogContent(),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      AddDeckContainer(roundNo: 1),
                      Spacing.bigHeight(),
                      AddDeckContainer(roundNo: 2),
                      Spacing.bigHeight(),
                      AddDeckContainer(roundNo: 3),
                      Spacing.bigHeight(),
                      AddDeckContainer(roundNo: 4),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 51),
              child: AppButton(
                text: 'CONTINUE',
                borderColor: AppColors.dark,
                backgroundColor: Color(0xffEFA83C),
                textColor: Color(0xff484444),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}

class DismissDialogContent extends StatelessWidget {
  const DismissDialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 54,
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff6C1D1D),
                    Color(0xffEF473C),
                  ],
                ),
              ),
              child: const Icon(
                Icons.close,
                color: AppColors.light,
                size: 30,
              ),
            ),
          ),
          const Spacing.height(31),
          const Text(
            'Are you sure you want to cancel?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
          const Spacing.height(52),
          AppButton(
            text: 'YES',
            backgroundColor: const Color(0xff0F96C5),
            borderColor: AppColors.dark,
            onPressed: () {},
          ),
          const Spacing.tinyHeight(),
          AppButton(
            text: 'NO',
            textColor: AppColors.dark,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
