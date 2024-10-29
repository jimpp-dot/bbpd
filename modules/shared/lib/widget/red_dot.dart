import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 展示红色圆点或者未读消息红点提醒
class RedDot extends StatelessWidget {
  final int? num;
  final double width;
  final double height;
  final bool showBorder;
  final BorderRadius? borderRadius;
  final bool showPlus;
  final Color? bgColor;
  final Color? textColor;

  const RedDot({
    super.key,
    this.num,
    this.width = 20,
    this.height = 20,
    this.showBorder = true,
    this.borderRadius,
    this.showPlus = false,
    this.bgColor,
    this.textColor,
  }) : assert(height > 0);

  @override
  Widget build(BuildContext context) {
    if (num == null) {
      // 显示圆点
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle,
          border: showBorder
              ? Border.all(color: R.color.mainBgColor, width: 2)
              : null,
          borderRadius: borderRadius,
        ),
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor ?? R.color.thirdBrightColor,
          ),
        ),
      );
    } else if (num! <= 0) {
      // 什么也不展示
      return const SizedBox.shrink();
    } else if ((num! > 0 && num! < 10)) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle,
          border: showBorder
              ? Border.all(color: R.color.mainBgColor, width: 2)
              : null,
        ),
        alignment: Alignment.center,
        child: Container(
          width: width - 4,
          height: height - 4,
          decoration: BoxDecoration(
            shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle,
            color: bgColor ?? R.color.thirdBrightColor,
            borderRadius: borderRadius,
          ),
          alignment: Alignment.center,
          child: NumText(
            num! > 99 ? "99+" : (showPlus ? '+$num' : num.toString()),
            softWrap: false,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 10,
              height: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: width,
        constraints: BoxConstraints(minWidth: width),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2.0),
          color: showBorder ? R.color.mainBgColor : Colors.transparent,
        ),
        padding: const EdgeInsets.all(2),
        alignment: Alignment.center,
        child: Container(
          height: height - 4,
          constraints: BoxConstraints(minWidth: width - 4),
          padding: EdgeInsets.symmetric(horizontal: num! >= 10 ? 4 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((height - 4) / 2.0),
            color: bgColor ?? R.color.thirdBrightColor,
          ),
          alignment: Alignment.center,
          child: NumText(
            num! > 99 ? "99+" : num.toString(),
            softWrap: false,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
  }
}
