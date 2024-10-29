import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';

/// 礼物等级
class GiftMedalWidget extends StatelessWidget {
  final List<GiftQualityMeta>? medalList;

  const GiftMedalWidget({Key? key, this.medalList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];
    if (medalList?.isNotEmpty == true) {
      for (int i = 0; i < min(4, medalList!.length); i++) {
        res.add(_buildGiftMedalItem(getMedalIcon(i), "${medalList![i].num}"));
      }
    }
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: res);
  }

  String getMedalIcon(int index) {
    String icon = Assets.personaldata$gift_wall_gift_ic_pz_webp;
    switch (index) {
      case 0:
        icon = Assets.personaldata$gift_wall_gift_ic_pz_webp;
        break;
      case 1:
        icon = Assets.personaldata$gift_wall_gift_ic_hh_webp;
        break;
      case 2:
        icon = Assets.personaldata$gift_wall_gift_ic_cq_webp;
        break;
      case 3:
        icon = Assets.personaldata$gift_wall_gift_ic_sj_webp;
        break;
    }
    return icon;
  }

  /// 礼物等级
  Widget _buildGiftMedalItem(String img, String name) {
    return Container(
      width: 50.dp,
      height: 20.dp,
      padding: EdgeInsetsDirectional.only(start: 18.dp, end: 0.dp),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(img))),
      child: Text(name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white,
              fontSize: 10.dp,
              fontWeight: FontWeight.w700,
              fontFamily: Util.numFontFamily,
              package: ComponentManager.MANAGER_BASE_CORE)),
    );
  }
}
