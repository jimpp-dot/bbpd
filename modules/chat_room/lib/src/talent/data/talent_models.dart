import 'package:shared/shared.dart';
import 'package:chat_room/src/base/widget/gift_combo/model/combo_banner_model.dart';

/// 主页面的信息
class BroadcasterInfoResp {
  BroadcasterInfo? broadcasterInfo;
  bool hasProgram;
  Banner? banner;
  TalentTheme? theme;
  int chatMsgInterval;
  String bannerV2;
  String rewardStarIcon;

  int rewardStarTotalTime;
  int rewardStarStayTime;

  /// true:任务全部完成，不展示星光值进度
  ///  false:展示进度
  bool rewardStarStayFinish;
  String bannerText;

  /// 对象的更新时间
  int updateTime;

  BroadcasterInfoResp({
    this.broadcasterInfo,
    required this.hasProgram,
    this.banner,
    required this.bannerV2,
    this.theme,
    required this.chatMsgInterval,
    required this.rewardStarTotalTime,
    required this.rewardStarStayTime,
    required this.rewardStarStayFinish,
    required this.rewardStarIcon,
    required this.bannerText,
  }) : updateTime = DateTime.now().millisecondsSinceEpoch;

  String get rewardStarIconUrl => Util.getRemoteImgUrl(rewardStarIcon);

  refreshUpdateTime() {
    updateTime = DateTime.now().millisecondsSinceEpoch;
  }

  factory BroadcasterInfoResp.fromJson(Map<String, dynamic> json) {
    return BroadcasterInfoResp(
      broadcasterInfo: json["broadcaster_info"] is Map
          ? BroadcasterInfo.fromJson(json["broadcaster_info"])
          : null,
      hasProgram: Util.parseBool(json["has_program"]),
      banner: json["banner"] is Map ? Banner.fromJson(json["banner"]) : null,
      bannerV2: Util.notNullStr(json["banner_v2"]),
      theme: json["theme"] is Map ? TalentTheme.fromJson(json["theme"]) : null,
      chatMsgInterval: Util.parseInt(json["chat_message_interval"]),
      rewardStarTotalTime: Util.parseInt(json["reward_star_total_time"]),
      rewardStarStayTime: Util.parseInt(json["reward_star_stay_time"]),
      rewardStarStayFinish:
          Util.parseBool(json["reward_star_stay_finish"], false),
      rewardStarIcon: Util.notNullStr(json["reward_star_icon"]),
      bannerText: Util.notNullStr(json["banner_text"]),
    );
  }
}

class BroadcasterInfo {
  CurrentAnchor? currentAnchor;
  int programId;

  //0未关注 1.已关注 2.好友
  int? follow;
  String rankDesc;
  int starNum;

  BroadcasterInfo({
    this.currentAnchor,
    required this.programId,
    this.follow,
    required this.rankDesc,
    required this.starNum,
  });

  factory BroadcasterInfo.fromJson(Map<String, dynamic> json) {
    return BroadcasterInfo(
      programId: Util.parseInt(json["program_id"]),
      currentAnchor: json["current_anchor"] is Map
          ? CurrentAnchor.fromJson(json["current_anchor"])
          : null,
      follow: Util.parseInt(json["follow"]),
      rankDesc: Util.notNullStr(json["rank_desc"]),
      starNum: Util.parseInt(json["star_num"]),
    );
  }

  /// 解析消息处理，消息部分，follow不准确
  static bool parseMsg(Map<String, dynamic>? json, BroadcasterInfoResp resp) {
    if (json == null) return false;
    resp.bannerText = Util.notNullStr(json["banner_text"]);
    resp.broadcasterInfo = BroadcasterInfo(
      programId: Util.parseInt(json["program_id"]),
      currentAnchor: json["current_anchor"] is Map
          ? CurrentAnchor.fromJson(json["current_anchor"])
          : null,
      rankDesc: Util.notNullStr(json["rank_desc"]),
      starNum: Util.parseInt(json["star_num"]),
    );
    return true;
  }

  @override
  String toString() {
    return 'BroadcasterInfo{currentAnchor: $currentAnchor, programId: $programId, follow: $follow, rankDesc: $rankDesc, starNum: $starNum}';
  }
}

class Banner {
  String icon;
  String text;

  Banner({
    required this.icon,
    required this.text,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      icon: Util.notNullStr(json["icon"]),
      text: Util.notNullStr(json["text"]),
    );
  }
}

