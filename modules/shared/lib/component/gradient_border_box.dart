import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

/// 渐进色的border
///
/// 需要注意的是，当GradientBorderBox的borderRadius值为X时,
/// 其内部的child如果需要设置圆角,则child的圆角需要值需要设置成(X - borderWidth/2.0)

@Deprecated('废弃，请使用GradientBorder')
class GradientBorderBox extends StatelessWidget {
  final double? width;

  final double? height;

  /// 默认2.0
  final double borderWidth;

  final double borderRadius;

  final AlignmentDirectional begin;

  final AlignmentDirectional end;

  /// 需要渐进的颜色
  final List<Color> gradientColors;

  final Widget? child;

  const GradientBorderBox({
    Key? key,
    this.width,
    this.height,
    this.borderWidth = 2.0,
    this.borderRadius = 8.0,
    required this.gradientColors,
    this.begin = AlignmentDirectional.centerStart,
    this.end = AlignmentDirectional.centerEnd,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _GradientBorderPainter(
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          gradientColors: gradientColors,
          begin: begin,
          end: end,
        ),
        child: Container(
          margin: EdgeInsetsDirectional.all(borderWidth / 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(
                Radius.circular(borderRadius - borderWidth / 2.0)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  /// 默认2.0
  final double borderWidth;

  final double borderRadius;

  final AlignmentDirectional begin;

  final AlignmentDirectional end;

  /// 需要渐进的颜色
  final List<Color> gradientColors;

  _GradientBorderPainter(
      {required this.borderWidth,
      required this.borderRadius,
      required this.gradientColors,
      required this.begin,
      required this.end});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth
          ..shader = ui.Gradient.linear(
              _gradientLocation(begin, size),
              _gradientLocation(end, size),
              gradientColors,
              _defaultGradientColorStops(gradientColors))

        /// centerLeft to centerRight
        ;

    final borderRadius = BorderRadius.all(Radius.circular(this.borderRadius));
    final rrect =
        borderRadius.toRRect(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  /// 默认平均分布颜色
  List<double>? _defaultGradientColorStops(List<Color> colors) {
    if (colors.length <= 2) return null;

    int length = colors.length;

    List<double> stops = [];

    var averageStopValue = 1 / (length - 1);

    for (int i = 0; i < length; i++) {
      var value = i * averageStopValue;
      if (i == length - 1) {
        value = 1;
      }
      stops.add(value);
    }

    return stops;
  }

  /// 渐进色方向
  Offset _gradientLocation(AlignmentDirectional directional, Size size) {
    if (directional == AlignmentDirectional.topStart) {
      /// 左上
      return const Offset(0, 0);
    } else if (directional == AlignmentDirectional.bottomStart) {
      /// 左下
      return Offset(0, size.height);
    } else if (directional == AlignmentDirectional.topCenter) {
      /// 顶部剧中
      return Offset(size.width / 2.0, 0);
    } else if (directional == AlignmentDirectional.bottomCenter) {
      /// 底部剧中
      return Offset(size.width / 2.0, size.height);
    } else if (directional == AlignmentDirectional.topEnd) {
      /// 右上
      return Offset(size.width, 0);
    } else if (directional == AlignmentDirectional.bottomEnd) {
      /// 右下
      return Offset(size.width, size.height);
    } else if (directional == AlignmentDirectional.centerEnd) {
      /// 又中
      return Offset(size.width, size.height / 2.0);
    }

    /// 左中
    return Offset(0, size.height / 2.0);
  }
}
