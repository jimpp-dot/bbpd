import 'package:flutter/rendering.dart';

import 'base_painter.dart';
import 'trace.dart';

/// 显示给观看者的painter
class AudiencePainter extends BasePainter {
  final Trace? trace;

  AudiencePainter(this.trace, {Color? eraseColor})
      : super(trace?.segments, eraseColor: eraseColor);

  @override
  Offset convertOffset(Size size, Offset offset) {
    if (trace?.boardSize == null) {
      return offset;
    }
    if (trace?.boardSize == size) {
      return offset;
    } else {
      return offset.scale(size.width / trace!.boardSize.width,
          size.height / trace!.boardSize.height);
    }
  }
}