/// 主页面当前演奏者的信息
class CurrentAnchor {
  int uid;
  String name;
  String icon;
  int inRid;

  CurrentAnchor({
    required this.uid,
    required this.name,
    required this.icon,
    required this.inRid,
  });

  factory CurrentAnchor.fromJson(Map<String, dynamic> json) {
    return CurrentAnchor(
      uid: Util.parseInt(json["uid"]),
      name: Util.notNullStr(json["name"]),
      icon: Util.notNullStr(json["icon"]),
      inRid: Util.parseInt(json["inRid"]),
    );
  }

  @override
  String toString() {
    return 'CurrentAnchor{uid: $uid, name: $name, icon: $icon}';
  }
}

class TalentTheme {
  String bg;
  String dynamicEffect;

  TalentTheme({
    required this.bg,
    required this.dynamicEffect,
  });

  factory TalentTheme.fromJson(Map<String, dynamic> json) {
    return TalentTheme(
      bg: Util.notNullStr(json["bg"]),
      dynamicEffect: Util.notNullStr(json["dynamic_effect"]),
    );
  }
}

/// 单独过去单个用户的星光信息
class AnchorInfoResp {
  AnchorInfo? anchor;

  AnchorInfoResp({this.anchor});

  factory AnchorInfoResp.fromJson(Map<String, dynamic> json) {
    return AnchorInfoResp(
      anchor:
          json["anchor"] is Map ? AnchorInfo.fromJson(json["anchor"]) : null,
    );
  }
}

class AnchorInfo {
  int uid;
  String name;
  String icon;
  int starNum;

  AnchorInfo({
    required this.uid,
    required this.name,
    required this.icon,
    required this.starNum,
  });

  factory AnchorInfo.fromJson(Map<String, dynamic> json) {
    return AnchorInfo(
      uid: Util.parseInt(json["uid"]),
      name: Util.notNullStr(json["name"]),
      icon: Util.notNullStr(json["icon"]),
      starNum: Util.parseInt(json["star_num"]),
    );
  }
}

class ProgramListResp {
  List<Program> programList;

  ProgramListResp({
    required this.programList,
  });

  factory ProgramListResp.fromJson(Map<String, dynamic> json) {
    return ProgramListResp(
      programList: Util.parseList<Program>(
          json["program_list"], (e) => Program.fromJson(e)),
    );
  }
}

/// 节目单
class Program {
  int id;
  CurrentAnchor? anchor;
  String intro;
  int myVoteNum;
  int starNum;
  List<String> contents;
  int follow;

  Program({
    required this.id,
    this.anchor,
    required this.intro,
    required this.myVoteNum,
    required this.starNum,
    required this.contents,
    required this.follow,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: Util.parseInt(json["id"]),
      anchor:
          json["anchor"] is Map ? CurrentAnchor.fromJson(json["anchor"]) : null,
      intro: Util.notNullStr(json["intro"]),
      myVoteNum: Util.parseInt(json["my_vote_num"]),
      starNum: Util.parseInt(json["star_num"]),
      contents: Util.parseList<String>(json["contents"], (e) => '$e'),
      follow: Util.parseInt(json["follow"]),
    );
  }
}

class ComboStarGift {
  String comboId;
  int uid;
  String name;
  String icon;
  int vipLevel;
  int hitNum;
  String message;
  String giftIcon;

  ComboStarGift({
    required this.comboId,
    required this.uid,
    required this.name,
    required this.icon,
    required this.vipLevel,
    required this.hitNum,
    required this.message,
    required this.giftIcon,
  });

  factory ComboStarGift.fromJson(Map<String, dynamic> json) {
    return ComboStarGift(
      comboId: Util.notNullStr(json["combo_id"]),
      uid: Util.parseInt(json["uid"]),
      name: Util.notNullStr(json["name"]),
      icon: Util.notNullStr(json["icon"]),
      vipLevel: Util.parseInt(json["vip_level"]),
      hitNum: Util.parseInt(json["hit_num"]),
      message: Util.notNullStr(json["message"]),
      giftIcon: Util.notNullStr(json["gift_icon"]),
    );
  }
}

ComboBanner convertComboBanner(ComboStarGift starGift) {
  return ComboBanner(
    comboId: starGift.comboId,
    uid: starGift.uid,
    name: starGift.name,
    icon: starGift.icon,
    vipLevel: starGift.vipLevel,
    hitNum: starGift.hitNum,
    message: starGift.message,
    giftIcon: starGift.giftIcon,
  );
}
