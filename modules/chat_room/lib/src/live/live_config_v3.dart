import 'package:shared/shared.dart';
import 'package:chat_room/src/live/live_pk_config_v3.dart';

class LiveConfigV3 {
  bool hasFollow = false;
  String fansLabel = '';
  int onlineNum = 0;
  List<LiveOffMicItem> offMicItems = [];
  int newLabel = 0;
  String challengeMicFrame = ''; // 直播房星级挑战获得的麦位框
  LivePKConfigV3? pkConfigV3;

  LiveConfigV3.fromJson(
      Map<String, dynamic>? json, Map<String, dynamic>? pkJson) {
    if (json == null) {
      hasFollow = false;
      fansLabel = '';
      onlineNum = 0;
      newLabel = 0;
    } else {
      hasFollow = 1 == Util.parseInt(json['is_follow'], 0);
      fansLabel = Util.notNullStr(json['fans_label']);
      onlineNum = Util.parseInt(json['online_num']);
      newLabel = Util.parseInt(json["new_label"]);
      offMicItems = Util.parseList(
          json['offmic_list'], (e) => LiveOffMicItem.fromJson(e));
      challengeMicFrame = Util.notNullStr(json['challenge_mic_frame']);
    }

    if (pkJson == null) {
      pkConfigV3 = null;
    } else {
      pkConfigV3 = LivePKConfigV3.fromJson(pkJson);
    }
  }

  @override
  String toString() {
    return 'LiveConfigV3{hasFollow: $hasFollow, fansLabel: $fansLabel, onlineNum: $onlineNum, newLabel: $newLabel}';
  }
}

/// 麦下用户信息
class LiveOffMicItem {
  int uid;
  String name;
  String icon;

  LiveOffMicItem.fromJson(Map<String, dynamic> json)
      : uid = Util.parseInt(json['uid']),
        name = Util.notNullStr(json['name']),
        icon = Util.notNullStr(json['icon']);
}
