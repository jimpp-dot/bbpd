import 'package:flutter/material.dart';

/// 外边框,需要放置在Stack容器中,并且设置：
/// overflow: Overflow.visible
class UserOuterBorderWidget extends StatelessWidget {
  final double borderWidth;
  final double size;

  const UserOuterBorderWidget(
      {super.key, required this.size, this.borderWidth = 2});

  @override
  Widget build(BuildContext context) {
    double overflow = -borderWidth;
    return PositionedDirectional(
      start: overflow,
      end: overflow,
      top: overflow,
      bottom: overflow,
      child: IgnorePointer(
        child: Container(
          width: size - 2 * overflow,
          height: size - 2 * overflow,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius:
                BorderRadius.all(Radius.circular((size - 2 * overflow) / 2)),
            border: Border.all(
              width: -overflow,
              color: const Color(0xFFFFFFFF).withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}
