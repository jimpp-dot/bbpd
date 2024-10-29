import 'package:flutter/material.dart';
import 'package:extended_text/extended_text.dart';

/// 自定义TextSpan：Container+Text标签

class SlpTextSpan extends ExtendedWidgetSpan {
  final double width;
  final double height;

  SlpTextSpan({
    Key? key,
    required String text,
    required double imageWidth,
    required double imageHeight,
    TextStyle? textStyle,
    AlignmentGeometry textAlignment = AlignmentDirectional.center,
    EdgeInsetsDirectional? margin,
    Decoration? decoration,
    GestureTapCallback? onTap,
    HitTestBehavior behavior = HitTestBehavior.deferToChild,
  })  : width = imageWidth + (margin == null ? 0 : margin.horizontal),
        height = imageHeight + (margin == null ? 0 : margin.vertical),
        super(
          child: Container(
            padding: margin,
            child: GestureDetector(
              onTap: onTap,
              behavior: behavior,
              child: Container(
                decoration: decoration,
                width: imageWidth,
                height: imageHeight,
                alignment: textAlignment,
                child: Text(text, style: textStyle),
              ),
            ),
          ),
        );
}
