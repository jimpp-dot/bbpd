import 'package:shared/shared.dart';
import 'package:chat_room/src/base/punish/model/punish_beans.dart';

class LivePKConfigV3 {
  LivePKBaseV3? pkBase;
  PkRank? pkRank;
  Punish? pkPunish;
  int isUse = 1; //1 开启,0关闭 默认为1

  LivePKConfigV3.fromJson(Map<String, dynamic> json) {
    if (json['base'] is Map) {
      pkBase = LivePKBaseV3.fromJson(json['base']);
    } else {
      pkBase = null;
    }
    if (json['rank'] is Map) {
      int mainRid = pkBase?.main?.rid ?? 0;
      int competeRid = pkBase?.compete?.rid ?? 0;
      pkRank = PkRank.fromJson(json['rank'], mainRid, competeRid);
    } else {
      pkRank = null;
    }
    if (json['punish'] is Map) {
      pkPunish = Punish.fromJson(json['punish']);
    } else {
      pkPunish = null;
    }
    isUse = Util.parseInt(json['isUse'], 1);
  }

  static LivePKState getLivePKState(String state) {
    try {
      String current = '${'LivePKState'.toLowerCase()}.${state.toLowerCase()}';
      return LivePKState.values.firstWhere((LivePKState type) {
        return type.toString().toLowerCase() == current;
      });
    } catch (e) {}
    return LivePKState.Wait;
  }

  bool isNotWaitMode() {
    return !(pkBase == null || pkBase?.state == LivePKState.Wait);
  }

  bool isPkClose() {
    return isUse == 0;
  }

  /// 是否正在pk中
  bool isInPk() {
    return pkBase?.state == LivePKState.PK;
  }
}

class LivePKBaseV3 {
  LivePKState state;
  LivePKUserOnMicItem? main;
  LivePKUserOnMicItem? compete;
  int win; //主场视角 1赢 2输 3平
  String punish;
  int pk_id;
  int punishId = 0;

  LivePKBaseV3.fromJson(Map<String, dynamic> json)
      : state = LivePKConfigV3.getLivePKState(json['state']),
        main = json['main'] is Map
            ? LivePKUserOnMicItem.fromJson(json['main'])
            : null,
        compete = json['compete'] is Map
            ? LivePKUserOnMicItem.fromJson(json['compete'])
            : null,
        win = Util.parseInt(json['win'], 0),
        punish = Util.notNullStr(json['punish']),
        pk_id = Util.parseInt(json['pk_id']);
}

class LivePKUserOnMicItem {
  int uid; //进入连麦状态，该字段一定有值
  int rid;
  String name;
  String icon;
  int score;
  int origin; //进入连麦状态，离线时为0
  int mic = 0; //1开麦 2关麦
  int winCount = 0; //连胜次数
  LivePKUserOnMicItem.fromJson(Map<String, dynamic> json)
      : uid = Util.parseInt(json['uid']),
        rid = Util.parseInt(json['rid']),
        name = Util.notNullStr(json['name']),
        icon = Util.notNullStr(json['icon']),
        score = Util.parseInt(json['score']),
        origin = Util.parseInt(json['origin']),
        mic = Util.parseInt(json['mic'], 1),
        winCount = Util.parseInt(json['con_win'], 0);

  LivePKUserOnMicItem(
      {this.uid = 0,
      this.rid = 0,
      this.name = '',
      this.icon = '',
      this.score = 0,
      this.origin = 0});
}

class PkRank {
  List<RankItem>? mainRank;
  List<RankItem>? competeRank;

