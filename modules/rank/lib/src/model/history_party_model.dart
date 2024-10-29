import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPartyTypeName {
  String label = '';
  String show = '';
  List<String> bg = [];
  String icon = '';
  String smallIcon = '';
  String bigIcon = '';
  Color? color;
  String acuteIcon = '';
  String abstractIcon = '';

  List<Color>? _bgColors;

  List<Color> get bgColors {
    if (_bgColors != null) return _bgColors!;

    _bgColors = Util.parseColors(bg);
    return _bgColors!;
  }

  HistoryPartyTypeName(
      {this.label = '',
      this.show = '',
      this.bg = const [],
      this.icon = '',
      this.acuteIcon = '',
      this.abstractIcon = '',
      this.color});

  HistoryPartyTypeName.fromPb(FriendTypeName item) {
    show = item.show;
    bg = item.bg;
    color = Util.parseColor(item.tagColor);
    smallIcon = item.tagIcon;
  }

  HistoryPartyTypeName.fromFriendListPb(FriendTypeName item) {
    bg = item.bg;
    smallIcon = item.tagIcon;
    color = Util.parseColor(item.tagColor);
  }

  HistoryPartyTypeName.fromJson(dynamic json) {
    label = Util.parseStr(json["label"]) ?? '';
    show = Util.parseStr(json["show"]) ?? '';
    bg = Util.parseList(json["bg"], (e) => Util.parseStr(e) ?? '');
    icon = Util.parseStr(json["icon"]) ?? '';
    smallIcon = Util.parseStr(json["small_icon"] ?? json['tag_icon']) ?? '';
    bigIcon = Util.parseStr(json["big_icon"] ?? json['type_icon']) ?? '';
    acuteIcon = Util.parseStr(json["acute_icon"]) ?? '';
    abstractIcon = Util.parseStr(json["abstract_icon"]) ?? '';
    color = json['color'] != null
        ? Util.parseColor(json['color'])
        : Util.parseColor(json['tag_color']);
  }
}

class HistoryPartyUser {
  int uid;
  String icon;

  HistoryPartyUser({this.uid = 0, this.icon = ''});
}

class HistoryPartyModel {
  int rid = 0;
  int uid = 0;
  String name = '';
  String onlineNum = '';
  String icon = '';
  String dateline = '';
  String game = '';
  String receptionUid = '';
  String bossUid = '';
  String bossIcon = '';
  int hot = 0;
  int gameStatus = 0;
  int patternStyle = 0;
  String historyType = '';
  bool online = false;
  String extra = '';
  String ticketMark = '';

  HistoryPartyTypeName? typeName;
  List<HistoryPartyUser> users = [];

  HistoryPartyModel(
      {this.rid = 0,
      this.uid = 0,
      this.name = '',
      this.onlineNum = '',
      this.icon = '',
      this.dateline = '',
      this.game = '',
      this.receptionUid = '',
      this.bossUid = '',
      this.bossIcon = '',
      this.hot = 0,
      this.gameStatus = 0,
      this.online = false,
      this.extra = '',
      this.historyType = '',
      this.patternStyle = 0,
      this.ticketMark = ''});

  HistoryPartyModel.fromPb(RoomListItem item) {
    rid = item.rid;
    icon = item.icon;
    typeName = HistoryPartyTypeName.fromPb(item.typeName);
    name = item.name;
    uid = item.uid;
    ticketMark = item.ticketMark;
  }

  HistoryPartyModel.fromFriendListPb(FriendListItem item) {
    rid = item.rid;
    icon = item.icon;
    name = item.uname;
    uid = item.uid;
    typeName = HistoryPartyTypeName.fromFriendListPb(item.typeName);
    extra = item.typeName.show;
    ticketMark = item.ticketMark;
  }

  HistoryPartyModel.fromJson(dynamic json) {
    rid = Util.parseInt(json["rid"]);
    uid = Util.parseInt(json["uid"]);
    name = Util.parseStr(json["name"]) ?? '';
    onlineNum = Util.parseStr(json["online_num"]) ?? '';
    icon = Util.parseStr(json["icon"]) ?? '';
    dateline = Util.parseStr(json["dateline"]) ?? '';
    game = Util.parseStr(json["game"]) ?? '';
    receptionUid = Util.parseStr(json["reception_uid"]) ?? '';
    bossUid = Util.parseStr(json["boss_uid"]) ?? '';
    bossIcon = Util.parseStr(json["boss_icon"]) ?? '';
    hot = Util.parseInt(json["hot"]);
    online = 1 == Util.parseInt(json['online_num']);
    gameStatus = Util.parseInt(json["game_status"]);
    patternStyle = Util.parseInt(json["pattern_style"]);
    typeName = json['typeName'] is Map
        ? HistoryPartyTypeName.fromJson(json['typeName'])
        : null;
    historyType = Util.parseStr(json["history_type"]) ?? '';
    ticketMark = Util.parseStr(json['ticket_mark']) ?? '';

    users = [];
    if (json['users'] is List) {
      json['users'].forEach((u) {
        users.add(HistoryPartyUser(
            uid: Util.parseInt(u['uid']),
            icon: Util.parseStr(u['icon']) ?? ''));
      });
    }
  }

  bool get recommend {
    return historyType == 'recommendation';
  }

  bool get isHistory {
    return historyType == 'history';
  }

  String get getStatus {
    if (online == true) {
      return K.rank_online_now;
    }
    int diff = Util.parseInt(dateline);

    return Utility.getDateDiff(diff) ?? '';
  }

  String get displayName {
    if (isMine) {
      return K.rank_home_my_party;
    } else if (extra == 'more') {
      return K.rank_home_view_all;
    } else if (extra == 'create') {
      return K.rank_home_create_party;
    }

    return name;
  }

  bool get isMine {
    bool myRoom = historyType == 'my_room';
    return uid == Session.uid || myRoom;
  }
}
