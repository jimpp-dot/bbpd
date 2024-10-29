import 'package:flutter/material.dart';

/// 对话框展示动画
class DialogTransition {
  /// 缩放展示对话框
  static Future<T?> scaleShow<T>(
      {required BuildContext context,
      bool barrierDismissible = true,
      required WidgetBuilder builder,
      Duration duration = const Duration(milliseconds: 150)}) {
    final ThemeData theme = Theme.of(context);
    return showGeneralDialog<T>(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: const Color(0x99000000),
      transitionDuration: duration,
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          ),
          child: ScaleTransition(
            scale: animation.drive(Tween(begin: 0.9, end: 1.0)),
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
    );
  }
}
