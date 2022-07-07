import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    Key? key,
    this.title,
    required this.content,
    this.takeAllSpace = false,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);
  final Widget? title;
  final Widget? content;
  final bool takeAllSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      insetPadding: takeAllSpace
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 24.0,
            ),
      title: title,
      content: content,
    );
  }
}
