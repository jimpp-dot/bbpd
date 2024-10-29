import 'package:flutter/material.dart';

/// 渐变边框
class GradientBorder extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget? _child;

  GradientBorder({
    super.key,
    Widget? child,
    required Gradient borderGradient,
    double borderWidth = 1,
    double borderRadius = 0,
  })  : _painter = _GradientPainter(
          borderRadius: borderRadius,
          borderGradient: borderGradient,
          borderWidth: borderWidth,
        ),
        _child = child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: _child,
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();

  final double borderRadius;
  final double borderWidth;
  final Gradient borderGradient; // 边框渐变
  _GradientPainter({
    required this.borderGradient,
    this.borderRadius = 0,
    this.borderWidth = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect outerRect = Offset.zero & size;
    RRect outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(borderRadius));

    Rect innerRect = Rect.fromLTWH(
      borderWidth,
      borderWidth,
      size.width - borderWidth * 2,
      size.height - borderWidth * 2,
    );
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(borderRadius - borderWidth));

    _paint.shader = borderGradient.createShader(outerRect,
        textDirection: TextDirection.ltr);

    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (this == oldDelegate) {
      return false;
    }
    if (oldDelegate is _GradientPainter) {
      _GradientPainter old = oldDelegate;
      if (old.borderWidth == borderWidth &&
          old.borderRadius == borderRadius &&
          old.borderGradient == borderGradient) {
        return false;
      }
    }
    return true;
  }
}
