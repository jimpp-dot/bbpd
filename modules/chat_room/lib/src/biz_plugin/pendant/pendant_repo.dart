import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';

class PendantRepo {
  /// 获取插件列表
  static Future<ResRoomPositionPlugin> getPendantList(int rid) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/room/plugin/option',
        pb: true,
        throwOnError: true,
        queryParameters: {'rid': rid.toString()},
      );
      return ResRoomPositionPlugin.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomPositionPlugin(success: false, msg: e.toString());
    }
  }

  /// 抽取奖励
  static Future<ResRoomPositionPluginClick> drawRewards({
    required int rid,
    required int pluginId,
    required int stageId,
    required String clickType,
    required String clickExtra,
  }) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/plugin/click',
        {
          'rid': '$rid',
          'pluginId': '$pluginId',
          'stage_id': '$stageId',
          'click_type': clickType,
          'clickExtra': clickExtra,
        },
        pb: true,
        throwOnError: true,
      );
      return ResRoomPositionPluginClick.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomPositionPluginClick(success: false, msg: e.toString());
    }
  }
}
