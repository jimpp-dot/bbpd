import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CanvasLine extends CustomPainter {
  final Paint _paint = Paint()
    ..color = const Color(0xFFC499F0)
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke;

  bool _isDash = false;

  CanvasLine([bool isDash = false]) {
    _isDash = isDash;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_isDash) {
      double space = 3.0;
      double width = 2.0;
      double start = space;
      while (true) {
        double end = start + width;
        if (end > size.width) end = size.width;
        canvas.drawLine(Offset(start, 0.0), Offset(end, 0.0), _paint);
        start = start + width + space;
        if (start > size.width) {
          break;
        }
      }
    } else {
      canvas.drawLine(const Offset(0.0, 0.0), Offset(size.width, 0.0), _paint);
    }
  }
}
