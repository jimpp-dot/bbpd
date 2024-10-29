import 'package:flutter/material.dart';

import '../shared.dart';

// 连击礼物展示混入欢迎动效中，区分类型展示不同的UI
enum WelcomeType {
  Welcome,
  ComboGift,
  OfferPrice,

  /// 守护双人上麦
  DefendJoinMic,

  /// 守护双人进房
  DefendEnterRoom,

  /// 情感私密房牵手
  PrivateRoom,

  /// 拍卖 送欧气 奖励
  AuctionBlessAward,

  /// 心跳速配：选择关系
  HeartRaceChooseRelation,

  /// 心跳速配：第一名变化
  HeartRaceTopChange,
}

/// 进房动效
class WelcomeEffect {
  final String image;
  final Color? fontColor;

  @override
  String toString() {
    return 'WelcomeEffect{image: $image, fontColor: $fontColor}';
  }

  WelcomeEffect(this.image, this.fontColor);

  static WelcomeEffect? fromJson(dynamic data) {
    String? image;
    Color? fontColor;
    if (data is Map) {
      try {
        if (data.containsKey('font_color')) {
          String? color = Util.parseStr(data['font_color']);
          if (color != null && color.isNotEmpty) {
            String colorStr = '0xff${color.substring(1)}';
            fontColor = Color(int.parse(colorStr));
          }
        }
        image = Util.parseStr(data['image']);
      } catch (e) {
        Log.d(e);
      }
    }
    if (image != null) return WelcomeEffect(image, fontColor);
    return null;
  }
}

class Welcome {
  final String? name;
  final int title;
  final int titleNew;
  final int vip;
  final bool iconGray;
  final int top;
  final int topMonth;
  final int topWeek;
  final int hotNum;
  final dynamic mounts;
  final GlobalKey key;
  final bool isNewer;
  final String? icon;
  final String? toName;
  final int? giftId;
  int? hitNum;
  final String? uuid;
  final WelcomeType type;
  final int popularityLevel;
  final WelcomeEffect? effect; // 进房动效
  final bool isNewNoble; //新贵
  final int knightLevel;
  final String? knightName;
  final String? knightTargetName;
  final String? creatorName; //房主名称
  final String? liveLabel; //粉丝牌名
  final bool allMic; //全麦打赏
  final String? hitId; //连击ID
  final String? giftPrice;
  final int fromUid;
  final List<String>? icons;
  final String? micSuffix;
  final String? toIcon;
  final String? enterSuffix;

  /// 是否男性
  final bool isMale;

  /// 是否声音礼物
  final String? voiceUrl;

  Welcome({
    this.name,
    required this.key,
    this.title = 0,
    this.titleNew = 0,
    this.vip = 0,
    this.iconGray = false,
    this.top = 0,
    this.topMonth = 0,
    this.topWeek = 0,
    this.hotNum = 0,
    this.mounts,
    this.isNewer = false,
    this.type = WelcomeType.Welcome,
    this.popularityLevel = 0,
    this.icon,
    this.toName,
    this.giftId = 0,
    this.hitNum = 0,
    this.uuid,
    this.effect,
    this.isNewNoble = false,
    this.knightLevel = 0,
    this.knightName,
    this.knightTargetName,
    this.creatorName,
    this.liveLabel,
    this.allMic = false,
    this.hitId,
    this.giftPrice,
    this.fromUid = 0,
    this.icons,
    this.micSuffix,
    this.toIcon,
    this.enterSuffix,
    this.isMale = false,
    this.voiceUrl,
  });

  static Welcome fromMap(Map extra, bool combo, String creatorName) {
    int title = extra.containsKey('title') ? Util.parseInt(extra['title']) : 0;
    int titleNew =
        extra.containsKey('title_new') ? Util.parseInt(extra['title_new']) : 0;

    return Welcome(
      key: GlobalKey(),
      name: combo ? extra['from'].toString() : extra['name'].toString(),
      fromUid: Util.parseInt(extra['uid']),
      vip: Util.parseInt(extra['vip_new']),
      iconGray: extra['icongray'],
      title: title,
      titleNew: titleNew,
      top: Util.parseInt(extra['top']),
      topMonth: Util.parseInt(extra['top_month']),
      topWeek: Util.parseInt(extra['top_week']),
      hotNum: Util.parseInt(extra['hotNum']),
      mounts: extra.containsKey('mounts') ? extra['mounts'] : null,
      isNewer: Util.parseInt(extra['is_newer']) > 0,
      popularityLevel: Util.parseInt(extra['popularity_level']),
      type: combo ? WelcomeType.ComboGift : WelcomeType.Welcome,
      icon: combo ? extra['icon'] : null,
      toName: combo ? Util.removeUnsupportedCharacters(extra['to']) : null,
      giftId: combo
          ? (extra['gift'] != null ? Util.parseInt(extra['gift']['id']) : null)
          : null,
      hitNum: combo ? Util.parseInt(extra['hit_num']) : null,
      hitId: combo ? Util.parseStr(extra['hit_id']) : null,
      giftPrice: combo
          ? (extra['gift'] != null
              ? Util.parseStr(extra['gift']['price'])
              : null)
          : null,
      uuid: combo ? extra['uuid'] : null,
      effect: WelcomeEffect.fromJson(extra['effect']),
      isNewNoble: extra['new_noble'] != null
          ? Util.parseBool(extra['new_noble'])
          : false,
      knightLevel: Util.parseInt(extra['knight_level']),
      knightName: Util.parseStr(extra['knight_name']),
      knightTargetName: Util.parseStr(extra['knight_target_name']),
      creatorName: creatorName,
      liveLabel: extra['live_label_effect'] ?? '',
      allMic: Util.parseBool(extra['all_mic']),
      icons: Util.parseList(extra['icons'], (e) => Util.parseStr(e) ?? ''),
      voiceUrl: Util.parseStr(extra['voice_url']),
    );
  }

  static Welcome fromOfferPriceMap(Map extra) {
    return Welcome(
      key: GlobalKey(),
      type: WelcomeType.OfferPrice,
      name: extra['from'],
      icon: extra['icon'],
      giftPrice: Util.parseStr(extra['money']),
    );
  }

  bool get isVoiceGift => !Util.isStringEmpty(voiceUrl);

  @override
  String toString() {
    return 'Welcome{name: $name, title: $title, titleNew: $titleNew, vip: $vip, iconGray: $iconGray, top: $top, topMonth: $topMonth, topWeek: $topWeek, hotNum: $hotNum, mounts: $mounts, key: $key,  isNewer: $isNewer, icon: $icon, toName: $toName, giftId: $giftId, hitNum: $hitNum, uuid: $uuid, type: $type, popularityLevel: $popularityLevel, effect: $effect, isNewNoble: $isNewNoble}';
  }
}
