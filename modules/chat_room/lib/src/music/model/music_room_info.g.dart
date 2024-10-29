// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_room_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicRoomInfoResp _$MusicRoomInfoRespFromJson(Map<String, dynamic> json) {
  return MusicRoomInfoResp(
    success: Util.parseBool(json['success']),
    msg: json['msg'],
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MusicRoomInfoRespToJson(MusicRoomInfoResp instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['current_song'] == null
        ? null
        : CurrentSong.fromJson(json['current_song'] as Map<String, dynamic>),
    json['theme'] == null
        ? null
        : MusicTheme.fromJson(json['theme'] as Map<String, dynamic>),
    json['robot'] == null
        ? null
        : RemoteRobotInfo.fromJson(json['robot'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'current_song': instance.currentSong,
      'theme': instance.musicTheme,
      'robot': instance.robot,
    };

CurrentSong _$CurrentSongFromJson(Map<String, dynamic> json) {
  return CurrentSong(
    sid: Util.parseInt(json['sid']),
    name: Util.parseStr(json['name']) ?? '',
    resourcePath: Util.parseStr(json['resource_path']) ?? '',
    type: Util.parseInt(json['type']),
    fromUser: json['from_user'] == null
        ? null
        : FromUser.fromJson(json['from_user'] as Map<String, dynamic>),
    state: parseSongCtlState(Util.notNullStr(json['state'])),
    extra: json['extra'] == null
        ? null
        : Extra.fromJson(json['extra'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrentSongToJson(CurrentSong instance) =>
    <String, dynamic>{
      'sid': instance.sid,
      'name': instance.name,
      'resource_path': instance.resourcePath,
      'type': instance.type,
      'from_user': instance.fromUser,
      'state': _$MusicRoomStatusEnumMap[instance.state],
      'extra': instance.extra,
    };

const _$MusicRoomStatusEnumMap = {
  MusicRoomStatus.wait: 'wait',
  MusicRoomStatus.play: 'play',
  MusicRoomStatus.resume: 'resume',
  MusicRoomStatus.pause: 'pause',
};

RemoteRobotInfo _$RemoteRobotInfoFromJson(Map<String, dynamic> json) {
  return RemoteRobotInfo(
    robotUid: Util.parseInt(json['RobotUid']),
    playMode: Util.parseStr(json['PlayMode']) ?? '',
    currentSong: json['CurrentSong'] == null
        ? null
        : CurrentSong.fromJson(json['CurrentSong'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RemoteRobotInfoToJson(RemoteRobotInfo instance) =>
    <String, dynamic>{
      'RobotUid': instance.robotUid,
      'PlayMode': instance.playMode,
      'CurrentSong': instance.currentSong,
    };

FromUser _$FromUserFromJson(Map<String, dynamic> json) {
  return FromUser(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
  );
}

Map<String, dynamic> _$FromUserToJson(FromUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
    };

Extra _$ExtraFromJson(Map<String, dynamic> json) {
  return Extra(
    Util.parseInt(json['id']),
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['hash']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['url']) ?? '',
    Util.parseStr(json['ext']) ?? '',
  );
}

Map<String, dynamic> _$ExtraToJson(Extra instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'hash': instance.hash,
      'name': instance.name,
      'url': instance.url,
      'ext': instance.ext,
    };

MusicTheme _$MusicThemeFromJson(Map<String, dynamic> json) {
  return MusicTheme(
    Util.parseStr(json['theme']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['bg_url']) ?? '',
    Util.parseStr(json['bg_type']) ?? '',
    Util.parseStr(json['dynamic_icon']) ?? '',
    Util.parseStr(json['icon_type']) ?? '',
    Util.parseStr(json['dynamic_static_icon']) ?? '',
    Util.parseStr(json['dynamic_static_icon_type']) ?? '',
  );
}

Map<String, dynamic> _$MusicThemeToJson(MusicTheme instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'name': instance.name,
      'bg_url': instance.bgUrl,
      'bg_type': instance.bgType,
      'dynamic_icon': instance.dynamicIcon,
      'icon_type': instance.iconType,
      'dynamic_static_icon': instance.dynamicStaticIcon,
      'dynamic_static_icon_type': instance.dynamicStaticIconType,
    };

MusicRoomThemeDataRepo _$MusicRoomThemeDataRepoFromJson(
    Map<String, dynamic> json) {
  return MusicRoomThemeDataRepo(
    current: Util.parseStr(json['current']) ?? '',
    themes: Util.parseList(
        json['themes'], (e) => Themes.fromJson(e as Map<String, dynamic>)),
    msg: json['msg'],
    success: Util.parseBool(json['success']),
  );
}

Map<String, dynamic> _$MusicRoomThemeDataRepoToJson(
        MusicRoomThemeDataRepo instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'current': instance.current,
      'themes': instance.themes,
    };

Themes _$ThemesFromJson(Map<String, dynamic> json) {
  return Themes(
    Util.parseStr(json['url']) ?? '',
    Util.parseStr(json['type']) ?? '',
    Util.parseBool(json['enable']),
    Util.parseStr(json['message']) ?? '',
  );
}

Map<String, dynamic> _$ThemesToJson(Themes instance) => <String, dynamic>{
      'url': instance.url,
      'type': instance.type,
      'enable': instance.enable,
      'message': instance.message,
    };
