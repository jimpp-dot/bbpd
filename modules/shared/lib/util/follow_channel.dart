import 'package:shared/src/util.dart';

// 关注的时候需要带上channel参数，来实现打招呼来源，目前分为以下几个类别
// 用于显示打招呼来源
class FollowChannel {
  static const ROOM = "room"; //房间

  static const DYNAMIC = "dynamic"; //动态

  static const NEARBY = "nearby"; //附近的人

  static const RANK = "rank"; //排行榜

  static const HI_CHAT_MATCH = 'hi_chat_match';

  static const List<String> DYNAMIC_REFERS = [
    "follow",
    "recommend",
    "net_detail",
    "topic_detail",
    "moment_detail",
    "moment:UserPage"
  ];

  static String getChannel(String refer,
      {List<String> dynamics = DYNAMIC_REFERS}) {
    if (Util.isStringEmpty(refer)) {
      return "";
    }

    String refStr = refer.toLowerCase();

    if (refStr.contains(ROOM)) {
      return ROOM;
    }

    if (refStr.contains(RANK)) {
      return RANK;
    }

    if (refStr.contains(NEARBY)) {
      return NEARBY;
    }

    if (refStr.contains(HI_CHAT_MATCH)) {
      return HI_CHAT_MATCH;
    }

    for (int i = 0; i < dynamics.length; i++) {
      if (refStr.contains(dynamics[i].toLowerCase())) {
        return DYNAMIC;
      }
    }
    return "";
  }
}
