import 'package:shared/shared.dart';

import 'talent_models.dart';

class TalentRepo {
  /// info 接口版本号
  static const int _infoVersion = 2;

  /// 才艺房信息
  static Future<DataRsp<BroadcasterInfoResp>> broadcasterInfo(int rid) async {
    String url = '${System.domain}rooms/broadcastercontent/info';
    try {
      XhrResponse response = await Xhr.getJson(url,
          params: {'rid': '$rid', 'version': _infoVersion});
      return DataRsp<BroadcasterInfoResp>.fromXhrResponse(
          response,
          (object) =>
              BroadcasterInfoResp.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<BroadcasterInfoResp>(msg: '$e', success: false);
    }
  }

  /// 节目单列表
  static Future<DataRsp<ProgramListResp>> programList(int rid) async {
    String url = '${System.domain}rooms/broadcastercontent/programList';
    try {
      XhrResponse response = await Xhr.getJson(url, params: {'rid': '$rid'});
      return DataRsp<ProgramListResp>.fromXhrResponse(response,
          (object) => ProgramListResp.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<ProgramListResp>(msg: '$e', success: false);
    }
  }

  static Future<BaseResponse> addProgram(
      {required int rid,
      required int anchorUid,
      String? intro,
      required List<String> contents}) async {
    String url = '${System.domain}rooms/broadcastercontent/addProgram';
    XhrResponse response = await Xhr.postJson(url, {
      'rid': '$rid',
      'anchor_uid': '$anchorUid',
      'intro': intro ?? "",
      'contents': Util.jsonEncode(contents),
    });
    return BaseResponse.parse(response);
  }

  static Future<BaseResponse> editProgram(
      {required int rid,
      required int programId,
      required int anchorUid,
      String? intro,
      required List<String> contents}) async {
    String url = '${System.domain}rooms/broadcastercontent/editProgram';
    XhrResponse response = await Xhr.postJson(url, {
      'rid': '$rid',
      'program_id': '$programId',
      'anchor_uid': '$anchorUid',
      'intro': intro ?? "",
      'contents': Util.jsonEncode(contents),
    });
    return BaseResponse.parse(response);
  }

  static Future<BaseResponse> delProgram(
      {required int rid, required int programId}) async {
    String url = '${System.domain}rooms/broadcastercontent/delProgram';
    XhrResponse response = await Xhr.postJson(url, {
      'rid': '$rid',
      'program_id': '$programId',
    });
    return BaseResponse.parse(response);
  }

  /// 节目单id的json数组
  static Future<BaseResponse> sortProgram(
      {required int rid, required List<int> ids}) async {
    String url = '${System.domain}rooms/broadcastercontent/sortProgram';
    XhrResponse response = await Xhr.postJson(url, {
      'rid': '$rid',
      'ids': Util.jsonEncode(ids),
    });
    return BaseResponse.parse(response);
  }

  /// 才艺房发公屏消息
  static Future<BaseResponse> sendChatMsg({required int rid}) async {
    String url = '${System.domain}rooms/broadcastercontent/sendChatMessage';
    XhrResponse response = await Xhr.postJson(url, {
      'rid': '$rid',
    });
    return BaseResponse.parse(response);
  }

  /// 获取主播基本资料
  static Future<DataRsp<AnchorInfoResp>> anchorInfo(
      {required int anchorUid}) async {
    String url = '${System.domain}rooms/broadcastercontent/anchorInfo';
    try {
      XhrResponse response = await Xhr.getJson(url, params: {
        'anchor_uid': '$anchorUid',
      });
      return DataRsp<AnchorInfoResp>.fromXhrResponse(response,
          (object) => AnchorInfoResp.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<AnchorInfoResp>(msg: '$e', success: false);
    }
  }

  /// 赠送星光值
  static Future<BaseResponse> giveStar({required int programId}) async {
    String url = '${System.domain}rooms/broadcastercontent/giveStar';
    XhrResponse response = await Xhr.postJson(url, {
      'program_id': '$programId',
    });
    return BaseResponse.parse(response);
  }

  /// 获取星光值玩法说明
  static Future<DataRsp<String>> starManual({int? anchorUid}) async {
    String url = '${System.domain}rooms/broadcastercontent/starManual';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<String>.fromXhrResponse(response, (object) {
        if (object is Map) {
          return Util.notNullStr(object["content"]);
        } else {
          return '';
        }
      });
    } catch (e) {
      return DataRsp<String>(msg: '$e', success: false);
    }
  }

  /// 获取当前用户的星光值
  static Future<DataRsp<int>> getStarBg() async {
    String url = '${System.domain}rooms/broadcastercontent/getStarBag';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<int>.fromXhrResponse(response, (object) {
        if (object is Map) {
          return Util.parseInt(object["star_num"]);
        } else {
          return 0;
        }
      });
    } catch (e) {
      return DataRsp<int>(msg: '$e', success: false);
    }
  }

  /// 判断用户是否是3区间内主播
  /// true 为前3后3，可自由上麦，false 不是前3后3，需要排麦
  static Future<DataRsp<bool>> isQueueAnchor(int rid) async {
    String url = '${System.domain}rooms/broadcastercontent/isQueueAnchor';
    try {
      XhrResponse response = await Xhr.getJson(url, params: {'rid': '$rid'});
      return DataRsp<bool>.fromXhrResponse(response, (object) {
        if (object is Map) {
          return Util.parseBool(object["is_queue_anchor"]);
        } else {
          return false;
        }
      });
    } catch (e) {
      return DataRsp<bool>(msg: '$e', success: false);
    }
  }
}
