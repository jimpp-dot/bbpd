import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:chat_room/src/ktv/model/ktv_song_manage_beans.dart';
import 'package:chat_room/src/ktv/model/sound_type.dart';
import 'package:chat_room/src/ktv/utils/ktv_lrc_util.dart';
import '../../protobuf/generated/common_ktv.pb.dart';

part 'song_sheet_beans.g.dart';

//歌曲
@JsonSerializable(createToJson: false)
class Song {
  @JsonKey(fromJson: Util.parseInt)
  int id; //歌曲ID

  String name; //歌曲名称

  @JsonKey(name: 'photo', fromJson: Song.parseSongUrl)
  String icon; //歌曲封面

  @JsonKey(name: 'original_mp3', fromJson: Song.parseSongUrl)
  String originalUrl; //原唱文件地址

  @JsonKey(name: 'size', fromJson: Util.parseInt)
  int originalSize; //原唱文件大小

  @JsonKey(name: 'hq_music', fromJson: Song.parseSongUrl)
  String hqUrl; //伴奏文件地址

  @JsonKey(name: 'hq_size', fromJson: Util.parseInt)
  int hqSize; //伴奏文件大小

  /// 1 伴奏生成成功或者超时.
  /// 2 伴奏正在自动生成中,
  @JsonKey(name: 'hq_status', fromJson: Util.parseInt)
  int hqStatus;

  @JsonKey(name: 'singer_id', fromJson: Util.parseInt)
  int singerId; //歌手ID

  @JsonKey(name: 'singer_name')
  String singerName; //歌手名称

  @JsonKey(name: 'uploader_uid', fromJson: Util.parseInt)
  int uploaderId; //上传者uid

  @JsonKey(name: 'uploader_name')
  String uploaderName; //上传者name

  @JsonKey(name: 'uploader_photo')
  String uploaderIcon; //上传者头像

  @JsonKey(name: 'brc', fromJson: Song.parseSongUrl)
  String brcUrl;

  @JsonKey(name: 'choosed', fromJson: Util.parseBool)
  bool chose;

  /// 是否显示举报入口
  @JsonKey(name: 'show_accuse', fromJson: Util.parseBool)
  bool showAccuse;

  /// 0下架，1上架，-3永久禁止
  @JsonKey(name: 'status', fromJson: Util.parseInt)
  int status;

  @JsonKey(name: 'status_description', fromJson: Util.notNullStr)
  String statusDescription;

  @JsonKey(fromJson: Util.notNullStr)
  String platform;

  @JsonKey(name: 'playtime', fromJson: Util.parseInt)
  int playTime;

  @JsonKey(name: 'platform_song_id', fromJson: Util.parseInt)
  int platformSongId;

  @JsonKey(name: 'music_id', fromJson: Util.notNullStr)
  String musicId;

  @JsonKey(name: 'ordered_count', fromJson: Util.parseInt)
  int orderedCount;

  @JsonKey(name: 'order_uname', fromJson: Util.notNullStr)
  String orderUname;

  @JsonKey(name: 'song_mv', fromJson: Util.notNullStr)

  /// 歌曲的mv地址
  String? songMV;

