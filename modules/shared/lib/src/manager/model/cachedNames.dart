import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../pbModel/generated/api_im_data.pb.dart';

class UserInfo {
  final int uid;
  final String? name;
  final String mark;
  final String? icon;
  final List<String>? members;
  final int version;
  int official;
  final int degree;
  final String? orderStatus;
  final ChatStarLevel? chatStarLevel;
  final int deleted;
  final int starVerifyTag; // 明星加V标签
  final int titleNew;
  final String? frame;
  final int daka;
  final int jiaren;
  final int accost;
  final String userMachine;
  final String lvIcon; // 群组的等级勋章

  UserInfo(
    this.uid,
    this.name,
    this.icon,
    this.members,
    this.orderStatus,
    this.chatStarLevel,
    this.deleted,
    this.titleNew,
    this.frame, {
    this.mark = '',
    this.version = 0,
    this.official = 0,
    this.degree = 0,
    this.starVerifyTag = 0,
    this.daka = 0,
    this.jiaren = 0,
    this.accost = 0,
    this.userMachine = '',
    this.lvIcon = '',
  });

  String get markName {
    if (mark.isNotEmpty) {
      return mark;
    } else {
      return name ?? '';
    }
  }

  static List<String> _getMemberIcons(dynamic value) {
    List? res;
    if (value is String && value.toString().isNotEmpty) {
      try {
        res = json.decode(value);
      } catch (e) {}
    } else if (value == null) {
      res = [];
    } else if (value is List) {
      res = value;
    } else {
      res = [];
    }
    List<String> values = [];
    if (res == null) return values;
    for (var value in res) {
      if (value is Map) {
        Map data = value;
        values.add(data['icon']);
      } else if (value is String) {
        values.add(value);
      }
    }
    return values;
  }

  bool isDeleted() {
    return deleted > 1;
  }

  UserInfo.fromJson(Map res)
      : uid = Util.parseInt(res['uid']),
        name = Util.parseStr(res['name']),
        mark = Util.parseStr(res['mark']) ?? '',
        icon = res['portraitUri'] != null
            ? Util.parseStr(res['portraitUri'])
            : Util.parseStr(res['icon']),
        version = Util.parseInt(res['version']),
        // cloud/profile proto改造 服务端将members拆分为members和memberList
        members = res.containsKey('members')
            ? _getMemberIcons(res['members'])
            : (res.containsKey('memberList')
                ? _getMemberIcons(res['memberList'])
                : []),
        official = Util.parseInt(res['official']),
        degree = Util.parseInt(res['degree']),
        orderStatus = res['order_status'] != null
            ? Util.parseStr(res['order_status'])
            : Util.parseStr(res['orderStatus']),
        // cloud/profile proto改造时, 发现服务端已经没有chat_star_level，原逻辑先保留
        chatStarLevel =
            (res["chat_star_level"] != null && res["chat_star_level"] is Map)
                ? ChatStarLevel.fromJson(res['chat_star_level'])
                : null,
        deleted = Util.parseInt(res['deleted']),
        starVerifyTag = res['star_verify_tag'] != null
            ? Util.parseInt(res['star_verify_tag'])
            : Util.parseInt(res['starVerifyTag']),
        // 数据库里存的是starVerifyTag,兼容
        titleNew = res['title_new'] != null
            ? Util.parseInt(res['title_new'])
            : Util.parseInt(res['titleNew']),
        frame = Util.parseStr(res['frame']),
        daka = Util.parseInt(res['daka']),
        jiaren = Util.parseInt(res['jiaren']),
        accost = Util.parseInt(res['accost']),
        lvIcon = Util.notNullStr(res['lv_icon']),
        userMachine = res['userMachine'] != null
            ? (Util.parseStr(res['userMachine']) ?? '')
            : '';

  ///cloud/all 接口返回的[UserData]转UserInfo
  UserInfo.fromImUserData(ImUserData userData)
      : uid = userData.uid,
        name = userData.name,
        mark = userData.mark,
        icon = userData.icon,
        version = userData.version,
        members = [], //没返回数据
        official = userData.official,
        degree = userData.degree,
        orderStatus = userData.orderStatus,
        chatStarLevel = null, //没返回数据
        deleted = userData.deleted,
        starVerifyTag = userData.starVerifyTag,
        titleNew = userData.titleNew,
        frame = userData.frame,
        daka = userData.daka,
        jiaren = userData.jiaren,
        accost = userData.accost,
        lvIcon = '',
        userMachine = userData.userMachine;

  /// cloud/all 接口返回的[GroupData]转UserInfo
  UserInfo.fromImGroupData(ImGroupData groupData)
      : uid = groupData.uid,
        name = groupData.name,
        mark = '',
        icon = groupData.icon,
        version = groupData.version,
        members = _getGroupMemberIcons(groupData.members),
        official = groupData.official,
        degree = 0,
        orderStatus = '',
        chatStarLevel = null, //没返回数据
        deleted = 0, //没返回数据
        starVerifyTag = 0, //没返回数据
        titleNew = 0,
        frame = '',
        daka = 0,
        jiaren = 0,
        accost = 0,
        lvIcon = groupData.lvIcon,
        userMachine = '';

