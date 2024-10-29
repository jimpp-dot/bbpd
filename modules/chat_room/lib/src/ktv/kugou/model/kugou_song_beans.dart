import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'kugou_song_beans.g.dart';

@JsonSerializable(createToJson: false)
class KuGouBaseResp {
  @JsonKey(name: 'error_code')
  int errorCode;

  @JsonKey(name: 'error_msg')
  String errorMsg;

  dynamic data;

  KuGouBaseResp(this.errorCode, this.errorMsg, this.data);

  factory KuGouBaseResp.fromJson(Map<String, dynamic> json) =>
      _$KuGouBaseRespFromJson(json);

  bool get success => errorCode == 0 && Util.isStringEmpty(errorMsg);

  @override
  String toString() {
    return 'KuGouBaseResp{errorCode: $errorCode, errorMsg: $errorMsg, data: $data}';
  }
}

@JsonSerializable(createToJson: false)
class AppInfoCode {
  @JsonKey(name: 'req_name')
  String reqName;

  @JsonKey(name: 'req_path')
  String reqPath;

  String ticket;

  AppInfoCode(this.reqName, this.reqPath, this.ticket);

  factory AppInfoCode.fromJson(Map<String, dynamic> json) =>
      _$AppInfoCodeFromJson(json);
}

@JsonSerializable(createToJson: false)
class QRCodeAuth {
  int expire;
  String token;

  String userid;

  QRCodeAuth(this.expire, this.token, this.userid);

  factory QRCodeAuth.fromJson(Map<String, dynamic> json) =>
      _$QRCodeAuthFromJson(json);
}

@JsonSerializable(createToJson: false)
class KuGouSongs {
  List<KuGouSong> songs;

  KuGouSongs(this.songs);

  factory KuGouSongs.fromJson(Map<String, dynamic> json) =>
      _$KuGouSongsFromJson(json);
}

@JsonSerializable(createToJson: false)
class KuGouSong {
  @JsonKey(name: 'album_id')
  int albumId;

  @JsonKey(name: 'album_img')
  String albumImg;

  @JsonKey(name: 'album_img_large')
  String albumImgLarge;

  @JsonKey(name: 'album_img_medium')
  String albumImgMedium;

  @JsonKey(name: 'album_img_small')
  String albumImgSmall;

  @JsonKey(name: 'album_name')
  String albumName;

  @JsonKey(name: 'copyright')
  CopyRight? copyRight;

  @JsonKey(name: 'distributor')
  Distributor? distributor;

  @JsonKey(name: 'has_accompany')
  int hasAccompany;

  @JsonKey(name: 'is_vip_song')
  int isVipSong;

  @JsonKey(name: 'mv_id')
  int mvId;

  @JsonKey(name: 'playable_code')
  int playableCode;

  @JsonKey(name: 'singer_id')
  int singerId;

  @JsonKey(name: 'singer_img')
  String singerImg;

  @JsonKey(name: 'singer_name')
  String singerName;

  @JsonKey(name: 'song_id')
  int songId;

  @JsonKey(name: 'song_name')
  String songName;

  KuGouSong(
      this.albumId,
      this.albumImg,
      this.albumImgLarge,
      this.albumImgMedium,
      this.albumImgSmall,
      this.albumName,
      this.copyRight,
      this.distributor,
      this.hasAccompany,
      this.isVipSong,
      this.mvId,
      this.playableCode,
      this.singerId,
      this.singerImg,
      this.singerName,
      this.songId,
      this.songName);

  factory KuGouSong.fromJson(Map<String, dynamic> json) =>
      _$KuGouSongFromJson(json);
}

@JsonSerializable(createToJson: false)
class CopyRight {
  int luyin;

  int ciqu;

  int tme;

  CopyRight(this.luyin, this.ciqu, this.tme);

  factory CopyRight.fromJson(Map<String, dynamic> json) =>
      _$CopyRightFromJson(json);
}

@JsonSerializable(createToJson: false)
class Distributor {
  @JsonKey(name: 'distributor_id')
  int distributorId;

  @JsonKey(name: 'distributor_name')
  String distributorName;

  Distributor(this.distributorId, this.distributorName);

  factory Distributor.fromJson(Map<String, dynamic> json) =>
      _$DistributorFromJson(json);
}

/// 歌词
@JsonSerializable(createToJson: false)
class SongKrc {
  String lyric;

  int offset;

  SongKrc(this.lyric, this.offset);

  factory SongKrc.fromJson(Map<String, dynamic> json) =>
      _$SongKrcFromJson(json);
}

/// 原唱
@JsonSerializable(createToJson: false)
class Original {
  int status;

  @JsonKey(name: 'song_id')
  int songId;

  @JsonKey(name: 'song_name')
  String songName;

  @JsonKey(name: 'singer_name')
  String singerName;

  @JsonKey(name: 'song_url')
  String songUrl;

  @JsonKey(name: 'song_size')
  int songSize;

  @JsonKey(name: 'song_url_hq')
  String songUrlHq;

  @JsonKey(name: 'song_size_hq')
  String songSizeHq;

  @JsonKey(name: 'song_url_sq')
  String songUrlSq;

  @JsonKey(name: 'song_size_sq')
  String songSizeSq;

  int duration;

  Original(
      this.status,
      this.songId,
      this.songName,
      this.singerName,
      this.songUrl,
      this.songSize,
      this.songUrlHq,
      this.songSizeHq,
      this.songUrlSq,
      this.songSizeSq,
      this.duration);

  factory Original.fromJson(Map<String, dynamic> json) =>
      _$OriginalFromJson(json);
}

/// 伴奏
@JsonSerializable(createToJson: false)
class Accompany {
  int status;

  @JsonKey(name: 'accompany_size')
  int accompanySize;

  @JsonKey(name: 'accompany_url')
  String accompanyUrl;

  @JsonKey(name: 'krc_token')
  String krcToken;

  Accompany(this.status, this.accompanySize, this.accompanyUrl, this.krcToken);

  factory Accompany.fromJson(Map<String, dynamic> json) =>
      _$AccompanyFromJson(json);
}

class WholeSong {
  Original? original;

  Accompany? accompany;

  SongKrc? krc;

  bool success;

  String msg;

  WholeSong(this.success, this.msg);

  WholeSong.success(
      this.original, this.accompany, this.krc, this.success, this.msg);
}
