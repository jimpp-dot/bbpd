import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/assets.dart';

import '../../k.dart';

/// 关注按钮
class FollowButton extends StatelessWidget {
  final bool isFollow;
  final Color? bgColor;
  final Color? textColorFollowed;
  final Color? textColorUnFollow;
  final VoidCallback? onFollowTap;
  final bool supportDark;

  const FollowButton(
      {this.isFollow = false,
      this.onFollowTap,
      this.bgColor,
      this.textColorFollowed,
      this.textColorUnFollow,
      this.supportDark = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    double width = 50;
    double height = 28;

    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: R.colors.translateGradientColors),
          border:
              Border.all(width: 1, color: bgLinearGradientColorBorderColor()),
          borderRadius: BorderRadius.circular(height / 2),
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              isFollow ? K.moment_already_follow : K.moment_attention,
              style: const TextStyle(
                // color: supportDark && darkMode ? R.colors.brightTextColor : R.color.brightTextColor,
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color bgLinearGradientColorBorderColor() {
    return isFollow ? Colors.white : const Color(0xFF9EFF4E);
  }

  List<Color> bgLinearGradientColor() {
    return isFollow
        ? R.colors.translateGradientColors
        : R.colors.translateGradientColors;

    // return isFollow
    //     ? (supportDark && darkMode
    //         ? R.colors.secondBrandGradientColors.map((e) => e.withOpacity(0.6)).toList()
    //         : R.color.secondBrandGradientColors.map((e) => e.withOpacity(0.6)).toList())
    //     : (supportDark && darkMode ? R.colors.mainBrandGradientColors : R.color.mainBrandGradientColors);
  }

  void _onTap() {
    if (onFollowTap != null) {
      onFollowTap!();
    }
  }
}

class Follow2Button extends StatelessWidget {
  final bool isFollow;
  final VoidCallback? onFollowTap;

  const Follow2Button({this.isFollow = false, this.onFollowTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: R.img(
          isFollow
              ? (darkMode
                  ? Assets.ic_topic_square_followed_dark_png
                  : Assets.ic_topic_square_followed_png)
              : (darkMode
                  ? Assets.ic_topic_square_follow_dark_png
                  : Assets.ic_topic_square_follow_png),
          width: 65,
          height: 36,
          package: Assets.package),
    );
  }

  void _onTap() {
    if (onFollowTap != null) {
      onFollowTap!();
    }
  }
}
