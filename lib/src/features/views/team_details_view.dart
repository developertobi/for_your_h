import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/features/models/selected_team_details_arg.dart';
import 'package:for_your_head/src/features/models/team_details_arg.dart';
import 'package:for_your_head/src/widgets/app_button.dart';
import 'package:for_your_head/src/widgets/app_text_field.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../../core/constants/colors.dart';
import '../../widgets/color_container.dart';

class TeamDetailsView extends StatefulWidget {
  final TeamDetailsArg args;
  const TeamDetailsView({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<TeamDetailsView> createState() => _TeamDetailsViewState();
}

class _TeamDetailsViewState extends State<TeamDetailsView> {
  late int noOfTeams;
  // final controllers = List.filled(4, TextEditingController());
  late List<TextEditingController> controllers;
  // = [
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  // ];
  final _formKey = GlobalKey<FormState>();
  // OverlayEntry? entry;
  // GlobalKey key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    noOfTeams = widget.args.noOfTeams;
    controllers = List.generate(
        widget.args.noOfTeams, (index) => TextEditingController());
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // showOverlay();
    });
  }

  // showOverlay() {
  //   final overlay = Overlay.of(context)!;
  //   final renderBox = key.currentContext?.findRenderObject() as RenderBox;
  //   final size = renderBox.size;
  //   print(size.height);
  //   final offset = renderBox.localToGlobal(Offset.zero);
  //
  //   entry = OverlayEntry(
  //     builder: (context) => Positioned(
  //       right: offset.dx,
  //       top: offset.dy + size.height + 12,
  //       // width: size.width,
  //       // height: size.height,
  //       child: buildOverlay(),
  //     ),
  //   );
  //   overlay.insert(entry!);
  // }
  //
  // void hideOverlay() {
  //   entry?.remove();
  //   entry = null;
  // }
  //
  // Widget buildOverlay() => Material(
  //       elevation: 8,
  //       child: Padding(
  //         padding: const EdgeInsets.all(24.0),
  //         child: Column(
  //           children: [
  //             Row(
  //               children: [
  //                 ColorContainer(
  //                     height: 24,
  //                     width: 24,
  //                     color: Colors.pink,
  //                     onTap: () {
  //                       hideOverlay();
  //                     }),
  //                 Spacing.mediumWidth(),
  //                 ColorContainer(
  //                     height: 24,
  //                     width: 24,
  //                     color: Colors.pink,
  //                     onTap: () {
  //                       hideOverlay();
  //                     }),
  //                 Spacing.mediumWidth(),
  //                 ColorContainer(
  //                     height: 24,
  //                     width: 24,
  //                     color: Colors.pink,
  //                     onTap: () {
  //                       hideOverlay();
  //                     }),
  //                 Spacing.mediumWidth(),
  //                 ColorContainer(
  //                     height: 24,
  //                     width: 24,
  //                     color: Colors.pink,
  //                     onTap: () {
  //                       hideOverlay();
  //                     }),
  //               ],
  //             ),
  //             const Spacing.mediumHeight(),
  //             Row(
  //               children: [
  //                 ColorContainer(
  //                     height: 24,
  //                     width: 24,
  //                     color: Colors.pink,
  //                     onTap: () {
  //                       hideOverlay();
  //                     }),
  //                 Spacing.mediumWidth(),
  //                 ColorContainer(
  //                     height: 24,
  //                     width: 24,
  //                     color: Colors.pink,
  //                     onTap: () {
  //                       hideOverlay();
  //                     }),
  //                 Spacing.mediumWidth(),
  //                 ColorContainer(
  //                     height: 24,
  //                     width: 24,
  //                     color: Colors.pink,
  //                     onTap: () {
  //                       hideOverlay();
  //                     }),
  //                 Spacing.mediumWidth(),
  //                 ColorContainer(
  //                     height: 24,
  //                     width: 24,
  //                     color: Colors.pink,
  //                     onTap: () {
  //                       hideOverlay();
  //                     }),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
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
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: noOfTeams + 1,
                        itemBuilder: (context, index) {
                          if (index == noOfTeams) {
                            return Visibility(
                              visible: noOfTeams < 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppButton(
                                    text: '+  Add Team ',
                                    borderColor:
                                        AppColors.dark.withOpacity(0.37),
                                    height: 32,
                                    width: null,
                                    textColor: AppColors.dark,
                                    onPressed: () {
                                      setState(() {
                                        if (noOfTeams < 4) {
                                          noOfTeams++;
                                          controllers
                                              .add(TextEditingController());
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return AppTextField(
                              controller: controllers[index],
                              hintText: 'Team ${index + 1} Name',
                              title: 'Team ${index + 1} Name',
                              borderRadius: 50,
                              validator: (val) => (val == null || val.isEmpty)
                                  ? 'Kindly enter a name.'
                                  : null,
                            );
                          }
                        },
                        separatorBuilder: (__, _) => const Spacing.height(33),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    height: 48,
                    text: 'CREATE TEAMS',
                    borderColor: AppColors.dark,
                    backgroundColor: const Color(0xff39187E),
                    backgroundColor2: const Color(0xff9064EC),
                    borderRadius: 50,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        List<String> teamsNames = [];
                        for (var controller in controllers) {
                          print('controller.text ${controller.text}');
                          teamsNames.add(controller.text);
                        }
                        Navigator.pushNamed(
                          context,
                          Routes.selectedTeamsDetails,
                          arguments: SelectedTeamDetailsArg(
                            gameRounds: widget.args.gameRounds,
                            teamsNames: teamsNames,
                          ),
                        );
                      }
                    },
                  ),
                  const Spacing.tinyHeight(),
                  AppButton(
                    height: 48,
                    text: 'SKIP',
                    textColor: AppColors.dark,
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                  ),
                  const Spacing.height(54),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
