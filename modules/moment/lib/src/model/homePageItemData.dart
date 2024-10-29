// ignore_for_file: constant_identifier_names

import 'package:shared/shared.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/model/activity_bean.dart';

class HomePageItemData {
  bool exposured = false;
  // 每个数据源后的padding不一致，所以这里放到数据源里控制
  double bottomPadding = 12;

  HomePageItemType type = HomePageItemType.Unknown;
  Moment? circleItemData;
  RoomItemData? roomItemData;
  ChatMatchItem? friendCardItemData;
  ActivityBean? activityBean;

  String? _type;

  List<RecTag>? topics; // 热搜话题

  int exposureId = 0;
  String? exposureType;

  int _uniqueId = 0;

  HomePageItemData();

  HomePageItemData.fromJson(Map<String, dynamic> json) {
    exposured = false;
    _type = json['type'];
    type = _getType(json['type']);

    Map? info = json['info'];
    assert(info != null);
    if (type == HomePageItemType.Circle) {
      circleItemData = Moment.fromJson(info as Map<String, dynamic>);
      exposureId = circleItemData!.uid;
      _uniqueId = circleItemData!.topicId;
      exposureType = circleItemData!.flowType;
    } else if (type == HomePageItemType.Room) {
      roomItemData = RoomItemData.fromJson(info as Map<String, dynamic>);
      exposureId = roomItemData!.uid;
      _uniqueId = roomItemData!.rid;
      exposureType = 'room';
    } else if (HomePageItemType.Activity == type) {
      activityBean = ActivityBean.fromJson(info as Map<String, dynamic>);
      exposureId = activityBean!.id;
      exposureType = 'topic';
      _uniqueId = activityBean!.id;
    } else {
      Log.d('not support type');
    }
  }

  HomePageItemType _getType(String? type) {
    if (type == 'room') {
      return HomePageItemType.Room;
    } else if (type == 'circle') {
      return HomePageItemType.Circle;
    } else if (type == 'activity') {
      return HomePageItemType.Activity;
    }

    return HomePageItemType.Unknown;
  }

  String get itemType => _type ?? '';

  String get exposureKey {
    return '${itemType}_$_uniqueId';
  }
}

/// 首页展示数据类型
enum HomePageItemType {
  Unknown,
  RecommendTopics, // 顶部推荐话题
  Circle, // 动态
  Room, // 房间
  Activity, // 运营活动
  HotTopic, // 热门话题
  banner, // banner
}

/// 房间类型
enum RoomItemType {
  Unknown,
  Game, // 游戏房为game
  Desktop, // 桌游
  Joy, // 娱乐房为joy
}

class RoomItemData {
  RoomItemType roomItemType = RoomItemType.Unknown;
  int rid = 0;
  String? desc;
  String? name;
  String? icon;
  String? firstTag;

  List<String> icons = [];
  int sex = 0;
  int age = 0;
  String? username;
  String? conditions;
  int numOfPeople = 0;
  int uid = 0;

  int isFollow = 0;

  RoomItemData.fromJson(Map<String, dynamic> json) {
    roomItemType = _getType(json['type']);
    rid = Util.parseInt(json['rid']);
    desc = json['desc'] ?? '';
    name = json['name'];
    icon = json['icon'];
    firstTag = json['firstTag'];
    List iconList = json['icons'];
    for (var icon in iconList) {
      icons.add(icon);
    }
    sex = Util.parseInt(json['sex']);
    age = Util.parseInt(json['age']);
    username = json['username'];
    uid = json['uid'];
    conditions = json['conditions'];
    numOfPeople = Util.parseInt(json['num']);
    isFollow = Util.parseInt(json['isfollow']);
  }

  RoomItemType _getType(String? type) {
    if (type == 'game') {
      return RoomItemType.Game;
    } else if (type == 'joy') {
      return RoomItemType.Joy;
    } else if (type == 'desktop') {
      return RoomItemType.Desktop;
    }

    return RoomItemType.Unknown;
  }

  Sex get userSex {
    if (sex == 1) {
      return Sex.Male;
    } else if (sex == 2) {
      return Sex.Female;
    } else {
      return Sex.Female;
    }
  }

  bool isGameRoom() {
    return roomItemType == RoomItemType.Game;
  }
}
