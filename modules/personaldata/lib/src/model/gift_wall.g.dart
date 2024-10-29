// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_wall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftWall _$GiftWallFromJson(Map<String, dynamic> json) {
  return GiftWall(
    Util.parseBool(json['success']),
    json['data'] == null
        ? null
        : GiftWallData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

GiftWallData _$GiftWallDataFromJson(Map<String, dynamic> json) {
  return GiftWallData(
    Util.parseInt(json['count']),
    Util.parseList(json['gift_list'],
            (e) => GiftBean.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

GiftBean _$GiftBeanFromJson(Map<String, dynamic> json) {
  return GiftBean(
    Util.parseInt(json['gid']),
    Util.parseInt(json['num']),
    Util.notNullStr(json['name']),
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
  );
}
