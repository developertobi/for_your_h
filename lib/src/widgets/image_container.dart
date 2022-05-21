import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.imageString,
  }) : super(key: key);
  final String imageString;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 104,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage(
            imageString,
          ),
        ),
      ),
    );
  }
}
