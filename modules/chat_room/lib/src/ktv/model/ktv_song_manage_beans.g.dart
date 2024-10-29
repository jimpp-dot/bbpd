// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ktv_song_manage_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MySongListResp _$MySongListRespFromJson(Map<String, dynamic> json) {
  return MySongListResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : MySongList.fromJson(json['data'] as Map<String, dynamic>),
  );
}

MySongList _$MySongListFromJson(Map<String, dynamic> json) {
  return MySongList(
    Util.parseList(
        json['list'], (e) => MySongItem.fromJson(e as Map<String, dynamic>)),
    Util.parseBool(json['share']),
    Util.parseBool(json['more']),
  );
}

MySongItem _$MySongItemFromJson(Map<String, dynamic> json) {
  return MySongItem(
    id: Util.parseInt(json['id']),
    name: Util.notNullStr(json['name']),
    singer: Util.notNullStr(json['singer_name']),
    shareUser: Util.notNullStr(json['from_user_name']),
    originalMp3: Song.parseSongUrl(Util.notNullStr(json['original_mp3'])),
    hqMusic: Song.parseSongUrl(Util.notNullStr(json['hq_music'])),
    hqSize: Util.parseInt(json['hq_size']),
    hqStatus: Util.parseInt(json['hq_status']),
    brc: Song.parseSongUrl(Util.notNullStr(json['brc'])),
  );
}

MySongDetailResp _$MySongDetailRespFromJson(Map<String, dynamic> json) {
  return MySongDetailResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : MySongItem.fromJson(json['data'] as Map<String, dynamic>),
  );
}

SongItem _$SongItemFromJson(Map<String, dynamic> json) {
  return SongItem(
    id: Util.parseInt(json['id']),
    name: Util.notNullStr(json['name']),
    singer: Util.notNullStr(json['singer_name']),
    shareUser: Util.notNullStr(json['from_user_name']),
    originalMp3: Song.parseSongUrl(Util.notNullStr(json['original_mp3'])),
    hqMusic: Song.parseSongUrl(Util.notNullStr(json['hq_music'])),
    hqSize: Util.parseInt(json['hq_size']),
    hqStatus: Util.parseInt(json['hq_status']),
    brc: Song.parseSongUrl(Util.notNullStr(json['brc'])),
  );
}

SongDetailResp _$SongDetailRespFromJson(Map<String, dynamic> json) {
  return SongDetailResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : SongItem.fromJson(json['data'] as Map<String, dynamic>),
  );
}
