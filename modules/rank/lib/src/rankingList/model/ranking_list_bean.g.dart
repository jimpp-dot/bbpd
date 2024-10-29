// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_list_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomCharmIndexResponse _$RoomCharmIndexResponseFromJson(
    Map<String, dynamic> json) {
  return RoomCharmIndexResponse(
    Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    entrance: json['data'] == null
        ? null
        : RoomCharmIndexBean.fromJson(json['data'] as Map<String, dynamic>),
  );
}

RoomCharmIndexBean _$RoomCharmIndexBeanFromJson(Map<String, dynamic> json) {
  return RoomCharmIndexBean(
    topList: Util.parseList(json['top_list'],
        (e) => RankingTabItem.fromJson(e as Map<String, dynamic>)),
    gapList: Util.parseList(json['gap_list'],
        (e) => RoomCharmGapBean.fromJson(e as Map<String, dynamic>)),
    rankTypeList: Util.parseList(json['rank_type_list'],
        (e) => TabItem.fromJson(e as Map<String, dynamic>)),
    rule: (json['rule'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, Util.parseList(e, (ee) => Util.parseStr(ee) ?? '')),
    ),
    haveRoomCharm: Util.parseBool(json['have_room_charm']),
  );
}

RoomCharmGapBean _$RoomCharmGapBeanFromJson(Map<String, dynamic> json) {
  return RoomCharmGapBean(
    time: Util.parseInt(json['time']),
    des: Util.parseStr(json['des']) ?? '',
    type: Util.parseStr(json['type']) ?? '',
    showIcon: Util.parseBool(json['show_icon']),
  );
}

RankingTabItem _$RankingTabItemFromJson(Map<String, dynamic> json) {
  return RankingTabItem(
    userName: Util.parseStr(json['user_name']) ?? '',
    uid: Util.parseInt(json['uid']),
    rank: Util.parseInt(json['rank']),
    rid: Util.parseInt(json['rid']),
    currentRid: Util.parseInt(json['current_rid']),
    roomCharm: Util.parseInt(json['room_charm']),
    userIcon: Util.parseStr(json['user_icon']) ?? '',
    rankChange: Util.parseInt(json['rank_change']),
    rankChangeType: Util.parseStr(json['rank_change_type']) ?? '',
    stayHour: Util.parseInt(json['stay_hour']),
    roomName: Util.parseStr(json['room_name']) ?? '',
    beforeDiff: Util.parseInt(json['before_diff']),
    stayNum: Util.parseInt(json['stay_num']),
    leftTime: Util.parseInt(json['left_time']),
  );
}
