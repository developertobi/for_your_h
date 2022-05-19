import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    this.hasBorder = false,
    this.onTap,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Color color;
  final bool hasBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 2,
            color: color,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(hasBorder ? 1.5 : 0),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
