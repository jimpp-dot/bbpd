import 'package:shared/shared.dart';

/// @Author bobzhou
/// @Description
/// @Date 2022-05-24 10:42

class ChatHiMatchUser {
  int uid;

  String? icon;

  String? name;

  String? birthday;

  String? distance;

  int matchScore;

  Map? originData;

  ChatHiMatchUser(this.uid, this.icon, this.name, this.birthday, this.distance,
      this.matchScore, this.originData);

  static ChatHiMatchUser? fromJson(Map? map) {
    if (map == null) {
      return null;
    }
    return ChatHiMatchUser(
        Util.parseInt(map['match_uid']),
        Util.parseStr(map['match_icon']),
        Util.parseStr(map['match_name']),
        Util.parseStr(map['birthday']),
        Util.parseStr(map['distance']),
        Util.parseInt(map['match_score']),
        map);
  }
}
