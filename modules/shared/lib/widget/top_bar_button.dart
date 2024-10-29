import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class NavigatorBack extends StatelessWidget {
  final GestureTapCallback? onTap;
  final double? height;
  final Widget? child;
  final double iconSize;
  final Color? iconColor;

  const NavigatorBack(
      {super.key,
      this.onTap,
      this.iconSize = 24,
      this.height,
      this.child,
      this.iconColor});

  _onBackTaped(BuildContext context) {
    Navigator.maybePop(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => _onBackTaped(context),
      child: Container(
        width: height ?? kToolbarHeight,
        height: height ?? kToolbarHeight,
        alignment: AlignmentDirectional.center,
        child: child ?? _defaultChild(),
      ),
    );
  }

  Widget _defaultChild() {
    return R.img(
      'ic_titlebar_back.svg',
      package: ComponentManager.MANAGER_BASE_CORE,
      width: iconSize,
      height: iconSize,
      color: iconColor ?? R.color.mainTextColor,
    );
  }
}

class NavigatorClose extends StatelessWidget {
  final GestureTapCallback? onTap;
  final double? height;
  final double iconSize;
  final Widget? child;
  final AlignmentDirectional alignment;
  final Color? iconColor;

  const NavigatorClose(
      {super.key,
      this.onTap,
      this.iconSize = 18,
      this.height,
      this.child,
      this.alignment = AlignmentDirectional.center,
      this.iconColor});

  _onBackTaped(BuildContext context) {
    Navigator.maybePop(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => _onBackTaped(context),
      child: Container(
        width: height ?? kToolbarHeight,
        height: height ?? kToolbarHeight,
        alignment: alignment,
        child: child ?? _defaultChild(),
      ),
    );
  }

  Widget _defaultChild() {
    return R.img(
      'titlebar/ic_titlebar_close.svg',
      package: ComponentManager.MANAGER_BASE_CORE,
      width: iconSize,
      height: iconSize,
      color: iconColor ?? R.color.mainTextColor,
    );
  }
}
