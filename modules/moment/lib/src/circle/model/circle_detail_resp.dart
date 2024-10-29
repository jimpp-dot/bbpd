import 'package:shared/shared.dart';

import 'circle_page_resp.dart';

class CircleDetailData {
  final int id;
  final String? name;
  final String? icon;
  final String? backgroundImageUrl;
  final int userNum;
  int isJoin;
  final List<CircleFriendsActivity> friendList;
  final List<CircleActivity> activityList;
  final List<CircleTab> tabList;

  CircleDetailData(
    this.id,
    this.name,
    this.icon,
    this.backgroundImageUrl,
    this.userNum,
    this.isJoin,
    this.friendList,
    this.activityList,
    this.tabList,
  );

  factory CircleDetailData.fromJson(Map<String, dynamic> json) =>
      CircleDetailData(
        Util.parseInt(json['id']),
        Util.parseStr(json['name']),
        Util.parseStr(json['icon']),
        Util.parseStr(json['bgimg']),
        Util.parseInt(json['user_num']),
        Util.parseInt(json['is_join']),
        Util.parseList(
            json['friends'], (e) => CircleFriendsActivity.fromJson(e)),
        Util.parseList(json['activities'], (e) => CircleActivity.fromJson(e)),
        Util.parseList(json['tabs'], (e) => CircleTab.fromJson(e)),
      );
}

class CircleTab {
  int id;
  String? name;
  int selected;

  CircleTab.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = Util.parseInt(json['id']),
        selected = Util.parseInt(json['selected']);

  get isSelected => selected == 1;
}
