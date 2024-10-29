import 'package:flutter/material.dart';

extension TextExt on Text {
  Text textAlignExt(TextAlign align) {
    return copyWith(textAlign: align);
  }

  Text directionExt(TextDirection direction) {
    return copyWith(textDirection: direction);
  }

  Text softWrapExt(bool softWrap) {
    return copyWith(softWrap: softWrap);
  }

  Text overflowExt(TextOverflow overflow) {
    return copyWith(overflow: overflow);
  }

  Text maxLinesExt(int maxLines) {
    return copyWith(maxLines: maxLines);
  }

  Text scaleFactorExt(double scaleFactor) {
    return copyWith(textScaleFactor: scaleFactor);
  }

  Text styleExt(TextStyle style) {
    return copyWith(style: style);
  }

  Text copyWith(
      {Key? key,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection? textDirection = TextDirection.ltr,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      TextStyle? style}) {
    return Text(data ?? '',
        key: key ?? this.key,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection ?? this.textDirection,
        locale: locale ?? this.locale,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        maxLines: maxLines ?? this.maxLines,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
        style: style != null ? this.style?.merge(style) ?? style : this.style);
  }
}

extension TextStyleExt on TextStyle {
  TextStyle colorExt(Color color) {
    return copyWith(color: color);
  }

  TextStyle backgroundColorExt(Color color) {
    return copyWith(backgroundColor: color);
  }

  TextStyle sizeExt(double size) {
    return copyWith(fontSize: size);
  }

  TextStyle familyExt(String family) {
    return copyWith(fontFamily: family);
  }

  TextStyle weightExt(FontWeight weight) {
    return copyWith(fontWeight: weight);
  }

  TextStyle italicsExt() {
    return copyWith(fontStyle: FontStyle.italic);
  }

  TextStyle letterSpacingExt(double letterSpacing) {
    return copyWith(letterSpacing: letterSpacing);
  }

  TextStyle baselineExt(TextBaseline baseline) {
    return copyWith(textBaseline: baseline);
  }
}
