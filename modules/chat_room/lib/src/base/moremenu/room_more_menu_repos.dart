import 'package:chat_room/src/protobuf/generated/room_bottom_panel.pb.dart';
import 'package:shared/shared.dart';

class RoomMoreMenuRepos {
  /// 房间更多面板
  static Future<ResRoomPluginPanel> getRoomBottomPanelData(int rid) async {
    XhrResponse response = await Xhr.postPb(
      '${System.domain}go/room/plugin/roomPanel',
      {'rid': '$rid', 'version': '3'},
    );
    try {
      ResRoomPluginPanel config = ResRoomPluginPanel.fromBuffer(response.bodyBytes);
      Log.d('getRoomBottomPanelData:$config');
      return config;
    } catch (e) {
      return ResRoomPluginPanel(success: false, msg: e.toString());
    }
  }
}
