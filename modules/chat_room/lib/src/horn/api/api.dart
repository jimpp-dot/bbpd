import 'package:shared/shared.dart';

import '../../protobuf/generated/horn.pb.dart';

class Api {
  /// 获取喇叭配置信息
  static Future<HornConfigV2Res> getConfig() async {
    String url = '${System.domain}go/yy/horn/configV2';
    Map<String, String> params = {};
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return HornConfigV2Res.fromBuffer(response.bodyBytes);
    } catch (e) {
      return HornConfigV2Res(msg: e.toString(), success: false);
    }
  }

  /// 提交小喇叭
  static Future<HornCommitRes> commit(
      int cid, int ucid, String content, int price,
      {String? id}) async {
    String url = '${System.domain}go/yy/horn/commit';
    Map<String, String> params = {
      'cid': '$cid',
      'ucid': '$ucid',
      'content': content,
      'price': '$price',
      'id': id ?? ''
    };
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return HornCommitRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      return HornCommitRes(msg: e.toString(), success: false);
    }
  }

  /// 发送小喇叭
  static Future<HornSendRes> send(int id, int rid) async {
    String url = '${System.domain}go/yy/horn/send';
    Map<String, String> params = {"id": "$id", "rid": "$rid"};
    try {
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return HornSendRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      return HornSendRes(msg: e.toString(), success: false);
    }
  }

  /// 小喇叭列表
  static Future<HornListRes> getList(int state, int lastId) async {
    String url = '${System.domain}go/yy/horn/list?v=2&state=$state&lid=$lastId';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      return HornListRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      return HornListRes(msg: e.toString(), success: false);
    }
  }

  /// 广场列表
  static Future<HornSquareRes> squareList() async {
    String url = '${System.domain}go/yy/horn/square';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      return HornSquareRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      return HornSquareRes(msg: e.toString(), success: false);
    }
  }
}
