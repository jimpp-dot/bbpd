import 'package:flutter/material.dart';

/// text aligns vertically, from top to bottom and right to left.
/// 垂直布局的文字. 从右上开始排序到左下角.
class VerticalText extends CustomPainter {
  String text;
  double width;
  double height;
  TextStyle textStyle;

  VerticalText(
      {required this.text,
      required this.textStyle,
      required this.width,
      required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = textStyle.color ?? Colors.black;
    double offsetX = width;
    double offsetY = 0;
    bool newLine = true;
    double maxWidth = 0;

    maxWidth = findMaxWidth(text, textStyle);

    for (var rune in text.runes) {
      String str = String.fromCharCode(rune);
      TextSpan span = TextSpan(style: textStyle, text: str);
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);
      tp.layout();

      if (offsetY + tp.height > height) {
        newLine = true;
        offsetY = 0;
      }

      if (newLine) {
        offsetX -= maxWidth;
        newLine = false;
      }

      if (offsetX < -maxWidth) {
        continue;
      }

      tp.paint(canvas, Offset(offsetX, offsetY));
      offsetY += tp.height;
    }
  }

  double findMaxWidth(String text, TextStyle style) {
    double maxWidth = 0;

    for (var rune in text.runes) {
      String str = String.fromCharCode(rune);
      TextSpan span = TextSpan(style: style, text: str);
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);
      tp.layout();
      maxWidth = max(maxWidth, tp.width);
    }

    return maxWidth;
  }

  @override
  bool shouldRepaint(VerticalText oldDelegate) {
    return oldDelegate.text != text ||
        oldDelegate.textStyle != textStyle ||
        oldDelegate.width != width ||
        oldDelegate.height != height;
  }

  double max(double a, double b) {
    if (a > b) {
      return a;
    } else {
      return b;
    }
  }
}
