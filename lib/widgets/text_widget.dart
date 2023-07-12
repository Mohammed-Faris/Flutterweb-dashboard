import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.textString,
      required this.fontSize,
      this.fontWeight,
      this.textOverflow,
      this.color});
  final String textString;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis,
          color: color),
    );
  }
}
