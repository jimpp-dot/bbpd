import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'ranking_theme.dart';

part 'ranking_star_bean.g.dart';

String _starValueString({int? value, int fractionDigits = 0}) {
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

/// 小时榜列表数据
class RankingStarTabListResponse {
  @JsonKey(fromJson: Util.parseBool)
  final bool success;
  @JsonKey(fromJson: Util.parseStr)
  String? msg;
  final List<RankingStarTabItem> list;
  RankingStarTabItem? self;
  int more;

  RankingStarTabListResponse(this.success,
      {this.msg, this.list = const [], this.self, this.more = 0});

  factory RankingStarTabListResponse.fromJson(Map<String, dynamic> data) {
    bool success = Util.parseBool(data['success']);
    String errorMsg = Util.parseStr(data['msg']) ?? '';
    if (Util.validStr(errorMsg) || data['data'] is! Map) {
      return RankingStarTabListResponse(false, msg: errorMsg);
    }

    List<RankingStarTabItem> list = [];
    (data['data']['rank_list'] as List?)?.asMap().forEach((index, element) {
      RankingStarTabItem item = RankingStarTabItem.fromJson(element);
      list.add(item);
    });
    int more = data['data']['more'];
    RankingStarTabItem? self = data['data']['self'] != null
        ? RankingStarTabItem.fromJson(data['data']['self'])
        : null;
    return RankingStarTabListResponse(success,
        msg: errorMsg, list: list, self: self, more: more);
  }

  int get listLength {
    if (list.isEmpty) return 0;
    if (list.length > 3) return list.length - 2;
    return 1;
  }

  List<RankingStarTabItem> dataAtIndex(int index) {
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
class RankingStarTabItem {
  @JsonKey(fromJson: Util.parseInt)
  final int rank;
  @JsonKey(fromJson: Util.parseInt)
  final int rid;
  @JsonKey(fromJson: Util.parseInt)
  final int uid;
  @JsonKey(name: 'room_name', fromJson: Util.parseStr)
  final String roomName;

  /// 房间魅力值
  @JsonKey(name: 'star_num', fromJson: Util.parseInt)
  final int starNum;
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

  @JsonKey(name: 'diff_num', fromJson: Util.parseInt)
  final int diffNum;

  RankingStarTabItem({
    this.userName = '',
    this.uid = 0,
    this.rank = 0,
    this.rid = 0,
    this.starNum = 0,
    this.userIcon = '',
    this.rankChange = 0,
    this.rankChangeType = '',
    this.stayHour = 0,
    this.roomName = '',
    this.diffNum = 0,
  });

  factory RankingStarTabItem.fromJson(Map<String, dynamic> json) {
    return _$RankingStarTabItemFromJson(json);
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

  String get starValueText {
    String value = _starValueString(value: starNum, fractionDigits: 1);
    return '$value ${K.rank_talent_star_value}';
  }

  String get starValue {
    return _starValueString(value: starNum, fractionDigits: 1);
  }
}
