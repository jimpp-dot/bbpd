import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';

import 'ranking_theme.dart';

part 'ranking_list_bean.g.dart';

String _charmValueString({int? value, int fractionDigits = 0}) {
  if (value == null) return '0';
  if (value < 1000) {
    return value.toString();
  } else if (value < 1000 * 1000) {
    return '${(value / 1000).toStringAsFixed(fractionDigits)}K';
  } else if (value < 1000 * 1000 * 1000) {
    return '${(value / 1000000).toStringAsFixed(fractionDigits)}M';
  } else {
    return '${(value / 1000000000).toStringAsFixed(fractionDigits)}B';
  }
}

@JsonSerializable(createToJson: false)
class RoomCharmIndexResponse {
  @JsonKey(fromJson: Util.parseBool)
  final bool success;
  @JsonKey(fromJson: Util.parseStr)
  final String? msg;
  @JsonKey(name: 'data')
  final RoomCharmIndexBean? entrance;

  RoomCharmIndexResponse(this.success, {this.msg, this.entrance});

  factory RoomCharmIndexResponse.fromJson(Map<String, dynamic> data) {
    return _$RoomCharmIndexResponseFromJson(data);
  }
}

@JsonSerializable(createToJson: false)
class RoomCharmIndexBean {
  /// 上小时榜单前十名
  @JsonKey(name: 'top_list')
  List<RankingTabItem> topList;

  /// 榜单轮动信息
  @JsonKey(name: 'gap_list')
  List<RoomCharmGapBean> gapList;

  /// 榜单tab
  @JsonKey(name: 'rank_type_list')
  List<TabItem> rankTypeList;

  /// 规则说明
  Map<String, List<String>>? rule;

  /// 榜单开关
  @JsonKey(name: 'have_room_charm')
  bool haveRoomCharm;

  RoomCharmIndexBean(
      {this.topList = const [],
      this.gapList = const [],
      this.rankTypeList = const [],
      this.rule,
      this.haveRoomCharm = false});

  factory RoomCharmIndexBean.fromJson(Map<String, dynamic> json) =>
      _$RoomCharmIndexBeanFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class RoomCharmGapBean {
  ///轮动时间
  @JsonKey(fromJson: Util.parseInt)
  int time;

  /// 榜单描述 eg 小时榜第8名 提升名次还差魅力1k
  String des;

  /// 榜单类型
  String type;

  bool showIcon;

  RoomCharmGapBean(
      {this.time = 0, this.des = '', this.type = '', this.showIcon = false});

  factory RoomCharmGapBean.fromJson(Map<String, dynamic> json) =>
      _$RoomCharmGapBeanFromJson(json);

  Map toJson() => {'des': des, 'time': time, 'type': type};
}

/// 小时榜列表数据
class RankingTabListResponse {
  @JsonKey(fromJson: Util.parseBool)
  final bool success;
  @JsonKey(fromJson: Util.parseStr)
  String? msg;
  final List<RankingTabItem> list;
  RankingTabItem? overLoad;
  RankingTabItem? self;
  int more;

  RankingTabListResponse(this.success,
      {this.msg,
      this.overLoad,
      this.list = const [],
      this.self,
      this.more = 0});

  factory RankingTabListResponse.fromJson(Map<String, dynamic> data) {
    bool success = Util.parseBool(data['success']);
    String? errorMsg = Util.parseStr(data['msg']);
    if (Util.validStr(errorMsg) || data['data'] == null) {
      return RankingTabListResponse(false, msg: errorMsg);
    }

    List<RankingTabItem> list = [];
    (data['data']['list'] as List?)?.asMap().forEach((index, element) {
      RankingTabItem item = RankingTabItem.fromJson(element);
      list.add(item);
    });
    RankingTabItem? overLoad;
    if (data['data']['occupy'] != null && data['data']['occupy'] is Map) {
      overLoad = RankingTabItem.fromJson(data['data']['occupy']);
    }
    int more = data['data']['more'];
    RankingTabItem? self = data['data']['self'] != null
        ? RankingTabItem.fromJson(data['data']['self'])
        : null;
    return RankingTabListResponse(success,
        msg: errorMsg, list: list, overLoad: overLoad, self: self, more: more);
  }

  int get listLength {
    if (list.isEmpty) {
      return 0;
    }
    if (list.length > 3) return list.length - 2;
    return 1;
  }

