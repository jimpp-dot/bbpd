import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/wolfAudioPlayUtil.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideConfig.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_main.dart';
//import 'package:were_wolf/src/room/guide/room/testData.dart';

class WolfGuideData {
  static WolfGuideData? _instance;

  static WolfGuideData getInstance() {
    _instance ??= WolfGuideData();
    return _instance!;
  }

  static void dispose() {
    _instance = null;
  }

  ///静态数据
  Map? guidData;

  ///房间标题
  String? title;

  ///麦位数据
  List<RoomPosition>? positions;

  ///所有可抢角色数据
  List<RoleItem>? allRoles;

  ///当前抢的角色
  RoleResultItem? currentRole;

  ///所有声音
  Map<String, String>? allVoices;

  ///板子
  List? boards;

  ///当前被击杀的人
  Map<int, List<RoomPosition>>? killingData;

  ///当前死亡的人
  List<RoomPosition>? deadPositions;

  ///当前说话者
  Map<int, bool>? speakers;

  ///当前麦开关状态
  bool isMuteClose = false;

  //系统玩家投票结果
  Map<int, List<int>>? voteData;
  //当前玩家投票结果
  int votePosition = -1;

  //游戏过程中
  Map<String, String>? wolfVoices;

  ///当前阶段
  WolfGuideConfigState? currentState;

  ///当前阶段剩余时间
  int currentStateLeaveTime = 0;

  ///第几天
  int? dayCount;

  ///白天或者黑夜
  WolfGuideDayType? dayType;

  bool isHasClickMute = false;

  GlobalKey muteKey = GlobalKey();

  ///进入初始页面时候调用
  void initData({bool isMan = true}) async {
    Map data = guidData!;
//    data = guideTestDataA["data"];//本地数据测试

    //房间标题
    title = data['title'];

    positions = [];
    List users = data['users'];
    for (int i = 0; i < 6; i++) {
      int index = users.indexWhere((element) {
        return element["position"] == (i + 1);
      });
      RoomPosition rp;
      if (index >= 0) {
        Map element = users[index];
        rp = RoomPosition(
          position: i,
          uid: 10000 + i,
          name: element["name"],
          icon: element["icon"],
          sex: RoomPosition.parseSex(element["sex"]),
          positionExpendData: WolfGuidePosition(
            levelIcon: '',
            role: WolfParseUtil.parseRole(element["role"]),
          ),
        );
      } else {
        rp = RoomPosition(
          position: i,
          uid: Session.uid,
          name: Session.name,
          icon: '${System.imageDomain}${Session.icon}!head100',
          sex: RoomPosition.parseSex(Session.sex),
          positionExpendData: WolfGuidePosition(
            levelIcon: '',
            role: WolfRole.Werewolf,
            canBeSelected: false,
          ),
        );
      }
      positions!.add(rp);
    }

    allRoles = [];
    List roles = data['roles'];
    for (var element in roles) {
      allRoles!.add(
        RoleItem(
          element["role"],
          element["roleName"],
          element["roleCount"],
          element["rolePrice"],
        ),
      );
    }

    String cRole = data["cRole"];
    RoleItem roleItem =
        allRoles!.firstWhere((element) => element.roleKey == cRole);
    currentRole = RoleResultItem(
        roleItem.roleKey,
        roleItem.roleName,
        roleItem.roleCount,
        roleItem.price,
        Session.uid,
        data["cWinCondition"],
        data["cDesc"]);

    allVoices = <String, String>{};
    Map voices = data["voices"];
    for (var element in voices.keys) {
      allVoices![element] = voices[element];
    }

    boards = [];
    List cBoard = data["cBoard"];
    boards!.addAll(cBoard);

    killingData = <int, List<RoomPosition>>{};
    deadPositions = [];
    speakers = <int, bool>{};
    isMuteClose = true;
    voteData = {
      0: [2, 4, 5],
      5: [0],
      -1: [1]
    };
    votePosition = -1;

    wolfVoices = <String, String>{};
    Map gameVoices = data["game_voices"];
    for (var element in gameVoices.keys) {
      wolfVoices![element] = gameVoices[element];
    }
  }

