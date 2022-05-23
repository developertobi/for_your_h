import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/constants/images.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_checkbox.dart';
import 'package:for_your_head/src/widgets/app_dialog.dart';
import 'package:for_your_head/src/widgets/app_text_field.dart';
import 'package:for_your_head/src/widgets/close_button.dart';
import 'package:for_your_head/src/widgets/image_container.dart';
import 'package:for_your_head/src/widgets/search_text_field_container.dart';
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
                              borderColor: Color(0xff0F96C5),
                              textColor: Color(0xff060000),
                              backgroundColor: Color(0xffDFF0F7),
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
                    onTap: () {
                      showModalBottomSheet(
                        isDismissible: false,
                        context: context,
                        backgroundColor: Colors.transparent.withOpacity(0.5),
                        isScrollControlled: true,
                        builder: (context) {
                          return AddDeckBottomSheetContainer(roundNo: roundNo);
                        },
                      );
                    },
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

class AddDeckBottomSheetContainer extends StatelessWidget {
  const AddDeckBottomSheetContainer({
    Key? key,
    required this.roundNo,
  }) : super(key: key);

  final int roundNo;

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
                  children: [
                    Text(
                      'Select Round $roundNo Deck',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xff484444),
                      ),
                    ),
                    const Spacing.mediumHeight(),
                    const SearchTextField(
                      hintText: 'Search decks',
                    ),
                    const Spacing.height(34),
                  ],
                ),
                const AddDeckBottomSheetCountries2()
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
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
        Row(
          children: const [
            ImageContainer(
              imageString: 'imageString',
            ),
            Spacing.mediumWidth(),
            ImageContainer(
              imageString: 'imageString',
            ),
            Spacing.mediumWidth(),
            ImageContainer(
              imageString: 'imageString',
            ),
          ],
        ),
        const Spacing.height(30),
        Row(
          children: const [
            ImageContainer(
              imageString: 'imageString',
            ),
            Spacing.mediumWidth(),
            ImageContainer(
              imageString: 'imageString',
            ),
            Spacing.mediumWidth(),
            ImageContainer(
              imageString: 'imageString',
            ),
          ],
        ),
        const Spacing.largeHeight(),
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
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
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
                      borderRadius: BorderRadius.circular(
                        12.46,
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AppImages.diamond),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class AddDeckBottomSheetCountries extends StatelessWidget {
  const AddDeckBottomSheetCountries({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
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
        DropdownButtonFormField(
          hint: const Text('Select a country'),
          items: const [
            DropdownMenuItem(child: Text("USA"), value: "USA"),
            DropdownMenuItem(child: Text("Canada"), value: "Canada"),
            DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
            DropdownMenuItem(child: Text("England"), value: "England"),
          ],
          onChanged: (newValue) {},
          decoration: const InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffE1E1E1),
              ),
            ),
            border: OutlineInputBorder(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacing.mediumHeight(),
            Image.asset(
              AppImages.curvedArrow,
              height: 55,
            ),
            Image.asset(
              AppImages.globe,
              height: 128,
              width: 128,
            ),
            const Text(
              'Select a country to\nview decks',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: AppColors.dark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AddDeckBottomSheetCountries2 extends StatelessWidget {
  const AddDeckBottomSheetCountries2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select A Country',
              style: TextStyle(
                color: Color(0xff484444),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacing.mediumHeight(),
            const AppButton(
              text: '🌍 More country specific decks coming soon..',
              backgroundColor: AppColors.dark,
              fontSize: 14,
              borderRadius: 8,
              height: 40,
            ),
            const Spacing.height(48),
            SizedBox(
              width: 64,
              child: Column(
                children: const [
                  CircleAvatar(radius: 32),
                  Spacing.smallHeight(),
                  Text(
                    'United Kingdom',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: Color(0xff484444),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
