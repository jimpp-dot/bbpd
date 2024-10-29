import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

const TextStyle aldotheStyle = TextStyle(
    fontFamily: 'AldotheApache', package: ComponentManager.MANAGER_BASE_CORE);

class AldotheText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool softWrap;
  final TextOverflow? overflow;
  final double textScaleFactor;
  final int maxLines;
  final String? semanticsLabel;

  const AldotheText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap = false,
    this.overflow,
    this.textScaleFactor = 0,
    this.maxLines = 1,
    this.semanticsLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: aldotheStyle.merge(style),
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
