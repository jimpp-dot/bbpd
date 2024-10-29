import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 渐变按钮
class GradientButton extends StatelessWidget {
  final List<Color>? colors;
  final GestureTapCallback? onTap;
  final String? text;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final Border? border;

  const GradientButton(this.text,
      {super.key,
      this.colors,
      this.onTap,
      this.width = 150,
      this.height = 50,
      this.textStyle,
      this.begin,
      this.end,
      this.border});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(height / 2),
        onTap: onTap,
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: colors ?? R.color.mainBrandGradientColors,
                begin: begin ?? AlignmentDirectional.centerStart,
                end: end ?? AlignmentDirectional.centerEnd,
              ),
              border: border),
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: Text(
              text ?? '',
              style: textStyle ??
                  const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
