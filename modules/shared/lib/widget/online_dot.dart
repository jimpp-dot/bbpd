import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 标识用户在线的小圆点
class OnlineDot extends StatelessWidget {
  final double size;
  final Color? color;
  final Color borderColor;
  final double padding;

  const OnlineDot(
      {super.key,
      this.size = 12,
      this.color,
      this.borderColor = Colors.white,
      this.padding = 4});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: borderColor,
      ),
      child: Container(
        width: size - padding,
        height: size - padding,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? R.color.fiveBrightColor,
        ),
      ),
    );
  }
}
