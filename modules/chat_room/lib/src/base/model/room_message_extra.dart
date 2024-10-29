import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../chat_room.dart';
import '../../protobuf/json_key/generated/system.screen.message.pb.dart';

/// 公屏消息extra
class RoomMessageExtra {
  final int uid;
  final int popularityLevel;

  final int defends;

  final int title;

  final int titleNew;

  final int vipNew;

  final int activityLevel;

  final String activityLevelTitle;

  final int activitySubLevel;

  final bool isNewer;

  final bool iconGray;

  final int position;

  final String beautifulRemark;

  final FansLabelExtra? fansLabel;

  final bool isRecall; // 召回用户
  final int rid; //分享房间的id
  final String icon;
  final String roomName;
  final String acuteIcon;
  final String showName;
  final List<Color> bg;
  final int payLevel;
  final int sevenNew;
  final String tailLight;
  final bool isNewNoble; //新贵
  final bool isGrowUser; // 引流用户
  final int knightLevel;
  final String reflowLabel; // 回流用户标签文本
  final String alarmLabel; // little_alarm, 小闹钟标签
  final String jukeboxLabel; // jukebox, 点唱标签
  final bool consumeLabel; //消费标签
  final bool rechargeLabel; //充值标签
  final int starSinger; // 国庆勋章
  final bool starVerifyTag; // 明星加V
  final int starVerifyTagV1;
  final String nameplate; // 动态铭牌
  final bool showKaTag; // ka标签
  final String awardTitle; // 皮队友七夕专属冠名
  final int awardTitleLv; // 专属冠名动效等级
  final String officialTag; // 私人管家
  final int sevenLoveTag; // 七夕勋章
  final String badgeIconInUse; // 当前穿戴的运营活动勋章
  final String newStarIcon; // 星座拍拍新星标签
  final String appPlatform; // 平台标识
  final DefendLabel? defendLabel; // 连连看羁绊关系用户
  final List<ScreenMessage_Extra_WarpUserBubbleTail> bubbleTails; // 聊天尾灯
  final String ktvLevelUrl; // KTV等级图片地址
  final String achieveIcon; //成就勋章
  final RoomRedPacket? giftRedPacket; // 礼物红包
  final String holdHandIcon; // 我的好哥哥
  final String sendOrderInvite;

  RoomMessageExtra.fromJson(Map extra)
      : uid = Util.parseInt(extra['uid']),
        popularityLevel = Util.parseInt(extra['popularity_level']),
        vipNew = Util.parseInt(extra['vip_new']),
        activityLevel = (extra['viability'] != null && extra['viability'] is Map) ? Util.parseInt(extra['viability']['mlevel']) : 0,
        activityLevelTitle = (extra['viability'] != null && extra['viability'] is Map) ? Util.notNullStr(extra['viability']['title']) : '',
        activitySubLevel = (extra['viability'] != null && extra['viability'] is Map) ? Util.parseInt(extra['viability']['slevel']) : 0,
        position = Util.parseInt(extra['position'], -1),
        defends = Util.parseInt(extra['defends']),
        title = Util.parseInt(extra['title']),
        titleNew = Util.parseInt(extra['title_new']),
        isNewer = Util.parseInt(extra['is_newer']) > 0,
        iconGray = Util.parseBool(extra['icongray']),
        fansLabel = extra.containsKey('fans_label') && extra['fans_label'] != null ? FansLabelExtra.fromJson(extra['fans_label']) : null,
        beautifulRemark = Util.notNullStr(extra['beautiful_remark']),
        isRecall = Util.parseBool(extra['is_recall']),
        rid = Util.parseInt(extra['rid']),
        icon = Util.notNullStr(extra['icon']),
        roomName = Util.notNullStr(extra['room_name']),
        acuteIcon = Util.notNullStr(extra['acute_icon']),
        showName = Util.notNullStr(extra['show_name']),
        bg = Util.parseColors(extra['bg']),
        payLevel = Util.parseInt(extra['pay_level']),
        sevenNew = Util.parseInt(extra['seven_new']),
        tailLight = Util.notNullStr(extra['tail_light']),
        isNewNoble = Util.parseBool(extra['new_noble']),
        isGrowUser = Util.parseInt(extra['is_grow_user']) > 0,
        knightLevel = Util.parseInt(extra['knight_level']),
        reflowLabel = Util.notNullStr(extra['tag_text']),
        alarmLabel = Util.notNullStr(extra['little_alarm']),
        jukeboxLabel = Util.notNullStr(extra['jukebox']),
        consumeLabel = Util.parseBool(extra['consume_label']),
        rechargeLabel = Util.parseBool(extra['recharge_label']),
        starSinger = Util.parseInt(extra['star_singer']),
        starVerifyTag = Util.parseBool(extra['star_verify_tag']),
        starVerifyTagV1 = Util.parseInt(extra['star_verify_tag_v1']),
        nameplate = Util.notNullStr(extra['nameplate']),
        showKaTag = Util.parseBool(extra['ka_white_icon']),
        awardTitle = Util.notNullStr(extra['awardTitle']),
        awardTitleLv = Util.parseInt(extra['awardTitleLv']),
        sevenLoveTag = Util.parseInt(extra['seven_love_tag']),
        officialTag = Util.parseIcon(extra['official_tag']),
        badgeIconInUse = Util.notNullStr(extra['badge_icon_in_use']),
        newStarIcon = Util.notNullStr(extra['new_star_icon']),
        holdHandIcon = Util.notNullStr(extra['hold_hand_icon']),
        sendOrderInvite = Util.notNullStr(extra['send_order_invite']),
        appPlatform = Util.parseIcon(extra['app_platform']),
        defendLabel =
            extra.containsKey('defend_label') && extra['defend_label'] != null ? DefendLabel.fromJson(extra['defend_label']) : null,
        bubbleTails = Util.parseList(extra['bubble_tail'], (e) => toTail(e)),
        ktvLevelUrl = Util.parseIcon(extra['ktv']),
        achieveIcon = Util.notNullStr(extra['achieve_wear_icon']),
        giftRedPacket =
            extra.containsKey('red_packet_v2') && extra['red_packet_v2'] != null ? RoomRedPacket.fromJson(extra['red_packet_v2']) : null;

