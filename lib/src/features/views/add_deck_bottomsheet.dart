import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/images.dart';
import '../../core/constants/strings.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_checkbox.dart';
import '../../widgets/close_button.dart';
import '../../widgets/deck_container.dart';
import '../../widgets/deck_info_dialog.dart';
import '../../widgets/image_container.dart';
import '../../widgets/search_text_field_container.dart';
import '../../widgets/spacing.dart';
import 'game_rounds_view.dart';

class AddDeckBottomSheet extends StatelessWidget {
  const AddDeckBottomSheet({Key? key, this.onAddDeckPressed}) : super(key: key);
  final void Function()? onAddDeckPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.only(
              top: 28.0,
              right: 16,
            ),
            child: AppCloseButton(),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(17, 23, 17, 51),
            decoration: const BoxDecoration(
              color: AppColors.light,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Select Round Deck',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xff484444),
                      ),
                    ),
                    Spacing.mediumHeight(),
                    SearchTextField(
                      hintText: 'Search decks',
                    ),
                    Spacing.height(34),
                  ],
                ),
                AddDeckBottomSheetAllDeck(onAddDeckPressed: onAddDeckPressed),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AddDeckBottomSheetAllDeck extends StatelessWidget {
  const AddDeckBottomSheetAllDeck({
    Key? key,
    this.onAddDeckPressed,
  }) : super(key: key);
  final void Function()? onAddDeckPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const AppButton(
              text: 'All Deck',
              height: 32,
              width: null,
              textColor: AppColors.dark,
              borderColor: Color(0xff871313),
              backgroundColor: Color(0xffF9EDEC),
              icon: Icon(Icons.close),
            ),
            separatorBuilder: (context, index) => const Spacing.smallWidth(),
            itemCount: 7,
          ),
        ),
        const Spacing.height(23),
        SizedBox(
          height: 380,
          // color: Colors.red,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: allDecks.length,
            itemBuilder: (BuildContext ctx, index) {
              return ImageContainer(
                imageString: AppStrings.ronaldo,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeckInfoDialog(
                        imageUrl: allDecks[index].deckImage,
                        onAddDeckPressed: onAddDeckPressed,
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
        const Spacing.bigHeight(),
        AppCheckbox(
          text: 'Apply deck to all rounds',
          checked: false,
          onChanged: (value) {},
        ),
        const Spacing.bigHeight(),
        AppButton(
          text: 'ADD DECK',
          // TODO: Change color based on condition
          backgroundColor: const Color(0xffD0D0D0),
          // onPressed: () {
          //   showDialog(
          //     context: context,
          //     builder: (context) {
          //       return const DeckInfoDialog(imageUrl: AppImages.diamond);
          //     },
          //   );
          // },
        ),
      ],
    );
  }
}
