import 'package:flutter/material.dart';

/// 与Widget相关的工具类
class TextUtils {
  TextUtils._();

  /// 获取[Text]的宽高
  static Size getTextSize(BuildContext context, String text, TextStyle style,
      double maxWidth, int maxLines) {
    if (text.isEmpty) return const Size(0, 0);
    String text0 = _filterText(text);
    TextPainter painter = TextPainter(
        locale: Localizations.localeOf(context),
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text0, style: style));
    painter.layout(maxWidth: maxWidth);
    return painter.size;
  }

  static String _filterText(String text) {
    while (text.contains('<br>')) {
      text = text.replaceAll('<br>', '\n\n');
    }
    return text;
  }
}
