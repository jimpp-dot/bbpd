import 'dart:math';
import 'package:flutter/material.dart';

class LeftBorder extends ShapeBorder {
  final BorderRadius borderRadius;
  final BorderSide borderSide;
  final double paddingTop;
  final double paddingBottom;

  const LeftBorder(
      {this.borderRadius = BorderRadius.zero,
      required this.borderSide,
      this.paddingTop = 0,
      this.paddingBottom = 0});

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsetsDirectional.only(start: borderSide.width);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRect(Rect.fromLTWH(rect.left, rect.top,
          max(0.0, rect.width - borderSide.width), rect.height));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (borderRadius.topLeft != Radius.zero ||
        borderRadius.bottomLeft != Radius.zero) {
      canvas.clipPath(getOuterPath(rect, textDirection: textDirection));
    }

    canvas.drawLine(rect.topLeft + Offset(0, paddingTop),
        rect.bottomLeft - Offset(0, paddingBottom), borderSide.toPaint());
  }

  @override
  ShapeBorder scale(double t) {
    return LeftBorder(
        borderRadius: borderRadius,
        paddingTop: paddingTop,
        paddingBottom: paddingBottom,
        borderSide: borderSide.scale(t));
  }
}
