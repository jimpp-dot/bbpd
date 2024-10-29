/*
 *
 *  Created by yao.qi on 2022/7/14 下午5:55
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/7/14 下午5:55
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';

import '../../../assets.dart';
import '../page/achievement_wall_screen.dart';

/// 直播聊天室内个人信息卡片上的成就墙入口
/// https://doc.weixin.qq.com/doc/w3_Af8A9AZxANkc6G75jF3SVOP7CqtMt?scode=ACkAfQfVAAgZb4jnn0Af8A9AZxANk
class AchievementWallEntryWidget extends StatelessWidget {
  /// 是否显示成就墙入口，默认显示
  final bool showEntry;
  final int roomId;

  /// 被查看用户id
  final int uid;

  const AchievementWallEntryWidget(
      {Key? key,
      required this.uid,
      required this.roomId,
      this.showEntry = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!showEntry) return const SizedBox.shrink();
    return GestureDetector(
      onTap: () {
        Tracker.instance.track(TrackEvent.achievement_click_room_entrance,
            properties: {'uid': uid, 'to_uid': Session.uid, 'room_id': roomId});

        AchievementWallScreen.show(context, uid: uid);
      },
      child: Container(
        width: 75,
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFF1D60DD).withOpacity(0.06),
          border: Border.all(
            color: const Color(0xFF7980F6).withOpacity(0.16),
            width: 0.5,
          ),
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(0),
            bottomStart: Radius.circular(20),
            bottomEnd: Radius.circular(0),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 4),
            R.img(
              Assets
                  .personaldata$achievement_wall_achievement_wall_entry_medal_webp,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 4),
            Text(
              K.personaldata_achievement_wall,
              style: const TextStyle(
                color: Color(0xFF5D4EFF),
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
    );
  }
}
