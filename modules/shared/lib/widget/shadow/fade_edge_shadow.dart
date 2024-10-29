import 'package:flutter/material.dart';

/// 边缘模糊阴影效果
class FadeEdgeShadow extends StatelessWidget {
  final Widget child;
  final Axis axis;

  const FadeEdgeShadow({super.key, required this.child, required this.axis});

  @override
  Widget build(BuildContext context) {
    AlignmentGeometry begin;
    AlignmentGeometry end;
    if (axis == Axis.vertical) {
      begin = AlignmentDirectional.topCenter;
      end = AlignmentDirectional.bottomCenter;
    } else {
      begin = AlignmentDirectional.centerStart;
      end = AlignmentDirectional.centerEnd;
    }
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: begin,
          end: end,
          colors: const [
            Colors.purple,
            Colors.transparent,
            Colors.transparent,
            Colors.purple
          ],
          stops: const [0.0, 0.1, 0.9, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: child,
    );
  }
}
