import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/constants/images.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../core/constants/colors.dart';

class AddDeckContainer extends StatelessWidget {
  const AddDeckContainer({
    Key? key,
    required this.roundNo,
    this.onAddToDeckTapped,
    this.hasDeck = false,
  }) : super(key: key);
  final int roundNo;
  final void Function()? onAddToDeckTapped;
  final bool hasDeck;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Card(
        color: AppColors.light,
        elevation: 5,
        child: hasDeck
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.diamond,
                          width: 48,
                        ),
                        const Spacing.tinyWidth(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Round $roundNo',
                              style: const TextStyle(
                                color: Color(0xff175B73),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            const Spacing.smallHeight(),
                            const AppButton(
                              text: 'Nigerian Culture',
                              fontSize: 11.8,
                              borderColor: const Color(0xff0F96C5),
                              textColor: const Color(0xff060000),
                              backgroundColor: const Color(0xffDFF0F7),
                              height: 26,
                              width: null,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const AppButton(
                      text: 'Replace deck',
                      fontSize: 9.62,
                      borderColor: AppColors.dark,
                      textColor: Color(0xffCF534A),
                      height: 26,
                      width: null,
                    ),
                  ],
                ),
              )
            // ListTile(
            //         dense: true,
            //         leading: Image.asset(AppImages.diamond),
            //         title: Text(
            //           'Round $roundNo',
            //           style: const TextStyle(
            //             color: Color(0xff175B73),
            //           ),
            //         ),
            //         subtitle: AppButton(
            //           text: 'Nigerian Culture',
            //           borderColor: Color(0xff0F96C5),
            //           textColor: Color(0xff060000),
            //           backgroundColor: Color(0xffDFF0F7),
            //           height: 26,
            //           width: null,
            //         ),
            //         trailing: AppButton(
            //           text: 'Nigerian Culture',
            //           borderColor: Color(0xff0F96C5),
            //           textColor: Color(0xff060000),
            //           backgroundColor: Color(0xffDFF0F7),
            //           width: null,
            //         ),
            //       )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Round $roundNo',
                    style: TextStyle(
                      color: const Color(0xff727171).withOpacity(0.47),
                    ),
                  ),
                  const Spacing.tinyHeight(),
                  //TODO: Make this a dotted border
                  GestureDetector(
                    onTap: onAddToDeckTapped,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xff0F96C5)),
                      ),
                      child: const Text(
                        ' Add a deck + ',
                        style: TextStyle(
                          color: Color(0xff0F96C5),
                          fontSize: 14.4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
