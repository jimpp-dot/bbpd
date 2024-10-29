import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class BottomButton {
  static Widget of({
    EdgeInsetsGeometry margin = const EdgeInsetsDirectional.only(
        bottom: 14.0, top: 16.0, start: 20.0, end: 20.0),
    GestureTapCallback? onTap,
    String title = '',
    Decoration? decoration,
    Widget? content,
    List<Color>? bgColor,
    Color? textColor,
  }) {
    return Padding(
      padding: margin.add(EdgeInsets.only(bottom: Util.iphoneXBottom)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          height: 48.0,
          decoration: decoration ??
              BoxDecoration(
                gradient: LinearGradient(
                  colors: bgColor ?? R.color.mainBrandGradientColors,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
          child: Align(
            child: content ??
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: textColor ?? Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
