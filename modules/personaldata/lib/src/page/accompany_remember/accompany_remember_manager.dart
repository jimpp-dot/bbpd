/*
 *
 *  Created by yao.qi on 2022/7/22 下午5:00
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/7/22 下午5:00
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/room_user_profile/widget/room_user_profile_style.dart';

import 'accompany_remember_individual_card_caller_widget.dart';
import 'accompany_remember_individual_card_oneself_widget.dart';
import 'accompany_remember_room_card_caller_widget.dart';
import 'accompany_remember_room_card_oneself_widget.dart';
import 'package:personaldata/k.dart';

/// 陪伴记管理
class AccompanyRememberManager {
  /// 直播信息资料卡显示的陪伴记视图
  static Widget getAccompanyRememberItemToRoomInfoCard(
      int uid, HomeProfileImprint imprint) {
    // if (uid != Session.uid && imprint.hasOur()) {
    //   /// 我查看别人的---我们的足迹
    //   return RoomUserProfileInfoContainer(
    //       title: K.personaldata_accompany_remember, child: AccompanyRememberRoomCardCallerWidget(uid, imprint.our));
    // }
    if (uid == Session.uid && imprint.users.isNotEmpty) {
      /// 我查看自己的---用户列表
      return RoomUserProfileInfoContainer(
          title: K.personaldata_accompany_remember,
          child: AccompanyRememberRoomCardOneselfWidget(uid, imprint.users));
    }

    return const SizedBox.shrink();
  }

  /// 个人主页信息资料卡显示的陪伴记视图
  static Widget getAccompanyRememberItemToIndividualInfoCard(
      int uid, HomeProfileImprint imprint) {
    // if (uid != Session.uid && imprint.hasOur()) {
    //   /// 我查看别人的---我们的足迹
    //   return AccompanyRememberIndividualCardCallerWidget(uid, imprint.our);
    // }
    if (uid == Session.uid && imprint.users.isNotEmpty) {
      /// 我查看自己的---用户列表
      return AccompanyRememberIndividualCardOneselfWidget(uid, imprint.users);
    }

    return const SizedBox.shrink();
  }
}
