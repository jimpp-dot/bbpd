import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CanvasCirclePart extends CustomPainter {
  final Paint _paint = Paint();

  CanvasCirclePart(Color color) {
    _paint.color = color;
    _paint.strokeWidth = 1.0;
    _paint.style = PaintingStyle.fill;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double x0 = size.width / 2;
    double y0 = size.height / 2;
    double radius = size.width / 2;
    Rect rect = Rect.fromCircle(center: Offset(x0, y0), radius: radius);

    double x1 = x0 + radius * cos(pi / 6);
    double y1 = y0 + radius * sin(pi / 6);

    double x2 = x0 + radius * cos(pi / 6 * 4);
    double y2 = y0 + radius * sin(pi / 6 * 4);

    canvas.drawArc(rect, pi / 6, pi / 6 * 4, false, _paint);
    canvas.drawLine(Offset(x2, y2), Offset(x1, y1), _paint);
  }
}