  void wolfKillerRole(int killUid, int opUid, {bool isKill = true}) {
    RoomPosition killPosition =
        positions!.firstWhere((element) => element.uid == killUid);
    RoomPosition opPosition =
        positions!.firstWhere((element) => element.uid == opUid);
    if (isKill) {
      //击杀
      if (killingData!.containsKey(killPosition.uid)) {
        killingData![killPosition.uid]!
            .removeWhere((element) => element.uid == opPosition.uid);
        killingData![killPosition.uid]!.add(opPosition);
      } else {
        killingData![killPosition.uid] = [opPosition];
      }
    } else {
      //取消击杀
      if (killingData!.containsKey(killPosition.uid)) {
        killingData![killPosition.uid]!
            .removeWhere((element) => element.uid == opPosition.uid);
      }
    }
  }

  bool needKillerRole() {
    bool flag = false;
    if (dayCount == 0) {
      wolfKillerRole(positions![1].uid, positions![5].uid, isKill: true);
      flag = true;
    } else if (dayCount == 1) {
      wolfKillerRole(positions![1].uid, positions![5].uid, isKill: true);
      flag = true;
    }
    return flag;
  }

  RoomPosition? positionForCurrentUser({int uid = 0}) {
    if (positions != null) {
      for (var element in positions!) {
        if (element.uid == (uid != 0 ? uid : Session.uid)) {
          return element;
        }
      }
    }
    return null;
  }

  bool isGameEnd() {
    bool flag = false;

    int sIndex = positions!.indexWhere((element) {
      WolfGuidePosition wolfGuidePosition =
          element.positionExpendData as WolfGuidePosition;
      return !wolfGuidePosition.isDead &&
          (wolfGuidePosition.role == WolfRole.Seer ||
              wolfGuidePosition.role == WolfRole.Witch);
    });

    int pIndex = positions!.indexWhere((element) {
      WolfGuidePosition wolfGuidePosition =
          element.positionExpendData as WolfGuidePosition;
      return !wolfGuidePosition.isDead &&
          (wolfGuidePosition.role == WolfRole.Popular);
    });

    if (sIndex == -1 || pIndex == -1) {
      //找不到活着的神职活着找不到活着的平民，则代表游戏结束了
      flag = true;
    }

    return flag;
  }

  //获取每个阶段的总时间
  getTimeByState(WolfGuideConfigState? state) {
    int time = 0;

    if (state == WolfGuideConfigState.Wait) {
      time = 7;
    } else if (state == WolfGuideConfigState.GameStart) {
      time = 5;
    } else if (state == WolfGuideConfigState.GetRole) {
      time = 10;
    } else if (state == WolfGuideConfigState.PublishRole) {
      time = 5;
    } else if (state == WolfGuideConfigState.Night) {
      time = 5; //流媒体音频3秒,
    } else if (state == WolfGuideConfigState.NightAction) {
      time = 40;
    } else if (state == WolfGuideConfigState.NightAntidote) {
      time = 10;
    } else if (state == WolfGuideConfigState.NightPoison) {
      time = 10;
    } else if (state == WolfGuideConfigState.Daytime) {
      time = 5; //同天黑
    } else if (state == WolfGuideConfigState.DaytimePublishDead) {
      time = 5;
    } else if (state == WolfGuideConfigState.DaytimeLastWords) {
      time = 90;
    } else if (state == WolfGuideConfigState.DaytimeDesc) {
      time = 90;
    } else if (state == WolfGuideConfigState.DaytimeStartVote) {
      time = 5;
    } else if (state == WolfGuideConfigState.DaytimeVote) {
      time = 10;
    } else if (state == WolfGuideConfigState.DaytimeVoteResult) {
      time = 5;
    } else if (state == WolfGuideConfigState.DaytimeVotePublishDead) {
      time = 5;
    } else if (state == WolfGuideConfigState.GameEnd) {
      time = 5;
    } else if (state == WolfGuideConfigState.End) {
      time = 20;
    }

    return time;
  }

