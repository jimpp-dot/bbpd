import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/src/room/wolfv2/dialog/wolf_auto_full_dialog.dart';
import 'package:were_wolf/src/room/wolfv2/dialog/wolf_end_dialog.dart';
import 'package:were_wolf/src/room/wolfv2/dialog/wolf_get_role_dialog.dart';
import 'package:were_wolf/src/room/wolfv2/dialog/wolf_get_role_result_dialog.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_center_bottom_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_center_middle_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_center_top_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_full_turn_user_widget.dart';
import 'package:were_wolf/src/room/wolfv2/wolfOpUtil.dart';
import 'package:were_wolf/src/room/wolfv2/wolfSourceUtil.dart';
import 'package:provider/provider.dart' hide Selector;

///狼人12人中间部分(上部分游戏区域(包含左侧麦位/中间内容(公告栏及部分操作浮层)/右侧麦位)以及下部分聊天区域)
class WolfRoom extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmote;

  const WolfRoom({Key? key, required this.room, this.displayEmote = true})
      : super(key: key);

  @override
  _WolfRoomState createState() => _WolfRoomState();
}

class _WolfRoomState extends State<WolfRoom> {
  late WolfModel _wolfModel;
  static const String DISPATCH_GAME_WOLF_EVENT =
      'room.game.wolf'; //socket分发的狼人杀消息

  @override
  void initState() {
    super.initState();
    _init();
    widget.room.addListener(DISPATCH_GAME_WOLF_EVENT, _onWolfEvent);
  }

  @override
  void dispose() {
    widget.room.removeListener(DISPATCH_GAME_WOLF_EVENT, _onWolfEvent);
    _wolfModel.dispose();
    WolfSourceUtil.stopVoice();
    super.dispose();
  }

