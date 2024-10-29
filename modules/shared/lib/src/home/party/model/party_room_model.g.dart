// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartyRoomGridItem _$PartyRoomGridItemFromJson(Map<String, dynamic> json) {
  return PartyRoomGridItem(
    Util.parseInt(json['rid']),
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['live_cover_icon']),
    Util.parseStr(json['live_tag_icon']),
    Util.parseInt(json['hot_num']),
    Util.parseBool(json['show_hot']),
    Util.parseStr(json['left_frame']),
    Util.parseStr(json['left_frame_new']),
    Util.parseStr(json['uname']),
    Util.parseStr(json['label']),
    Util.parseStr(json['property']),
    onlineUserIcons: (json['online_user_icons'] as List?)
        ?.map((e) => Util.parseStr(e))
        .toList(),
  );
}

FastEntryRoom _$FastEntryRoomFromJson(Map<String, dynamic> json) {
  return FastEntryRoom(
    Util.parseColors(json['bg_color']),
    Util.getRemoteImgUrl(Util.parseStr(json['icon'])),
    Util.parseStr(json['profile']),
    Util.parseStr(json['button_txt']),
    Util.parseStr(json['type']),
    Util.parseInt(json['need_verify_new']),
    Util.parseColor(json['text_color']),
    Util.getRemoteImgUrl(Util.parseStr(json['bg_img'])),
  );
}

PartyRoomResponse _$PartyRoomResponseFromJson(Map<String, dynamic> json) {
  return PartyRoomResponse(
    items: (json['list'] as List?)
        ?.map((e) => e == null
            ? null
            : PartyRoomGridItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasMore: Util.parseBool(json['more']),
    fastEntryRoom: json['fast_entry_room'] == null
        ? null
        : FastEntryRoom.fromJson(
            json['fast_entry_room'] as Map<String, dynamic>),
  );
}

PartyGodBean _$PartyGodBeanFromJson(Map<String, dynamic> json) {
  return PartyGodBean(
    Util.parseInt(json['uid']),
    Util.parseInt(json['rid']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['name']),
    Util.parseStr(json['desc']),
    Util.parseInt(json['status']),
    (json['skills'] as List?)
        ?.map((e) => e == null
            ? null
            : PartyGodSkillBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PartyGodBeanToJson(PartyGodBean instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'rid': instance.rid,
      'icon': instance.icon,
      'name': instance.name,
      'desc': instance.desc,
      'status': instance.status,
      'skills': instance.skills,
    };

PartyGodSkillBean _$PartyGodSkillBeanFromJson(Map<String, dynamic> json) {
  return PartyGodSkillBean(
    Util.parseStr(json['icon']),
    Util.parseStr(json['name']),
  );
}

Map<String, dynamic> _$PartyGodSkillBeanToJson(PartyGodSkillBean instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
    };
