import 'package:shared/shared.dart';

class IconItem {
  String icon;
  String tag;

  IconItem(this.icon, this.tag);
}

enum DiscoveryItemType {
  game_god, // 游戏主播
  joy_room, // 娱乐房
  black_room, // 开黑房
  game_room, // 游戏房
  nearby, // 附近的人
  rank, // 排行榜
  beauty, // 颜值
  activity, // 活动
  radio, // 电台
  moment, // 朋友圈
  teacher, //师徒
  marry, //结婚
}

class DiscoveryItem {
  DiscoveryItemType? type;
  String? image;
  String? title;
  List<IconItem>? icons;
  String? content;
  bool redPoint = false;
  List<TabItem>? tabs;
  int online = 0; // 在线人数
  dynamic extra; // 扩展字段
  List<ListTabHeadItem>? gameTabs;
  String? icon; // 朋友圈未读状态用户头像
  int unreadMsg = 0; // 朋友圈未读消息
}
