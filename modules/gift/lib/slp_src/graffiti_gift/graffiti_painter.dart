import 'dart:ui';

import 'package:flutter/material.dart' hide Image;

class GraffitiPainter extends CustomPainter {
  final List<Offset> list;
  final Image image;
  final double showSize;
  final double animValue;

  GraffitiPainter(
      {required this.list,
      required this.image,
      required this.showSize,
      this.animValue = 0});

  final Paint _paint = Paint()..filterQuality = FilterQuality.high;

  @override
  void paint(Canvas canvas, Size size) {
    // 设置透明度
    _paint.color = Colors.white.withOpacity(1 - animValue);
    // 设置缩放尺寸
    double realSize = showSize * (1 + animValue / 2);
    for (var point in list) {
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromCenter(center: point, width: realSize, height: realSize),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(GraffitiPainter oldDelegate) {
    return oldDelegate.list.length != list.length ||
        oldDelegate.animValue != animValue;
  }
}
