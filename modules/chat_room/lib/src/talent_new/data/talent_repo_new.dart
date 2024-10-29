import 'package:shared/shared.dart';

import '../../protobuf/generated/common_artcenter.pb.dart';

class TalentNewRepo {
  /// 节目单列表
  static Future<ResArtList> programList(int rid, int dateTime) async {
    String url = '${System.domain}go/yy/roomartcenter/artList/';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'rid': '$rid', 'start_time': '$dateTime'});
      return ResArtList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResArtList(success: false, msg: e.toString());
    }
  }

  /// 新增节目单
  static Future<NormalNull> addProgram(int rid,
      {int contentRid = 0,
      int contentUid = 0,
      String contentSign = "",
      String contentDesc = "",
      int startTime = 0,
      int endTime = 0}) async {
    String url = '${System.domain}go/yy/roomartcenter/artAdd/';
    try {
      XhrResponse response = await Xhr.postPb(url, {
        'rid': '$rid',
        'content_rid': '$contentRid',
        'content_uid': '$contentUid',
        'content_uid_sign': contentSign,
        'content_desc': contentDesc,
        'start_time': '$startTime',
        'end_time': '$endTime',
      });
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  static Future<NormalNull> editProgram(int rid, int artId,
      {int contentRid = 0,
      int contentUid = 0,
      String contentSign = "",
      String contentDesc = "",
      int startTime = 0,
      int endTime = 0}) async {
    String url = '${System.domain}go/yy/roomartcenter/artUpdate/';
    Map<String, String> map = <String, String>{};
    map['art_id'] = '$artId';
    map['rid'] = '$rid';
    if (contentRid > 0) map['content_rid'] = '$contentRid';
    if (contentUid > 0) map['content_uid'] = '$contentUid';
    map['content_uid_sign'] = contentSign;
    map['content_desc'] = contentDesc;
    if (startTime > 0) map['start_time'] = '$startTime';
    if (endTime > 0) map['end_time'] = '$endTime';
    try {
      XhrResponse response = await Xhr.postPb(url, map);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  static Future<NormalNull> delProgram(int rid, int artId) async {
    String url = '${System.domain}go/yy/roomartcenter/artDel/';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'rid': '$rid', 'art_id': '$artId'});
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  static Future<NormalNull> copyProgram(
      int rid, int fromTime, int toTime) async {
    String url = '${System.domain}go/yy/roomartcenter/artListCopy/';
    try {
      XhrResponse response = await Xhr.postPb(
          url, {'rid': '$rid', 'from_time': '$fromTime', 'to_time': '$toTime'});
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  static Future<ResArtRoomSearch> searchRid(String rid) async {
    String url = '${System.domain}go/yy/roomartcenter/artRoomSearch/';
    try {
      XhrResponse response = await Xhr.postPb(url, {'rid': rid});
      return ResArtRoomSearch.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResArtRoomSearch(success: false, msg: e.toString());
    }
  }
}
