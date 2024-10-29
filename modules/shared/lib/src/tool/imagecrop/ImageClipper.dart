import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ImageClipper extends CustomPainter {
  final ui.Image image;
  final Rect clipperRect;

  ImageClipper(this.image, this.clipperRect);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Rect targetRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawImageRect(image, clipperRect, targetRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