  void initToDaytimeDescData() {
    for (var element in positions!) {
      WolfGuidePosition wolfGuidePosition =
          element.positionExpendData as WolfGuidePosition;
      if (!wolfGuidePosition.isDead) {
        wolfGuidePosition.isDesc = true;
      }
    }
    isHasClickMute = false;
  }

  ///////////---------游戏不同阶段---------//////////
  ///进入等待阶段
  void initToWait() {
    currentState = WolfGuideConfigState.Wait;
    currentStateLeaveTime = getTimeByState(currentState);
    dayCount = 0;
    dayType = WolfGuideDayType.other;
  }

  ///游戏开始
  void initToGameStart() {
    dayType = WolfGuideDayType.night;
    currentState = WolfGuideConfigState.GameStart;
    currentStateLeaveTime = getTimeByState(currentState);
  }

  ///抢身份
  void initToGetRole() {
    currentState = WolfGuideConfigState.GetRole;
    currentStateLeaveTime = getTimeByState(currentState);
    //msg
    Map extra = {'subType': 'wolfNormal'};
    MessageContent content = MessageContent.from(
      K.wolf_v2_guide_board_1,
      extra,
      null,
      -1,
    );
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
    //msg
  }

  ///公布身份
  void initToPublishRole() {
    currentState = WolfGuideConfigState.PublishRole;
    currentStateLeaveTime = getTimeByState(currentState);
    //msg
    Map extra = {'subType': 'wolfNormal'};
    MessageContent content = MessageContent.from(
      K.wolf_v2_guide_board_2,
      extra,
      null,
      -1,
    );
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
    //msg
  }

  ///天黑
  void initToNight() {
    dayType = WolfGuideDayType.night;
    currentState = WolfGuideConfigState.Night;
    currentStateLeaveTime = getTimeByState(currentState);
    speakers!.clear();
    //msg
    Map extra = {'subType': 'wolfNormal'};
    MessageContent content = MessageContent.from(
      K.wolf_v2_guide_board_3,
      extra,
      null,
      -1,
    );
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
    //msg
  }

  ///夜晚行动
  void initToNightAction({Function? function}) {
    RoomPosition selfPosition = positionForCurrentUser()!;
    WolfGuidePosition wolfGuidePosition =
        selfPosition.positionExpendData as WolfGuidePosition;
    wolfGuidePosition.canAction = true;

    currentState = WolfGuideConfigState.NightAction;
    currentStateLeaveTime = getTimeByState(currentState);

    //msg
    Map extra = {'subType': 'wolfNormal'};
    MessageContent content = MessageContent.from(
      K.wolf_v2_guide_board_4,
      extra,
      null,
      -1,
    );
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
    //msg

    if (dayCount == 0) {
      //第一晚播放声音
      RoomPosition voicePosition = positions![5];
      bool isSpeaking = speakers!.containsKey(voicePosition.uid) &&
          speakers![voicePosition.uid]!;
      Log.d("initToNightAction isSpeaking=$isSpeaking");
      if (!isSpeaking) {
        speakers![voicePosition.uid] = true;
        WolfAudioPlayUtil.instance().playAudio(
          '',
          url: allVoices!['day_1_night_position_6'] ?? '',
          onComplete: () {
            Log.d("initToNightAction onComplete ");
            speakers![voicePosition.uid] = false;
//            eventCenter.emit(WolfMain.DISPATCH_GAME_WOLF_GUIDE_STEPCHANGE_EVENT);
//            eventCenter.emit(WolfMain.DISPATCH_GAME_WOLF_EVENT);
            Log.d("initToNightAction onComplete11 ");

            if (function != null) {
              function();
            }
          },
        );
      }
    }
  }