  _init() {
    _wolfModel = WolfModel(widget.room);

    if (widget.room.config?.configExpendData == null ||
        widget.room.config?.configExpendData is! WolfConfigData) return;

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      WolfConfigData wolfConfigData =
          widget.room.config?.configExpendData as WolfConfigData;
      if (wolfConfigData.state == WolfState.End) {
        WolfEndDialog.show(context, widget.room);
      } else {
        WolfEndDialog.dismiss(context);
      }
      Future.delayed(const Duration(seconds: 3), () => _initSource());
    });
  }

  _initSource() async {
    if (!mounted) {
      return;
    }
    await WolfSourceUtil.initWolfSource();
  }

  Future<void> _onWolfEvent(String type, dynamic data) async {
    if (!mounted) return;

    if (widget.room.config == null ||
        widget.room.config?.configExpendData == null ||
        widget.room.config?.configExpendData is! WolfConfigData) return;

    WolfConfigData wolfConfigData =
        widget.room.config?.configExpendData as WolfConfigData;
    WolfState wolfState = wolfConfigData.state;
    RoomPosition? item =
        WolfOpUtil.getRoomPositionByUid(widget.room, Session.uid);
    _playVoice(wolfConfigData, item);
    if (wolfState == WolfState.GetRole) {
      RoomPosition? selfPosition = widget.room.positionForCurrentUser;
      if (selfPosition == null) return;
      GetRoleData getRoleData = GetRoleData.fromJson(
          wolfConfigData.currentResult as Map<String, dynamic>);
      WolfGetRoleDialog.show(context, data: getRoleData, wolfModel: _wolfModel);
    } else if (wolfState == WolfState.PublishRole) {
      RoomPosition? selfPosition = widget.room.positionForCurrentUser;
      if (selfPosition == null || wolfConfigData.currentResult == null) return;

      List roleData = wolfConfigData.currentResult!['positionRole'];
      List<RoleResultItem> positionRoles =
          roleData.map((_) => RoleResultItem.fromJson(_)).toList();
      RoleResultItem roleItem =
          positionRoles.firstWhere((_) => _.uid == selfPosition.uidOrOrigin);
      WolfGetRoleResultDialog.show(context,
          room: widget.room, roleItem: roleItem);
    } else if (wolfState == WolfState.End) {
      WolfEndDialog.show(context, widget.room);
    } else if (wolfState == WolfState.GameStart) {
      //进入新一局游戏抢身份阶段
      WolfEndDialog.dismiss(context);
      _wolfModel.clearAllMark();
      _wolfModel.clearAllSeerMar();
    }

    //游戏开始/进入白天/进入黑夜/开始pk发言,均需要转场动画；狼人自爆单独写因为暂时只能本人看到；
    if (wolfState == WolfState.GameStart ||
        wolfState == WolfState.Daytime ||
        wolfState == WolfState.Night ||
        wolfState == WolfState.DaytimePK ||
        wolfState == WolfState.DaytimePublishDead ||
        wolfState == WolfState.DaytimeVotePublishDead ||
        wolfState == WolfState.PoliceResult ||
        wolfState == WolfState.PoliceChangeResult ||
        wolfState == WolfState.PolicePk ||
        wolfState == WolfState.DaytimeGun ||
        wolfState == WolfState.NightAction ||
        wolfState == WolfState.NightAntidote) {
      Widget? childWidget;
      String? type;
      if (wolfState == WolfState.GameStart) {
        type = 'state.game.start';
      } else if (wolfState == WolfState.Daytime) {
        type = 'state.day.time';
      } else if (wolfState == WolfState.Night) {
        type = 'state.night';
      } else if (wolfState == WolfState.DaytimePK) {
        //发言pk
        type = 'state.day.time.pk';
      } else if (wolfState == WolfState.DaytimePublishDead) {
        //白天公布死亡结果
        List<RoomPosition> deadPositions =
            WolfOpUtil.getDeadPositions(widget.room);
        if (deadPositions.isEmpty) {
          type = 'state.day.time.no.dead';
        } else {
          type = 'state.day.time.dead';
          childWidget = Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 87.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    R.imagePath('wolfv2/full_turn/wolf_game_turn_user_bg.webp',
                        package: ComponentManager.MANAGER_WERE_WOLF),
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: deadPositions
                    .map((_) => WolfFullTurnUserWidget(roomPosition: _))
                    .toList(),
              ),
            ),
          );
        }
      } else if (wolfState == WolfState.DaytimeVotePublishDead) {
        //投票公布死亡结果
        List<RoomPosition> deadPositions =
            WolfOpUtil.getDeadPositions(widget.room);
        if (deadPositions.isNotEmpty) {
          type = 'state.day.time.vote.dead';
          childWidget = Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 87.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    R.imagePath('wolfv2/full_turn/wolf_game_turn_user_bg.webp',
                        package: ComponentManager.MANAGER_WERE_WOLF),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: deadPositions
                    .map((_) => WolfFullTurnUserWidget(roomPosition: _))
                    .toList(),
              ),
            ),
          );
        }
      } else if (wolfState == WolfState.PoliceResult) {
        //竞选警长结果
        RoomPosition? targetPosition = WolfOpUtil.getPolice(widget.room);
        bool hasPolice = targetPosition != null;
        if (hasPolice) {
          type = 'state.join.police.result';
          childWidget = Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 87.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    R.imagePath('wolfv2/full_turn/wolf_game_turn_user_bg.webp',
                        package: ComponentManager.MANAGER_WERE_WOLF),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: WolfFullTurnUserWidget(
                roomPosition: targetPosition,
              ),
            ),
          );
        }
      } else if (wolfState == WolfState.PoliceChangeResult) {
        //警长移交警徽结果
        RoomPosition? targetPosition = WolfOpUtil.getPolice(widget.room);
        bool hasPolice = targetPosition != null;
        if (hasPolice) {
          type = 'state.change.police.result';
          childWidget = Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 87.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    R.imagePath('wolfv2/full_turn/wolf_game_turn_user_bg.webp',
                        package: ComponentManager.MANAGER_WERE_WOLF),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: WolfFullTurnUserWidget(
                roomPosition: targetPosition,
              ),
            ),
          );
        } else {
          type = 'state.change.no.police.result';
        }
      } else if (wolfState == WolfState.PolicePk) {
        //竞选平票pk
        type = 'state.join.police.pk';

        List<RoomPosition> pkPositions = WolfOpUtil.getPKPositions(widget.room);
        if (pkPositions.isNotEmpty) {
          List<Widget> colRes = [];
          int len = pkPositions.length;
          if (len < 4) {
            colRes.add(const SizedBox(height: 28.0));
            List<Widget> rowRes = [];
            rowRes.add(const Spacer());
            for (int i = 0; i < len; i++) {
              rowRes.add(
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 4.0, end: 4.0),
                  child: WolfFullTurnUserWidget(
                    roomPosition: pkPositions[i],
                    maxWidth: 80.0,
                  ),
                ),
              );
            }
            rowRes.add(const Spacer());
            colRes.add(
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: rowRes,
              ),
            );
          } else {
            for (int i = 0; i < len; i += 4) {
              colRes.add(const SizedBox(height: 28.0));
              List<Widget> rowRes = [];
              rowRes.add(SizedBox(
                  width: (MediaQuery.of(context).size.width - 4 * 88.0) / 2));
              pkPositions.skip(i).take(4).forEach((item) {
                rowRes.add(
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 4.0, end: 4.0),
                    child: WolfFullTurnUserWidget(
                        roomPosition: item, maxWidth: 80.0),
                  ),
                );
              });
              colRes.add(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: rowRes,
                ),
              );
            }
          }
          childWidget = Positioned(
            top: 252.0 * MediaQuery.of(context).size.width / 375 - 28.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: colRes,
              ),
            ),
          );
        }
      } else if (wolfState == WolfState.NightAction ||
          wolfState == WolfState.NightAntidote ||
          wolfState == WolfState.DaytimeGun) {
        RoomPosition? selfPosition = widget.room.positionForCurrentUser;
        if (selfPosition == null) return;
        WolfPositionData wolfPositionData =
            selfPosition.positionExpendData as WolfPositionData;
        WolfRole role = wolfPositionData.role;
        bool needAwaitAni = false;
        if (wolfState == WolfState.NightAction) {
          //夜晚行动阶段
          if (!(role == WolfRole.Werewolf ||
              role == WolfRole.Seer ||
              role == WolfRole.Guard)) {
            //非狼人非预言家非守卫,则需要等到动画
            await Future.delayed(const Duration(milliseconds: 1000));
            needAwaitAni = true;
          }
        } else if (wolfState == WolfState.NightAntidote) {
          //夜晚解药阶段
          if (role != WolfRole.Witch) {
            //非女巫,则需要等到动画
            needAwaitAni = true;
          }
        } else if (wolfState == WolfState.DaytimeGun) {
          //猎人开枪阶段
          if (role != WolfRole.Hunter) {
            //非猎人,则需要等到动画
            needAwaitAni = true;
          }
        }
        if (needAwaitAni && _wolfModel.awaitAni == 0) {
          //一个白天或者黑夜只出现一次等待动画
          _wolfModel.awaitAni = 1;
          type = 'state.await.other';
        }
      }
      if (type != null && type.isNotEmpty) {
        WolfAutoFullDialog.show(
          context: context,
          type: type,
          childWidget: childWidget,
        );
      }
    }

    //等待状态、白天、夜晚、时，清除action数据
    if (wolfState == WolfState.Daytime ||
        wolfState == WolfState.Night ||
        wolfState == WolfState.Wait ||
        wolfState == WolfState.DaytimeGunPublishDead ||
        wolfState == WolfState.NightAntidote ||
        wolfState == WolfState.DaytimePK) {
      if (wolfState == WolfState.Daytime || wolfState == WolfState.Night) {
        _wolfModel.awaitAni = 0;
      }
      _wolfModel.actionUid = 0;
    } else {
      if (!mounted) {
        return;
      }
      _wolfModel.notifyRefresh();
    }
  }

  void _playVoice(WolfConfigData wolfConfigData, RoomPosition? item) {
    WolfState wolfState = wolfConfigData.state;
    WolfPositionData? wolfPositionData;
    if (item != null && item.positionExpendData is WolfPositionData) {
      wolfPositionData = item.positionExpendData as WolfPositionData;
    }
    switch (wolfState) {
      case WolfState.Wait:
        WolfSourceUtil.stopVoice();
        break;
      case WolfState.GetRole:

        ///抢身份
        WolfSourceUtil.playVoice("wolf_get_role_tips");
        break;
      case WolfState.PublishRole:

        ///公布身份
        WolfSourceUtil.playPublishRoleVoice(wolfPositionData?.role);
        break;
      case WolfState.Night:

        ///夜晚来临
        WolfSourceUtil.playNightAction(wolfPositionData);
        break;
      case WolfState.NightAction:

        ///夜晚行动
        if (wolfPositionData?.isDead == true) {
          return;
        }
        WolfRole? role = wolfPositionData?.role;
        if (role == WolfRole.Werewolf) {
          ///狼人行动
          if (!WolfSourceUtil.canplayVoice('wolf_night_action_wolf_tips')) {
            return;
          }
          WolfSourceUtil.playVoice('wolf_night_action_wolf_tips',
              onComplete: () {
            WolfSourceUtil.playVoice('wolf_night_bg');
          });
        } else if (role == WolfRole.Seer) {
          ///预言家行动
          if (!WolfSourceUtil.canplayVoice('wolf_night_action_seer_tips')) {
            return;
          }
          WolfSourceUtil.playVoice('wolf_night_action_seer_tips');
        } else if (role == WolfRole.Guard) {
          ///守卫行动
          if (!WolfSourceUtil.canplayVoice('wolf_night_action_guard_tips')) {
            return;
          }
          WolfSourceUtil.playVoice('wolf_night_action_guard_tips');
        }
        break;
      case WolfState.NightAntidote:

        ///救人
        if (wolfPositionData?.isDead ?? true) {
          return;
        }

        WolfRole? role = wolfPositionData?.role;
        if (role == WolfRole.Witch) {
          if (wolfPositionData?.actionStatus != WolfActionStatus.enable) {
            WolfSourceUtil.playVoice('wolf_night_action_witch_tips');
            return;
          }
          if (wolfConfigData.currentResult == null) {
            return;
          }

          WitchAntidoteData antidoteData = WitchAntidoteData.fromJson(
              wolfConfigData.currentResult!['antidote']);
          if (!antidoteData.hasAntidote || antidoteData.killTarget <= 0) {
            ///没有解药 ｜｜ 平安夜
            WolfSourceUtil.playVoice('wolf_night_action_witch_tips');
          } else {
            WolfSourceUtil.playVoice('wolf_night_action_witch_tips',
                onComplete: () {
              WolfSourceUtil.playVoice('wolf_night_action_witch_antidote_tips');
            });
          }
        }
        break;
      case WolfState.Daytime:

        ///白天
        WolfSourceUtil.playVoice('wolf_day_time_tips');
        break;
      case WolfState.DaytimePublishDead:

        ///白天公布死亡
        List<RoomPosition> deadPositions =
            WolfOpUtil.getDeadPositions(widget.room);
        if (deadPositions.isEmpty) {
          ///平安夜
          WolfSourceUtil.playVoice('wolf_day_time_no_dead_tips');
        } else {
          ///有人出局
          WolfSourceUtil.playVoice('wolf_day_time_has_dead_tips');
        }
        break;
      case WolfState.DaytimeDesc:
      case WolfState.PoliceDesc:

        ///几号玩家发言
        int position = wolfConfigData.current;
        bool selfSpeak = wolfPositionData != null &&
            item != null &&
            item.counter > 0 &&
            item.counter >= widget.room.timestamp;
        WolfSourceUtil.playSpeakVoice(position + 1,
            dealSpeak: false, selfSpeak: selfSpeak);
        break;
      case WolfState.DaytimeLastWords:

        ///几号玩家发表遗言
        int position = wolfConfigData.current;
        bool selfSpeak = wolfPositionData != null &&
            item != null &&
            item.counter > 0 &&
            item.counter >= widget.room.timestamp;
        WolfSourceUtil.playSpeakVoice(position + 1,
            dealSpeak: true, selfSpeak: selfSpeak);
        break;
      case WolfState.DaytimeGun:

        ///猎人请行动
        WolfRole? role = wolfPositionData?.role;
        if (role == WolfRole.Hunter) {
          if (wolfPositionData?.actionStatus != WolfActionStatus.enable) {
            return;
          }
          WolfSourceUtil.playVoice('wolf_day_time_gun_hunter_tips');
        }
        break;
      case WolfState.PoliceJoin:

        ///警长竞选
        if (wolfPositionData?.actionStatus != WolfActionStatus.enable) {
          return;
        }
        WolfSourceUtil.playVoice('wolf_police_join_tips');
        break;
      case WolfState.PoliceVote:

        ///警长竞选投票
        if (wolfPositionData?.actionStatus != WolfActionStatus.enable) {
          return;
        }
        WolfSourceUtil.playVoice('wolf_police_vote_tips');
        break;
      case WolfState.PolicePk:

        ///警长竞选PK
        WolfSourceUtil.playVoice('wolf_police_pk_tips');
        break;
      case WolfState.DaytimePK:

        ///警长竞选平票
        WolfSourceUtil.playVoice('wolf_police_result_equal_tips');
        break;
      case WolfState.PoliceResult:
        RoomPosition? targetPosition = WolfOpUtil.getPolice(widget.room);
        bool hasPolice = targetPosition != null;
        if (hasPolice) {
          ///警长竞选结果有警长
          WolfSourceUtil.playVoice('wolf_police_has_tips');
        }
        break;
      case WolfState.DaytimeVote:

        ///放逐投票
        if (wolfPositionData?.actionStatus != WolfActionStatus.enable) {
          return;
        }
        WolfSourceUtil.playVoice('wolf_day_time_vote_tips');
        break;
      case WolfState.DaytimeVotePublishDead:

        ///放逐投票公布结果

        List<RoomPosition> deadPositions =
            WolfOpUtil.getDeadPositions(widget.room);
        if (deadPositions.isEmpty) {
          ///无人出局
          WolfSourceUtil.playVoice('wolf_day_time_vote_no_dead_tips');
        } else {
          ///有人出局
          WolfSourceUtil.playVoice('wolf_day_time_vote_has_dead_tips');
        }
        break;
      case WolfState.PoliceChangeResult:

        ///撕毁警徽
        RoomPosition? targetPosition = WolfOpUtil.getPolice(widget.room);
        bool hasPolice = targetPosition != null;
        if (!hasPolice) {
          WolfSourceUtil.playVoice('wolf_police_destroy_tips');
        }
        break;
      case WolfState.End:

        ///游戏结果
        Map endData = wolfConfigData.currentResult ?? {};
        int result = Util.parseInt(endData['win'], 2);
        if (result == 3) {
          ///狼人胜利
          WolfRole? role = wolfPositionData?.role;
          if (role == WolfRole.Werewolf) {
            ///本局胜利
            WolfSourceUtil.playVoice('wolf_win_tips');
          } else if (role != null) {
            ///本局失败
            WolfSourceUtil.playVoice('wolf_fail_tips');
          }
        } else if (result == 2) {
          ///平民胜利
          WolfRole? role = wolfPositionData?.role;
          if (role == WolfRole.Werewolf) {
            ///本局失败
            WolfSourceUtil.playVoice('wolf_fail_tips');
          } else if (role != null) {
            ///本局胜利
            WolfSourceUtil.playVoice('wolf_win_tips');
          }
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WolfModel>.value(
      value: _wolfModel,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WolfCenterTopWidget(room: widget.room),
          ValueListenableBuilder(
            valueListenable: widget.room.speakers,
            builder: (context, speakers, child) {
              return WolfCenterMiddleWidget(
                room: widget.room,
                speakers: speakers,
                displayEmote: widget.displayEmote,
              );
            },
          ),
          WolfCenterBottomWidget(room: widget.room),
        ],
      ),
    );
  }
}
