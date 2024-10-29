// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_sheet_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
    id: Util.parseInt(json['id']),
    name: Util.notNullStr(json['name']),
    icon: Song.parseSongUrl(Util.notNullStr(json['photo'])),
    originalUrl: Song.parseSongUrl(Util.notNullStr(json['original_mp3'])),
    originalSize: Util.parseInt(json['size']),
    hqUrl: Song.parseSongUrl(Util.notNullStr(json['hq_music'])),
    hqSize: Util.parseInt(json['hq_size']),
    hqStatus: Util.parseInt(json['hq_status']),
    singerId: Util.parseInt(json['singer_id']),
    singerName: Util.notNullStr(json['singer_name']),
    uploaderId: Util.parseInt(json['uploader_uid']),
    uploaderName: Util.notNullStr(json['uploader_name']),
    uploaderIcon: Util.notNullStr(json['uploader_photo']),
    brcUrl: Song.parseSongUrl(Util.notNullStr(json['brc'])),
    chose: Util.parseBool(json['choosed']),
    showAccuse: Util.parseBool(json['show_accuse']),
    status: Util.parseInt(json['status']),
    statusDescription: Util.notNullStr(json['status_description']),
    platform: Util.notNullStr(json['platform']),
    playTime: Util.parseInt(json['playtime']),
    platformSongId: Util.parseInt(json['platform_song_id']),
    musicId: Util.notNullStr(json['music_id']),
    orderedCount: Util.parseInt(json['ordered_count']),
    orderUname: Util.notNullStr(json['order_uname']),
    songMV: Util.notNullStr(json['song_mv']),
  );
}

RequestedSong _$RequestedSongFromJson(Map<String, dynamic> json) {
  return RequestedSong(
    requestUid: Util.parseInt(json['request_uid']),
    requestUName: Util.notNullStr(json['request_uname']),
    id: Util.parseInt(json['id']),
    name: Util.notNullStr(json['name']),
    icon: Song.parseSongUrl(Util.notNullStr(json['photo'])),
    originalUrl: Song.parseSongUrl(Util.notNullStr(json['original_mp3'])),
    originalSize: Util.parseInt(json['size']),
    hqUrl: Song.parseSongUrl(Util.notNullStr(json['hq_music'])),
    hqSize: Util.parseInt(json['hq_size']),
    hqStatus: Util.parseInt(json['hq_status']),
    singerId: Util.parseInt(json['singer_id']),
    singerName: Util.notNullStr(json['singer_name']),
    uploaderId: Util.parseInt(json['uploader_uid']),
    uploaderName: Util.notNullStr(json['uploader_name']),
    uploaderIcon: Util.notNullStr(json['uploader_photo']),
    brcUrl: Song.parseSongUrl(Util.notNullStr(json['brc'])),
    chose: Util.parseBool(json['choosed']),
    showAccuse: Util.parseBool(json['show_accuse']),
    status: Util.parseInt(json['status']),
    statusDescription: Util.notNullStr(json['status_description']),
    platform: Util.notNullStr(json['platform']),
    playTime: Util.parseInt(json['playtime']),
    platformSongId: Util.parseInt(json['platform_song_id']),
    songMV: Util.notNullStr(json['song_mv']),
    musicId: Util.notNullStr(json['music_id']),
    orderedCount: Util.parseInt(json['ordered_count']),
    orderUname: Util.notNullStr(json['order_uname']),
  );
}

RcmdTab _$RcmdTabFromJson(Map<String, dynamic> json) {
  return RcmdTab(
    Util.parseInt(json['type']),
    Util.notNullStr(json['title']),
  );
}

RcmdSongListRsp _$RcmdSongListRspFromJson(Map<String, dynamic> json) {
  return RcmdSongListRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    tabs: Util.parseList(
        json['tabs'], (e) => RcmdTab.fromJson(e as Map<String, dynamic>)),
    songs: Util.parseList(
        json['list'], (e) => Song.fromJson(e as Map<String, dynamic>)),
    showSearch: Util.parseBool(json['show_search']),
  );
}

SongSearchResultRsp _$SongSearchResultRspFromJson(Map<String, dynamic> json) {
  return SongSearchResultRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    songs: Util.parseList(
        json['data'], (e) => Song.fromJson(e as Map<String, dynamic>)),
  );
}

SongSearchHistoryRsp _$SongSearchHistoryRspFromJson(Map<String, dynamic> json) {
  return SongSearchHistoryRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    queryList: Util.parseList(json['data'], (e) => Util.notNullStr(e)),
  );
}

SingerSongListRsp _$SingerSongListRspFromJson(Map<String, dynamic> json) {
  return SingerSongListRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    songs: Util.parseList(
        json['data'], (e) => Song.fromJson(e as Map<String, dynamic>)),
  );
}

RequestedSongListRsp _$RequestedSongListRspFromJson(Map<String, dynamic> json) {
  return RequestedSongListRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    songs: Util.parseList(
        json['data'], (e) => RequestedSong.fromJson(e as Map<String, dynamic>)),
    orderedNum: Util.parseInt(json['ordered_num']),
  );
}
