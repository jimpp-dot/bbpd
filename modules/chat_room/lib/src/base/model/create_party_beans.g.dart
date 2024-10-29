// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_party_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePartyInfo _$CreatePartyInfoFromJson(Map<String, dynamic> json) {
  return CreatePartyInfo(
    Util.parseInt(json['playing_num']),
    Util.notNullStr(json['party_name']),
    Util.getRemoteImgUrl(Util.parseStr(json['party_icon'])),
    Util.parseBool(json['friend_next']),
    Util.parseList(json['friend_list'],
        (e) => FriendItem.fromJson(e as Map<String, dynamic>)),
    json['room_info'] == null
        ? null
        : RoomInfo.fromJson(json['room_info'] as Map<String, dynamic>),
    Util.parseInt(json['need_verify_new']),
    Util.parseList(json['party_rooms'],
        (e) => RoomType.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['private_levels'],
        (e) => PrivateLevel.fromJson(e as Map<String, dynamic>)),
    Util.notNullStr(json['toast']),
    Util.parseInt(json['match_style']),
    Util.notNullStr(json['agreement']),
    Util.parseInt(json['close_notify']),
    Util.parseBool(json['ticket_setting']),
  );
}

FriendItem _$FriendItemFromJson(Map<String, dynamic> json) {
  return FriendItem(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['name']),
    Util.parseBool(json['online']),
    Util.parseInt(json['online_dateline']),
    Util.notNullStr(json['type'], def: 'user'),
  );
}

RoomInfo _$RoomInfoFromJson(Map<String, dynamic> json) {
  return RoomInfo(
    Util.parseInt(json['rid']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['type']),
    Util.notNullStr(json['prefix']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['description']),
    Util.notNullStr(json['password']),
    Util.parseInt(json['reception']),
    Util.parseInt(json['paier']),
  );
}

PrivateLevel _$PrivateLevelFromJson(Map<String, dynamic> json) {
  return PrivateLevel(
    Util.parseInt(json['private_level']),
    Util.notNullStr(json['level_name']),
  );
}

PartyListResp _$PartyListRespFromJson(Map<String, dynamic> json) {
  return PartyListResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(
        json['data'], (e) => PartyList.fromJson(e as Map<String, dynamic>)),
  );
}

PartyList _$PartyListFromJson(Map<String, dynamic> json) {
  return PartyList(
    Util.parseList(
        json['list'], (e) => Party.fromJson(e as Map<String, dynamic>)),
    Util.notNullStr(json['type']),
    Util.notNullStr(json['name']),
  );
}

Party _$PartyFromJson(Map<String, dynamic> json) {
  return Party(
    display: Util.notNullStr(json['display']),
    partyType: Util.notNullStr(json['party_type']),
    icon: Util.notNullStr(json['home_icon']),
    tag: Util.notNullStr(json['player_tag']),
    optionIcon: Util.notNullStr(json['option_icon']),
  )
    ..abstractIcon = Util.notNullStr(json['abstract_icon'])
    ..cornerIcon = Util.notNullStr(json['rt_corner']);
}

RoomType _$RoomTypeFromJson(Map<String, dynamic> json) {
  return RoomType(
    Util.notNullStr(json['room_type']),
    Util.notNullStr(json['room_show']),
    Util.parseBool(json['room_lock']),
  );
}
