import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_user_icon.dart';

class WolfOpUtil {
  // 是否pk
  static bool isPK(ChatRoomData room, RoomPosition item) {
    if (room.config?.configExpendData == null ||
        room.config?.configExpendData is! WolfConfigData) return false;
    WolfConfigData wolfConfigData =
        room.config?.configExpendData as WolfConfigData;
    if (!(wolfConfigData.ispk)) return false;
    if (wolfConfigData.currentResult == null) return false;

    List? pkData = wolfConfigData.currentResult!['pkPosition'];
    if (pkData == null || pkData.isEmpty) return false;

    List<int> pkList = pkData.map((_) => Util.parseInt(_)).toList();
    return (pkList.contains(item.position));
  }

  // 轮询谁在发言
  static RoomPosition? getDescPlayer(ChatRoomData room) {
    RoomPosition? rp;
    if (room.positions.isNotEmpty) {
      for (var pos in room.positions) {
        if (pos.positionExpendData == null ||
            pos.positionExpendData is! WolfPositionData) continue;
        if (pos.counter >= room.timestamp) {
          // 在发言
          rp = pos;
        }
      }
    }
    return rp;
  }

  // 获取狼人杀title：第几天第几页等
  static String getWolfStateStr(ChatRoomData room) {
    if (room.config?.configExpendData == null ||
        room.config?.configExpendData is! WolfConfigData) return '';

    WolfConfigData wolfConfigData =
        room.config?.configExpendData as WolfConfigData;

    String stateStr = R.string('room_ready_step');
    if (wolfConfigData.state == WolfState.Wait) {
      stateStr = R.string('room_ready_step');
    } else if (wolfConfigData.state == WolfState.GetRole ||
        wolfConfigData.state == WolfState.PublishRole) {
      stateStr = R.string('room_grab_identity');
    } else if (wolfConfigData.state == WolfState.Night ||
        wolfConfigData.state == WolfState.NightAction ||
        wolfConfigData.state == WolfState.NightActionKilling ||
        wolfConfigData.state == WolfState.NightAntidote ||
        wolfConfigData.state == WolfState.NightPoison) {
      if (wolfConfigData.count == 0) {
        stateStr = R.string('room_first_night');
      } else {
        stateStr = R.string('room_day_night');
      }
    } else if (wolfConfigData.state == WolfState.Daytime ||
        wolfConfigData.state == WolfState.DaytimePublishDead ||
        wolfConfigData.state == WolfState.DaytimeGun ||
        wolfConfigData.state == WolfState.DaytimeLastWords ||
        wolfConfigData.state == WolfState.DaytimeDesc ||
        wolfConfigData.state == WolfState.DaytimeWolfExplode ||
        wolfConfigData.state == WolfState.DaytimeStartVote ||
        wolfConfigData.state == WolfState.DaytimeVote ||
        wolfConfigData.state == WolfState.DaytimeVoteResult ||
        wolfConfigData.state == WolfState.DaytimePK) {
      stateStr = R.string('room_some_day', args: [' ${wolfConfigData.count} ']);
    } else if (wolfConfigData.state == WolfState.End) {
      stateStr = R.string('end');
    }

    return stateStr;
  }

  ///
  /// 获取当前用户对应的坑位对象
  /// 在麦上返回正常对象，不在返回null
  ///
  static RoomPosition? getRoomPosition(ChatRoomData room) {
    return getRoomPositionByUid(room, Session.uid);
  }

  ///
  /// 获取坑位对象中指定的uid对象
  /// 在麦上返回正常对象，不在返回null
  ///
  static RoomPosition? getRoomPositionByUid(ChatRoomData room, int uid) {
    for (var _ in room.positions) {
      if (_.uidOrOrigin == uid) {
        return _;
      }
    }
    return null;
  }

  ///
  /// 判断自己是否是1号麦
  ///
  static bool isFirstPosition(room) {
    bool flag = false;
    if (room != null && room.positions != null && room.positions.length > 0) {
      if (room.positions[0].uid == Session.uid) {
        flag = true;
      }
    }
    return flag;
  }

