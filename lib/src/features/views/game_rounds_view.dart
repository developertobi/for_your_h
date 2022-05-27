import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/constants/strings.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_text_field.dart';
import 'package:for_your_head/src/widgets/selected_team_container.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../../core/constants/colors.dart';
import '../../widgets/deck_container.dart';
import '../models/deck_model.dart';
import 'add_deck_bottomsheet.dart';

class GameRoundsView extends StatefulWidget {
  final int gameRounds;
  const GameRoundsView({
    Key? key,
    required this.gameRounds,
  }) : super(key: key);

  @override
  State<GameRoundsView> createState() => _GameRoundsViewState();
}

class _GameRoundsViewState extends State<GameRoundsView> {
  late List<DeckModel?> decks;

  @override
  void initState() {
    super.initState();

    decks = List.filled(widget.gameRounds, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff484444)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Game Rounds',
          style: TextStyle(
            color: Color(0xff175B73),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 51),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Select a deck for each game round',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff727171),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacing.height(33),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: widget.gameRounds,
                      itemBuilder: (context, index) {
                        return DeckContainer(
                          roundNo: index + 1,
                          // hasDeck: true,
                          deck: decks[index],
                          onAddToDeckTapped: () {
                            showModalBottomSheet(
                              isDismissible: false,
                              context: context,
                              backgroundColor:
                                  Colors.transparent.withOpacity(0.5),
                              isScrollControlled: true,
                              builder: (context) {
                                return AddDeckBottomSheet(
                                  onAddDeckPressed: () {
                                    setState(() {
                                      decks[index] = allDecks[index];
                                    });
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, _) =>
                          const Spacing.height(36),
                    ),
                  ),
                ],
              ),
            ),
            AppButton(
              text: 'CONTINUE',
              borderColor: AppColors.dark,
              backgroundColor: const Color(0xffEFA83C),
              textColor: const Color(0xff484444),
              onPressed: () {
                showModalBottomSheet(
                  context: (context),
                  builder: (context) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        // borderRadius: BorderRadius.vertical(
                        //   top: Radius.circular(20),
                        // ),
                      ),
                      child: Container(
                        height: 350,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        decoration: const BoxDecoration(
                          color: AppColors.light,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20)
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Select round duration',
                              style: TextStyle(
                                color: AppColors.dark,
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacing.height(26),
                            Row(
                              // mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: AppButton(
                                    text: '120:00 secs',
                                    textColor: const Color(0xff484444),
                                    fontSize: 26,
                                    borderColor: const Color(0xff0F96C5),
                                    backgroundColor: const Color(0xff8DC1D3)
                                        .withOpacity(0.26),
                                    height: 45.67,
                                    // width: null,
                                    borderRadius: 7.61,
                                  ),
                                ),
                                const Spacing.width(24.49),
                                Expanded(
                                  child: AppButton(
                                    text: '120:00 secs',
                                    textColor: const Color(0xff484444),
                                    fontSize: 26,
                                    borderColor: const Color(0xff0F96C5),
                                    backgroundColor: const Color(0xff8DC1D3)
                                        .withOpacity(0.26),
                                    height: 45.67,
                                    // width: null,
                                    borderRadius: 7.61,
                                  ),
                                ),
                              ],
                            ),
                            const Spacing.height(26),
                            Row(
                              // mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: AppButton(
                                    text: '120:00 secs',
                                    textColor: const Color(0xff484444),
                                    fontSize: 26,
                                    borderColor: const Color(0xff0F96C5),
                                    backgroundColor: const Color(0xff8DC1D3)
                                        .withOpacity(0.26),
                                    height: 45.67,
                                    // width: null,
                                    borderRadius: 7.61,
                                  ),
                                ),
                                const Spacing.width(24.49),
                                Expanded(
                                  child: AppButton(
                                    text: '120:00 secs',
                                    textColor: const Color(0xff484444),
                                    fontSize: 26,
                                    borderColor: const Color(0xff0F96C5),
                                    backgroundColor: const Color(0xff8DC1D3)
                                        .withOpacity(0.26),
                                    height: 45.67,
                                    // width: null,
                                    borderRadius: 7.61,
                                  ),
                                ),
                              ],
                            ),
                            const Spacing.height(48.67),
                            AppButton(
                                text: 'PLAY',
                                backgroundColor: const Color(0xff0F96C5),
                                borderColor: AppColors.dark,
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(
                                      context, Routes.teamPreview);
                                }),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

List<DeckModel> allDecks = [
  DeckModel(deckName: 'Deck 111', deckImage: AppStrings.ronaldo),
  DeckModel(deckName: 'Deck 222', deckImage: AppStrings.ronaldo),
  DeckModel(deckName: 'Deck 333', deckImage: AppStrings.ronaldo),
  DeckModel(deckName: 'Deck 444', deckImage: AppStrings.ronaldo),
];
