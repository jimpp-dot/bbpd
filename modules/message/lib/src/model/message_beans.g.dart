// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearbyUserListResp _$NearbyUserListRespFromJson(Map<String, dynamic> json) {
  return NearbyUserListResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : NearbyUserList.fromJson(json['data'] as Map<String, dynamic>),
  );
}

NearbyUserList _$NearbyUserListFromJson(Map<String, dynamic> json) {
  return NearbyUserList(
    Util.parseInt(json['match_num']),
    Util.parseList(json['data'],
        (e) => NearbyUserItem.fromJson(e as Map<String, dynamic>)),
  );
}

NearbyUserItem _$NearbyUserItemFromJson(Map<String, dynamic> json) {
  return NearbyUserItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['state']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['distance']),
    Util.parseInt(json['in_room']),
    Util.parseStr(json['room_property']),
    Util.parseStr(json['room_type']),
    Util.parseStr(json['room_tag_new']),
    Util.parseStr(json['show']),
    Util.parseList(json['bg'], (e) => Util.parseStr(e) ?? ''),
    Util.parseStr(json['acute_icon']),
  );
}

AddressBookUserItem _$AddressBookUserItemFromJson(Map<String, dynamic> json) {
  return AddressBookUserItem(
    Util.parseInt(json['its_uid']),
    Util.parseStr(json['app_name']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['contact_name']),
    Util.parseInt(json['redpoint']),
    Util.parseInt(json['follow']),
    Util.parseInt(json['online']),
    json['room_tag'] == null
        ? null
        : UserConfig.fromJson(json['room_tag'] as Map<String, dynamic>),
  );
}

AddressBookFriendsResp _$AddressBookFriendsRespFromJson(
    Map<String, dynamic> json) {
  return AddressBookFriendsResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : AddressBookFriendsModel.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}

AddressBookFriendsModel _$AddressBookFriendsModelFromJson(
    Map<String, dynamic> json) {
  return AddressBookFriendsModel(
    Util.parseInt(json['total']),
    Util.parseList(json['list'],
        (e) => AddressBookUserItem.fromJson(e as Map<String, dynamic>)),
    Util.parseBool(json['more']),
  );
}
