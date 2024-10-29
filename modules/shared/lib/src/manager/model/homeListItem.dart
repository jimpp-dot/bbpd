import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class ListItem {
  String icon;
  String name;
  String nick;
  int role;
  bool online;
  int inRoom; // rid
  int uid;
  int cCid;
  String cName;
  int cPrice;
  int cNum;
  int sex;
  int title;
  int onlineStatus;
  String type;
  String sign;
  String city;
  String position;
  String online_dateline_diff;
  bool isInterests;
  int pid;
  bool exposured;
  String room_tag_new;
  List<Color> room_tag_bg = [];
  String tagName;
  bool follow;
  String audio;
  int age;
  int distance; // 距离，单位m
  bool isBShowType = false;
  List<Photo>? photos;
  int? clickPhotoIndex; // 首页点击第几个海报图
  String roomProperty;
  int popularityLevel; //人气等级
  String mark;
  bool isBiz; // 是否是插入的商业房
  String typeName; //标签
  String roomFactoryType; //模板
  String settlementChannel; //结算频道

  ListItem.fromJson(Map data)
      : icon = data['icon'].toString(),
        type = data['type'] ?? '',
        nick = data['_nick'] ?? '',
        sign = data['sign'] ?? '',
        isInterests = Util.parseInt(data['_isinterest']) > 0,
        online_dateline_diff = data['online_diff'] ?? '',
        city = data['city'] ?? '',
        position = data['position'] ?? '',
        name = data['name'].toString(),
        cName = data['_name'] == null ? '' : data['_name'].toString(),
        role = Util.parseInt((data['role'] ?? '0')),
        sex = Util.parseInt((data['sex'] ?? '0')),
        onlineStatus = Util.parseInt((data['online_status'] ?? '0')),
        inRoom = Util.parseInt(data['in_room']),
        uid = Util.parseInt(data['uid']),
        cCid = data['_cid'] != null ? Util.parseInt(data['_cid']) : 0,
        cPrice = Util.parseInt(data['_price']),
        cNum = data['_num'] != null ? Util.parseInt(data['_num']) : 0,
        title = Util.parseInt(data['title']),
        online = Util.parseInt(data['online']) > 0,
        pid = Util.parseInt(data['_pid']),
        tagName = data['tagName'] ?? '',
        room_tag_new = data['room_tag_new'],
        follow = Util.parseInt(data['follow']) > 0,
        audio = data['_audio'] ?? '',
        age = Util.parseInt(data['age']),
        distance = Util.parseInt(data['distance'], -1),
        exposured = false,
        roomProperty = data['room_property'] ?? '',
        mark = data['mark'] ?? '',
        isBiz = Util.parseBool(data['is_biz']),
        typeName = data['type_label'] ?? '',
        settlementChannel = data['settlement_channel'] ?? '',
        roomFactoryType = data['room_factory_type'] ?? '',
        popularityLevel = Util.parseInt(data['popularity_level']) {
    var bg = data['room_tag_bg'];
    if (bg != null && bg is List) {
      List roomTagBgList = data['room_tag_bg'];
      for (var element in roomTagBgList) {
        String colorStr = '0xff${(Util.notNullStr(element)).substring(1)}';
        Color color = Color(int.parse(colorStr));
        room_tag_bg.add(color);
      }
    }
  }

  String get nickName => nick.isNotEmpty ? nick : name;

  String get onlineStatusStr =>
      online ? R.string('online') : online_dateline_diff;

  String get distanceStr {
    if (distance <= 0) {
      return '';
    } else if (distance < 100) {
      return '0.10km';
    } else if (distance > 50000) {
//      return '';
      return '${(distance / 1000).toStringAsFixed(2)}km';
    } else {
      return '${(distance / 1000).toStringAsFixed(2)}km';
    }
  }
}
