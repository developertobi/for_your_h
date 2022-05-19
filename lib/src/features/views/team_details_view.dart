import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_text_field.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../../core/constants/colors.dart';
import '../../widgets/color_container.dart';

class TeamDetailsView extends StatefulWidget {
  const TeamDetailsView({Key? key}) : super(key: key);

  @override
  State<TeamDetailsView> createState() => _TeamDetailsViewState();
}

class _TeamDetailsViewState extends State<TeamDetailsView> {
  OverlayEntry? entry;
  GlobalKey key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // showOverlay();
    });
  }

  showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderBox = key.currentContext?.findRenderObject() as RenderBox;
    final size = renderBox.size;
    print(size.height);
    final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
      builder: (context) => Positioned(
        right: offset.dx,
        top: offset.dy + size.height + 12,
        // width: size.width,
        // height: size.height,
        child: buildOverlay(),
      ),
    );
    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  Widget buildOverlay() => Material(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  ColorContainer(
                      height: 24,
                      width: 24,
                      color: Colors.pink,
                      onTap: () {
                        hideOverlay();
                      }),
                  Spacing.mediumWidth(),
                  ColorContainer(
                      height: 24,
                      width: 24,
                      color: Colors.pink,
                      onTap: () {
                        hideOverlay();
                      }),
                  Spacing.mediumWidth(),
                  ColorContainer(
                      height: 24,
                      width: 24,
                      color: Colors.pink,
                      onTap: () {
                        hideOverlay();
                      }),
                  Spacing.mediumWidth(),
                  ColorContainer(
                      height: 24,
                      width: 24,
                      color: Colors.pink,
                      onTap: () {
                        hideOverlay();
                      }),
                ],
              ),
              const Spacing.mediumHeight(),
              Row(
                children: [
                  ColorContainer(
                      height: 24,
                      width: 24,
                      color: Colors.pink,
                      onTap: () {
                        hideOverlay();
                      }),
                  Spacing.mediumWidth(),
                  ColorContainer(
                      height: 24,
                      width: 24,
                      color: Colors.pink,
                      onTap: () {
                        hideOverlay();
                      }),
                  Spacing.mediumWidth(),
                  ColorContainer(
                      height: 24,
                      width: 24,
                      color: Colors.pink,
                      onTap: () {
                        hideOverlay();
                      }),
                  Spacing.mediumWidth(),
                  ColorContainer(
                      height: 24,
                      width: 24,
                      color: Colors.pink,
                      onTap: () {
                        hideOverlay();
                      }),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff484444)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Teams',
          style: TextStyle(
            color: Color(0xff484444),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Text(
                  'Enter your Team names and select team colour\nlabel to create teams.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.dark.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                AppTextField(
                  key: key,
                  title: 'Team 1 Name',
                  borderRadius: 50,
                  selectedColor: Colors.blue,
                  onSelectColorTapped: () => showOverlay(),
                ),
                const Spacing.height(33),
                AppTextField(
                  // key: key,
                  title: 'Team 2 Name',
                  borderRadius: 50,
                  selectedColor: Colors.pink,
                  onSelectColorTapped: () => showOverlay(),
                ),
                const Spacing.height(42),
                AppButton(
                  text: '+  Add Team ',
                  borderColor: AppColors.dark.withOpacity(0.37),
                  height: 32,
                  width: null,
                  textColor: AppColors.dark,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  height: 48,
                  text: 'CREATE TEAMS',
                  borderColor: AppColors.dark,
                  backgroundColor: const Color(0xff39187E),
                  borderRadius: 50,
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.selectedTeamsDetails),
                ),
                AppButton(
                  height: 48,
                  text: 'SKIP',
                  textColor: AppColors.dark,
                  onPressed: () {},
                ),
                const Spacing.height(84),
              ],
            )
          ],
        ),
      ),
    );
  }
}
