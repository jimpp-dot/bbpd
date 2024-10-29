// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_group_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourGroupInfo _$TourGroupInfoFromJson(Map<String, dynamic> json) {
  return TourGroupInfo(
    json['group'] == null
        ? null
        : Group.fromJson(json['group'] as Map<String, dynamic>),
    json['captain'] == null
        ? null
        : Captain.fromJson(json['captain'] as Map<String, dynamic>),
    Util.parseList(json['members'],
        (e) => TourMembers.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$TourGroupInfoToJson(TourGroupInfo instance) =>
    <String, dynamic>{
      'group': instance.group,
      'captain': instance.captain,
      'members': instance.members,
    };

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['countMembers']),
    Util.parseInt(json['countOnline']),
    Util.parseStr(json['notice']) ?? '',
    Util.parseStr(json['symbol']) ?? '',
    Util.parseBool(json['show_symbol']),
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'countMembers': instance.countMembers,
      'countOnline': instance.countOnline,
      'notice': instance.notice,
      'symbol': instance.symbol,
      'show_symbol': instance.showSymbol,
    };

Captain _$CaptainFromJson(Map<String, dynamic> json) {
  return Captain(
    Util.parseInt(json['uid']),
    Util.parseInt(json['rid']),
  );
}

Map<String, dynamic> _$CaptainToJson(Captain instance) => <String, dynamic>{
      'uid': instance.uid,
      'rid': instance.rid,
    };

TourMembers _$TourMembersFromJson(Map<String, dynamic> json) {
  return TourMembers(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['dateline']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['online_status']),
    Util.parseInt(json['same_rid']),
    Util.parseInt(json['vip']),
    Util.parseBool(json['is_manager']),
    Util.parseBool(json['ban']),
  );
}

Map<String, dynamic> _$TourMembersToJson(TourMembers instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'dateline': instance.dateline,
      'sex': instance.sex,
      'online_status': instance.onlineStatus,
      'same_rid': instance.sameRid,
      'vip': instance.vip,
      'is_manager': instance.isManager,
      'ban': instance.ban,
    };
