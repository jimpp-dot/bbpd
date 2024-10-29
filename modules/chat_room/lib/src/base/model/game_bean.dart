import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_bean.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class CloudGameData {
  /// 状态
  /// 1--排队中，2--排队结束（获取到了资源），3--游戏中，4--游戏时长不足
  @JsonKey(fromJson: CloudGameData.parseState)
  CloudGameState? state;

  /// 游戏数据
  CloudGameBean? gameInfo;

  /// 排队数据
  CloudGameQueueInfo? queueInfo;

  CloudGameData(this.state, this.gameInfo, this.queueInfo);

  factory CloudGameData.fromJson(Map<String, dynamic> json) =>
      _$CloudGameDataFromJson(json);

  bool get isQueue => state == CloudGameState.queue;

  bool get isReady => state == CloudGameState.ready;

  bool get isGaming => state == CloudGameState.gaming;

  bool get noDuration => state == CloudGameState.noDuration;

  /// 时长耗尽，还有5分钟的等待期

  bool get isQuickQueue => isQueue && queueInfo?.queueType == 'quick';

  static CloudGameState parseState(dynamic value) {
    int stateValue = Util.parseInt(value, 0);
    switch (stateValue) {
      case 1:
        return CloudGameState.queue;
      case 2:
        return CloudGameState.ready;
      case 3:
        return CloudGameState.gaming;
      case 4:
        return CloudGameState.noDuration;
      default:
        return CloudGameState.none;
    }
  }

  @override
  String toString() {
    return 'state:${state?.toString()}, gameInfo:${gameInfo?.toString()}, queueInfo: ${queueInfo?.toString()}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CloudGameData &&
            runtimeType == other.runtimeType &&
            state == other.state &&
            gameInfo == other.gameInfo &&
            queueInfo == other.queueInfo;
  }

  @override
  int get hashCode => Object.hash(state, gameInfo, queueInfo);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class CloudGameBean {
  /// 云游戏ID，每次排队生成一个
  final int cgiId;

  /// 游戏ID，游戏厂商配置
  @JsonKey(name: 'id')
  final String gameId;
  final String name;

  /// 游戏封面竖图
  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String icon;

  ///  游戏封面横图
  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String landscapeIcon;

  /// 直播拉流地址
  final String liveUrl;

  /// 游戏标签
  final List<String>? tag;

  /// 游戏用户信息
  @JsonKey(name: 'user_list')
  final List<GameUser>? users;

  /// 是否支持游戏存档
  final bool archiveSupport;

  @JsonKey(defaultValue: false)
  final bool hideMouse;

  /// 游戏类型
  @JsonKey(unknownEnumValue: CloudGameType.single)
  final CloudGameType gameType;

  /// 云游戏厂商：tencent、haima
  @JsonKey(unknownEnumValue: GameVendor.tencent)
  final GameVendor vendor;

  /// 海马云游戏配置数据
  final HaimaConfig? authentication;

  CloudGameBean(
    this.gameId,
    this.cgiId,
    this.name,
    this.icon,
    this.landscapeIcon,
    this.liveUrl,
    this.tag,
    this.users,
    this.archiveSupport,
    this.hideMouse,
    this.gameType,
    this.vendor,
    this.authentication,
  );

  factory CloudGameBean.fromJson(Map<String, dynamic> json) =>
      _$CloudGameBeanFromJson(json);

  bool get isMultiPlayer =>
      (users?.where((_) => (_.roleIndex ?? -1) >= 0).length ?? 0) >= 2;

  String get vendorString {
    return vendor.toString().split('.').last;
  }

  bool get showSetting {
    return vendor == GameVendor.tencent && hideMouse == false;
  }

  bool get showJoyStick {
    return vendor == GameVendor.tencent;
  }

  bool get showKeyboard {
    return vendor == GameVendor.tencent;
  }

  bool get showArchive {
    return vendor == GameVendor.tencent;
  }

  @override
  String toString() {
    return 'gameid:$gameId, cgiId:$cgiId, name:$name, liveUrl:$liveUrl, users:${users?.map((e) => e.toString())}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CloudGameBean &&
            runtimeType == other.runtimeType &&
            gameId == other.gameId &&
            cgiId == other.cgiId &&
            liveUrl == other.liveUrl &&
            users == other.users &&
            vendor == other.vendor &&
            authentication == other.authentication;
  }

  @override
  int get hashCode =>
      Object.hash(gameId, cgiId, liveUrl, users, authentication);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GameUser {
  int uid;
  int? roleIndex;

  @JsonKey(name: 'want_play_cloud_game')
  bool wantPlay;

  GameUser(this.uid, this.roleIndex, this.wantPlay);

  factory GameUser.fromJson(Map<String, dynamic> json) =>
      _$GameUserFromJson(json);

  @override
  String toString() {
    return 'uid:$uid, roleIndex:$roleIndex, wantPlay:$wantPlay';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GameUser &&
            runtimeType == other.runtimeType &&
            uid == other.uid &&
            roleIndex == other.roleIndex &&
            wantPlay == other.wantPlay;
  }

  @override
  int get hashCode => Object.hash(uid, roleIndex, wantPlay);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class CloudGameQueueInfo {
  /// 排队id
  final int id;

  /// 排第几位
  final int rank;

  /// 开始排队时间
  final int time;

  /// 剩余的可玩时长,单位：分
  final int remainDuration;

  /// normal普通排队 ，quick 插队
  final String queueType;

  /// 插队，超越多少人
  final int defeated;

  CloudGameQueueInfo(this.id, this.rank, this.time, this.remainDuration,
      this.queueType, this.defeated);

  factory CloudGameQueueInfo.fromJson(Map<String, dynamic> json) =>
      _$CloudGameQueueInfoFromJson(json);

  @override
  String toString() {
    return 'id:$id, rank:$rank, queueType:$queueType';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CloudGameQueueInfo &&
            runtimeType == other.runtimeType &&
            id == other.id &&
            rank == other.rank &&
            queueType == other.queueType;
  }

  @override
  int get hashCode => Object.hash(id, rank, queueType);
}

enum CloudGameType {
  single, //单人游戏
  multi, //多人游戏
}

enum CloudGameState {
  none, // 未排队
  queue, // 排队中
  ready, // 排队结束（获取到了资源）
  gaming, // 游戏中
  noDuration, // 游戏时长不足
}

@JsonSerializable(createToJson: false)
class DefeatedNum {
  final int defeated;

  DefeatedNum(this.defeated); // 插队，超越多少人

  factory DefeatedNum.fromJson(Map<String, dynamic> json) =>
      _$DefeatedNumFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class HaimaConfig {
  /// 接入商的唯一 ID，用来区分不同的接入商，该值由海马云分配
  final String bid;
  final String channelId;
  final String cToken;
  final String gameChannel;
  final String gamePkg;
  final String cid;
  final String pinCode;

  /// 选择流类型，0 代表 RTMP；1 代表 WEBRTC。不填写此参数，默 认 RTMP 流类型
  final int streamType;

  HaimaConfig(this.bid, this.channelId, this.cToken, this.gameChannel,
      this.gamePkg, this.cid, this.pinCode, this.streamType);

  factory HaimaConfig.fromJson(Map<String, dynamic> json) =>
      _$HaimaConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HaimaConfigToJson(this);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class CloudGameRcmdRoomData {
  final int rid;
  final String type;

  CloudGameRcmdRoomData(this.rid, this.type);

  factory CloudGameRcmdRoomData.fromJson(Map<String, dynamic> json) =>
      _$CloudGameRcmdRoomDataFromJson(json);
}

enum GameVendor {
  tencent,
  haima,
}
