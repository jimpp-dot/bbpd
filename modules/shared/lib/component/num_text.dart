import 'package:flutter/widgets.dart';
import 'package:shared/src/util.dart';
import 'package:shared/src/manager/ComponentManager.dart';

/// 用于显示数字的text控件
class NumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;

  const NumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  }) : super(key: key);

  TextStyle get _style => style == null
      ? TextStyle(
          fontFamily: Util.numFontFamily,
          package: ComponentManager.MANAGER_BASE_CORE)
      : style!.copyWith(
          fontFamily: Util.numFontFamily,
          package: ComponentManager.MANAGER_BASE_CORE);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: _style,
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