  PkRank.fromJson(Map<String, dynamic>? json, int? mainRid, int? competeRid) {
    if (json == null) {
      mainRank = null;
      competeRank = null;
      return;
    }
    if (mainRid != null && mainRid > 0 && json.containsKey('$mainRid')) {
      mainRank = (json['$mainRid'] as List?)
          ?.map((e) => RankItem.fromJson(e as Map<String, dynamic>))
          .toList();
      if (mainRank != null) {
        if (mainRank!.length > 1) {
          mainRank!.sort((a, b) {
            //小的在前面
            if (a.score >= b.score) {
              return 1;
            }
            return 0;
          });
        }
        for (int i = 0; i < mainRank!.length; i++) {
          mainRank![i].index = mainRank!.length - 1 - i;
          if (i == mainRank!.length - 1) {
            mainRank![i].isMvp = true;
          }
        }
      }
    }
    if (competeRid != null &&
        competeRid > 0 &&
        json.containsKey('$competeRid')) {
      competeRank = (json['$competeRid'] as List?)
          ?.map((e) => RankItem.fromJson(e as Map<String, dynamic>))
          .toList();
      if (competeRank != null) {
        if (competeRank!.length > 1) {
          competeRank!.sort((a, b) {
            //大的在前面
            if (a.score >= b.score) {
              return 0;
            }
            return 1;
          });
        }
        for (int i = 0; i < competeRank!.length; i++) {
          competeRank![i].index = i;
          if (i == 0) {
            if (mainRank == null || mainRank!.isEmpty) {
              competeRank![i].isMvp = true;
            } else {
              if (competeRank![i].score >
                  mainRank![mainRank!.length - 1].score) {
                competeRank![i].isMvp = true;
                mainRank![mainRank!.length - 1].isMvp = false;
              }
            }
          }
        }
      }
    }
  }

  PkRank({this.mainRank, this.competeRank});
}

class RankItem {
  int uid;
  String icon;
  double score;
  int isFirstScore; //首杀，PK阶段，第一个送超过10币礼物的
  int index = -1; //正常顺序从0开始
  bool isMvp = false;

  RankItem.fromJson(Map<String, dynamic> json)
      : uid = Util.parseInt(json['uid']),
        icon = Util.notNullStr(json['icon']),
        score = Util.parseDouble(json['score']),
        isFirstScore = Util.parseInt(json['is_first_kill']);

  RankItem(
      {this.uid = 0,
      this.icon = '',
      this.score = 0,
      this.index = -1,
      this.isMvp = false,
      this.isFirstScore = 0});
}

class Punish {
  List<UserPunish>? userPunishList;

  Punish.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      userPunishList = null;
      return;
    }
    List? data = json["data"];
    Log.d('livePKconfigv3 data=$data');
    if (data != null) {
      List<UserPunish> punishList = [];
      for (var e in data) {
        UserPunish userPunish =
            UserPunish.fromJson(Map<String, dynamic>.from(e));
        punishList.add(userPunish);
      }
      userPunishList = punishList;
    }
  }

  /// 获取头像框惩罚
  List<UserPunish>? getUserIconPunish(int uid) {
    if (userPunishList != null && userPunishList!.isNotEmpty) {
      return userPunishList!
          .where((element) => element.uid == uid && element.isIconPunish())
          .toList();
    }
    return null;
  }

  /// 获取当前用户的语音惩罚
  UserPunish? getVoicePunish(int uid) {
    if (userPunishList != null && userPunishList!.isNotEmpty) {
      for (UserPunish punish in userPunishList!) {
        if (punish.uid == uid && punish.isVoicePunish()) {
          return punish;
        }
      }
    }
    return null;
  }

  /// 获取当前用户的名字惩罚
  UserPunish? getNamePunish(int uid) {
    if (userPunishList != null && userPunishList!.isNotEmpty) {
      for (UserPunish punish in userPunishList!) {
        if (punish.uid == uid && punish.isNamePunish()) {
          return punish;
        }
      }
    }
    return null;
  }
}

enum LivePKState {
  Wait,
  Match, //匹配中
  Start, //开始(瞬时状态)
  Ready, //准备
  PK, //pk
  Punish, //惩罚
  End //结束(离场)
}
