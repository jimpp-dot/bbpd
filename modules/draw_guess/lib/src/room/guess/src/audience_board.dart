import 'package:flutter/material.dart';

import 'audience_painter.dart';
import 'trace.dart';

class AudienceBoard extends StatelessWidget {
  final Trace? trace;
  final Color? eraseColor;

  const AudienceBoard(this.trace, {super.key, this.eraseColor});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AudiencePainter(trace, eraseColor: eraseColor),
      size: Size.infinite,
    );
  }
}
