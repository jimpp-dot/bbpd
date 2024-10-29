import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/plugin_base.pb.dart';

class RoomGameApi {
  /// laya插件玩法开启/关闭接口
  /// rid：房间ID
  /// type：插件类型
  /// op：操作类型1开启，0关闭
  static Future<ResPluginOperate> pluginOp({
    required int rid,
    required String type,
    required int op,
  }) async {
    try {
      String url = '${System.domain}go/room/plugin/op';
      Map<String, String> queryParameters = {
        'rid': '$rid',
        'type': type,
        'op': '$op',
      };
      XhrResponse response = await Xhr.get(url,
          queryParameters: queryParameters, pb: true, throwOnError: true);
      return ResPluginOperate.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResPluginOperate(msg: e.toString(), success: false);
    }
  }
}
