import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 过滤多余快速点击控件
class QuickTapFilterWidget extends StatefulWidget {
  /// 冷却时间：单位ms
  final int cd;
  final Widget child;
  final GestureTapCallback onTap;
  final HitTestBehavior behavior;
  final String? tips;

  const QuickTapFilterWidget({
    super.key,
    required this.child,
    required this.onTap,
    this.cd = 800,
    this.behavior = HitTestBehavior.translucent,
    this.tips,
  });

  @override
  State<QuickTapFilterWidget> createState() => _QuickTapFilterWidgetState();
}

class _QuickTapFilterWidgetState extends State<QuickTapFilterWidget> {
  /// 上次点击时间
  int _lastTapTime = 0;

  int get _now => DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      behavior: widget.behavior,
      child: widget.child,
    );
  }

  void _onTap() {
    if (_now - _lastTapTime < widget.cd) {
      // 点击间隔时间小于冷却时间
      if (Util.validStr(widget.tips)) {
        Fluttertoast.showCenter(msg: widget.tips);
      }
      return;
    }
    // 更新点击时间
    _lastTapTime = _now;
    widget.onTap.call();
  }
}