  static ImUserData? toImUserData(UserInfo? info) {
    if (info == null) return null;
    return ImUserData(
      uid: info.uid,
      name: info.name,
      mark: info.mark,
      icon: info.icon,
      version: info.version,
      official: info.official,
      degree: info.degree,
      onlineData: ImUserOnlineData(
        uid: info.uid,
      ),
      orderStatus: info.orderStatus,
      deleted: info.deleted,
      starVerifyTag: info.starVerifyTag,
      titleNew: info.titleNew,
      frame: info.frame,
      daka: info.daka,
      jiaren: info.jiaren,
      accost: info.accost,
      userMachine: info.userMachine,
    );
  }

  static List<String> _getGroupMemberIcons(List<GroupUser> members) {
    if (members.isEmpty) {
      return [];
    } else {
      return members.map((e) => e.icon).toList();
    }
  }

  @override
  String toString() {
    return 'UserInfo{uid: $uid, name: $name, mark: $mark, icon: $icon, members: $members, version: $version, official: $official, degree: $degree, orderStatus: $orderStatus, chatStarLevel: $chatStarLevel, deleted: $deleted, starVerifyTag: $starVerifyTag, titleNew: $titleNew, frame: $frame, daka: $daka, jiaren: $jiaren, accost：$accost, userMachine: $userMachine, lvIcon: $lvIcon}';
  }
}

class CachedNames {
  static CachedNames? _instance;

  static CachedNames instance() {
    _instance ??= CachedNames();
    return _instance!;
  }

  CachedNames() {
    eventCenter.addListener(Im.EventMessageReceived, _onMessage);
  }

  final Map<int, VoidCallback> _listeners = {};

  addEvent(int uid, VoidCallback callback) {
    _listeners[uid] = callback;
  }

  removeEvent(int uid) {
    if (_listeners.containsKey(uid)) {
      _listeners.remove(uid);
    }
  }

  _notify(int uid) {
    if (_listeners.containsKey(uid)) {
      _listeners[uid]!();
    }
  }

  _onMessage(String type, dynamic value) async {
    try {
      Map data = value;
      int messageId = data['messageId'];
      MessageContent? message = await Im.getMessage(messageId);
      if (message != null && message.type == 'info') {
        if (message.conversationType == ConversationType.Group) {
          //清楚缓存
          int groupId = Util.parseInt(message.targetId, 0);
          if (groupId > 0) {
            remove(groupId);
          }
        }
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  dispose() {
    eventCenter.removeListener(Im.EventMessageReceived, _onMessage);
    _data.clear();
  }

  final Map<int, UserInfo> _data = {};

  Map<int, UserInfo> get data => _data;

  set(UserInfo info, [bool notify = true, bool reuseMembers = false]) async {
    if (reuseMembers &&
        Util.validList(_data[info.uid]?.members) &&
        info.members != null &&
        info.members!.isEmpty) {
      info.members!.addAll(_data[info.uid]!.members!);
    }
    _data[info.uid] = info;
    try {
      await LocalStorage.db?.insert(
          'yy_user',
          {
            'uid': info.uid,
            'version': info.version,
            'name': info.name,
            'mark': info.mark,
            'portraitUri': info.icon,
            'members': json.encode(info.members),
            'official': info.official,
            'degree': info.degree,
            'starVerifyTag': info.starVerifyTag,
            'title_new': info.titleNew,
            'frame': info.frame,
            'lv_icon': info.lvIcon,
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      Log.d('CachedNames set UserInfo error $e');
    }
    _notify(info.uid);
  }

  Future<UserInfo?> get(int uid, String type, {bool onlyCache = false}) async {
    // im中有些数据，uid = 1,例如 info 类型的message
    if (uid < 10) {
      return null;
    }
    if (_data.containsKey(uid)) {
      return _data[uid];
    } else {
      try {
        String sql = "select * from yy_user where uid = $uid";
        List<Map<String, dynamic>>? res = await LocalStorage.db?.rawQuery(sql);
        if (res != null && res.isNotEmpty) {
          Log.d(res[0]);
          UserInfo info = UserInfo.fromJson(res[0]);
          _data[info.uid] = info;
          return info;
        }
        if (onlyCache) return null;
        return await _loadFromRemote(uid, type);
      } catch (e, s) {
        Log.e(e, stackTrace: s);
        return null;
      }
    }
  }

  Future<UserInfo?> _loadFromRemote(int uid, String type) async {
    ResCloudProfile profile =
        await BaseRequestManager.cloudProfile(uid.toString(), type: type);
    if (profile.success && profile.hasData()) {
      if (profile.data.toProto3Json() == null) return null;
      UserInfo info = UserInfo.fromJson(profile.data.toProto3Json() as Map);
      set(info, false);
      return info;
    }
    return null;
  }

  remove(int uid) async {
    if (_data.containsKey(uid)) {
      _data.remove(uid);
    }
    try {
      String sql = "delete from yy_user where uid = $uid";
      await LocalStorage.db?.rawDelete(sql);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    _notify(uid);
  }
}
