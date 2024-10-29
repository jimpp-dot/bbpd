import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';
part 'room_guess_queue_data.g.dart';

@JsonSerializable(createToJson: false)
class GuessQueueRoomConfigData {
  int version;
  int state;
  int turns;
  @JsonKey(name: 'cate_id')
  int cateId;
  @JsonKey(name: 'state_deadline')
  int deadline;
  @JsonKey(name: 'cate_name')
  String cateName;
  @JsonKey(name: 'line_uid')
  int lineUid;
  @JsonKey(name: 'replay_start_time')
  int replayStartTime;

  List<Gift> gift;

  /// 画猜复盘
  GuessQueueReplay? replay;

  /// 投票该条线是否成功
  @JsonKey(name: 'replay_comment')
  GuessQueueRePlayComment? replayComment;

  /// 选择喜欢和展示喜欢的画
  @JsonKey(name: 'replay_like')
  GuessQueueRePlayLike? replayLike;

  GuessQueueRoomConfigData(
      this.version,
      this.state,
      this.turns,
      this.replay,
      this.replayComment,
      this.replayLike,
      this.cateId,
      this.deadline,
      this.cateName,
      this.gift,
      this.lineUid,
      this.replayStartTime);

  factory GuessQueueRoomConfigData.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueRoomConfigDataFromJson(json);

  //游戏状态
  static const STATE_WAIT = 0; //未开始
  static const STATE_CHOOSE = 1; // 服务端临界状态，客户端不做处理
  static const STATE_DRAW = 2; //画
  static const STATE_GUESS = 4; //猜
  static const STATE_REPLAY = 6; //复盘画猜
  static const STATE_REPLAY_COMMENT = 7; //评价
  static const STATE_REPLAY_LIKE = 8; //选喜欢
  static const STATE_RESULT = 9; //公布结果
  static const STATE_PRE_REPLAY = 10;

  @override
  String toString() {
    return 'GuessQueueRoomConfigData{version: $version, state: $state, turns: $turns, cateId: $cateId, deadline: $deadline, cateName: $cateName}';
  } //准备复盘
}

@JsonSerializable(createToJson: false)
class GuessQueueReplay {
  @JsonKey(name: 'owner_info')
  GuessQueueOwnerInfo? ownerInfo;

  @JsonKey(name: 'drawer_info')
  GuessQueueDrawerInfo? drawerInfo;

  @JsonKey(name: 'guesser_info')
  GuessQueueGuesserInfo? guesserInfo;

  @JsonKey(name: 'total_turns')
  int totalTurns;

  @JsonKey(name: 'current_turns')
  int currentTurns;

  GuessQueueReplay(this.ownerInfo, this.drawerInfo, this.guesserInfo,
      this.totalTurns, this.currentTurns);

  factory GuessQueueReplay.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueReplayFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessQueueOwnerInfo {
  int uid;
  String icon;
  String word;
  @JsonKey(name: 'line_id')
  int lineId;

  GuessQueueOwnerInfo(this.uid, this.icon, this.word, this.lineId);

  factory GuessQueueOwnerInfo.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueOwnerInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessQueueDrawerInfo {
  int uid;
  String icon;
  @JsonKey(name: 'guess_image')
  String guessImage;
  @JsonKey(name: 'last_guess_word')
  String lastGuessWord;

  GuessQueueDrawerInfo(
      this.uid, this.icon, this.guessImage, this.lastGuessWord);

  factory GuessQueueDrawerInfo.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueDrawerInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessQueueGuesserInfo {
  int uid;
  String icon;
  @JsonKey(name: 'guess_word')
  String guessWord;

  GuessQueueGuesserInfo(this.uid, this.icon, this.guessWord);

  factory GuessQueueGuesserInfo.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueGuesserInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessQueueRePlayComment {
  @JsonKey(name: 'from_word')
  String fromWord;

  @JsonKey(name: 'line_id')
  int lineId;

  @JsonKey(name: 'to_word')
  String toWord;

  String image;

  /// 投票结果，<uid, vote>, vote: 1为suc，0为fail
  Map<int, int>? vote;

  GuessQueueRePlayComment(
      this.fromWord, this.toWord, this.image, this.vote, this.lineId);

  factory GuessQueueRePlayComment.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueRePlayCommentFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessQueueRePlayLikeImage {
  int uid;

  @JsonKey(name: 'guess_image')
  String image;

  String icon;

  String name;

  GuessQueueRePlayLikeImage(this.uid, this.image, this.icon, this.name);

  factory GuessQueueRePlayLikeImage.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueRePlayLikeImageFromJson(json);
}

@JsonSerializable(createToJson: false)
class GuessQueueRePlayLike {
  @JsonKey(name: 'line_id')
  int lineId;

  /// 线的主人uid
  @JsonKey(name: 'line_uid')
  int lineUid;

  @JsonKey(name: 'line_icon')
  String lineIcon;

  /// 已选择喜欢的画，根据这个判断阶段：GuessQueueState.SelectPictureEnd还是GuessQueueState.SelectPicture
  GuessQueueRePlayLikeImage? like;

  /// 代选择的喜欢的图片列表
  List<GuessQueueRePlayLikeImage> images;

  GuessQueueRePlayLike(
      this.lineId, this.lineUid, this.like, this.images, this.lineIcon);

  factory GuessQueueRePlayLike.fromJson(Map<String, dynamic> json) =>
      _$GuessQueueRePlayLikeFromJson(json);
}
