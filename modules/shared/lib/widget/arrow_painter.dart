import 'package:shared/src/theme/themes.dart';
import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  final Color? color;
  final bool isSharpCorner;

  late Paint _paint;

  ArrowPainter({this.color, this.isSharpCorner = false}) {
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
    if (isSharpCorner) {
      path.lineTo(width / 2, height);
    } else {
      path.lineTo(width / 2 - 2, height - 1);
      path.conicTo(width / 2, height, width / 2 + 2, height - 1, 2);
    }
    path.lineTo(width, 0);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
