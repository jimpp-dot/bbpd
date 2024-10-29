import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../assets.dart';
import '../../shared.dart';

extension WidgetExt on Widget {
  Widget withCommonBg() {
    return Container(
      height: double.infinity,
      color: R.colors.mainBgColor,
      child: Stack(
        children: [
          Image.asset(
            width: Util.width,
            BaseAssets.shared$normal_main_bg_webp,
            fit: BoxFit.fitWidth,
          ),
          this,
        ],
      ),
    );
  }

  Widget withCommonBgLocalImg(Widget bg) {
    return Container(
      height: double.infinity,
      color: Colors.transparent,
      child: Stack(
        children: [
          bg,
          this,
        ],
      ),
    );
  }

  Widget withCommonBgLocalImgWithTwo(Widget foreBg, Widget backBg) {
    return Container(
      height: double.infinity,
      color: Colors.transparent,
      child: Stack(
        children: [
          backBg,
          foreBg,
          this,
        ],
      ),
    );
  }

  Widget withCommonBgBlack() {
    return Container(height: double.infinity, color: R.colors.homeBgColor, child: this);
  }

  Widget withCommonBgColor(Color bgColor) {
    return Container(height: double.infinity, color: bgColor, child: this);
  }

  Widget withColorFiltered(bool isBlackMast) {
    return ColorFiltered(
      colorFilter: isBlackMast
          ? const ColorFilter.matrix(
              <double>[0.2126, 0.7152, 0.0722, 0, 0, 0.2126, 0.7152, 0.0722, 0, 0, 0.2126, 0.7152, 0.0722, 0, 0, 0, 0, 0, 1, 0],
            )
          : const ColorFilter.mode(Colors.transparent, BlendMode.color),
      child: this,
    );
  }
}

extension TextSpanExt on TextSpan {
  TextSpan directional(TextDirection direction) {
    if ((children?.length ?? 0) <= 1) return this;
    if (direction == TextDirection.rtl) {
      return TextSpan(
        text: text,
        children: children!.reversed.toList(),
        style: style,
        recognizer: recognizer,
        semanticsLabel: semanticsLabel,
      );
    }
    return this;
  }
}

extension RelativeRectExt on RelativeRect {
  RelativeRect directional(TextDirection direction) {
    if (direction == TextDirection.rtl) {
      return RelativeRect.fromLTRB(right, top, left, bottom);
    }
    return this;
  }
}

//TextAlign

/// 用在body最外层
extension HideInputExt on Widget {
  Widget tapHideInput(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: this);
  }
}

extension TextStyleExt on TextStyle {
  TextStyle get safely {
    if (fontFamily?.isEmpty ?? true) {
      return copyWith(fontFamily: Util.fontFamily);
    }
    return this;
  }
}

extension StateExt on State {
  safeRun(VoidCallback callback) {
    if (mounted) {
      callback.call();
    }
  }

  refresh([VoidCallback? fn]) {
    fn ??= (() {});
    final schedulerPhase = SchedulerBinding.instance.schedulerPhase;
    if (schedulerPhase == SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(fn!);
      });
    } else {
      if (mounted) setState(fn);
    }
  }
}
