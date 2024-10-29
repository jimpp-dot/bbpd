import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'base_painter.dart';
import 'trace.dart';

/// 显示绘制者绘制的轨迹
class BroadcasterPainter extends BasePainter {
  BroadcasterPainter(List<Segment> segments, {Color? eraseColor})
      : super(segments, eraseColor: eraseColor);

  @override
  Offset convertOffset(Size size, Offset offset) {
    return offset;
  }
}