  List<RankingTabItem> dataAtIndex(int index) {
    if (list.isEmpty) return [];
    if (index == 0) {
      if (list.length > 2) {
        return list.sublist(0, 3);
      } else {
        return list;
      }
    } else if (index == 1 || index == 2) {
      return [];
    } else {
      return [list[index]];
    }
  }
}

@JsonSerializable(createToJson: false)
class RankingTabItem {
  @JsonKey(fromJson: Util.parseInt)
  final int rank;
  @JsonKey(fromJson: Util.parseInt)
  final int rid;
  @JsonKey(fromJson: Util.parseInt)
  final int uid;
  @JsonKey(name: 'room_name', fromJson: Util.parseStr)
  final String roomName;

  ///倒计时
  @JsonKey(name: 'left_time', fromJson: Util.parseInt)
  final int leftTime;

  /// 房间魅力值
  @JsonKey(name: 'room_charm', fromJson: Util.parseInt)
  final int roomCharm;
  @JsonKey(name: 'user_name', fromJson: Util.parseStr)
  final String userName;
  @JsonKey(name: 'user_icon', fromJson: Util.parseStr)
  final String userIcon;

  /// new-新上榜，incry-上升排名，decry-下降排名
  @JsonKey(name: 'rank_change', fromJson: Util.parseInt)
  final int rankChange;

  /// 上升或下降名次
  @JsonKey(name: 'rank_change_type', fromJson: Util.parseStr)
  final String rankChangeType;

  /// 上升或下降名次
  @JsonKey(name: 'stay_hour', fromJson: Util.parseInt)
  final int stayHour;

  @JsonKey(name: 'current_rid', fromJson: Util.parseInt)
  final int currentRid;

  /// 距离上一名差值
  @JsonKey(name: 'before_diff', fromJson: Util.parseInt)
  final int beforeDiff;

  /// 霸榜次数
  @JsonKey(name: 'stay_num', fromJson: Util.parseInt)
  final int stayNum;

  RankingTabItem({
    this.userName = '',
    this.uid = 0,
    this.rank = 0,
    this.rid = 0,
    this.currentRid = 0,
    this.roomCharm = 0,
    this.userIcon = '',
    this.rankChange = 0,
    this.rankChangeType = '',
    this.stayHour = 0,
    this.roomName = '',
    this.beforeDiff = 0,
    this.stayNum = 0,
    this.leftTime = 0,
  });

  factory RankingTabItem.fromJson(Map<String, dynamic> json) {
    return _$RankingTabItemFromJson(json);
  }

  Widget? get rankImg {
    if (rankChangeType == 'incry') {
      return R.img(Assets.room_ranking_up_png,
          height: 10, width: 10, package: ComponentManager.MANAGER_RANK);
    } else if (rankChangeType == 'decry') {
      return R.img(Assets.room_ranking_down_png,
          height: 10, width: 10, package: ComponentManager.MANAGER_RANK);
    }
    return null;
  }

  String get rankChangeText {
    if (rankChangeType == 'new') {
      return 'New';
    } else if (rankChangeType == 'none') {
      return '-';
    } else {
      return rankChange.toString();
    }
  }

  TextStyle get rankChangeStyle {
    Color textColor = Colors.white.withOpacity(0.7);
    if (rankChangeType == 'new') {
      textColor = RankingTheme.albumBtnColor;
    } else if (rankChangeType == 'incry') {
      textColor = RankingTheme.thirdBrightColor;
    } else if (rankChangeType == 'decry') {
      textColor = RankingTheme.fiveBrightColor;
    }

    return TextStyle(
      fontSize: 9,
      color: textColor,
    );
  }

  String get charmValueText {
    String value = _charmValueString(value: roomCharm, fractionDigits: 1);
    return '$value ${K.rank_charm_value}';
  }

  String get diffBeforeValue {
    String value = _charmValueString(value: beforeDiff, fractionDigits: 1);
    return value;
  }

  String get roomIcon {
    return userIcon;
  }

  String get mvpText {
    return '${K.rank_charm_mvp}$userName';
  }

  String get overLordTitle {
    return K.hour_rank_lord;
  }

  /// 霸榜持续次数
  String get overLordNumText {
    return K.last_hour_top_one;
    // if (stayNum == 0) {
    //   return K.rank_stay_hour_age;
    // } else {
    //   return K.rank_stay_num_text(['$stayNum']);
    // }
  }
}
