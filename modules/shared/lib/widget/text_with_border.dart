import 'package:flutter/material.dart';

/// 带边框的文本
class TextWithBorder extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  final Color borderColor;
  final double borderWidth;

  const TextWithBorder(this.data,
      {super.key,
      required this.textStyle,
      required this.borderColor,
      required this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          data,
          style: textStyle.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeCap = StrokeCap.round
                ..strokeWidth = borderWidth
                ..strokeJoin = StrokeJoin.round
                ..color = borderColor),
        ),
        Text(
          data,
          style: textStyle,
        ),
      ],
    );
  }
}
