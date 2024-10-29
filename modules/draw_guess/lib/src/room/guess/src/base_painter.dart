import 'package:flutter/material.dart';

import 'trace.dart';

enum Operation {
  draw, // 绘画模式
  erase, // 擦除模式
}

abstract class BasePainter extends CustomPainter {
  final List<Segment>? _segments;

  final Paint _drawPaint = Paint();
  final Paint _erasePaint = Paint();

  BasePainter(this._segments, {Color? eraseColor}) {
    _drawPaint.isAntiAlias = true;
    _drawPaint.blendMode = BlendMode.srcOver;
    _drawPaint.strokeWidth = 4;
    _drawPaint.style = PaintingStyle.stroke;
    _drawPaint.strokeCap = StrokeCap.round;
    _drawPaint.strokeJoin = StrokeJoin.round;

    _erasePaint.isAntiAlias = true;
    _erasePaint.color = eraseColor ?? Colors.white;
    _erasePaint.blendMode = BlendMode.srcATop;
    _erasePaint.strokeWidth = 4;
    _erasePaint.style = PaintingStyle.stroke;
    _erasePaint.strokeCap = StrokeCap.round;
    _erasePaint.strokeJoin = StrokeJoin.round;
  }

  /// 坐标转换, 根据画布大小进行缩放
  ///
  /// [size] 当前画布的大小
  /// [offset] 当前坐标
  Offset convertOffset(Size size, Offset offset);

  @override
  void paint(Canvas canvas, Size size) {
    if ((_segments?.isEmpty ?? true) || size.isEmpty) return;
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    for (Segment segment in _segments!) {
      if (segment.points.isEmpty) continue;
      // points to path
      Path path = Path();
      for (Point point in segment.points) {
        Offset localPoint = convertOffset(size, point.offset);
        if (point.start) {
          path.moveTo(localPoint.dx, localPoint.dy);
          path.lineTo(localPoint.dx, localPoint.dy);
        } else {
          path.lineTo(localPoint.dx, localPoint.dy);
        }
      }
      // paint
      if (segment.op == Operation.draw) {
        // 画笔
        _drawPaint.color = segment.color;
        _drawPaint.strokeWidth = segment.strokeWidth;
        canvas.drawPath(path, _drawPaint);
      } else if (segment.op == Operation.erase) {
        // 橡皮擦
        _erasePaint.strokeWidth = segment.strokeWidth;
        canvas.drawPath(path, _erasePaint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
