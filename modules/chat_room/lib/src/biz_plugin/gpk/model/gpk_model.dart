import 'package:shared/shared.dart';
import 'package:chat_room/src/base/punish/model/punish_beans.dart';
import 'package:chat_room/src/base/punish/punish_model.dart';
import '../gpk_constants.dart';
import 'package:equatable/equatable.dart';

/// 创建PK设置UI界面-初始化数据
class GPKConfigResp extends BaseResponse {
  final GPKConfigData? data;

  GPKConfigResp({this.data, super.success, super.msg});

  factory GPKConfigResp.fromJson(Map<String, dynamic> json) {
    return GPKConfigResp(
      success: Util.parseBool(json['success']),
      msg: Util.parseStr(json['msg']),
      data: json['data'] is Map ? GPKConfigData.fromJson(json['data']) : null,
    );
  }
}

/// 创建PK设置UI界面-初始化数据Model
class GPKConfigData {
  final int pkRule;

  /// 是否计入金币礼物，1:计入，0不计入
  final int coinValid;
  final int pkTime;
  final int punishId;
  Map<int, PunishModel>? punishMap;

  bool hasPunishList() {
    return punishMap != null && punishMap!.isNotEmpty;
  }

  List<PunishModel> toPunishList() {
    return punishMap!.values.toList();
  }

  GPKConfigData({
    required this.pkRule,
    required this.coinValid,
    required this.pkTime,
    required this.punishId,
    this.punishMap,
  });

  factory GPKConfigData.fromJson(Map<String, dynamic> json) {
    var punishMap = json["system_punish"];
    Map<int, PunishModel>? convertMap;
    if (punishMap is Map) {
      convertMap = punishMap.map((key, value) {
        return MapEntry(Util.parseInt(key), PunishModel.fromJson(value));
      });
    }
    return GPKConfigData(
      pkRule: Util.parseInt(json["pk_rule"]),
      coinValid: Util.parseInt(json["coin_valid"]),
      pkTime: Util.parseInt(json["pk_time"], 60),
      punishId: Util.parseInt(json["punish_id"], -1),
      punishMap: convertMap,
    );
  }
}

class GPKRoomPkData extends Equatable {
  final GPKState state;
  final GPKSideData? leftSide;
  final GPKSideData? rightSide;
  final int pkRule; // pk规则：礼物还是投票
  final int pkTimeLeft;
  final int punishTimeLeft;
  final String? punishName;

  // --- 团战pk新增字段 ---

  // 贡献榜榜首
  final GPKUser? bestSender; // 有giftValue
  // 魅力榜榜首
  final GPKUser? bestReceiver; // 有score值

  const GPKRoomPkData({
    required this.state,
    this.leftSide,
    this.rightSide,
    required this.pkRule,
    required this.pkTimeLeft,
    required this.punishTimeLeft,
    this.punishName,
    this.bestSender,
    this.bestReceiver,
  });

  factory GPKRoomPkData.fromJson(Map<String, dynamic> json) {
    var state = parseGPKStatus(Util.parseStr(json['state']));
    var pkRule = Util.parseInt(json['pk_rule'], 0);
    return GPKRoomPkData(
      state: state,
      leftSide: json['left_side'] is Map
          ? GPKSideData.fromJson(json['left_side'])
          : null,
      rightSide: json['right_side'] is Map
          ? GPKSideData.fromJson(json['right_side'])
          : null,
      pkRule: pkRule,
      pkTimeLeft: Util.parseInt(json['pk_time_left']),
      punishTimeLeft: Util.parseInt(json['punish_time_left']),
      punishName: Util.parseStr(json['punish_name']),
      bestSender: json['best_sender'] is Map
          ? GPKUser.fromJson(json['best_sender'])
          : null,
      bestReceiver: json['best_receiver'] is Map
          ? GPKUser.fromJson(json['best_receiver'])
          : null,
    );
  }