  ///
  /// 是否可以显示过麦
  /// 在坑位上 && (白天发言 || 白天遗言 || 警长发言) && 自己发言
  ///
  static bool isNeedPass(ChatRoomData room) {
    bool flag = false;
    RoomPosition? rp = getRoomPosition(room);
    if (rp != null &&
        room.config?.configExpendData != null &&
        room.config?.configExpendData is WolfConfigData) {
      WolfConfigData wolfConfigData =
          room.config?.configExpendData as WolfConfigData;
      if (wolfConfigData.state == WolfState.DaytimeDesc ||
          wolfConfigData.state == WolfState.DaytimeLastWords ||
          wolfConfigData.state == WolfState.PoliceDesc) {
        if (rp.counter - room.timestamp >= 0) {
          flag = true;
        }
      }
    }
    return flag;
  }

  ///
  /// 是否游戏中
  ///
  static bool isGaming(ChatRoomData room) {
    if (ChatRoomData.getInstance()?.config?.configExpendData != null &&
        ChatRoomData.getInstance()?.config?.configExpendData
            is WolfConfigData) {
      WolfConfigData wolfConfigData = ChatRoomData.getInstance()!
          .config!
          .configExpendData as WolfConfigData;
      WolfState? state = wolfConfigData.state;
      return state != WolfState.Wait &&
          state != WolfState.GameEnd &&
          state != WolfState.End;
    }
    return false;
  }

  ///
  /// 是否能发普通消息
  /// 如果是游戏玩家且在游戏中,则不能发送普通消息
  ///
  static bool isHideNormalMsg(ChatRoomData room) {
    // RoomPosition selfPosition = ChatRoomData.getInstance()?.positionForCurrentUser;
    // if (selfPosition != null && isGaming(room)) {
    //   return true;
    // }
    return false;
  }

  static double get itemHeight {
    return WolfUserIcon.iconSize;
  }

  static double get spaceHeight {
    return 12.0;
  }

  static int get sideCount {
    if (ChatRoomData.getInstance() == null ||
        ChatRoomData.getInstance()!.config == null ||
        ChatRoomData.getInstance()!.config!.game != Games.Wolf ||
        ChatRoomData.getInstance()?.config?.configExpendData
            is! WolfConfigData) {
      return 6;
    }
    WolfConfigData wolfConfigData =
        ChatRoomData.getInstance()?.config?.configExpendData as WolfConfigData;
    switch (wolfConfigData.playerType) {
      case PlayerType.player6:
        return 3;
      case PlayerType.player9:
        return 5;
      case PlayerType.newplayer6:
        return 6;
      case PlayerType.newplayer9:
        return 6;
      case PlayerType.player12:
        return 6;
      default:
        return 6;
    }
  }

  static List<RoomPosition> getDeadPositions(ChatRoomData room) {
    if (room.config?.configExpendData == null ||
        room.config?.configExpendData is! WolfConfigData) return [];
    WolfConfigData wolfConfigData =
        room.config!.configExpendData as WolfConfigData;
    Map result = wolfConfigData.currentResult ?? {};
    List deadList = result['deadList'] ?? [];
    if (deadList.isEmpty) return [];

    List<int> positions = [];
    if (deadList.isNotEmpty) {
      for (var role in deadList) {
        positions.add(Util.parseInt(role['position'], 0));
      }
    }

    return room.positions
        .where((element) => positions.contains(element.position))
        .toList();
  }

  static List<RoomPosition> getPKPositions(ChatRoomData room) {
    if (room.config?.configExpendData == null ||
        room.config!.configExpendData is! WolfConfigData) return [];

    WolfConfigData wolfConfigData =
        room.config!.configExpendData as WolfConfigData;
    Map result = wolfConfigData.currentResult ?? {};

    List pkList = result['pkPosition'] ?? [];
    if (pkList.isEmpty) return [];

    List<int> positions = [];
    if (pkList.isNotEmpty) {
      for (var item in pkList) {
        positions.add(Util.parseInt(item, -1));
      }
    }
    return room.positions
        .where((element) => positions.contains(element.position))
        .toList();
  }

  static RoomPosition? getPolice(ChatRoomData room) {
    RoomPosition? targetPosition;
    WolfConfigData wolfConfigData =
        room.config?.configExpendData as WolfConfigData;
    int policeUid = Util.parseInt(wolfConfigData.currentResult?['police']);
    if (policeUid > 0) {
      for (var _ in room.positions) {
        if (_.uidOrOrigin == policeUid) {
          targetPosition = _;
          break;
        }
      }
    }
    return targetPosition;
  }
}
