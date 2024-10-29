import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 优设标题黑
const youSheFontFamily = 'YouSheBiaoTiHei';
const TextStyle youSheStyle = TextStyle(
    fontFamily: youSheFontFamily, package: ComponentManager.MANAGER_BASE_CORE);

class YouSheText extends StatelessWidget {
  final String data;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextStyle? style;

  const YouSheText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  });

  static make(String data, {Color? color, double fontSize = 14.0}) {
    return NumText(
      data,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: youSheFontFamily,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: youSheStyle.merge(style),
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
    );
  }
}
