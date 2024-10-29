import 'dart:io';

import 'package:flutter/material.dart';

/// 兼容[TextEditingController]
///
/// 背景：[TextEditingController]在iOS系统存在如下问题：
///
///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/// 比如在iOS系统中，用拼音输入汉字"中国"，当输入到"zhong"，后面"guo"还没输;
///
///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/// 此时，通过[TextEditingController].value.text获取的文本，应该为''，但实际是zhong
///
/// 目标：在[TextField]输入过程中，通过[TextEditingController]获取的文本与[TextField]中一致。
class CompatibleTextEditingController extends TextEditingController {
  CompatibleTextEditingController({super.text});

  /// 有效的文本
  String _validText = '';

  /// 获取有效的文本
  ///
  /// 注意：需要在使用[CompatibleTextEditingController]的[StatefulWidget]或[StatelessWidget]的build(BuildContext)方法使用，才能获取正确的有效文本；
  ///
  /// 若在[TextField]的onChanged回调方法中调用，则获取的文本有问题，因为onChanged被调用时isComposingRangeValid == true。
  String get validText {
    _obtainValidText();
    return _validText;
  }

  @override
  void clear() {
    super.clear();
    _validText = '';
  }

  @override
  set text(String newText) {
    super.text = newText;
    _obtainValidText();
  }

  @override
  set value(TextEditingValue newValue) {
    super.value = newValue;
    _obtainValidText();
  }

  /// 抓取有效文本
  void _obtainValidText() {
    if (Platform.isIOS && value.isComposingRangeValid) {
    } else {
      _validText = value.text;
    }
  }
}
