import 'package:shared/shared.dart';

// 消息通知配置
class MsgNotify {
  // 是否展示好友踩房通知
  static const String SHOW_ROOM_NOTIFY = 'show_room_notify';
  // 是否展示粉丝关注提醒
  static const String SHOW_FOLLOW_NOTIFY = 'show_follow_notify';

  static bool getBoolValue(String key) {
    return 'true' == Config.get(key, 'true');
  }

  static bool get showRoomNotify {
    return getBoolValue(SHOW_ROOM_NOTIFY);
  }

  static set showRoomNotify(bool value) {
    String show = 'false';
    if (value) {
      show = 'true';
    }
    Config.set(SHOW_ROOM_NOTIFY, show);
  }

  static bool get showFollowNotify {
    return getBoolValue(SHOW_FOLLOW_NOTIFY);
  }

  static set showFollowNotify(bool value) {
    String show = 'false';
    if (value) {
      show = 'true';
    }
    Config.set(SHOW_FOLLOW_NOTIFY, show);
  }

  static Future<Map?> loadConfig() async {
    try {
      String url = "${System.domain}account/msgSetInfo";
      XhrResponse response = await Xhr.getJson(url);
      if (response.error == null) {
        Map res = response.value();
        if (res['success'] == true &&
            res['data'] != null &&
            res['data'] is Map) {
          Map data = res['data'];
          if (data['close_user_join_room'] != null) {
            if (data['close_user_join_room'] == 1) {
              // 1为关闭通知
              MsgNotify.showRoomNotify = false;
            } else {
              MsgNotify.showRoomNotify = true;
            }
          }

          if (data['close_fans_attention'] != null) {
            if (data['close_fans_attention'] == 1) {
              // 1为关闭通知
              showFollowNotify = false;
            } else {
              showFollowNotify = true;
            }
          }

          return data;
        }
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }

    return null;
  }
}