  static GPKState parseGPKStatus(String? status) {
    if (status == null || status.isEmpty) return GPKState.unknown;
    return GPKState.values.firstWhere(
        (e) => e.toString().toLowerCase().endsWith(status.toLowerCase()),
        orElse: () => GPKState.unknown);
  }

  @override
  String toString() {
    return 'GPKRoomPkData{state: $state, leftSide: $leftSide, rightSide: $rightSide, pkRule: $pkRule, pkTimeLeft: $pkTimeLeft, punishTimeLeft: $punishTimeLeft, punishName: $punishName, bestSender: $bestSender, bestReceiver: $bestReceiver}';
  }

  @override
  List<Object?> get props => [
        state,
        leftSide,
        rightSide,
        pkRule,
        pkTimeLeft,
        punishTimeLeft,
        punishName,
        bestSender,
        bestReceiver,
      ];
}

class GPKSideData extends Equatable {
  final int total;
  final List<GPKPosModel> list;

  const GPKSideData({required this.total, required this.list});

  factory GPKSideData.fromJson(Map<String, dynamic> json) {
    return GPKSideData(
      total: Util.parseInt(json["total"], 0),
      list: Util.parseList<GPKPosModel>(
          json["list"], (e) => GPKPosModel.fromJson(e)),
    );
  }

  @override
  List<Object> get props => [total, list];

  @override
  String toString() {
    return 'GPKSideData{total: $total, list: $list}';
  }
}

class GPKResultData {
  final String? winnerSide; // 哪一方赢了，'red','blue','draw'
  final List<GPKUser> redList; // 有score值
  final List<GPKUser> blueList; // 有score值
  final int redTotal; // 红队总值
  final int blueTotal; // 蓝队总值
  final List<GPKUser> contributionList; // 贡献榜
  final int rule;
  final Prop? card; // 奖励给贡献榜首的道具(应援票)

  GPKResultData({
    this.winnerSide,
    required this.redList,
    required this.blueList,
    required this.redTotal,
    required this.blueTotal,
    required this.contributionList,
    required this.rule,
    this.card,
  });

  bool get redWin => winnerSide == 'red';

  bool get blueWin => winnerSide == 'blue';

  bool get draw => winnerSide == 'draw';

  factory GPKResultData.fromJson(Map json) {
    return GPKResultData(
      winnerSide: Util.parseStr(json['side']),
      redList:
          Util.parseList<GPKUser>(json['red_list'], (e) => GPKUser.fromJson(e)),
      blueList: Util.parseList<GPKUser>(
          json['blue_list'], (e) => GPKUser.fromJson(e)),
      redTotal: Util.parseInt(json['red_total']),
      blueTotal: Util.parseInt(json['blue_total']),
      contributionList: Util.parseList<GPKUser>(
          json['contribution'], (e) => GPKUser.fromJson(e)),
      rule: Util.parseInt(json['rule'], 1),
      card: json['card'] is Map ? Prop.fromJson(json['card']) : null,
    );
  }

  @override
  String toString() {
    return 'GPKResultData{winnerSide: $winnerSide, redList: $redList, blueList: $blueList, redTotal: $redTotal, blueTotal: $blueTotal, contributionList: $contributionList, rule: $rule, card: $card}';
  }
}

class Prop {
  final int uid;
  final String cardName;
  final String cardIcon;
  final int count;

  Prop(
      {required this.uid,
      required this.cardName,
      required this.cardIcon,
      required this.count});

  factory Prop.fromJson(Map<String, dynamic> json) {
    return Prop(
      uid: Util.parseInt(json['uid']),
      cardName: Util.notNullStr(json['card_name']),
      cardIcon: Util.notNullStr(json['card_icon']),
      count: Util.parseInt(json['count']),
    );
  }

  @override
  String toString() {
    return 'Prop{uid: $uid, cardName: $cardName, cardIcon: $cardIcon, count: $count}';
  }
}

class GPKUser extends Equatable {
  final int uid;
  final String icon;
  final String name;
  final int sex;
  final int score;
  final int giftValue;
  final String? frame;

