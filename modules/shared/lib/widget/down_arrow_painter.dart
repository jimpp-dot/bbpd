import 'package:shared/src/theme/themes.dart';
import 'package:flutter/material.dart';

class DownArrowPainter extends CustomPainter {
  final Color? color;

  late Paint _paint;

  DownArrowPainter({this.color}) {
    _paint = Paint();
    _paint.isAntiAlias = true;
    _paint.color = color ?? R.color.mainBrandColor;
    _paint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width / 2, height);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
