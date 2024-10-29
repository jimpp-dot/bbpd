import 'dart:math';

import 'package:flutter/material.dart';

class CrossPKRingWidget extends StatelessWidget {
  final List<num> values;
  final Size size;

  const CrossPKRingWidget({
    Key? key,
    required this.values,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CrossPKRing(values),
      size: size,
    );
  }
}

class CrossPKRing extends CustomPainter {
  CrossPKRing(this.values) : assert(values.length <= colors.length);

  final List<num> values;

  // 圆环上每个扇区的最小占比
  static const double min_percent = 1 / 12; // 30°

  // 扇区的颜色
  // 目前支持三房PK，所以只有3个渐变色，后续支持更多房间时，请追加颜色
  static const List<List<Color>> colors = [
    [Color(0xFFFF29A7), Color(0xFFF365FF)],
    [Color(0xFF00F9FA), Color(0xFF008CFB)],
    [Color(0xFFC57500), Color(0xFFFADC00)],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final double length = min<double>(size.width, size.height); // 边长
    final double width = length / 4; // Paint的strokeWidth
    final Rect outerRect = Offset.zero & Size.square(length); // canvas的实际区域
    final Rect rect =
        Offset(width / 2, width / 2) & Size.square(length - width); // 绘制圆环的区域
    final int parts = values.length;
    final num totalValue = values.reduce((value, element) => value + element);
    List<double> percents = [];
    if (totalValue == 0) {
      percents = List.filled(parts, 1 / parts);
    } else {
      double normalTotalValue = 0;
      double overrunPercents = 0; // 侵占的比例
      for (int i = 0; i < parts; i++) {
        double percent = values[i] / totalValue;
        percents.add(percent);
        if (percent < min_percent) {
          overrunPercents += (min_percent - percent);
        } else if (percent > min_percent) {
          normalTotalValue += values[i];
        }
      }

      // 重新分配比例
      for (int i = 0; i < parts; i++) {
        if (percents[i] < min_percent) {
          percents[i] = min_percent;
        } else if (percents[i] > min_percent) {
          // 大于最小占比的单个部分，需要减去它应承担的份额
          percents[i] =
              percents[i] - values[i] / normalTotalValue * overrunPercents;
        }
      }
    }

    canvas.save();
    // 这里必须先旋转canvas，要不然某个跨越2π位置的扇区颜色渐变会被截断
    canvas.translate(outerRect.width / 2, outerRect.height / 2);
    canvas.rotate(pi - 2 * pi * percents.first / 2); // 翻转，让第一个扇区的中间位于左边
    canvas.translate(-outerRect.width / 2, -outerRect.height / 2);

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    double sweepAngle = 0;
    double startAngle = 0;
    for (int i = 0; i < parts; i++) {
      // Log.d('$i: percent:${percents[i]}');
      startAngle = startAngle + sweepAngle;
      sweepAngle = 2 * pi * percents[i];
      paint.shader = SweepGradient(
        colors: colors[i],
        startAngle: startAngle,
        endAngle: startAngle + sweepAngle,
      ).createShader(rect);
      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CrossPKRing oldDelegate) {
    if (values.length != oldDelegate.values.length) {
      return true;
    }
    for (int i = 0, l = values.length; i < l; i++) {
      if (values[i] != oldDelegate.values[i]) {
        return true;
      }
    }
    return false;
  }
}
