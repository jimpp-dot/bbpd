import 'package:flutter/material.dart';
import 'package:shared/assets.dart';

import '../shared.dart';

/// 选中or非选中 图标
///
class SelectedIcon extends StatelessWidget {
  final bool selected;
  final double size;
  final bool supportDark;

  const SelectedIcon({super.key, this.size = 20, this.selected = true, this.supportDark = false});

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          gradient: LinearGradient(colors: supportDark ? R.colors.mainBrandGradientColors : R.color.mainBrandGradientColors),
        ),
        alignment: AlignmentDirectional.center,
        child: R.img(
          BaseAssets.ic_select_small_svg,
          width: size,
          height: size,
          color: supportDark ? R.colors.brightTextColor : Colors.white,
          package: BaseAssets.package,
        ),
      );
    } else {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          border: Border.all(color: supportDark ? R.colors.thirdTextColor : R.color.dividerColor, width: 2),
        ),
      );
    }
  }
}
