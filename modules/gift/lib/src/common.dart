import 'dart:io';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

/// 现在开箱即有机会获得
Widget buildOpenBoxTips(
    BuildContext context, GiftScene giftScene, String giftImage,
    {String? description}) {
  if (Util.validStr(giftImage)) {
    String tips = K.gift_open_pac_tips([BoxUtil.boxActName]);
    return ScaleAnimationWidget(
      alignment: const Alignment(0.9, 1.0),
      child: Container(
        alignment: AlignmentDirectional.centerEnd,
        padding: const EdgeInsetsDirectional.only(end: 15),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 53,
              padding: const EdgeInsetsDirectional.only(
                  start: 8, end: 8, top: 3, bottom: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    colors: [Color(0XFF665BFF), Color(0XFF7F5BFE)]),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        tips,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: "${System.imageDomain}$giftImage",
                        width: 30,
                        height: 30,
                      ),
                      if (Session.showLucky) const Spacer(),
                      if (Session.showLucky)
                        InkWell(
                          onTap: () {
                            IRankManager? rankManager = ComponentManager
                                .instance
                                .getManager(ComponentManager.MANAGER_RANK);
                            rankManager?.showRank(context, 'lucky');
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                K.lucky_oder,
                                style: const TextStyle(
                                  color: Color(0x99FFFFFF),
                                  fontSize: 12,
                                ),
                              ),
                              const Icon(
                                Icons.navigate_next,
                                size: 16,
                                color: Color(0x99FFFFFF),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        Platform.isIOS
                            ? R.string('special_statement')
                            : K.gift_activity_explain([Util.appName]),
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          // HelpScreen xxx活动说明
                          String url = BoxUtil.getBoxH5();
                          BaseWebviewScreen.show(context, url: url);
                        },
                        child: Text(
                          K.explain,
                          style: TextStyle(
                            fontSize: 9,
                            color: R.color.mainBrandColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              top: 52,
              end: 26,
              child: R.img(BaseAssets.ic_box_tip_arrow_down_webp,
                  width: 18,
                  height: 8,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
          ],
        ),
      ),
    );
  }
  if (Util.validStr(description)) {
    return ScaleAnimationWidget(
      alignment: const Alignment(0.9, 1.0),
      child: Container(
        alignment: AlignmentDirectional.centerEnd,
        padding: const EdgeInsetsDirectional.only(end: 15),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 26,
              padding:
                  const EdgeInsetsDirectional.only(start: 13, end: 13, top: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                gradient: const LinearGradient(colors: [
                  Color(0XFF7D2EE6),
                  Color(0XFFFF6BB3),
                  Color(0XFFE4FE7C)
                ]),
              ),
              child: Text(
                description ?? '',
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            PositionedDirectional(
              bottom: -7,
              end: 26,
              child: R.img(BaseAssets.ic_box_tip_arrow_down_webp,
                  width: 18,
                  height: 8,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
          ],
        ),
      ),
    );
  }
  return const SizedBox.shrink();
}
