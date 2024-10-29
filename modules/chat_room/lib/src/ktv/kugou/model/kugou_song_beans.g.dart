// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kugou_song_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KuGouBaseResp _$KuGouBaseRespFromJson(Map<String, dynamic> json) {
  return KuGouBaseResp(
    Util.parseInt(json['error_code']),
    Util.notNullStr(json['error_msg']),
    json['data'],
  );
}

AppInfoCode _$AppInfoCodeFromJson(Map<String, dynamic> json) {
  return AppInfoCode(
    Util.notNullStr(json['req_name']),
    Util.notNullStr(json['req_path']),
    Util.notNullStr(json['ticket']),
  );
}

QRCodeAuth _$QRCodeAuthFromJson(Map<String, dynamic> json) {
  return QRCodeAuth(
    Util.parseInt(json['expire']),
    Util.notNullStr(json['token']),
    Util.notNullStr(json['userid']),
  );
}

KuGouSongs _$KuGouSongsFromJson(Map<String, dynamic> json) {
  return KuGouSongs(
    Util.parseList(
        json['songs'], (e) => KuGouSong.fromJson(e as Map<String, dynamic>)),
  );
}

KuGouSong _$KuGouSongFromJson(Map<String, dynamic> json) {
  return KuGouSong(
    Util.parseInt(json['album_id']),
    Util.notNullStr(json['album_img']),
    Util.notNullStr(json['album_img_large']),
    Util.notNullStr(json['album_img_medium']),
    Util.notNullStr(json['album_img_small']),
    Util.notNullStr(json['album_name']),
    json['copyright'] == null
        ? null
        : CopyRight.fromJson(json['copyright'] as Map<String, dynamic>),
    json['distributor'] == null
        ? null
        : Distributor.fromJson(json['distributor'] as Map<String, dynamic>),
    Util.parseInt(json['has_accompany']),
    Util.parseInt(json['is_vip_song']),
    Util.parseInt(json['mv_id']),
    Util.parseInt(json['playable_code']),
    Util.parseInt(json['singer_id']),
    Util.notNullStr(json['singer_img']),
    Util.notNullStr(json['singer_name']),
    Util.parseInt(json['song_id']),
    Util.notNullStr(json['song_name']),
  );
}

CopyRight _$CopyRightFromJson(Map<String, dynamic> json) {
  return CopyRight(
    Util.parseInt(json['luyin']),
    Util.parseInt(json['ciqu']),
    Util.parseInt(json['tme']),
  );
}

Distributor _$DistributorFromJson(Map<String, dynamic> json) {
  return Distributor(
    Util.parseInt(json['distributor_id']),
    Util.notNullStr(json['distributor_name']),
  );
}

SongKrc _$SongKrcFromJson(Map<String, dynamic> json) {
  return SongKrc(
    Util.notNullStr(json['lyric']),
    Util.parseInt(json['offset']),
  );
}

Original _$OriginalFromJson(Map<String, dynamic> json) {
  return Original(
    Util.parseInt(json['status']),
    Util.parseInt(json['song_id']),
    Util.notNullStr(json['song_name']),
    Util.notNullStr(json['singer_name']),
    Util.notNullStr(json['song_url']),
    Util.parseInt(json['song_size']),
    Util.notNullStr(json['song_url_hq']),
    Util.notNullStr(json['song_size_hq']),
    Util.notNullStr(json['song_url_sq']),
    Util.notNullStr(json['song_size_sq']),
    Util.parseInt(json['duration']),
  );
}

Accompany _$AccompanyFromJson(Map<String, dynamic> json) {
  return Accompany(
    Util.parseInt(json['status']),
    Util.parseInt(json['accompany_size']),
    Util.notNullStr(json['accompany_url']),
    Util.notNullStr(json['krc_token']),
  );
}
