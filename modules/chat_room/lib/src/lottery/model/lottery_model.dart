import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lottery_model.g.dart';

class LotteryOption {
  /// 房间ID
  final int rid;

  ///  1-公屏发言，2-赠送礼物
  String joinWay;

  /// 单次抽奖时长，单位秒
  int roundTime = 0;

  /// 本次抽奖次数
  int roundNum = 0;

  /// 抽奖间隔时长，单位秒
  int roundInterval = 0;

  /// 单次中奖人数
  int winnerNum = 0;

  /// 指定的发言内容
  String words;

  /// 赠送的礼物id
  int giftId;

  LotteryOption(this.rid, this.joinWay, this.roundTime, this.roundNum,
      this.roundInterval, this.winnerNum, this.words, this.giftId);

  static LotteryOption createDefault(int roomId) {
    return LotteryOption(roomId, LotteryType.TYPE_TEXT, 0, 0, 0, 0, '', 0);
  }

  @override
  String toString() {
    return '{rid: $rid, roundTime: $roundTime, roundNum: $roundNum, roundInterval: $roundInterval, winnerNum: $winnerNum, words: $words';
  }
}

@JsonSerializable(createToJson: false)
class LotteryRecord {
  /// 抽奖记录ID
  @JsonKey(name: 'id', fromJson: Util.parseInt)
  final int id;

  /// 抽奖设置ID
  @JsonKey(name: 'setting_id', fromJson: Util.parseInt)
  final int settingId;

  /// 第几轮抽奖
  @JsonKey(name: 'round', fromJson: Util.parseInt)
  final int round;

  /// 指定的发言内容
  @JsonKey(name: 'words', fromJson: Util.notNullStr, defaultValue: '')
  final String words;
  @JsonKey(name: 'create_time', fromJson: Util.notNullStr)
  final String createTime;

  @JsonKey(name: 'join_way')
  final String joinWay;

  LotteryRecord(this.id, this.settingId, this.round, this.words,
      this.createTime, this.joinWay);

  factory LotteryRecord.fromJson(Map<String, dynamic> json) =>
      _$LotteryRecordFromJson(json);
}

@JsonSerializable(createToJson: false)
class LotteryRecordResponse {
  @JsonKey(name: 'list')
  final List<LotteryRecord> records;

  LotteryRecordResponse(this.records);

  factory LotteryRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$LotteryRecordResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class LotteryWinner {
  /// 用户uid
  final int uid;

  /// 用户名
  final String name;

  /// 用户icon
  final String icon;

  LotteryWinner(this.uid, this.name, this.icon);

  factory LotteryWinner.fromJson(json) {
    return LotteryWinner(
      Util.parseInt(json['uid']),
      Util.notNullStr(json['name']),
      Util.getRemoteImgUrl(Util.parseStr(json['icon'])),
    );
  }
}

@JsonSerializable(createToJson: false)
class LotteryWinners {
  @JsonKey(name: 'title', fromJson: Util.notNullStr)
  String title;
  @JsonKey(name: 'list')
  List<LotteryWinner> winners;

  LotteryWinners(this.title, this.winners);

  factory LotteryWinners.fromJson(Map<String, dynamic> json) =>
      _$LotteryWinnersFromJson(json);
}

@JsonSerializable(createToJson: false)
class LotteryInfo {
  /// id
  /// @JsonKey(name: 'id', fromJson: Util.parseInt)
  /// final int id;
  /// 用户名
  @JsonKey(name: 'admin_name', fromJson: Util.notNullStr)
  final String name;

  /// 条件
  @JsonKey(name: 'words', fromJson: Util.notNullStr)
  final String condition;
  @JsonKey(name: 'round_time', fromJson: Util.parseInt)
  final int roundTime;
  @JsonKey(name: 'start_time', fromJson: Util.parseInt)
  final int startTime;

  /// 当前服务器的时间
  @JsonKey(name: 'now', fromJson: Util.parseInt)
  final int now;

  /// 当前用户是否已参与本次抽奖：0，未参与；1，已参与
  @JsonKey(name: 'joined', fromJson: Util.parseInt)
  int joined;

  /// 参与抽奖的成员
  @JsonKey(name: 'members')
  final List<LotteryWinner> members;

  @JsonKey(name: 'join_way')
  final String joinWay;

  @JsonKey(name: 'gift_id')
  final int giftId;

  @JsonKey(name: 'gift_name')
  final String giftName;

  /// 是否已参与本次抽奖
  bool get isJoined => (joined) == 1;

  LotteryInfo(
    this.name,
    this.condition,
    this.roundTime,
    this.startTime,
    this.now,
    this.joined,
    this.members,
    this.joinWay,
    this.giftId,
    this.giftName,
  );

  factory LotteryInfo.fromJson(Map<String, dynamic> json) =>
      _$LotteryInfoFromJson(json);
}

abstract class ILottery {
  int get id;
}

/// 抽奖开始
class LotteryStart implements ILottery {
  final int rid;

