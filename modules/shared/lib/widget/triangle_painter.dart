import 'package:flutter/material.dart';

/// 倒三角
class TrianglePainter extends CustomPainter {
  Color color; //填充颜色
  late Paint _paint; //画笔
  late Path _path; //绘制路径

  TrianglePainter(this.color) {
    _paint = Paint()
      ..strokeWidth = 1.0 //线宽
      ..color = color
      ..isAntiAlias = true;
    _path = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    //起点
    _path.moveTo(0, 0);
    _path.lineTo(size.width * 0.5, size.height);
    _path.lineTo(size.width, 0);
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
