import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class ScaffoldBody extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? decorationColor;

  const ScaffoldBody(
      {super.key,
      required this.child,
      this.backgroundColor,
      this.shadowColor,
      this.decorationColor});

  @override
  Widget build(BuildContext context) {
    return Ink(
        color: backgroundColor,
        child: Ink(
            decoration: BoxDecoration(
              color: decorationColor ?? R.color.mainBgColor,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
              ),
            ),
            child: child));
  }
}