  ///女巫解药
  void initToNightAntidote() {
    killingData?.clear(); //清空上一环节杀
    speakers!.clear(); //清空上一轮说话(万一异常)
    currentState = WolfGuideConfigState.NightAntidote;
    currentStateLeaveTime = getTimeByState(currentState);
  }

  ///女巫毒药
  void initToNightPoison() {
    currentState = WolfGuideConfigState.NightPoison;
    currentStateLeaveTime = getTimeByState(currentState);
  }

  ///进入白天
  void initToDaytime() {
    dayCount = dayCount! + 1;
    dayType = WolfGuideDayType.day;
    currentState = WolfGuideConfigState.Daytime;
    currentStateLeaveTime = getTimeByState(currentState);

    //msg
    Map extra = {'subType': 'wolfMenu'};
    MessageContent content = MessageContent.from(
      K.wolf_v2_guide_board_13(["${dayCount! + 1}"]),
      extra,
      null,
      -1,
    );
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
    //msg
  }

  ///白天公布死亡结果
  void initToDaytimePublishDead() {
    currentState = WolfGuideConfigState.DaytimePublishDead;
    currentStateLeaveTime = getTimeByState(currentState);

    deadPositions?.clear();
    if (dayCount == 2) {
      //第二天晚上,2号玩家被刀,6号玩家被毒
      RoomPosition selfPosition = positions![1];
      WolfGuidePosition wolfGuidePosition =
          selfPosition.positionExpendData as WolfGuidePosition;
      wolfGuidePosition.isDead = true;
      wolfGuidePosition.deadType = WolfDeadType.killDead;
      RoomPosition selfPosition1 = positions![5];
      WolfGuidePosition wolfGuidePosition1 =
          selfPosition1.positionExpendData as WolfGuidePosition;
      wolfGuidePosition1.isDead = true;
      wolfGuidePosition1.deadType = WolfDeadType.killDead;

      deadPositions?.add(selfPosition);
      deadPositions?.add(selfPosition1);

      //msg
      String str1 = "【2】";
      String str2 = "【6】";
      Map extra = {
        'subType': 'wolfNormal',
        "highLightContent": [str1, str2]
      };
      String str = str1 + str2;
      MessageContent content = MessageContent.from(
        K.wolf_v2_guide_board_12([str]),
        extra,
        null,
        -1,
      );
      eventCenter.emit(
          WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
      //msg
    } else {
      //msg
      Map extra = {'subType': 'wolfNormal'};
      MessageContent content = MessageContent.from(
        K.wolf_v2_guide_board_5,
        extra,
        null,
        -1,
      );
      eventCenter.emit(
          WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
      //msg
    }
  }

  ///白天遗言
  void initToDaytimeLastWords({Function? function}) {
    currentState = WolfGuideConfigState.DaytimeLastWords;
    currentStateLeaveTime = getTimeByState(currentState);

    if (dayCount == 1) {
      //第2天白天播放遗言声音
      RoomPosition voicePosition = positions![0];
      bool isSpeaking = speakers!.containsKey(voicePosition.uid) &&
          speakers![voicePosition.uid]!;
      Log.d("initToNightAction isSpeaking=$isSpeaking");
      if (!isSpeaking) {
        speakers![voicePosition.uid] = true;
        WolfAudioPlayUtil.instance().playAudio(
          '',
          url: allVoices![
                  'day_${dayCount! + 1}_day_last_position_${voicePosition.position + 1}'] ??
              '',
          onComplete: () {
            Log.d("initToDaytimeLastWords onComplete ");
            speakers![voicePosition.uid] = false;
//            eventCenter.emit(WolfMain.DISPATCH_GAME_WOLF_GUIDE_STEPCHANGE_EVENT);
//            eventCenter.emit(WolfMain.DISPATCH_GAME_WOLF_EVENT);
            Log.d("initToDaytimeLastWords onComplete11 ");

            if (function != null) {
              function();
            }
          },
        );
      }
      //msg
      String str = "【1】";
      Map extra = {
        'subType': 'wolfNormal',
        "highLightContent": [str]
      };
      MessageContent content = MessageContent.from(
        K.wolf_v2_guide_board_11([str]),
        extra,
        null,
        -1,
      );
      eventCenter.emit(
          WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
      //msg
    }
  }

  ///白天发言阶段->白天开始投票阶段或白天发言阶段
  void initToDaytimeDesc() {
    currentState = WolfGuideConfigState.DaytimeDesc;
    currentStateLeaveTime = getTimeByState(currentState);
    speakers!.clear();

    int index = positions!.indexWhere((element) {
      WolfGuidePosition wolfGuidePosition =
          element.positionExpendData as WolfGuidePosition;
      return !wolfGuidePosition.isDead && wolfGuidePosition.isDesc;
    });

    if (index < 0) {
      //发言结束
      initToDaytimeStartVote();
      return;
    }

    RoomPosition voicePosition = positions![index];
    if (voicePosition.uid == Session.uid) {
      //
    } else {
      if (dayCount == 1) {
        //第2天白天播放发言声音
        bool isSpeaking = speakers!.containsKey(voicePosition.uid) &&
            speakers![voicePosition.uid]!;
        Log.d(
            "initToDaytimeDesc isSpeaking=$isSpeaking voicePosition.position+1=${voicePosition.position + 1}");
        if (!isSpeaking) {
          speakers![voicePosition.uid] = true;
          WolfAudioPlayUtil.instance().playAudio(
            '',
            url: allVoices![
                    'day_${dayCount! + 1}_day_desc_position_${voicePosition.position + 1}'] ??
                '',
            onComplete: () {
              Log.d("initToDaytimeDesc onComplete ");
              speakers![voicePosition.uid] = false;
              WolfGuidePosition wolfGuidePosition =
                  voicePosition.positionExpendData as WolfGuidePosition;
              wolfGuidePosition.isDesc = false;
              eventCenter.emit(
                  WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
              eventCenter.emit(
                  WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
              Log.d("initToDaytimeDesc onComplete11 ");
              //msg
              String str = "【${voicePosition.position + 1}】";
              Map extra = {
                'subType': 'wolfNormal',
                "highLightContent": [str]
              };
              int useTime =
                  getTimeByState(currentState) - currentStateLeaveTime;
              MessageContent content = MessageContent.from(
                K.wolf_v2_guide_board_10([str, '$useTime']),
                extra,
                null,
                -1,
              );
              eventCenter.emit(
                  WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
              //msg

              initToDaytimeDesc();
            },
          );
        }
      }
    }
  }

  ///白天开始投票
  void initToDaytimeStartVote() {
    currentState = WolfGuideConfigState.DaytimeStartVote;
    currentStateLeaveTime = getTimeByState(currentState);
    speakers!.clear();

    //msg
    Map extra = {'subType': 'wolfNormal'};
    MessageContent content = MessageContent.from(
      K.wolf_v2_guide_board_6,
      extra,
      null,
      -1,
    );
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
    //msg
  }

  ///白天投票
  void initToDaytimeVote() {
    RoomPosition selfPosition = positionForCurrentUser()!;
    WolfGuidePosition wolfGuidePosition =
        selfPosition.positionExpendData as WolfGuidePosition;
    wolfGuidePosition.canAction = true;

    currentState = WolfGuideConfigState.DaytimeVote;
    currentStateLeaveTime = getTimeByState(currentState);
  }

  ///白天投票结果
  void initToDaytimeVoteResult() {
    currentState = WolfGuideConfigState.DaytimeVoteResult;
    currentStateLeaveTime = getTimeByState(currentState);

    //计算最终投票结果
    RoomPosition self = positionForCurrentUser()!;
    int selfKey = votePosition;
    if (voteData!.containsKey(selfKey)) {
      voteData![selfKey]!.add(self.position);
    } else {
      voteData![selfKey] = [self.position];
    }
    //msg
    List newVoteResultPosMap = [];
    for (var element in voteData!.keys) {
      Map m = {};
      m["key"] = element;
      m["value"] = voteData![element];
      newVoteResultPosMap.add(m);
    }
    Map extra = {
      'subType': 'wolfNormal',
      "btnData": {"type": "vote", "text": ""},
      "msgData": {"newVoteResultPosMap": newVoteResultPosMap}
    };
    MessageContent content = MessageContent.from(
      "",
      extra,
      null,
      -1,
    );
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
    //msg
  }

  ///白天投票公布死亡结果
  void initToDaytimeVotePublishDead() {
    currentState = WolfGuideConfigState.DaytimeVotePublishDead;
    currentStateLeaveTime = getTimeByState(currentState);

    deadPositions?.clear();
    if (dayCount == 1) {
      //第二天白天,1号玩家被投死
      RoomPosition selfPosition = positions![0];
      WolfGuidePosition wolfGuidePosition =
          selfPosition.positionExpendData as WolfGuidePosition;
      wolfGuidePosition.isDead = true;
      wolfGuidePosition.deadType = WolfDeadType.voteDead;

      deadPositions?.add(selfPosition);

      //msg
      String str = "【1】";
      Map extra = {
        'subType': 'wolfNormal',
        "highLightContent": [str]
      };
      MessageContent content = MessageContent.from(
        K.wolf_v2_guide_board_9([str]),
        extra,
        null,
        -1,
      );
      eventCenter.emit(
          WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
      //msg
    }
  }

  ///游戏结束
  void initToGameEnd() {
    currentState = WolfGuideConfigState.GameEnd;
    currentStateLeaveTime = getTimeByState(currentState);
  }

  ///end
  void initToEnd() {
    currentState = WolfGuideConfigState.End;
    currentStateLeaveTime = getTimeByState(currentState);

    //msg
    Map extra = {
      'subType': 'wolfNormal',
//      "btnData":{"type":"replay","text":"复盘"},
    };
    MessageContent content = MessageContent.from(
      K.wolf_v2_guide_board_7,
      extra,
      null,
      -1,
    );
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
    //msg

    //msg
    Map extra1 = {'subType': 'wolfNormal'};
    MessageContent content1 = MessageContent.from(
      K.wolf_v2_guide_board_8,
      extra1,
      null,
      -1,
    );
    eventCenter.emit(
        WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content1);
    //msg
  }

  bool isGameOver() {
    return currentState == WolfGuideConfigState.End;
  }

  ///业务方法
  String? getVoicePath(String? key) {
    String? voicePath;
    if (wolfVoices != null && wolfVoices!.isNotEmpty) {
      if (key != null && key.isNotEmpty) {
        voicePath = wolfVoices![key];
      }
    }
    return voicePath;
  }

  bool isInDay() {
    return dayType != null && dayType == WolfGuideDayType.day;
  }

  bool isCurrentDesc() {
    bool isCurrentDesc = false;

    WolfGuideConfigState? state = currentState;
    if (state == WolfGuideConfigState.DaytimeDesc) {
      int index = positions!.indexWhere((element) {
        WolfGuidePosition wolfGuidePosition =
            element.positionExpendData as WolfGuidePosition;
        return !wolfGuidePosition.isDead && wolfGuidePosition.isDesc;
      });
      if (index >= 0) {
        RoomPosition roomPosition = positions![index];
        if (roomPosition.uid == Session.uid) {
          isCurrentDesc = true;
        }
      }
    }

    return isCurrentDesc;
  }

  bool needShowDescTip() {
    bool flag = false;
    if (isCurrentDesc() && !isHasClickMute) {
      flag = true;
    }
    return flag;
  }
}
