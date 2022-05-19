import 'package:flutter/material.dart';
import 'package:for_your_head/src/widgets/spacing.dart';
import 'package:for_your_head/src/widgets/spacing.dart';
import 'package:for_your_head/src/widgets/spacing.dart';
import 'package:for_your_head/src/widgets/spacing.dart';

import '../../widgets/color_container.dart';

class CreatingTeamsView extends StatelessWidget {
  const CreatingTeamsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ColorContainer(
                height: 14.21,
                width: 14.21,
                color: Colors.blueGrey,
              ),
              Spacing.tinyWidth(),
              ColorContainer(
                height: 14.21,
                width: 14.21,
                color: Colors.greenAccent,
              ),
              Spacing.tinyWidth(),
              ColorContainer(
                height: 14.21,
                width: 14.21,
                color: Colors.pink,
              ),
              Spacing.tinyWidth(),
              ColorContainer(
                height: 14.21,
                width: 14.21,
                color: Colors.deepPurpleAccent,
              ),
              Spacing.tinyWidth(),
            ],
          ),
          const Spacing.smallHeight(),
          const Text(
            'Creating Teams',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color(0xff175B73),
                fontSize: 26,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
