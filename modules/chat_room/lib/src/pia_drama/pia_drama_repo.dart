import 'package:shared/shared.dart';

import '../protobuf/generated/piadrama.pb.dart';

class PiaDramaRepo {
  /// 获取配置礼物列表
  /// type: 1.设置接待费  2.表演费用
  static Future<ResPiaJuBenPayConfig> getGiftConfig({int type = 2}) async {
    String url = '${System.domain}go/yy/piadrama/config';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'type': '$type'}, throwOnError: true);
      return ResPiaJuBenPayConfig.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPiaJuBenPayConfig(success: false, msg: e.toString());
    }
  }

  /// 获取剧本列表
  /// rid: 房间id
  /// uid: 查询单个人的剧本时，待查询人的uid,其他场景可传0
  /// type: 查询类型,1:指定用户的单人本 2:房间的多人本 3:指定用户的单人本+房间的多人本 4:房间所有单人本+房间的多人本
  static Future<ResPiaJuBenList> getJuben(
      {required int rid, required int uid, required int type}) async {
    String url = '${System.domain}go/yy/piadrama/jubenList';
    try {
      XhrResponse response = await Xhr.postPb(
          url,
          {
            'rid': '$rid',
            'uid': '$uid',
            'type': '$type',
          },
          throwOnError: true);
      return ResPiaJuBenList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPiaJuBenList(success: false, msg: e.toString());
    }
  }

  /// 编辑剧本列表
  /// rid: 房间id
  /// operate: 操作 1:新增 2:修改 3:删除
  /// jid: 剧本id,修改和删除时使用
  /// type: 剧本类型 1:单人本(剧本属于麦上gs,其他房间也可以展示)) 2:多人本(房间内一人活多人演绎,剧本属于房间
  /// name: 剧本名
  /// paycreator: 房主收入,格式:{$giftId}:{$giftNum}
  /// payreceptor: 接待收入,目前接待费用和房主费用是相同的，只能设置其中一个，这里为了后面做扩展做预留
  /// paygs: 每个gs收入,格式:{$giftId}:{$giftNum}
  static Future<NormalNull> editJuben({
    required int rid,
    required int operate,
    required int jid,
    required int type,
    required String name,
    required String paycreator,
    required String payreceptor,
    required String paygs,
  }) async {
    String url = '${System.domain}go/yy/piadrama/edit';
    try {
      XhrResponse response = await Xhr.postPb(
          url,
          {
            'rid': '$rid',
            'operate': '$operate',
            'jid': '$jid',
            'type': '$type',
            'name': name,
            'paycreator': paycreator,
            'payreceptor': payreceptor,
            'paygs': paygs,
          },
          throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 房间已点剧本
  static Future<ResPiaOrderList> getordered({required int rid}) async {
    String url = '${System.domain}go/yy/piadrama/ordered';
    try {
      XhrResponse response = await Xhr.postPb(
          url,
          {
            'rid': '$rid',
          },
          throwOnError: true);
      return ResPiaOrderList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPiaOrderList(success: false, msg: e.toString());
    }
  }
}
