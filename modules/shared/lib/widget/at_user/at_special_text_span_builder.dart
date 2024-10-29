import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'at_text.dart';

abstract class ATTextRange {
  TextRange? textRange;
  int? postPos;

  int textLength();

  String actualText();

  ATTextRange copy();
}

class ATSpecialTextSpanBuilder extends SpecialTextSpanBuilder {
  late List<ATTextRange> Function() atTextAttach;
  Function(List<ATTextRange> atTextAttach)? updateATTextAttach;
  List<ATTextRange> sortedATTextAttach = [];
  TextStyle? atTextStyle;

  List<ATTextRange> getAtTextBeansFrom(String data,
      {TextStyle? textStyle, SpecialTextGestureTapCallback? onTap}) {
    TextSpan textSpan = super.build(data, textStyle: textStyle, onTap: onTap);
    return _getATTextFrom(textSpan: textSpan, attachList: atTextAttach());
  }

  List<ATTextRange> _getATTextFrom(
      {required TextSpan textSpan, required List<ATTextRange> attachList}) {
    List<ATTextRange> sortedATTextAttach = [];
    List<ATTextRange> atTextAttach = List.from(attachList);
    // Unicode编码和string的UTF16编码长度差异
    int unicodeLength = 0;
    textSpan.children?.forEach((value) {
      if (value is SpecialTextSpan) {
        SpecialTextSpan textSpan = value;
        int matchIndex = atTextAttach.indexWhere(
            (element) => textSpan.actualText == element.actualText());
        ATTextRange? match = matchIndex != -1 ? atTextAttach[matchIndex] : null;
        if (match != null) {
          match.textRange = textSpan.textRange;
          match.postPos = match.textRange!.start - unicodeLength;
          sortedATTextAttach.add(match.copy());
          atTextAttach.removeAt(matchIndex);
        }
      }
      if (value is TextSpan) {
        TextSpan textSpan = value;
        unicodeLength +=
            (textSpan.text?.length ?? 0) - (textSpan.text?.runes.length ?? 0);
      }
    });
    int minusLength = 0;
    for (var e in sortedATTextAttach) {
      if (e.postPos != null) {
        e.postPos = e.postPos! - minusLength;
      }
      minusLength += e.textLength();
    }
    return sortedATTextAttach;
  }

  @override
  TextSpan build(String data,
      {TextStyle? textStyle, SpecialTextGestureTapCallback? onTap}) {
    if (kIsWeb) {
      return TextSpan(text: data, style: textStyle);
    }
    TextSpan textSpan = super.build(data, textStyle: textStyle, onTap: onTap);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (atTextAttach().isNotEmpty &&
          textSpan.children != null &&
          textSpan.children!.isNotEmpty) {
        sortedATTextAttach =
            _getATTextFrom(textSpan: textSpan, attachList: atTextAttach());
        if (updateATTextAttach != null) updateATTextAttach!(sortedATTextAttach);
      }
    });

    return textSpan;
  }

  @override
  SpecialText? createSpecialText(String? flag,
      {TextStyle? textStyle,
      SpecialTextGestureTapCallback? onTap,
      required int index}) {
    if (flag == null || flag == '') {
      return null;
    }

    ///index is end index of start flag, so text start index should be index-(flag.length-1)
    if (isStart(flag, AtText.flag)) {
      return AtText(
        atTextStyle ?? textStyle,
        onTap,
        start: index - (AtText.flag.length - 1),
        showAtBackground: false,
      );
    }
    return null;
  }
}
