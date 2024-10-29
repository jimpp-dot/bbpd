import 'package:shared/shared.dart';
import 'package:personaldata/src/model/pb/generated/healer.pb.dart';

/// 聊愈师相关Api
class HealerApi {
  /// 聊愈师首页
  static Future<ResHealerIndex> indexList(int cursor, String word) async {
    Map<String, dynamic> params = {
      'pageSize': 20,
      'cursor': cursor,
      'word': word,
    };

    String url = '${System.domain}go/yy/healer/index';
    try {
      XhrResponse response =
          await Xhr.getPb(url, queryParameters: params, throwOnError: true);
      return ResHealerIndex.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHealerIndex(msg: e.toString(), success: false);
    }
  }

  /// 聊愈师 获取当前用户UP卡数据
  static Future<ResHealerCardInfo> userCardInfo() async {
    String url = '${System.domain}go/yy/healer/cardInfo';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      return ResHealerCardInfo.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHealerCardInfo(msg: e.toString(), success: false);
    }
  }

  /// 聊愈师 赠送UP卡
  static Future<NormalNull> sendCard(int receiveUid, int count) async {
    String url = '${System.domain}go/yy/healer/sendUpCard';
    try {
      XhrResponse response = await Xhr.postPb(
          url, {'receive_uid': '$receiveUid', 'count': '$count'},
          throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 聊愈师 历史助力
  /// [type] 0当前助力，1历史助力
  static Future<ResHealerHistory> history(int uid, int type, int page) async {
    Map<String, dynamic> params = {
      'pageSize': 20,
      'page': page,
      'type': type,
      'uid': uid,
    };
    String url = '${System.domain}go/yy/healer/sendHistory';
    try {
      XhrResponse response =
          await Xhr.getPb(url, queryParameters: params, throwOnError: true);
      return ResHealerHistory.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHealerHistory(msg: e.toString(), success: false);
    }
  }
}
