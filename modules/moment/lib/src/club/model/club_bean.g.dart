// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubListPage _$ClubListPageFromJson(Map<String, dynamic> json) {
  return ClubListPage(
    Util.parseInt(json['total']),
    Util.parseList(
        json['list'], (e) => ClubBean.fromJson(e as Map<String, dynamic>)),
  );
}

ClubBean _$ClubBeanFromJson(Map<String, dynamic> json) {
  return ClubBean(
    Util.parseInt(json['club_id']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['name']),
    Util.parseBool(json['joined']),
  );
}

ClubDetailBean _$ClubDetailBeanFromJson(Map<String, dynamic> json) {
  return ClubDetailBean(
    Util.parseStr(json['name']),
    Util.parseIcon(json['icon']),
    Util.parseInt(json['broadcast_num']),
    Util.parseInt(json['member_num']),
    Util.parseIcon(json['bg_img']),
    Util.parseBool(json['joined']),
    Util.parseInt(json['club_id']),
    Util.parseList(json['related_rooms'],
        (e) => PartyRoomGridItem.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['related_broadcast'],
        (e) => AnchorInfo.fromJson(e as Map<String, dynamic>)),
    Util.parseList(
        json['gods'], (e) => PartyGodBean.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['pcid']),
  );
}

AnchorInfo _$AnchorInfoFromJson(Map<String, dynamic> json) {
  return AnchorInfo(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseIcon(json['icon']),
    Util.parseInt(json['rid']),
    Util.parseStr(json['room_tag']),
    Util.parseBool(json['online_status']),
    Util.parseInt(json['is_game']),
    Util.parseIcon(json['sicon']),
  );
}
