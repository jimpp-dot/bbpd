import 'package:shared/shared.dart';

import '../models/generated/common_title_skills.pb.dart';
import '../models/generated/room_general_setting.pb.dart';

class RoomGeneralSettingRepository {
  //  房间通用设置接口
  static Future<ResRoomGeneralSetting> roomGeneralSetting({int rid = 0}) async {
    try {
      XhrResponse response = await Xhr.get(
        'go/yy/room/generalSetting?rid=$rid&version=1',
        pb: true,
      );
      return ResRoomGeneralSetting.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomGeneralSetting(success: false, msg: e.toString());
    }
  }

  //  房间禁言接口
  //  传参   uid   被禁言用户id
  //        rid   房间id
  static Future<NormalNull> roomUserMute({int uid = 0, int rid = 0}) async {
    try {
      XhrResponse response = await Xhr.post(
        'go/yy/title/roomUserMute',
        {'uid': uid.toString(), 'rid': rid.toString()},
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  //  置顶房间接口
  //  POST  /go/yy/title/setRoomTop
  //  传参   rid   房间id
  static Future<NormalNull> setRoomTop({int rid = 0}) async {
    try {
      XhrResponse response = await Xhr.post(
        'go/yy/title/setRoomTop',
        {'rid': rid.toString()},
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  //  技能列表接口
  //  GET  /go/yy/title/skills
  //  传参  rid   房间id
  //  uid   被操作人的id
  static Future<ResTitleRoomSkill> skills({int uid = 0, int rid = 0}) async {
    try {
      XhrResponse response = await Xhr.get(
        'go/yy/title/skills?uid=$uid&rid=$rid',
        pb: true,
      );
      return ResTitleRoomSkill.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResTitleRoomSkill(success: false, msg: e.toString());
    }
  }
}
