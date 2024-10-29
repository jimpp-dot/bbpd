import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/ktv/utils/ktv_url_file_util.dart';

import 'song_sheet_beans.dart';

part 'ktv_song_manage_beans.g.dart';

@JsonSerializable(createToJson: false)
class MySongListResp extends BaseResponse with PageListResponse<MySongItem> {
  MySongList? data;

  MySongListResp({super.success, super.msg, this.data});

  factory MySongListResp.fromJson(Map<String, dynamic> json) =>
      _$MySongListRespFromJson(json);

  @override
  List<MySongItem>? get items => data?.list;

  @override
  bool get hasMore => data?.more == true;
}

@JsonSerializable(createToJson: false)
class MySongList {
  List<MySongItem> list;

  bool share;

  bool more;

  MySongList(this.list, this.share, this.more);

  factory MySongList.fromJson(Map<String, dynamic> json) =>
      _$MySongListFromJson(json);
}

@JsonSerializable(createToJson: false)
class MySongItem {
  int id;

  String name;

  @JsonKey(name: 'singer_name')
  String singer;

  @JsonKey(name: 'from_user_name')
  String shareUser;

  @JsonKey(name: 'original_mp3', fromJson: Song.parseSongUrl)
  String originalMp3;

  @JsonKey(name: 'hq_music', fromJson: Song.parseSongUrl)
  String hqMusic;

  @JsonKey(name: 'hq_size', fromJson: Util.parseInt)
  int hqSize; //伴奏文件大小

  @JsonKey(name: 'hq_status', fromJson: Util.parseInt)
  int hqStatus;

  @JsonKey(name: 'brc', fromJson: Song.parseSongUrl)
  String brc;

  MySongItem({
    required this.id,
    required this.name,
    required this.singer,
    required this.shareUser,
    required this.originalMp3,
    required this.hqMusic,
    required this.hqSize,
    required this.hqStatus,
    required this.brc,
  });

  factory MySongItem.fromJson(Map<String, dynamic> json) =>
      _$MySongItemFromJson(json);

  String get orgFileName => KtvUrlFileUtil.getFileName(originalMp3);

  String get orgFileMd5 => KtvUrlFileUtil.getFileMd5(originalMp3);

  String get accFileName => KtvUrlFileUtil.getFileName(hqMusic);

  String get accFileMd5 => KtvUrlFileUtil.getFileMd5(hqMusic);

  String get lrcFileName => KtvUrlFileUtil.getFileName(brc);

  String get lrcFileMd5 => KtvUrlFileUtil.getFileMd5(brc);
}

@JsonSerializable(createToJson: false)
class MySongDetailResp extends BaseResponse {
  MySongItem? data;

  MySongDetailResp({super.success, super.msg, this.data});

  factory MySongDetailResp.fromJson(Map<String, dynamic> json) =>
      _$MySongDetailRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class SongItem {
  int id;

  String name;

  @JsonKey(name: 'singer_name')
  String singer;

  @JsonKey(name: 'from_user_name')
  String shareUser;

  @JsonKey(name: 'original_mp3', fromJson: Song.parseSongUrl)
  String originalMp3;

  @JsonKey(name: 'hq_music', fromJson: Song.parseSongUrl)
  String hqMusic;

  @JsonKey(name: 'hq_size', fromJson: Util.parseInt)
  int hqSize; //伴奏文件大小

  @JsonKey(name: 'hq_status', fromJson: Util.parseInt)
  int hqStatus;

  @JsonKey(name: 'brc', fromJson: Song.parseSongUrl)
  String brc;

  SongItem({
    required this.id,
    required this.name,
    required this.singer,
    required this.shareUser,
    required this.originalMp3,
    required this.hqMusic,
    required this.hqSize,
    required this.hqStatus,
    required this.brc,
  });

  factory SongItem.fromJson(Map<String, dynamic> json) =>
      _$SongItemFromJson(json);

  String get orgFileName => KtvUrlFileUtil.getFileName(originalMp3);

  String get orgFileMd5 => KtvUrlFileUtil.getFileMd5(originalMp3);

  String get accFileName => KtvUrlFileUtil.getFileName(hqMusic);

  String get accFileMd5 => KtvUrlFileUtil.getFileMd5(hqMusic);

  String get lrcFileName => KtvUrlFileUtil.getFileName(brc);

  String get lrcFileMd5 => KtvUrlFileUtil.getFileMd5(brc);
}

@JsonSerializable(createToJson: false)
class SongDetailResp extends BaseResponse {
  SongItem? data;

  SongDetailResp({super.success, super.msg, this.data});

  factory SongDetailResp.fromJson(Map<String, dynamic> json) =>
      _$SongDetailRespFromJson(json);
}
