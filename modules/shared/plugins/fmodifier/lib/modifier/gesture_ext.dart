import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

/// 手势扩展
/// 支持简单常用的一次性手势：
/// + 单击
/// + 双击
/// + 长按
/// behavior 默认为：translucent，即整个手势区域都可以点击，不论其是否透明
extension GestureExt on Widget {
  Widget onTapExt(VoidCallback? callback,
      {Key? key, HitTestBehavior behavior = HitTestBehavior.translucent}) {
    return GestureDetector(
        key: key, onTap: callback, behavior: behavior, child: this);
  }

  Widget onDoubleTapExt(VoidCallback? callback,
      {Key? key, HitTestBehavior behavior = HitTestBehavior.translucent}) {
    return GestureDetector(
        key: key, onDoubleTap: callback, behavior: behavior, child: this);
  }

  Widget onLongPressExt(VoidCallback? callback,
      {Key? key, HitTestBehavior behavior = HitTestBehavior.translucent}) {
    return GestureDetector(
        key: key, onLongPress: callback, behavior: behavior, child: this);
  }
}
