import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class ChatMsgUtil {
  static Size getImageMsgSize(String? jsonExtra,
      {double defaultW = 120.0, defaultH = 120.0}) {
    if (Util.isStringEmpty(jsonExtra)) {
      return Size(defaultW, defaultH);
    }

    Map? extra;
    try {
      extra = json.decode(jsonExtra!);
    } catch (e) {
      Log.d("getImageMsgSize parse jsonExtra error!");
    }

    if (extra == null || extra.isEmpty) {
      return Size(defaultW, defaultH);
    }

    double width = 0.0;
    double height = 0.0;
    if (extra.containsKey("w")) {
      width = Util.parseInt(extra["w"]).toDouble();
    } else if (extra.containsKey("width")) {
      width = Util.parseInt(extra["width"]).toDouble();
    }

    if (extra.containsKey("h")) {
      height = Util.parseInt(extra["h"]).toDouble();
    } else if (extra.containsKey("height")) {
      height = Util.parseInt(extra["height"]).toDouble();
    }

    if (width <= 0) {
      width = defaultW;
    }

    if (height <= 0) {
      height = defaultH;
    }
    return Size(width, height);
  }

  /// 是否为1对1个人私聊
  static bool is1V1(int targetId) {
    /// 系统账号，不显示
    if (ChatUtil.isSystemUser(targetId)) return false;

    /// 专属客服，不显示
    if (ChatUtil.isVipCustomerService(targetId)) return false;

    /// 在线客服，不显示
    if (ChatUtil.isCustomerService(targetId)) return false;
    return true;
  }

  static String getHiChatMatchDesc(String birthday, String distance) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    String? astro = manager.getConstellationByBirthday(birthday);
    String? ageDecade = manager.getAgeDecadeByBirthday(birthday);

    String? desc = astro;

    if (!Util.isStringEmpty(ageDecade)) {
      if (!Util.isStringEmpty(desc)) {
        desc = '$desc · $ageDecade';
      } else {
        desc = ageDecade;
      }
    }

    if (!Util.isStringEmpty(distance)) {
      if (!Util.isStringEmpty(desc)) {
        desc = '$desc · $distance';
      } else {
        desc = distance;
      }
    }
    return desc;
  }
}
