import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../assets.dart';

class CheckBoxChecked extends StatelessWidget {
  final double width;
  final double height;
  final Decoration? decoration;
  final Color? backgroundColor;
  final Color? color;
  final bool suppDark;

  const CheckBoxChecked(
      {super.key,
      this.width = 16,
      this.height = 16,
      this.decoration,
      this.color,
      this.backgroundColor,
      this.suppDark = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration ??
          BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor ??
                  (suppDark
                      ? R.colors.mainBrandColor
                      : R.color.mainBrandColor)),
      alignment: Alignment.center,
      child: R.img(
        BaseAssets.shared$icon_checkbox_selected_svg,
        width: width,
        height: height,
        fit: BoxFit.cover,
        package: ComponentManager.MANAGER_BASE_CORE,
        color: color ?? Colors.white,
      ),
    );
  }
}

class CheckBoxUnchecked extends StatelessWidget {
  final double width;
  final double height;
  final double borderWidth;
  final Color? color;
  final bool suppDark;

  const CheckBoxUnchecked(
      {super.key,
      this.width = 16,
      this.height = 16,
      this.color,
      this.suppDark = false,
      this.borderWidth = 2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: color ??
                (suppDark ? R.colors.thirdTextColor : R.color.thirdTextColor),
            width: borderWidth),
      ),
    );
  }
}
