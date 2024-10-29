import 'package:shared/shared.dart';

class MusicListResp extends BaseResponse {
  List<MusicPlayListItem> data = [];
  bool onlyAdminAdd;
  int currentSid;

  MusicListResp({
    success,
    msg,
    this.data = const <MusicPlayListItem>[],
    this.onlyAdminAdd = false,
    this.currentSid = 0,
  }) : super(success: success, msg: msg);

  factory MusicListResp.fromJson(Map<String, dynamic> json) {
    return MusicListResp(
      success: Util.parseBool(json['success']),
      msg: Util.parseStr(json['msg']),
      data: Util.parseList<MusicPlayListItem>(
          json['data'], (e) => MusicPlayListItem.fromJson(e)),
      onlyAdminAdd: Util.parseBool(json["only_admin_add"], false),
      currentSid: Util.parseInt(json['current_sid'], 0),
    );
  }

  bool isListEmpty() {
    return data.isEmpty;
  }
}

enum MusicOption {
  play,
  resume, //恢复播放
  pause,
  addLimit, //添加歌曲限制
  reset, //清空播放列表
  random, //随机播放，服务器会打乱顺序
  order, // 顺序播放，服务器会恢复顺序
  seek, // seek（trtc服务端推流，seek）
  prev, // 上一曲（trtc服务端推流，下一首）
  next, // 下一曲（trtc服务端推流，下一首）
  playmode, // 设置播放模式（trtc服务端推流，设置播放模式）
}

extension MusicOptionExt on MusicOption {
  String getApiValue() {
    return describeEnum(this);
  }
}

/// 本地音乐
const int PLAY_LIST_TYPE_LOCAL = 1;

/// 远端音乐
const int PLAY_LIST_TYPE_REMOTE = 2;

/// AME音乐
const int PLAY_LIST_TYPE_AME = 3;

/// Agora版权音乐
const int PLAY_LIST_TYPE_AGORA = 4;

/// zego 音集协
const int PLAY_LIST_TYPE_ZEGO = 5;

/// 音乐列表-音乐信息
class MusicPlayListItem {
  int sid;
  int uniqueId;
  String name;
  String resourcePath;

  /// 1 本地音乐，2 第三方音乐 3.AME音乐，4.Agora版权音乐, 5 zego版权音乐
  int type;

  /// 点歌用户信息
  MusicPlayListUser fromUser;

  MusicPlayListItem({
    required this.sid,
    required this.uniqueId,
    required this.name,
    required this.resourcePath,
    required this.type,
    required this.fromUser,
  });

  factory MusicPlayListItem.fromJson(Map<String, dynamic> json) {
    return MusicPlayListItem(
      sid: Util.parseInt(json["sid"]),
      uniqueId: Util.parseInt(json["unique_id"]),
      name: Util.parseStr(json["name"]) ?? '',
      resourcePath: Util.parseStr(json["resource_path"]) ?? '',
      type: Util.parseInt(json["type"]),
      fromUser: MusicPlayListUser.fromJson(json["from_user"] ?? {}),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicPlayListItem &&
          runtimeType == other.runtimeType &&
          sid == other.sid &&
          resourcePath == other.resourcePath;

  @override
  int get hashCode => sid.hashCode;
}

class MusicPlayListUser {
  int uid;
  String name;
  String icon;

  MusicPlayListUser({
    required this.uid,
    required this.name,
    required this.icon,
  });

  factory MusicPlayListUser.fromJson(Map<String, dynamic> json) {
    return MusicPlayListUser(
      uid: Util.parseInt(json["uid"]),
      name: Util.parseStr(json["name"]) ?? '',
      icon: Util.parseStr(json["icon"]) ?? '',
    );
  }
}

class DeleteSongReq {
  int sid;
  int uid;

  DeleteSongReq({
    required this.sid,
    required this.uid,
  });

  Map<String, dynamic> toJson() {
    return {
      "sid": sid,
      "uid": uid,
    };
  }
}
