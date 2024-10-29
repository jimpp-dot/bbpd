import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_room_info.g.dart';

@JsonSerializable()
class MusicRoomInfoResp extends BaseResponse {
  @JsonKey(name: 'data')
  Data? data;

  MusicRoomInfoResp({success, msg, this.data})
      : super(success: success, msg: msg);

  factory MusicRoomInfoResp.fromJson(Map<String, dynamic> srcJson) =>
      _$MusicRoomInfoRespFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$MusicRoomInfoRespToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'current_song')
  CurrentSong? currentSong;

  @JsonKey(name: 'theme')
  MusicTheme? musicTheme;

  RemoteRobotInfo? robot;

  Data(this.currentSong, this.musicTheme, this.robot);

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

enum MusicRoomStatus {
  wait, //等待
  play, //播放中
  resume, //恢复播放中
  pause, //暂停
}

enum SongCtlType {
  play,
  resume,
  pause,
  reset,
}

MusicRoomStatus parseSongCtlState(String state) {
  if (state == 'play') {
    return MusicRoomStatus.play;
  } else if (state == 'pause') {
    return MusicRoomStatus.pause;
  } else if (state == 'resume') {
    return MusicRoomStatus.resume;
  }
  return MusicRoomStatus.wait;
}

SongCtlType? parseSongCtlType(String type) {
  if (type == 'play') {
    return SongCtlType.play;
  } else if (type == 'pause') {
    return SongCtlType.pause;
  } else if (type == 'reset') {
    return SongCtlType.reset;
  } else if (type == 'resume') {
    return SongCtlType.resume;
  }
  return null;
}

class SongCtrl {
  SongCtlType? type;

  CurrentSong? currentSong;

  SongCtrl({
    this.type,
    this.currentSong,
  });

  factory SongCtrl.fromJson(Map<String, dynamic> json) {
    return SongCtrl(
      type: parseSongCtlType(json["type"]),
      currentSong: json["current_song"] != null
          ? CurrentSong.fromJson(json["current_song"])
          : null,
    );
  }
}

@JsonSerializable()
class CurrentSong {
  @JsonKey(name: 'sid')
  int sid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'resource_path')
  String resourcePath;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'from_user')
  FromUser? fromUser;

  @JsonKey(name: 'state', fromJson: parseSongCtlState)
  MusicRoomStatus state;

  @JsonKey(name: 'extra')
  Extra? extra;

  CurrentSong({
    required this.sid,
    this.name = '',
    this.resourcePath = '',
    required this.type,
    this.fromUser,
    required this.state,
    this.extra,
  });

  factory CurrentSong.fromJson(Map<String, dynamic> srcJson) =>
      _$CurrentSongFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CurrentSongToJson(this);
}

@JsonSerializable()
class RemoteRobotInfo {
  @JsonKey(name: 'RobotUid')
  int robotUid;

  @JsonKey(name: 'PlayMode')
  String playMode;

  @JsonKey(name: 'CurrentSong')
  CurrentSong? currentSong;

  RemoteRobotInfo({
    required this.robotUid,
    this.playMode = '',
    this.currentSong,
  });

  factory RemoteRobotInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$RemoteRobotInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RemoteRobotInfoToJson(this);
}

@JsonSerializable()
class FromUser {
  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  String icon;

  FromUser(
    this.uid,
    this.name,
    this.icon,
  );

  factory FromUser.fromJson(Map<String, dynamic> srcJson) =>
      _$FromUserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FromUserToJson(this);
}

@JsonSerializable()
class Extra {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'hash')
  String hash;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'ext')
  String ext;

  Extra(
    this.id,
    this.type,
    this.hash,
    this.name,
    this.url,
    this.ext,
  );

  factory Extra.fromJson(Map<String, dynamic> srcJson) =>
      _$ExtraFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExtraToJson(this);
}

@JsonSerializable()
class MusicTheme {
  @JsonKey(name: 'theme')
  String theme;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'bg_url')
  String bgUrl;

  @JsonKey(name: 'bg_type')
  String bgType;

  @JsonKey(name: 'dynamic_icon')
  String dynamicIcon;

  @JsonKey(name: 'icon_type')
  String iconType;

  @JsonKey(name: 'dynamic_static_icon')
  String dynamicStaticIcon;

  @JsonKey(name: 'dynamic_static_icon_type')
  String dynamicStaticIconType;

  MusicTheme(
    this.theme,
    this.name,
    this.bgUrl,
    this.bgType,
    this.dynamicIcon,
    this.iconType,
    this.dynamicStaticIcon,
    this.dynamicStaticIconType,
  );

  factory MusicTheme.fromJson(Map<String, dynamic> srcJson) =>
      _$MusicThemeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MusicThemeToJson(this);
}

/// 列表数据
@JsonSerializable()
class MusicRoomThemeDataRepo extends BaseResponse {
  @JsonKey(name: 'current')
  String current;

  @JsonKey(name: 'themes')
  List<Themes> themes;

  MusicRoomThemeDataRepo(
      {this.current = '', this.themes = const <Themes>[], msg, success})
      : super(success: success, msg: msg);

  factory MusicRoomThemeDataRepo.fromJson(Map<String, dynamic> srcJson) =>
      _$MusicRoomThemeDataRepoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$MusicRoomThemeDataRepoToJson(this);
}

@JsonSerializable()
class Themes {
  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'enable')
  bool enable;

  @JsonKey(name: 'message')
  String message;

  Themes(
    this.url,
    this.type,
    this.enable,
    this.message,
  );

  factory Themes.fromJson(Map<String, dynamic> srcJson) =>
      _$ThemesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ThemesToJson(this);
}
