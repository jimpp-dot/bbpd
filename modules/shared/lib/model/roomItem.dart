import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class RoomTagType {
  final String? label;
  final String? val;
  final String? color;
  final bool isFollow;
  final String? show;
  final String? tagIcon;
  final Color? tagColor;
  List<Color>? bgColors = [];

  RoomTagType(
      {this.label,
      this.val,
      this.color,
      this.isFollow = false,
      this.show,
      this.tagIcon,
      this.tagColor,
      this.bgColors});

  RoomTagType.fromJson(Map data)
      : label = data['label'],
        show = data['show'],
        val = data['val'],
        isFollow = data.containsKey('isFollow') ? data['isFollow'] > 0 : false,
        color = data['color'],
        tagIcon = Util.parseStr(data['tag_icon']) ?? '',
        tagColor = Util.parseColor(data['tag_color']) {
    var bg = data['bg'];
    if (bg != null && bg is List) {
      List bgList = data['bg'];
      for (var element in bgList) {
        String colorStr = '0xff${(Util.notNullStr(element)).substring(1)}';
        Color color = Color(int.parse(colorStr));
        bgColors?.add(color);
      }
    }
  }
}

class RoomItemModel {
  Color roomBorderColor = Colors.black; // 皮队友1050版本新增，用于首页tab tag框颜色

  final int rid;
  final int uid;
  final int onlineNum;
  final int realNum;
  final int userTitle;
  final int numBoy;
  final int numGirl;
  final bool isBusy;
  final bool isPassword;
  final String roomName;
  final String prefix;
  final String roomIcon;
  final String userName;
  final String types;
  final String effect;
  final RoomTagType tag;
  final String gicon; // 皮队友1050版本新增，房间类型icon
  final bool isGameRoom;
  final String gameProcess; //wait为游戏等待,其它为游戏中
  final String frame; // 房间年度盛典头像框
  final String leftFrame; // 头像上房间角标
  final int ppnum; // 服务端计算的在线人数
  final String type;
  final int sex;
  final String roomProperty;
  final int playerNumType; //狼人游戏人数种类：1、4是9人；2、5是6人；3是12人
  final int gameStartTime; //狼人游戏开始时间戳，单位秒
  final String gameState; //狼人游戏状态，wait为等待中，其他为开始
  final int hourRank; //排行榜外露
  final int paier;
  final int bossUid;
  final int gameStatus;
  bool exposured = false;
  bool isBiz = false; //是否商业化推荐
  HomeRoomUiStyle? roomUiStyle;
  UserRelationType? relationType;
  String operationLabel = ''; // 运营标签
  String operationBg = ''; // 运营标签背景
  final String bossIcon; // 老板位用户Icon
  List<String> micIcons = []; // 麦上用户Icon
  final String typeName; //标签
  final String settlementChannel; //结算频道
  final String roomFactoryType; //模板
  final String followDesc;

  RoomItemModel.fromJson(Map data)
      : uid = Util.parseInt(data['uid']),
        rid = Util.parseInt(data['rid']),
        numBoy = Util.parseInt(data['num_boy']),
        numGirl = Util.parseInt(data['num_girl']),
        userTitle = Util.parseInt(data['utitle']),
        onlineNum = Util.parseInt(data['online_num']),
        playerNumType = Util.parseInt(data['player_num_type']),
        gameStartTime = Util.parseInt(data['start_time']),
        gameState = data['state'],
        realNum = Util.parseInt(data['real']),
        isBusy = Util.parseInt(data['boss_uid']) > 0,
        isPassword = Util.parseInt(data['password']) > 0,
        ppnum = Util.parseInt(data['ppnum']),
        roomName = Util.notNullStr(data['name']),
        roomIcon = Util.notNullStr(data['icon']),
        prefix = Util.notNullStr(data['prefix']),
        userName = data['uname'] ?? '',
        types = data['types'],
        effect = data['effect'] ?? '',
        tag = RoomTagType.fromJson(data['typeName'] ?? {}),
        isGameRoom = Util.parseInt(data['isgame']) > 0,
        gameProcess = data['state'] ?? '',
        frame = data['frame'] ?? '',
        exposured = false,
        type = data['type'],
        sex = Util.parseInt(data['sex']),
        hourRank = Util.parseInt(data['hour_rank']),
        roomProperty = data['property'],
        gicon = data['gicon'],
        leftFrame = data['left_frame'],
        isBiz = Util.parseBool(data['is_biz']),
        paier = Util.parseInt(data['paier']),
        bossUid = Util.parseInt(data['boss_uid']),
        gameStatus = Util.parseInt(data['game_status']),
        bossIcon = Util.parseStr(
              data['boss_icon'],
            ) ??
            '',
        typeName = data['type_label'] ?? '',
        roomFactoryType = data['room_factory_type'] ?? '',
        settlementChannel = data['settlement_channel'] ?? '',
        followDesc = data['follow_desc'] ?? '' {
    if (data['mic_icons'] is List) {
      List iconList = data['mic_icons'];
      for (var icon in iconList) {
        if (icon != bossIcon) {
          micIcons.add(Util.notNullStr(icon));
        }
      }
    }
    roomUiStyle = HomeRoomUiStyle.RoomUiStyleAnchor;
    int patternStyle = Util.parseInt(data['pattern_style']);
    if (patternStyle == 3) {
      roomUiStyle = HomeRoomUiStyle.RoomUiStyleGame;
    } else if (patternStyle == 1 &&
        (paier == 1 || !Util.isCollectionEmpty(micIcons))) {
      roomUiStyle = HomeRoomUiStyle.RoomUiStyleNormal;
    }
    String relation = Util.parseStr(data['friend_ship']) ?? '';
    if ('friend' == relation) {
      relationType = UserRelationType.Friend;
    } else if ('follow' == relation) {
      relationType = UserRelationType.Follow;
    } else {
      relationType = UserRelationType.Accompany;
    }
    if (data.containsKey('om_tab') && data['om_tab'] != null) {
      operationLabel = data['om_tab']['label'];
      operationBg = data['om_tab']['icon'];
    }
    if (data.containsKey('room_border')) {
      String? roomBorderColorStr = Util.parseStr(data['room_border']);
      if (roomBorderColorStr != null) {
        String colorStr = '0xff${roomBorderColorStr.substring(1)}';
        roomBorderColor = Color(int.parse(colorStr));
      }
    }
  }

  /// 是否视频直播房间
  bool get isGameLivingRoom {
    return type == 'live-game';
  }

  int get hotNum {
    return Utility.getRoundOnline(onlineNum, realNum, types);
  }
}

enum HomeRoomUiStyle {
  RoomUiStyleNormal,
  RoomUiStyleAnchor,
  RoomUiStyleGame,
  RoomUiStyleGameRecruit,
}

enum UserRelationType {
  Friend,
  Follow,
  Accompany,
}
