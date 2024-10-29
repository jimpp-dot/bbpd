import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';

enum GameUnderState {
  //谁是卧底房间状态
  Wait, //等待
  Send, //分词
  Ready, //准备
  Desc, //描述
  Vote, //投票
  VoteResult, //投票结果
  PublishDead, //公布死亡
  End, //结束了，在显示结果
}

enum GameUnderRole {
  None, //
  Populace, //平民
  Under, //卧底
  Under_Loser, //淘汰的卧底
  Populace_Loser //淘汰的平民
}

final Map<GameUnderRole, String> gameUnderRoleToString = {
  GameUnderRole.Under: K.room_under,
  GameUnderRole.Populace: K.room_civilian,
  GameUnderRole.Under_Loser: K.room_under,
  GameUnderRole.Populace_Loser: K.room_civilian,
};

class UnderConfigData {
  final GameUnderState gameUnderState;
  final int gameUnderCount;
  final int gameUnderCurrent;
  final bool isStrict;
  final Map? dataMap;
  final bool isPK;

  UnderConfigData.fromJson(Map? data)
      : gameUnderState = getGameUnderState(data?['un_state']),
        gameUnderCurrent = Util.parseInt(data?['un_current'], -1),
        gameUnderCount = Util.parseInt(data?['un_count']),
        isStrict = Util.parseInt(data?['un_strict'], 0) > 0,
        isPK = Util.parseInt(data?['un_ispk'], 0) > 0,
        dataMap = Util.parseMap(data?['un_dataMap']);

  static GameUnderState getGameUnderState(String? state) {
    if (state == null) return GameUnderState.Wait;
    try {
      String current =
          '${'GameUnderState'.toLowerCase()}.${state.replaceAll('-', '').toLowerCase()}';
      return GameUnderState.values.firstWhere((GameUnderState type) {
        return type.toString().toLowerCase() == current;
      });
    } catch (e) {}
    return GameUnderState.Wait;
  }
}

class UnderPositionData {
  final int gameUnderId;
  final int gameUnderOrigin; //原麦位uid
  final GameUnderRole gameUnderRole;
  final int gameUnderEnable;
  final int gameUnderVote;
  final bool isAdmin;

  UnderPositionData.fromJson(Map data)
      : gameUnderId = Util.parseInt(data['un_aid'], 0),
        gameUnderOrigin = Util.parseInt(data['un_origin'], 0),
        gameUnderRole = getGameUnderRole(data['un_role']),
        gameUnderVote = Util.parseInt(data['un_vote'], -1),
        gameUnderEnable = Util.parseInt(data['un_enable'], 0),
        isAdmin = Util.parseInt(data['un_admin'], 0) > 0;

  bool get gameUnderEnableToVote {
    return gameUnderEnable == 3 || gameUnderEnable == 1;
  }

  bool get gameUnderEnableVotedByOther {
    return gameUnderEnable == 3 || gameUnderEnable == 2;
  }

  bool get gameUnderVoted {
    return gameUnderVote != -1;
  }

  static GameUnderRole getGameUnderRole(String? role) {
    if (role == null || role.isEmpty) return GameUnderRole.None;
    try {
      String current =
          '${'GameUnderRole'.toLowerCase()}.${role.replaceAll('-', '').toLowerCase()}';
      return GameUnderRole.values.firstWhere((GameUnderRole type) {
        return type.toString().toLowerCase() == current;
      });
    } catch (e) {}
    return GameUnderRole.None;
  }
}
