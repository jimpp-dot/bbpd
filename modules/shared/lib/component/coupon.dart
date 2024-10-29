import 'dart:math';

import 'package:flutter/widgets.dart';

/// 自定义礼券背景图片控件
class Coupon extends StatelessWidget {
  /// The size that this [CustomPaint] should aim for, given the layout
  /// constraints, if there is no child.
  ///
  /// Defaults to [Size.zero].
  ///
  /// If there's a child, this is ignored, and the size of the child is used
  /// instead.
  final Size? size;

  /// Paint color.
  final Color? color;

  final Gradient? gradient;

  final Widget? child;

  const Coupon({
    super.key,
    this.size,
    this.color,
    this.child,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    Shader? shader;
    if (gradient != null) {
      shader = gradient!
          .createShader(Rect.fromLTWH(0, 0, size!.width, size!.height));
    }
    return Container(
      child: CustomPaint(
        painter: CouponPainter(color: color, shader: shader),
        size: size ?? Size.infinite,
        child: child,
      ),
    );
  }
}

class CouponPainter extends CustomPainter {
  final Color? color;
  final Shader? shader;
  late Paint _paint;

  CouponPainter({this.color, this.shader}) {
    _paint = Paint();
    _paint.isAntiAlias = true;
    if (color != null) {
      _paint.color = color!;
    }
    if (shader != null) {
      _paint.shader = shader;
    }
    _paint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }

    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, height / 3.0);
    path.arcTo(
        Rect.fromCircle(
          center: Offset(0, height / 2.0),
          radius: height / 6.0,
        ),
        -pi / 2,
        pi,
        false);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, height * (2 / 3.0));
    path.arcTo(
        Rect.fromCircle(
          center: Offset(width, height / 2.0),
          radius: height / 6.0,
        ),
        pi / 2,
        pi,
        false);
    path.lineTo(width, 0);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
