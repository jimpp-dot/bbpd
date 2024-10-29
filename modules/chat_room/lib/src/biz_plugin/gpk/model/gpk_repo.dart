import 'package:shared/shared.dart';
import 'gpk_model.dart';

class GPKRepo {
  /// 获取分组pk创建页面的初始数据
  static Future<GPKConfigResp> getPkConfig(int rid, int uid) async {
    String url = '${System.domain}roomgrouppk/getpkconfig';
    XhrResponse resp = await Xhr.postJson(
      url,
      {'rid': '$rid', 'uid': '$uid', 'version': '1'},
    );

    if (resp.error == null && resp.response != null) {
      Map res = resp.value();
      return GPKConfigResp.fromJson(res as Map<String, dynamic>);
    } else {
      return GPKConfigResp(success: false, msg: resp.error?.toString());
    }
  }

  /// 设置分组PK项
  static Future<DataRsp> setPkConfig(
      {required int rid,
      required int uid,
      required List<int> leftUser,
      required List<int> rightUser,
      required int pkRule,
      required int coinValid,
      required int pkTime,
      int? punishId,
      String? punishName}) async {
    String url = '${System.domain}roomgrouppk/setpkconfig';

    final Map<String, String> params = {
      'version': '1',
      'rid': '$rid',
      'uid': '$uid',
      'left_user': leftUser.toString(),
      'right_user': rightUser.toString(),
      'pk_rule': '$pkRule',
      'coin_valid': '$coinValid',
      'pk_time': '$pkTime',
      'punish_id': '$punishId',
      'punish_name': '$punishName'
    };

    XhrResponse response = await Xhr.postJson(url, params);
    DataRsp rsp = DataRsp.fromXhrResponse(response, (json) => json);
    return rsp;
  }

  /// 开始分组pk
  static Future<BaseResponse> startPk(int rid, int uid) async {
    String url = '${System.domain}roomgrouppk/startpk';
    XhrResponse resp = await Xhr.postJson(
      url,
      {'rid': '$rid', 'uid': '$uid'},
    );
    return BaseResponse.parse(resp);
  }

  /// 提前结束房间分组pk
  static Future<BaseResponse> endPk(int rid, int uid) async {
    String url = '${System.domain}roomgrouppk/endpk';
    XhrResponse resp = await Xhr.postJson(
      url,
      {'rid': '$rid', 'uid': '$uid'},
    );
    return BaseResponse.parse(resp);
  }

  /// 分组pk提前结束惩罚
  static Future<BaseResponse> endPunish(int rid, int uid) async {
    String url = '${System.domain}roomgrouppk/endpunish';
    XhrResponse resp = await Xhr.postJson(
      url,
      {'rid': '$rid', 'uid': '$uid'},
    );
    return BaseResponse.parse(resp);
  }

  /// 房间分组pk投票
  /// [uid] 当前投票的用户
  /// [voteUid]给哪位用户投票
  static Future<BaseResponse> vote(int rid, int uid, int voteUid) async {
    String url = '${System.domain}roomgrouppk/vote';
    XhrResponse resp = await Xhr.postJson(
      url,
      {'rid': '$rid', 'uid': '$uid', 'vote_uid': '$voteUid'},
    );
    return BaseResponse.parse(resp);
  }

  /// 延时结束房间分组pk
  /// [delayTime] 延时时间，最短10秒，最长10分钟
  static Future<BaseResponse> delayPk(int rid, int uid, int delayTime) async {
    String url = '${System.domain}roomgrouppk/delaypk';
    XhrResponse resp = await Xhr.postJson(
      url,
      {'rid': '$rid', 'uid': '$uid', 'delay_time': '$delayTime'},
    );
    return BaseResponse.parse(resp);
  }

  /// 拉取团战结果
  static Future<DataRsp<GPKResultData>> result(int rid) async {
    String url = '${System.domain}roomgrouppk/result';
    XhrResponse resp = await Xhr.postJson(
      url,
      {'rid': '$rid'},
    );
    return DataRsp<GPKResultData>.fromXhrResponse(
        resp, (json) => GPKResultData.fromJson(json as Map<String, dynamic>));
  }
}
