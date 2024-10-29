import 'dart:core';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

import '../../../assets.dart';

class LightStarWidget extends StatelessWidget {
  final int totalNum;
  final int lightNum;
  final double size;
  final int targetUid;
  final bool fromGiftDetailDialog;
  const LightStarWidget(
      {Key? key,
      this.totalNum = 0,
      this.lightNum = 0,
      this.size = 0,
      this.targetUid = 0,
      this.fromGiftDetailDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget starLight = R.img(Assets.personaldata$gift_wall_star_light_webp,
        width: size,
        height: size,
        fit: BoxFit.contain,
        package: ComponentManager.MANAGER_PERSONALDATA);
    Widget starDark = R.img(Assets.personaldata$gift_wall_star_dark_webp,
        width: size,
        height: size,
        fit: BoxFit.contain,
        package: ComponentManager.MANAGER_PERSONALDATA);
    List<Widget> stars = [];
    if (targetUid == Session.uid || (fromGiftDetailDialog ?? false)) {
      for (int i = 0; i < totalNum; i++) {
        if (i < lightNum) {
          stars.add(starLight);
        } else {
          stars.add(starDark);
        }
      }
    } else {
      if (lightNum < 1) {
        return SizedBox(
          height: 15.dp,
        );
      }
      for (int i = 0; i < lightNum; i++) {
        stars.add(starLight);
      }
    }

    return Row(
      mainAxisAlignment: targetUid == Session.uid
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      children: stars,
    );
  }
}
