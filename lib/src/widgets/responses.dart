import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../features/models/response.dart';

class Responses extends StatelessWidget {
  const Responses({Key? key, required this.responses}) : super(key: key);
  final List<Response> responses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...responses
            .map((response) => Text(
                  response.word,
                  textAlign: TextAlign.center,
                  style: kNunitoTextStyle.copyWith(
                    fontSize: 42,
                    color: response.isCorrect
                        ? const Color(0xff0F96C5)
                        : const Color(0xff85828E),
                  ),
                ))
            .toList(),
        Container(
          height: 3,
          color: const Color(0xff0F96C5),
        ),
      ],
    );
  }
}