  /// 抽奖ID
  final int lotteryId;
  final int round;
  final int roundTime;
  final int startTime;
  final int now;
  final String words;

  LotteryStart(this.rid, this.lotteryId, this.round, this.roundTime,
      this.startTime, this.now, this.words);

  @override
  int get id => lotteryId;

  /// 抽奖活动是否已过期
  bool get expire => (now - startTime) > roundTime;

  /// 剩余的倒计时时间
  int get remain => roundTime - (now - startTime);

  factory LotteryStart.fromJson(json) {
    return LotteryStart(
      Util.parseInt(json['rid']),
      Util.parseInt(json['lottery_id']),
      Util.parseInt(json['round']),
      Util.parseInt(json['round_time']),
      Util.parseInt(json['start_time']),
      Util.parseInt(json['now']),
      Util.notNullStr(json['words']),
    );
  }
}

/// 开奖信息
class LotteryDraw implements ILottery {
  /// 房间ID
  final int rid;

  /// 抽奖ID
  final int lotteryId;

  /// 用户角色：0，普通用户；1，房主或接待
  final int admin;

  /// 1-公屏发言，2-赠送礼物
  final String joinWay;

  /// 参与的用户是否中奖
  final bool win;

  final List<LotteryWinner> winners;

  LotteryDraw(this.rid, this.lotteryId, this.admin, this.winners, this.joinWay,
      this.win);

  @override
  int get id => lotteryId;

  /// 是否为普通用户
  bool get isNormalUser => admin == 0;

  /// 是否为房主或接待
  bool get isCreatorOrReception => admin == 1;

  /// 当前用户是否中奖
  bool get isWinner {
    for (var e in winners) {
      if ((e.uid) == (Session.uid)) {
        return true;
      }
    }
    return false;
  }

  factory LotteryDraw.fromJson(json) {
    return LotteryDraw(
        Util.parseInt(json['rid']),
        Util.parseInt(json['lottery_id']),
        Util.parseInt(json['is_admin']),
        Util.parseList(json['winner_list'], (e) => LotteryWinner.fromJson(e)),
        Util.notNullStr(json['join_way']),
        Util.parseBool(json['win']));
  }

  @override
  String toString() {
    return 'LotteryDraw{rid: $rid, lotteryId: $lotteryId, admin: $admin, joinWay: $joinWay, win: $win, winners: $winners}';
  }
}

/// 抽奖结束
class LotteryEnd implements ILottery {
  /// 房间ID
  final int rid;

  /// 抽奖ID
  final int lotteryId;

  /// 中奖用户的UID
  final List<int> winnerIds;

  LotteryEnd(this.rid, this.lotteryId, this.winnerIds);

  /// 当前用户是否中奖
  bool get isWinner => winnerIds.contains(Session.uid);

  @override
  int get id => lotteryId;

  factory LotteryEnd.fromJson(json) {
    return LotteryEnd(
      Util.parseInt(json['rid']),
      Util.parseInt(json['lottery_id']),
      Util.parseList(json['winners'], (e) => Util.parseInt(e)),
    );
  }
}

/// 抽奖
class Lottery {
  static const _stateStart = 1;

  /// 进行中
  static const _stateDraw = 2;

  /// 开奖后
  static const _stateEnd = 3;

  /// 结束
  /// 房间id
  final int rid;

  /// 抽奖ID
  final int lotteryId;
  final int remain;

  /// 抽奖关键字
  final String words;

  /// 抽奖活动进行状态
  int _state = _stateStart;

  Lottery(this.rid, this.lotteryId, this.remain, this.words);

  /// 抽奖开奖
  void draw() {
    if (isEnd) return;
    _state = _stateDraw;
  }

  /// 抽奖结束
  void end() {
    _state = _stateEnd;
  }

  /// 活动是否正在进行中
  bool get isOnGoing => _state == _stateStart;

  /// 是否已经开过奖励
  bool get isDrawn => _state == _stateDraw;

  /// 中奖是否已结束
  bool get isEnd => _state == _stateEnd;

  /// 是否为同一个Lottery
  bool isSame(ILottery lottery) {
    return lotteryId == lottery.id;
  }

  @override
  String toString() {
    return '{rid: $rid, lotteryId: $lotteryId, remain: $remain, words: $words, _state: $_state}';
  }
}

class LotteryType {
  /// 公屏抽奖类型：发送特定文本
  static const TYPE_TEXT = '1';

  /// 公屏抽奖类型：礼物
  static const TYPE_GIFT = '2';

  String name;

  String type;

  LotteryType(this.name, this.type);

  static List<LotteryType> get types => [
        LotteryType(K.room_lottery_type_text, TYPE_TEXT),
        // LotteryType(K.room_lottery_type_gift, TYPE_GIFT),
      ];
}
