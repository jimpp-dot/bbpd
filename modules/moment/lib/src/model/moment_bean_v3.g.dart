// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_bean_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowActivityUserItem _$FollowActivityUserItemFromJson(
    Map<String, dynamic> json) {
  return FollowActivityUserItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['sex']),
    Util.parseInt(json['age']),
    Util.parseStr(json['mark']) ?? '',
    Util.parseStr(json['cicon']) ?? '',
    Util.parseInt(json['cid']),
    Util.parseStr(json['cname']) ?? '',
    Util.parseInt(json['cnum']),
    Util.parseInt(json['diamond_num']),
  );
}

Map<String, dynamic> _$FollowActivityUserItemToJson(
        FollowActivityUserItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'sex': instance.sex,
      'age': instance.age,
      'mark': instance.mark,
      'cicon': instance.cicon,
      'cid': instance.cid,
      'cname': instance.cname,
      'cnum': instance.cnum,
      'diamond_num': instance.diamondNum,
    };

FollowActivityLoveItem _$FollowActivityLoveItemFromJson(
    Map<String, dynamic> json) {
  return FollowActivityLoveItem(
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['vip']),
    Util.parseInt(json['title']),
    Util.parseInt(json['title_new']),
    Util.parseStr(json['toName']) ?? '',
    Util.parseStr(json['toIcon']) ?? '',
    Util.parseInt(json['toVip']),
    Util.parseInt(json['giftId']),
    Util.parseInt(json['dateLine']),
    Util.parseStr(json['roomTitle']) ?? '',
  );
}

Map<String, dynamic> _$FollowActivityLoveItemToJson(
        FollowActivityLoveItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'vip': instance.vip,
      'title': instance.title,
      'title_new': instance.titleNew,
      'toName': instance.toName,
      'toIcon': instance.toIcon,
      'toVip': instance.toVip,
      'giftId': instance.giftId,
      'dateLine': instance.dateLine,
      'roomTitle': instance.roomTitle,
    };
