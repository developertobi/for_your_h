import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.imageString,
    this.height = 160,
    this.width = 104,
    this.hasShadow = false,
    this.onTap,
  }) : super(key: key);
  final double? height;
  final double? width;
  final String imageString;
  final bool hasShadow;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: !hasShadow
              ? null
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    // spreadRadius: 3,
                    blurRadius: 1,
                    offset: const Offset(0, 7), // changes position of shadow
                  ),
                ],
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(imageString), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