  const GPKUser({
    required this.uid,
    required this.icon,
    required this.name,
    required this.sex,
    required this.score,
    required this.giftValue,
    this.frame,
  });

  factory GPKUser.fromJson(Map<String, dynamic> json) {
    return GPKUser(
      uid: Util.parseInt(json['uid']),
      icon: Util.notNullStr(json['icon']),
      name: Util.notNullStr(json['name']),
      sex: Util.parseInt(json['sex']),
      score: Util.parseInt(json['score']),
      giftValue: Util.parseInt(json['gift_value']),
      frame: _parseFrame(json),
    );
  }

  static String? _parseFrame(Map data) {
    String? frameStr = data['frame_new'];
    if (frameStr != null && frameStr.isNotEmpty) {
      return frameStr;
    } else {
      frameStr = data['frame'];
      if (frameStr != null && frameStr.isNotEmpty) {
        return '$frameStr.png';
      } else {
        return null;
      }
    }
  }

  /// 获取头像框地址
  String? getFrameImg() {
    if (frame == null || frame!.isEmpty) {
      return frame;
    }
    if (frame!.startsWith(RegExp(r'http(s?):\/\/'))) {
      return frame;
    }
    return '${System.imageDomain}static/effect/$frame';
  }

  @override
  List<Object?> get props => [uid, icon, name, sex, score, giftValue, frame];

  @override
  String toString() {
    return 'GPKUser{uid: $uid, icon: $icon, name: $name, sex: $sex, score: $score, giftValue: $giftValue, frame: $frame}';
  }
}

class GPKPosModel extends Equatable {
  final int uid;
  final String? name;
  final String? icon;
  final int score;
  final int position;
  final List<UserPunish> punish;
  final String? status; // online offline
  // 领先GS头像框
  // 在团战过程中，处于团战双方pk值最多的一个参赛选手，会有一个特殊头像框
  // 这个头像框会是一个类似帽子一样的装扮，不与原头像框冲突，覆盖在原头像框上
  // 直到团战结束，该头像框消失
  final String? gsIcon;

  const GPKPosModel({
    required this.uid,
    this.name,
    this.icon,
    required this.score,
    required this.position,
    required this.punish,
    this.status,
    this.gsIcon,
  });

  factory GPKPosModel.fromJson(Map<String, dynamic> json) {
    int uid = Util.parseInt(json["uid"], 0);
    return GPKPosModel(
      uid: uid,
      name: Util.parseStr(json["name"]),
      icon: Util.parseStr(json["icon"]),
      score: Util.parseInt(json["score"], 0),
      position: Util.parseInt(json['position'], -1),
      punish: Util.parseList<UserPunish>(
          json['punish_new'], (e) => UserPunish.fromJson(e)),
      status: Util.parseStr(json['status']),
      gsIcon: Util.parseStr(json['gs_icon']),
    );
  }

  /// 获取头像框惩罚
  List<UserPunish>? getUserIconPunish() {
    if (punish.isNotEmpty) {
      return punish
          .where((element) => element.uid == uid && element.isIconPunish())
          .toList();
    }
    return null;
  }

  /// 获取当前用户的语音惩罚
  UserPunish? getVoicePunish() {
    if (punish.isNotEmpty) {
      for (UserPunish punish in punish) {
        if (punish.uid == uid && punish.isVoicePunish()) {
          return punish;
        }
      }
    }
    return null;
  }

  /// 获取当前用户的名字惩罚
  UserPunish? getNamePunish() {
    if (punish.isNotEmpty) {
      for (UserPunish punish in punish) {
        if (punish.uid == uid && punish.isNamePunish()) {
          return punish;
        }
      }
    }
    return null;
  }

  @override
  List<Object?> get props =>
      [uid, name, icon, score, position, punish, status, gsIcon];

  @override
  String toString() {
    return 'GPKPosModel{uid: $uid, name: $name, icon: $icon, score: $score, position: $position, punish: $punish, status: $status, gsIcon: $gsIcon}';
  }
}
