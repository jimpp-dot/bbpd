// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hilist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiListUsers _$HiListUsersFromJson(Map<String, dynamic> json) {
  return HiListUsers(
    Util.parseList(json['users'],
        (e) => HiListUserItem.fromJson(e as Map<String, dynamic>)),
  );
}

HiListUserItem _$HiListUserItemFromJson(Map<String, dynamic> json) {
  return HiListUserItem(
    Util.parseInt(json['uid']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['age']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['title']),
    Util.parseInt(json['title_new']),
    Util.parseInt(json['photo_num']),
    Util.parseInt(json['popularity']),
    Util.parseInt(json['vip']),
    Util.parseBool(json['icongray']),
    Util.parseList(json['marks'], (e) => Util.notNullStr(e)),
    Util.parseInt(json['online_dateline']),
    Util.parseBool(json['new_user']),
    Util.parseInt(json['daka']),
    Util.parseInt(json['jiaren']),
  );
}
