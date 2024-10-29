import 'package:shared/shared.dart';

class GamePremadeItem {
  final String? type;
  final String? name;
  final String? icon;
  final bool? isWolfLock;
  final int? span;
  final int? onlineNum;
  final String? bigIcon;
  List<ListTabHeadItem>? tabs = [];
  List<RoomType>? roomList;

  GamePremadeItem({
    this.type,
    this.name,
    this.icon,
    this.isWolfLock,
    this.span,
    this.onlineNum,
    this.bigIcon,
    this.tabs,
  });

  GamePremadeItem.fromJson(Map data)
      : type = data['type'],
        name = data['title'] ?? data['name'],
        icon = data['icon'],
        span = Util.parseInt(data['span'], 2),
        onlineNum = Util.parseInt(data['num'] ?? data['online_num'], 0),
        bigIcon = data['big_icon'] ?? '',
        roomList =
            Util.parseList(data['party_rooms'], (e) => RoomType.fromJson(e)),
        isWolfLock = Util.parseInt(data['is_lock']) > 0 {
    if (data['manito'] != null && data['manito']['games'] != null) {
      List<dynamic> games = data['manito']['games'] ?? [];
      if (games.isNotEmpty) {
        tabs = games.map((_) => ListTabHeadItem.fromJson(_)).toList();
      }
    }
  }

  String? get roomType {
    if (roomList != null && roomList!.isNotEmpty) {
      return roomList![0].roomType;
    }
    return type;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GamePremadeItem &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;

  @override
  String toString() {
    return 'GamePremadeItem{type: $type, name: $name}';
  }
}

class RoomType {
  String roomType;
  String show;
  bool lock;

  RoomType(this.roomType, this.show, this.lock);

  factory RoomType.fromJson(Map<String, dynamic> json) {
    return RoomType(
      Util.parseStr(json['room_type']) ?? '',
      Util.parseStr(json['room_show']) ?? '',
      Util.parseBool(json['room_lock']),
    );
  }
}
