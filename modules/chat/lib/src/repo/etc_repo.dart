import 'package:chat/src/model/pbModel/generated/ka_touch.pb.dart';
import 'package:shared/shared.dart';

/// 建联用户池
class ETCRepo {
  /// 获取建联用户池数据
  static Future<ResKaTouchList> getETCUserPoolData(int? tabId) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/yy/katouch/list',
        pb: true,
        throwOnError: true,
        queryParameters: {'tab_id': tabId ?? 0},
      );
      return ResKaTouchList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKaTouchList(success: false, msg: e.toString());
    }
  }

  /// 给建联用户发送消息
  static Future<NormalNull> sendMessageToETCUser(
      String uids, int msgId, int poolId) async {
    try {
      XhrResponse response = await Xhr.postPb(
        '${System.domain}go/yy/katouch/send',
        {
          'uids': uids,
          'content_id': msgId.toString(),
          'pool_id': poolId.toString(),
        },
        throwOnError: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 获取指定日期建联招呼列表数据
  static Future<ResKaTouchStatDaily> getETCHiListDataByDate(String date) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/yy/katouch/statDaily',
        pb: true,
        throwOnError: true,
        queryParameters: {'date': date},
      );
      return ResKaTouchStatDaily.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKaTouchStatDaily(success: false, msg: e.toString());
    }
  }

  /// 获取建联招呼全部历史数据
  static Future<ResKaTouchStatHistory> getETCAllHiHistoryData() async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/yy/katouch/statHistory',
        pb: true,
        throwOnError: true,
      );
      return ResKaTouchStatHistory.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKaTouchStatHistory(success: false, msg: e.toString());
    }
  }
}
