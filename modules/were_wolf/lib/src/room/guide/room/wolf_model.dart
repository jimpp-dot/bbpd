import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideConfig.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideData.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_main.dart';
import 'package:were_wolf/src/room/wolfv2/wolfOpUtil.dart';

class WolfModel with ChangeNotifier {
  int _actionUid = 0;
  double messageHight = WolfOpUtil.itemHeight * WolfOpUtil.sideCount +
      WolfOpUtil.spaceHeight * (WolfOpUtil.sideCount - 1);

  int? _awaitAni;

  WolfGuideData data;

  Map<int, List<RoomPosition>> killingData = <int, List<RoomPosition>>{};

  WolfModel(this.data);

  ///
  /// 每1秒检查一次
  /// 状态流转具体逻辑
  ///
  void eventControl() {
    if (data.currentState == WolfGuideConfigState.Wait) {
      //等待阶段->游戏开始阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.getTimeByState(data.currentState!) -
              data.currentStateLeaveTime ==
          2) {
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_BOARD_HIDE_EVENT);
      }
      if (data.getTimeByState(data.currentState!) -
              data.currentStateLeaveTime ==
          3) {
        eventCenter.emit(WolfGuideMain
            .DISPATCH_GAME_WOLF_GUIDE_SHOW_START_FULL_DIALOG_EVENT);
      }
      if (data.currentStateLeaveTime <= 0) {
        data.initToGameStart();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.GameStart) {
      //游戏开始阶段->抢身份阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToGetRole();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.GetRole) {
      //抢身份阶段->身份公布阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToPublishRole();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.PublishRole) {
      //身份公布阶段->天黑阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToNight();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.Night) {
      //天黑阶段->夜晚行动阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToNightAction(function: () {
          Log.d("initToNightAction onComplete22 ");
          notifyListeners();

          //夜晚系统语音播放完成，检查是否跳到女巫阶段
          checkJumpNightAction();
        });
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.NightAction) {
      //夜晚行动阶段->女巫解药阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.getTimeByState(data.currentState) - data.currentStateLeaveTime ==
          5) {
        bool flag = data.needKillerRole();
        if (flag) {
          notifyListeners();
        }
      }
      if (data.currentStateLeaveTime <= 0) {
        _actionUid = 0; //清除选中的目标
        data.initToNightAntidote();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.NightAntidote) {
      //女巫解药阶段->女巫毒药阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToNightPoison();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.NightPoison) {
      //女巫毒药阶段->天亮阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToDaytime();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.Daytime) {
      //天亮阶段->白天死亡公布阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToDaytimePublishDead();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.DaytimePublishDead) {
      //白天死亡公布阶段->游戏结束阶段或白天发言阶段或白天遗言阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToDaytimeDescData();
        bool gameEnd = data.isGameEnd();
        Log.d("DaytimeVotePublishDead data.currentStateTime gameEnd=$gameEnd");
        if (gameEnd) {
          //游戏结束
          data.initToGameEnd();
        } else {
          int index = data.positions!.indexWhere((element) {
            WolfGuidePosition wolfGuidePosition =
                element.positionExpendData as WolfGuidePosition;
            return !wolfGuidePosition.isDead && wolfGuidePosition.isDesc;
          });
          if (index >= 0) {
            //发言未结束
            RoomPosition voicePosition = data.positions![index];
            //msg
            String str = "【${voicePosition.position + 1}】";
            Map extra = {
              'subType': 'wolfNormal',
              "highLightContent": [str]
            };
            MessageContent content = MessageContent.from(
              K.wolf_v2_guide_board_14([str]),
              extra,
              null,
              -1,
            );
            eventCenter.emit(
                WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
            //msg
          }
          data.initToDaytimeDesc();
        }
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.DaytimeLastWords) {
      //白天遗言阶段->天黑阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToNight();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.DaytimeDesc) {
      //白天发言阶段->白天开始投票阶段或白天发言阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        int index = data.positions!.indexWhere((element) {
          WolfGuidePosition wolfGuidePosition =
              element.positionExpendData as WolfGuidePosition;
          return !wolfGuidePosition.isDead && wolfGuidePosition.isDesc;
        });

        if (index >= 0) {
          RoomPosition voicePosition = data.positions![index];
          data.speakers![voicePosition.uid] = false;
          WolfGuidePosition wolfGuidePosition =
              voicePosition.positionExpendData as WolfGuidePosition;
          wolfGuidePosition.isDesc = false;

          //msg
          String str = "【${voicePosition.position + 1}】";
          Map extra = {
            'subType': 'wolfNormal',
            "highLightContent": [str]
          };
          int useTime = data.getTimeByState(data.currentState);
          MessageContent content = MessageContent.from(
            K.wolf_v2_guide_board_10([str, '$useTime']),
            extra,
            null,
            -1,
          );
          eventCenter.emit(
              WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
          //msg
        }

        index = data.positions!.indexWhere((element) {
          WolfGuidePosition wolfGuidePosition =
              element.positionExpendData as WolfGuidePosition;
          return !wolfGuidePosition.isDead && wolfGuidePosition.isDesc;
        });

        if (index < 0) {
          //发言结束
          data.initToDaytimeStartVote();
          data.isHasClickMute = true;
          eventCenter
              .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
          eventCenter
              .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
          return;
        }

        data.initToDaytimeDesc();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.DaytimeStartVote) {
      //白天开始投票阶段->白天投票阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToDaytimeVote();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.DaytimeVote) {
      //白天投票阶段->投票结果阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        _actionUid = 0; //清除选中的目标
        data.initToDaytimeVoteResult();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.DaytimeVoteResult) {
      //投票结果阶段->投票死亡结果公布阶段或者天黑阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToDaytimeVotePublishDead();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState ==
        WolfGuideConfigState.DaytimeVotePublishDead) {
      //投票死亡结果公布阶段->游戏结束阶段或者白天遗言阶段或者游戏结束阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        bool gameEnd = data.isGameEnd();
        Log.d("DaytimeVotePublishDead data.currentStateTime gameEnd=$gameEnd");

        if (gameEnd) {
          data.initToGameEnd();
        } else {
          if (data.deadPositions != null && data.deadPositions!.isNotEmpty) {
            data.initToDaytimeLastWords(function: () {
              data.initToNight();
              Log.d("initToNight onComplete33 ");
//                  notifyListeners();
              eventCenter.emit(
                  WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
              eventCenter.emit(
                  WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
            });
          } else {
            data.initToNight();
          }
        }

        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    } else if (data.currentState == WolfGuideConfigState.GameEnd) {
      //游戏结束阶段->结束阶段
      data.currentStateLeaveTime = data.currentStateLeaveTime - 1;
      if (data.currentStateLeaveTime <= 0) {
        data.initToEnd();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
//        notifyListeners();
      }
    }
    Log.d(
        "eventControl this.data.currentStateTime=${data.currentStateLeaveTime} this.data.currentState=${data.currentState}");
  }

  ///过麦
  void passDesc() {
    int index = data.positions!.indexWhere((element) {
      return element.uid == Session.uid;
    });

    if (index >= 0) {
      RoomPosition voicePosition = data.positions![index];
      data.speakers![voicePosition.uid] = false;
      WolfGuidePosition wolfGuidePosition =
          voicePosition.positionExpendData as WolfGuidePosition;
      wolfGuidePosition.isDesc = false;

      //msg
      String str = "【${voicePosition.position + 1}】";
      Map extra = {
        'subType': 'wolfNormal',
        "highLightContent": [str]
      };
      int useTime =
          data.getTimeByState(data.currentState) - data.currentStateLeaveTime;
      MessageContent content = MessageContent.from(
        K.wolf_v2_guide_board_10([str, '$useTime']),
        extra,
        null,
        -1,
      );
      eventCenter.emit(
          WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT, content);
      //msg

      data.initToDaytimeDesc();
      eventCenter
          .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
      eventCenter
          .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
    }
  }

  //检查是否需要跳过夜晚行动
  void checkJumpNightAction() {
    RoomPosition voicePosition = data.positions![5];
    bool isSpeaking = data.speakers!.containsKey(voicePosition.uid) &&
        data.speakers![voicePosition.uid]!;

    RoomPosition? selfPosition = data.positionForCurrentUser();
    WolfGuidePosition? wolfGuidePosition =
        selfPosition?.positionExpendData as WolfGuidePosition?;

    //不能操作或者已完成操作
    if (!isSpeaking &&
        (wolfGuidePosition == null || !wolfGuidePosition.canAction)) {
      //系统玩家已完成说话&&玩家自己已选择击杀
      if (data.currentState == WolfGuideConfigState.NightAction) {
        _actionUid = 0; //清除选中的目标
        data.initToNightAntidote();
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
        eventCenter
            .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
      }
    }
  }

  RoomPosition? get targetPosition {
    int targetUid = _actionUid;
    if (data.positions != null) {
      for (var _ in data.positions!) {
        if (_.uid == targetUid) {
          return _;
        }
      }
    }
    return null;
  }

  set actionUid(int value) {
    if (_actionUid == value) {
      _actionUid = 0;
    } else {
      _actionUid = value;
    }
//    notifyListeners();
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
  }

  int get actionUid {
    return _actionUid;
  }

  set awaitAni(int hasAni) {
    if (hasAni != 0) {
      _awaitAni = 1;
    } else {
      _awaitAni = 0;
    }
  }

  int get awaitAni {
    return _awaitAni ?? 1;
  }

  setMuteClose(bool flag) {
    Log.d("setMuteClose flag=$flag data.isMuteClose=${data.isMuteClose}");
    if (flag != data.isMuteClose) {
      data.isMuteClose = flag;
//      notifyListeners();
      Log.d("setMuteClose 11 flag=$flag data.isMuteClose=${data.isMuteClose}");
    }
  }

  bool getMuteClose() {
    return data.isMuteClose;
  }

  set middleMessageHight(double height) {
    messageHight = height;
    notifyListeners();
  }

  void notifyRefresh() {
//    notifyListeners();
  }

  RoomPosition? positionForCurrentUser({int uid = 0}) {
    if (data.positions != null) {
      for (var element in data.positions!) {
        if (element.uid == (uid != 0 ? uid : Session.uid)) {
          return element;
        }
      }
    }
    return null;
  }

  void _confirmAction() {
    RoomPosition? selfPosition = positionForCurrentUser();
    if (selfPosition == null) return;

    WolfGuidePosition selfWolfGuidePosition =
        selfPosition.positionExpendData as WolfGuidePosition;
    selfWolfGuidePosition.canAction = false;
//    notifyListeners();
  }

  Future<bool> wolfKill(int uid, {bool isConfirm = false}) async {
    Log.d("wolfKill _actionUid=$_actionUid uid=$uid");
    if (_actionUid > 0) {
      if (!isConfirm) {
        data.wolfKillerRole(_actionUid, Session.uid, isKill: false);
      }
    }
    if (_actionUid != uid) {
      _actionUid = uid;
      data.wolfKillerRole(uid, Session.uid, isKill: true);
    } else {
      _actionUid = 0;
    }
    if (isConfirm) {
      _confirmAction();
    }

//    notifyListeners();
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
    return true;
  }

  Future<bool> vote(int uid, {bool isConfirm = false}) async {
    if (_actionUid != uid) {
      _actionUid = uid;
    } else {
      _actionUid = 0;
    }
    if (isConfirm) {
      _confirmAction();
    }

//    notifyListeners();
    eventCenter.emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);
    return true;
  }
}
