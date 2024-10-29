import 'package:shared/k.dart';
import 'dart:convert';

import '../shared.dart';

class MessageFrom {
  static const List<String> MSG_DYNAMICS = [
    ...FollowChannel.DYNAMIC_REFERS,
    "moment_item_hi"
  ];

  static String getMessageFrom(String extraJson) {
    if (Util.isStringEmpty(extraJson)) {
      return "";
    }

    Map? extra;
    try {
      extra = json.decode(extraJson);
    } catch (e) {
      Log.d(e);
    }

    if (extra == null || extra.isEmpty) {
      return "";
    }

    return getMessageFromByMap(extra);
  }

  static String getMessageFromByMap(Map? extra) {
    if (extra == null || extra.isEmpty) {
      return "";
    }

    String? refer = extra["channel"];

    return getSource(refer);
  }

  static String getSource(String? refer) {
    if (Util.isStringEmpty(refer)) {
      return "";
    }

    String source = FollowChannel.getChannel(refer!, dynamics: MSG_DYNAMICS);
    if (Util.isStringEmpty(source)) {
      return "";
    }

    switch (source) {
      case FollowChannel.ROOM:
        return K.base_msg_source_room;

      case FollowChannel.DYNAMIC:
        return K.base_msg_source_dynamic;

      case FollowChannel.NEARBY:
        return K.base_msg_source_nearby;

      case FollowChannel.RANK:
        return K.base_msg_source_rank;

      case FollowChannel.HI_CHAT_MATCH:
        return K.base_chat_match_online;

      default:
        return "";
    }
  }
}
