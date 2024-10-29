// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';

WidgetSpan TapableTextSpan(
    {required String text, TextStyle? style, GestureTapCallback? onLongPress}) {
  return WidgetSpan(
      child: GestureDetector(
    onLongPress: onLongPress,
    child: Text(text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: style ??
            const TextStyle(
                fontSize: 10, height: 1.5, color: Color(0xff666666))),
  ));
}
