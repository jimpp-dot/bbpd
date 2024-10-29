import 'package:shared/shared.dart';

/// 插件类型
enum RoomPluginType {
  DigitBomb, // 数字炸弹
  Suicide, // 倒霉蛋
  Lucky, // 幸运闯关
  Vote, // 投票
  LayaRichMan, // Laya大富翁
  GrabHat, //抢帽子
  UnSupport, // 不支持的插件类型
}

extension RoomPluginTypeExt on RoomPluginType {}

/// 解析房间插件类型
RoomPluginType _parsePluginType(String? typeStr) {
  if (typeStr == null || typeStr.isEmpty) return RoomPluginType.UnSupport;
  try {
    String current = '${'RoomPluginType'.toLowerCase()}.${typeStr.replaceAll('-', '').toLowerCase()}';
    return RoomPluginType.values.firstWhere((RoomPluginType type) {
      return type.toString().toLowerCase() == current;
    });
  } catch (e) {
    Log.d('room plugin _parsePluginType ${e.toString()} not support');
  }
  return RoomPluginType.UnSupport;
}

/// 插件显示控制item
class RoomPluginItem {
  final RoomPluginType type; // 插件类型
  final bool showPlugin; // 该房间是否支持显示插件
  final bool inUse;

  RoomPluginItem({required this.type, required this.showPlugin, required this.inUse}); // 改房间当前是否有插件正在显示

  factory RoomPluginItem.fromJson(Map map) {
    return RoomPluginItem(
        type: _parsePluginType(Util.parseStr(map['type'])),
        showPlugin: Util.parseBool(map['show_plugin']),
        inUse: Util.parseBool(map['in_use']));
  }

  @override
  String toString() {
    return 'RoomPluginItem type=$type, showPlugin=$showPlugin, inUse=$inUse';
  }
}
