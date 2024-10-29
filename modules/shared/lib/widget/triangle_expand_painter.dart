import 'package:flutter/material.dart';

/// 左右箭头三角形
class TriangleExpandPainter extends CustomPainter {
  Color color; //填充颜色
  late Paint _paint; //画笔
  late Path _path; //绘制路径
  bool isLeft;

  /// 三角指向左或者右

  TriangleExpandPainter({required this.color, required this.isLeft}) {
    _paint = Paint()
      ..strokeWidth = 1.0 //线宽
      ..color = color
      ..isAntiAlias = true;
    _path = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    //起点
    if (isLeft) {
      /// 三角形指向左
      _path.moveTo(0, size.height / 2);
      _path.lineTo(size.width, size.height);
      _path.lineTo(size.width, 0);
    } else {
      /// 三角形指向右
      _path.moveTo(0, 0);
      _path.lineTo(0, size.height);
      _path.lineTo(size.width, size.height * 0.5);
    }

    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
