import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/biz_plugin/base/room_plugin_beans.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:flutter/material.dart';

mixin RoomGamePluginMixin<T extends StatefulWidget> on State<T> {
  bool _richManInUse = false; // 大富翁玩法是否开启
  RoomPluginType? _curType;

  ChatRoomData? get room => ChatRoomData.getInstance();

  @override
  void initState() {
    super.initState();

    _richManInUse = room!.inUse(RoomPluginType.LayaRichMan);
    room!
        .addListener(UIRefresh.UI_Room_Plugins_Refresh, _handlePluginChangeMsg);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_richManInUse) showGamePanel(RoomPluginType.LayaRichMan);
    });
  }

  bool get canShow => canShowRichMan;

  bool get canShowRichMan =>
      _richManInUse && _curType == RoomPluginType.LayaRichMan;

  RoomPluginType? get curGameType => _curType;

  void closeGamePanel() {
    _curType = null;
    if (mounted) setState(() {});
  }

  void showGamePanel(RoomPluginType type) {
    _curType = type;
    if (type == RoomPluginType.LayaRichMan) _richManInUse = true;

    if (mounted) setState(() {});
  }

  void _handlePluginChangeMsg(String type, dynamic data) {
    _refreshRichMan();
  }

  void _refreshRichMan() {
    bool inUse = room!.inUse(RoomPluginType.LayaRichMan);
    if (inUse != _richManInUse) {
      _richManInUse = inUse;
      if (inUse) {
        showGamePanel(RoomPluginType.LayaRichMan);
      } else {
        closeGamePanel();
      }
      if (mounted) setState(() {});
    }
  }

  @override
  void dispose() {
    room?.removeListener(
        UIRefresh.UI_Room_Plugins_Refresh, _handlePluginChangeMsg);
    super.dispose();
  }
}