  static ScreenMessage_Extra_WarpUserBubbleTail toTail(Map data) {
    return ScreenMessage_Extra_WarpUserBubbleTail(cid: data['cid']);
  }

  bool hasFansLabel() {
    return fansLabel != null && !Util.isStringEmpty(fansLabel!.label);
  }

  /// 能否展示小闹钟标签
  bool get isCanShowAlarmLabel => ChatUtil.isCanShowAlarmLabel(alarmLabel);

  /// 能否展示点唱标签
  bool get isCanShowJukeboxLabel => ChatRoomUtil.isCanShowJukeboxLabel(jukeboxLabel);

  /// 能否展示回流用户标签
  bool get isCanShowReflowLabel => (reflowLabel.isNotEmpty == true) && Session.joinBroker;

  bool get showConsumeLabel {
    ChatRoomData? data = ChatRoomData.getInstance();
    if (data == null) return false;
    return consumeLabel && data.isBusiness && (data.isReception || data.isCreator);
  }

  bool get showRechargeLabel {
    ChatRoomData? data = ChatRoomData.getInstance();
    if (data == null) return false;
    return rechargeLabel && data.isBusiness && (data.isReception || data.isCreator);
  }

  @override
  String toString() {
    return 'RoomMessageExtra{uid: $uid, popularityLevel: $popularityLevel, defends: $defends, title: $title, titleNew: $titleNew, vipNew: $vipNew, activityLevel: $activityLevel, activityLevelTitle: $activityLevelTitle, activitySubLevel: $activitySubLevel, isNewer: $isNewer, iconGray: $iconGray, position: $position, beautifulRemark: $beautifulRemark, fansLabel: $fansLabel, isRecall: $isRecall, rid: $rid, icon: $icon, roomName: $roomName, acuteIcon: $acuteIcon, showName: $showName, bg: $bg, payLevel: $payLevel, sevenNew: $sevenNew, tailLight: $tailLight, isNewNoble: $isNewNoble, isGrowUser: $isGrowUser, knightLevel: $knightLevel, reflowLabel: $reflowLabel, alarmLabel: $alarmLabel, jukeboxLabel: $jukeboxLabel, consumeLabel: $consumeLabel, rechargeLabel: $rechargeLabel, starSinger: $starSinger, starVerifyTag: $starVerifyTag, starVerifyTagV1：$starVerifyTagV1, nameplate: $nameplate, showKaTag: $showKaTag, awardTitle: $awardTitle, awardTitleLv: $awardTitleLv, officialTag: $officialTag, sevenLoveTag: $sevenLoveTag, badgeIconInUse: $badgeIconInUse, ktvLevelUrl: $ktvLevelUrl}';
  }
}

class RoomRedPacket {
  final int type; // =1, 两个人
  final String? icon;
  final int giftNum;
  final String? robName;
  final String? robNameColor;
  final String? authorName;
  final String? authorNameColor;
  final String? redName;

  RoomRedPacket.fromJson(Map data)
      : icon = data['icon'] is String ? data['icon'].toString() : null,
        giftNum = Util.parseInt(data['gift_num']),
        type = Util.parseInt(data['type']),
        robName = data['rob_name'] is String ? data['rob_name'].toString() : null,
        robNameColor = data['rob_name_color'] is String ? data['rob_name_color'].toString() : null,
        authorName = data['author_name'] is String ? data['author_name'].toString() : null,
        authorNameColor = data['author_name_color'] is String ? data['author_name_color'].toString() : null,
        redName = data['red_name'] is String ? data['red_name'].toString() : null;

  @override
  String toString() {
    return 'RoomRedPacket{giftNum: $giftNum, type: $type, icon: $icon, robName: $robName, robNameColor: $robNameColor, authorName: $authorName, authorNameColor: $authorNameColor, redName: $redName}';
  }
}

class FansLabelExtra {
  final String? label;
  final int level;

  FansLabelExtra.fromJson(Map data)
      : label = data['label'] is String ? data['label'].toString() : null,
        level = Util.parseInt(data['level']);

  @override
  String toString() {
    return 'FansLabelExtra{label: $label, level: $level}';
  }
}

class DefendLabel {
  final String? name;
  final String? relation;

  DefendLabel.fromJson(Map data)
      : name = data['user_name'] is String ? data['user_name'].toString() : null,
        relation = data['relation'] is String ? data['relation'].toString() : null;

  @override
  String toString() {
    return 'DefendLabel{name: $name, relation: $relation}';
  }
}
