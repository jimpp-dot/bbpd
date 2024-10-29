import 'package:shared/shared.dart';
import 'package:chat_room/src/biz_plugin/base/room_plugin_beans.dart';

/// 房间插件管理
mixin RoomPluginControlMixin {
  /// 房间插件数据
  Map<RoomPluginType, RoomPluginItem>? plugins;

  /// 本地累加的值，辅助提示数据发生变化
  int pluginVersionIndex = 0;

  /// 解析房间插件代码
  void parseRoomPlugins(dynamic data) {
    if (data != null && data is List) {
      List<RoomPluginItem>? pluginList;
      try {
        List<RoomPluginItem> list = [];
        for (var e in data) {
          if (e is Map) {
            list.add(RoomPluginItem.fromJson(e));
          }
        }
        pluginList = list.isNotEmpty ? list : null;
        if (pluginList != null) {
          plugins ??= {};
          for (var element in pluginList) {
            plugins![element.type] = element;
          }
          pluginVersionIndex++;
        }
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    }
  }

  /// 是否显示投票插件入口
  bool get showVoteEntrance {
    return pluginItem(RoomPluginType.Vote)?.showPlugin == true;
  }

  /// 是否显示插件入口
  bool canShow(RoomPluginType type) {
    return pluginItem(type)?.showPlugin == true;
  }

  /// 插件玩法是否开启
  bool inUse(RoomPluginType type) {
    return pluginItem(type)?.inUse == true;
  }

  RoomPluginItem? pluginItem(RoomPluginType type) {
    return plugins != null ? plugins![type] : null;
  }
}
