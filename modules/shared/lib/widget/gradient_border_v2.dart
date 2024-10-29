import 'package:flutter/material.dart';

/// 渐变边框，可传入BorderRadiusDirectional
class GradientBorderV2 extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget? _child;

  GradientBorderV2({
    super.key,
    Widget? child,
    Gradient? borderGradient, // 将 borderGradient 参数变为可空
    double borderWidth = 1,
    BorderRadiusGeometry borderRadius =
        BorderRadiusDirectional.zero, // 使用 BorderRadiusDirectional 类型
  })  : _painter = _GradientPainter(
          borderRadius: borderRadius,
          borderGradient: borderGradient, // 在这里不需要改变
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

  final BorderRadiusGeometry borderRadius;
  final double borderWidth;
  final Gradient? borderGradient; // 声明 borderGradient 为可空类型

  _GradientPainter({
    required this.borderRadius,
    required this.borderWidth,
    this.borderGradient, // 参数为可空
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 如果没有设置 borderGradient，则不需要绘制边框
    if (borderGradient == null) return;

    // 获取文本方向
    TextDirection textDirection = TextDirection.ltr; // 默认值，你可以从上下文获取实际文本方向

    // 将边框半径转换为对应方向的边框半径
    BorderRadius resolvedBorderRadius = borderRadius.resolve(textDirection);

    Rect outerRect = Offset.zero & size;
    RRect outerRRect = RRect.fromRectAndCorners(
      outerRect,
      topLeft: resolvedBorderRadius.topLeft,
      topRight: resolvedBorderRadius.topRight,
      bottomLeft: resolvedBorderRadius.bottomLeft,
      bottomRight: resolvedBorderRadius.bottomRight,
    );

    Rect innerRect = Rect.fromLTWH(
      borderWidth,
      borderWidth,
      size.width - borderWidth * 2,
      size.height - borderWidth * 2,
    );
    RRect innerRRect = RRect.fromRectAndCorners(
      innerRect,
      topLeft: resolvedBorderRadius.topLeft - Radius.circular(borderWidth),
      topRight: resolvedBorderRadius.topRight - Radius.circular(borderWidth),
      bottomLeft:
          resolvedBorderRadius.bottomLeft - Radius.circular(borderWidth),
      bottomRight:
          resolvedBorderRadius.bottomRight - Radius.circular(borderWidth),
    );

    // 使用 borderGradient 创建 Shader
    _paint.shader = borderGradient!
        .createShader(outerRect); // 添加 null-aware 操作符，确保 borderGradient 不为 null

    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    Path combinedPath = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(combinedPath, _paint);
  }

  @override
  bool shouldRepaint(_GradientPainter oldDelegate) {
    return oldDelegate.borderGradient != borderGradient ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.borderRadius != borderRadius;
  }
}