  Song({
    this.id = 0,
    this.name = '',
    this.icon = '',
    this.originalUrl = '',
    this.originalSize = 0,
    this.hqUrl = '',
    this.hqSize = 0,
    this.hqStatus = 0,
    this.singerId = 0,
    this.singerName = '',
    this.uploaderId = 0,
    this.uploaderName = '',
    this.uploaderIcon = '',
    this.brcUrl = '',
    this.chose = false,
    this.showAccuse = false,
    this.status = 0,
    this.statusDescription = '',
    this.platform = '',
    this.playTime = 0,
    this.platformSongId = 0,
    this.musicId = '',
    this.orderedCount = 0,
    this.orderUname = '',
    this.songMV = '',
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  static String parseSongUrl(String url) {
    if (Util.isStringEmpty(url)) {
      return "";
    }

    if (url.startsWith("http")) {
      return url;
    }
    return '${System.songDomain}$url';
  }

  /// 更新伴奏文件相关数据
  void updateHqMusicData(SongItem data) {
    if (!Util.isStringEmpty(data.hqMusic) && data.hqSize > 0) {
      Log.d(
          'Song id:$id updateHqMusicData hqUrl:${data.hqMusic},hqSize:${data.hqSize},hqStatus:${data.hqStatus}');
      hqUrl = data.hqMusic;
      hqSize = data.hqSize;
      hqStatus = data.hqStatus;
    }
  }

  int get pid {
    if (platform == SongPlatform.KUGOU) {
      return platformSongId;
    }
    return id;
  }
}

//排麦的歌曲
@JsonSerializable(createToJson: false)
class RequestedSong extends Song {
  @JsonKey(name: 'request_uid')
  int requestUid; //点唱者uid
  @JsonKey(name: 'request_uname')
  String requestUName; //点唱者name

  RequestedSong({
    required this.requestUid,
    required this.requestUName,
    required super.id,
    required super.name,
    required super.icon,
    required super.originalUrl,
    required super.originalSize,
    required super.hqUrl,
    required super.hqSize,
    required super.hqStatus,
    required super.singerId,
    required super.singerName,
    required super.uploaderId,
    required super.uploaderName,
    required super.uploaderIcon,
    required super.brcUrl,
    required super.chose,
    required super.showAccuse,
    required super.status,
    required super.statusDescription,
    required super.platform,
    required super.playTime,
    required super.platformSongId,
    required super.songMV,
    required super.musicId,
    required super.orderedCount,
    required super.orderUname,
  });

  factory RequestedSong.fromJson(Map<String, dynamic> json) =>
      _$RequestedSongFromJson(json);
}

//推荐tab
@JsonSerializable(createToJson: false)
class RcmdTab {
  static const int TYPE_MINE = 10002; // 我上传的
  static const int TYPE_ROOM_HASSING = 10003; // 房间唱过
  static const int TYPE_SEARCH_RCMD = 10004; // 好友在唱
  static const int TYPE_ROOM_ORDERED = 10005; // 房间历史已点

  int type;
  String title;

  RcmdTab(this.type, this.title);

  factory RcmdTab.fromJson(Map<String, dynamic> json) =>
      _$RcmdTabFromJson(json);

  @override
  String toString() {
    return 'RcmdTab{type: $type, title: $title}';
  }
}

@JsonSerializable(createToJson: false)
class RcmdSongListRsp extends BaseResponse with PageListResponse<Song> {
  List<RcmdTab> tabs;

  @JsonKey(name: 'list')
  List<Song> songs;

  @JsonKey(name: 'show_search')
  bool showSearch;

  RcmdSongListRsp(
      {super.success,
      super.msg,
      this.tabs = const [],
      this.songs = const [],
      this.showSearch = false});

  factory RcmdSongListRsp.fromJson(Map<String, dynamic> json) =>
      _$RcmdSongListRspFromJson(json);

  @override
  List<Song> get items => songs;
}

@JsonSerializable(createToJson: false)
class SongSearchResultRsp extends BaseResponse with PageListResponse<Object> {
  @JsonKey(name: 'data')
  List<Song> songs;

  SongSearchResultRsp({super.success, super.msg, this.songs = const []});

  factory SongSearchResultRsp.fromJson(Map<String, dynamic> json) =>
      _$SongSearchResultRspFromJson(json);

  @override
  List<Object> get items => songs;
}

@JsonSerializable(createToJson: false)
class SongSearchHistoryRsp extends BaseResponse {
  @JsonKey(name: 'data')
  List<String> queryList;

  SongSearchHistoryRsp({super.success, super.msg, this.queryList = const []});

  factory SongSearchHistoryRsp.fromJson(Map<String, dynamic> json) =>
      _$SongSearchHistoryRspFromJson(json);
}

@JsonSerializable(createToJson: false)
class SingerSongListRsp extends BaseResponse with PageListResponse<Song> {
  @JsonKey(name: 'data')
  List<Song> songs;

  SingerSongListRsp({super.success, super.msg, this.songs = const []});

  factory SingerSongListRsp.fromJson(Map<String, dynamic> json) =>
      _$SingerSongListRspFromJson(json);

  @override
  List<Song> get items => songs;
}

@JsonSerializable(createToJson: false)
class RequestedSongListRsp extends BaseResponse {
  @JsonKey(name: 'data')
  List<RequestedSong> songs;

  @JsonKey(name: 'ordered_num', fromJson: Util.parseInt)
  int orderedNum;

  RequestedSongListRsp(
      {super.success, super.msg, this.songs = const [], this.orderedNum = 0});

  factory RequestedSongListRsp.fromJson(Map<String, dynamic> json) =>
      _$RequestedSongListRspFromJson(json);
}

/*
* 1.17.0 ktv 接入新的曲库接口, 点歌搜索接口使用 pb 数据格式返回（ResMusicSearch），无法兼容之前的 PageListResponse
* 迫于无奈，故使用 SongSheetSongListRespV2 作为桥接，以后等 json 全部迁移到 pb 后，直接删除该类即可
* */
class SongSheetSongListRespV2 extends BaseResponse with PageListResponse<Song> {
  final dynamic innerResp;

  SongSheetSongListRespV2({super.success, super.msg, this.innerResp});

  @override
  bool get success {
    if (innerResp == null) {
      return false;
    }
    if (innerResp is ResMusicSearch) {
      ResMusicSearch musicSearchResp = innerResp;
      return musicSearchResp.success;
    }
    if (innerResp is ResMusicTapList) {
      ResMusicTapList musicTabResp = innerResp;
      return musicTabResp.success;
    }
    return false;
  }

  @override
  String get msg {
    if (innerResp == null) {
      return "";
    }
    if (innerResp is ResMusicSearch) {
      ResMusicSearch musicSearchResp = innerResp;
      return musicSearchResp.msg;
    }
    if (innerResp is ResMusicTapList) {
      ResMusicTapList musicTabResp = innerResp;
      return musicTabResp.msg;
    }
    return "";
  }

  @override
  List<Song> get items {
    if (innerResp == null) {
      return [];
    }

    /// 将 MusicInfoSet 桥接成 Song
    if (innerResp is ResMusicSearch) {
      ResMusicSearch musicSearchResp = innerResp;
      return musicSearchResp.data.info
          .map((e) =>
              KtvLrcUtil.songFromMusicInfo(e, musicSearchResp.data.platform))
          .toList();
    }
    if (innerResp is ResMusicTapList) {
      ResMusicTapList musicTabResp = innerResp;
      return musicTabResp.data.info
          .map((e) =>
              KtvLrcUtil.songFromMusicInfo(e, musicTabResp.data.base.platform))
          .toList();
    }
    return [];
  }

  @override
  bool get hasMore {
    if (innerResp == null) {
      return false;
    }
    if (innerResp is ResMusicSearch) {
      ResMusicSearch musicSearchResp = innerResp;
      return musicSearchResp.data.info.isNotEmpty; // 只要有数据就默认存在下一页
    }
    if (innerResp is ResMusicTapList) {
      ResMusicTapList musicTabResp = innerResp;
      return musicTabResp.data.info.isNotEmpty; // 只要有数据就默认存在下一页
    }
    return false;
  }
}
