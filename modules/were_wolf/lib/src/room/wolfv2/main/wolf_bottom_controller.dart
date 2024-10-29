import 'package:chat_room/K.dart' as RoomK;
import 'package:chat_room/chat_room.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/main/wolf_repository.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/wolfOpUtil.dart';

///狼人底栏
///
class WolfBottomController extends StatefulWidget {
  final ChatRoomData room;

  const WolfBottomController({super.key, required this.room});

  @override
  _WolfBottomControllerState createState() => _WolfBottomControllerState();
}

class _WolfBottomControllerState extends State<WolfBottomController> {
  IRoomManager get roomManager => ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);

  ///
  /// done
  /// 参加-菜单
  /// 1.如果游戏未开始：有空位则可以申请上麦;无空位则不能申请上麦
  /// 2.如果游戏已开始：自己是游戏玩家则可以申请上麦(正常服务端自动上麦了)；自己不是游戏玩家则不能申请上麦
  ///
  Widget _renderJoinMic(ChatRoomData room) {
    bool canJoin = false;
    WolfConfigData? wolfConfigData = room.config?.configExpendData as WolfConfigData?;
    int index = room.positions.indexWhere((element) {
      WolfPositionData wolfPositionData = element.positionExpendData as WolfPositionData;
      return (wolfConfigData?.state == WolfState.Wait && element.uid == 0) ||
          (wolfConfigData?.state != WolfState.Wait && wolfPositionData.origin == Session.uid);
    });
    if (index > -1) {
      canJoin = true;
    }
    String cannotJoinStr = '';
    if (!canJoin) {
      if (wolfConfigData?.state == WolfState.Wait) {
        cannotJoinStr = K.wolf_v2_room_cannot_join_no_position;
      } else {
        cannotJoinStr = K.wolf_v2_room_cannot_join_gaming;
      }
    }

    //我在排麦中
    bool meIsWaitingMic =
        room.wait.contains(Session.uid) || room.waitForBoss.contains(Session.uid) || room.waitForAuction.contains(Session.uid);

    return roomManager.getControllerIconButton(
      buttonText: meIsWaitingMic ? RoomK.K.room_joining_mic : K.wolf_v2_room_controller_join,
      buttonType: meIsWaitingMic ? 1 : 2,
      backgroundColor: R.color.mainBrandColor,
      normalIcon: 'controller/ic_mic_sofa.webp',
      textSize: 13,
      onClick: (BuildContext context, bool selected) async {
        if (!meIsWaitingMic) {
          if (!canJoin) {
            Fluttertoast.showToast(msg: cannotJoinStr, gravity: ToastGravity.CENTER);
            return;
          }

          bool isGranted = await room.checkAudioAuthorization();
          if (!isGranted) {
            return;
          }

          if (room.config?.mode == RoomMode.Auto) {
            int pos = -1;
            RoomRepository.joinMic(room.rid, pos, needCertify: true, type: room.needVerify, newType: room.needVerifyNew);
          } else {
            Map? data = await RoomRepository.queue(room.rid, RoomConstant.Queue_Join,
                boss: false, needCertify: true, type: room.needVerify, newType: room.needVerifyNew);
            if (data != null && data.containsKey('certify') && data['certify'] == false) {
              // 未认证
              return;
            }

            //如果房间设置由自由上麦改为申请上麦 房主上麦时会提示房主不能排队上麦 跟服务端沟通 服务端表示不用改 一直是这个逻辑
            roomManager.openMicUpWaitListBottomPanel(System.context, room: room);
          }
        } else {
          //如果房间设置由自由上麦改为申请上麦 房主上麦时会提示房主不能排队上麦 跟服务端沟通 服务端表示不用改 一直是这个逻辑
          roomManager.openMicUpWaitListBottomPanel(System.context, room: room);
        }
      },
    );
  }

  ///
  /// done
  /// 过麦-菜单
  ///
  Widget _renderPass(ChatRoomData room) {
    return roomManager.getControllerIconButton(
        buttonType: 1,
        buttonText: K.wolf_v2_room_controller_pass,
        onClick: (BuildContext context, bool selected) async {
          await WolfRepository.pass(room.rid);
        });
  }

  ///
  /// done
  /// 开始游戏-菜单
  /// 1.所有人都准备了才能开始游戏；否则不能开始游戏
  ///
  Widget _renderStartGame(BuildContext context, ChatRoomData room) {
    bool canStart = true;

    ///游戏中有空位或者有人未准备,则不能开始
    int index = room.positions.indexWhere((element) {
      WolfPositionData wolfPositionData = element.positionExpendData as WolfPositionData;
      return element.uid == 0 || wolfPositionData.readyState != WolfReadyState.ready;
    });
    if (index > -1) {
      canStart = false;
    }

    return roomManager.getControllerIconButton(
      buttonType: 1,
      buttonText: K.wolf_v2_room_controller_start,
      onClick: (BuildContext context, bool selected) async {
        if (!canStart) {
          String reason = K.wolf_v2_room_controller_not_start_need_all_ready;
          int indexF = room.positions.indexWhere((element) {
            return element.uid == 0;
          });
          if (indexF >= 0) {
            //有空位
            reason = K.wolf_v2_game_start_tips;
          }
          Fluttertoast.showToast(msg: reason, gravity: ToastGravity.CENTER);
          return;
        }
        WolfRepository.startGame(room.rid);
      },
    );
  }

  ///
  /// done
  /// 结束游戏-菜单
  ///
  Widget _renderEndGame(BuildContext context, ChatRoomData room) {
    return roomManager.getControllerIconButton(
      buttonType: 1,
      buttonText: K.wolf_v2_room_controller_end,
      onClick: (BuildContext context, bool selected) async {
        bool? result = await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              content: Text(
                K.wolf_v2_room_controller_end_desc_1,
                style: const TextStyle(fontSize: 16.0),
              ),
              actions: <Widget>[
                CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(K.wolf_v2_cancel)),
                CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text(K.wolf_v2_sure)),
              ],
            );
          },
        );

        if (result == true) {
          WolfPositionData? wolfPositionData = room.positionForCurrentUser?.positionExpendData as WolfPositionData?;
          int aid = wolfPositionData?.aid ?? 0;
          await WolfRepository.end(room.rid, aid);
        }
      },
    );
  }

  ///
  /// 开关麦-菜单
  /// 1.用户不在麦位上,返回占用弹性空间的布局,并检查用户是否在声网开麦如果开麦关闭掉
  /// 2.如果用户在麦位上:
  ///  如果在游戏未开始和游戏结束阶段,可以自由开关麦;
  ///  如果在白天发言/警长发言/遗言阶段,如果自己麦序,可以自由开关麦,非自己麦序,自动闭麦且不能开麦
  ///  如果在其它阶段,自动闭麦且不能开麦
  ///
  Widget _renderMute(ChatRoomData room) {
    RoomPosition? selfPosition = room.positionForCurrentUser;
    //用户不在麦位上
    if (selfPosition == null) {
      if (!room.mute) {
        //处于开麦状态
        WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
          room.setMute(true); //关麦
        });
      }
      return const SizedBox.shrink();
    }

    //用户在麦位上
    WolfConfigData? wolfConfigData = room.config?.configExpendData as WolfConfigData?;
    WolfState? wolfState = wolfConfigData?.state;

    bool disabled; //发言按钮是否可点击
    String disabledStr = ''; //不可点击对应的文案

    bool isCurrentDesc = false;

    if (wolfState == WolfState.Wait || wolfState == WolfState.GameEnd || wolfState == WolfState.End) {
      //非游戏中状态
      disabled = false;
      if (widget.room.mute) {
        //当前处于关麦状态
        if (selfPosition.forbidden) {
          //被禁麦
          disabled = true;
          disabledStr = K.wolf_v2_room_controller_mute_5;
        }
      }
    } else if (wolfState == WolfState.DaytimeDesc || wolfState == WolfState.DaytimeLastWords || wolfState == WolfState.PoliceDesc) {
      //发言阶段
      int pos = Util.parseInt(wolfConfigData?.current);
      if (pos == selfPosition.position) {
        //当前发言麦序
        disabled = false;
        isCurrentDesc = true;
      } else {
        if (!room.mute) {
          //处于开麦状态
          room.setMute(true, false); //关麦
        }
        disabled = true;
        disabledStr = K.wolf_v2_room_controller_mute_3;
      }
    } else {
      if (!room.mute) {
        //处于开麦状态
        room.setMute(true, false); //关麦
      }
      disabled = true;
      disabledStr = K.wolf_v2_room_controller_mute_6;
    }

    return roomManager.getControllerIconButton(
        normalIcon: 'controller/ic_mute.png',
        selectedIcon: 'controller/ic_mute_disable.png',
        selected: room.mute,
        disabled: disabled,
        onClick: (BuildContext context, bool selected) async {
          bool flag = true;
          if (isCurrentDesc) {
            String opt = '';
            if (widget.room.mute) {
              //开麦
              opt = 'open';
            } else {
              //关麦
              opt = 'close';
            }
            flag = await WolfRepository.optionMic(widget.room.rid, opt);
          }
          if (flag) {
            await room.setMute(!room.mute);
          }
        },
        onDisabledClick: () {
          Fluttertoast.showToast(msg: disabledStr, gravity: ToastGravity.CENTER);
        });
  }

  ///
  /// done
  /// 赠送礼物-菜单
  ///
  Widget _renderGift() {
    return roomManager.renderGift(widget.room);
  }

  /// 排麦列表入口
  Widget _renderWaitMic() {
    return roomManager.getBounceScaleAnimationWidget(
      Stack(
        clipBehavior: Clip.none,
        children: [
          roomManager.getControllerIconButton(
            buttonText: RoomK.K.room_wait_mic_entrance,
            buttonType: 1,
            backgroundColor: R.color.secondaryBrandColor,
            onClick: (BuildContext context, bool selected) async {
              roomManager.openMicUpWaitListBottomPanel(context, room: widget.room, isAdmin: true);
            },
          ),
          PositionedDirectional(
            end: -8.0,
            top: -3.0,
            child: IgnorePointer(
              child: RoomBadgeNum(num: widget.room.waitMicTotalNum),
            ),
          ),
        ],
      ),
    );
  }

  /// 分享
  Widget _renderShare() {
    return roomManager.getControllerIconButton(
      normalIcon: 'controller/ic_room_invite.webp',
      onClick: (BuildContext context, bool selected) async {
        ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.share(context, widget.room.rid,
            tp: 1, needInApp: true, newShareInRoom: true, rid: widget.room.rid, title: RoomK.K.room_invite_friend);
      },
    );
  }

  /// 输入框
  Widget _renderInput({double marginStart = 8.0}) {
    bool isGaming = WolfOpUtil.isHideNormalMsg(widget.room); //在游戏中
    bool disabled = !(widget.room.config?.displayMessage ?? false) || isGaming;

    String inputStr = RoomK.K.room_input;

    return Expanded(
      child: disabled
          ? _renderDisableInput()
          : GestureDetector(
              onTap: () => _onInputTaped(context),
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white.withOpacity(0.12),
                ),
                margin: EdgeInsetsDirectional.only(start: marginStart, end: 8),
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        inputStr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14),
                      ),
                    ),
                    InkWell(
                      onTap: _displayEmotePanel,
                      child: R.img(
                        'controller/ic_room_input_emote.svg',
                        package: ComponentManager.MANAGER_BASE_ROOM,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  /// 限制发言
  Widget _renderDisableInput([bool isGaming = false]) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isGaming == true) {
          Fluttertoast.showToast(msg: K.wolf_gaming_not_message);
        }
      },
      child: Container(
        height: 34,
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                RoomK.K.room_input_disable,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
              ),
            ),
            InkWell(
              onTap: _displayEmotePanel,
              child: R.img(
                'controller/ic_room_input_emote.svg',
                package: ComponentManager.MANAGER_BASE_ROOM,
                color: Colors.white.withOpacity(0.4),
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 发送消息点击
  _onInputTaped(BuildContext context) async {
    if (await OperateUtil.checkAuth(context, widget.room, 'room:send_msg')) _displayInputMessage(context);
  }

  /// 调起emote 面板
  _displayEmotePanel() {
    bool disable = widget.room.config?.displayMessage == false && widget.room.role != ClientRole.Broadcaster;
    if (disable) {
      return;
    }

    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openEmotePanel(context, widget.room, defineBarrierColor: Colors.transparent);
  }

  _displayInputMessage(BuildContext context) async {
    bool? displayEmote = await roomManager.showInputMessage(context, room: widget.room);

    if (displayEmote != null && displayEmote) {
      _displayEmotePanel();
    }
  }

  /// 私聊消息入口
  Widget _renderChatMessage() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        roomManager.getControllerIconButton(
          buttonText: 'chat',
          isNewStyle: true,
          normalIcon: 'controller/ic_chat_message.svg',
          disabledIcon: 'controller/ic_chat_message.svg',
          onClick: (BuildContext context, bool selected) async {
            if (!Session.isLogined) {
              Fluttertoast.showToast(msg: RoomK.K.room_dropped_relogin);
              return;
            }

            Tracker.instance.track(TrackEvent.game_room, properties: {
              'game_room_click': 'messagelist',
              'rid': widget.room.rid,
              'room_type': widget.room.config?.type,
            });
            IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
            manager.openChatMessagePanel(context);
          },
        ),
        const RoomMessageRedPoint(width: 10, height: 10),
      ],
    );
  }

  Widget _buildBody() {
    List<Widget> res = [];
    res.add(const SizedBox(width: 12.0));
    RoomPosition? selfPosition = widget.room.positionForCurrentUser;
    if (selfPosition != null) {
      //已经在麦位上
      ///1号麦 开始菜单 或 结束菜单
      bool isFirst = WolfOpUtil.isFirstPosition(widget.room);
      if (isFirst || widget.room.purview == Purview.Createor) {
        WolfConfigData wolfConfigData = widget.room.config?.configExpendData as WolfConfigData;
        if (wolfConfigData.state == WolfState.Wait || wolfConfigData.state == WolfState.End) {
          res.add(_renderStartGame(context, widget.room));
          res.add(const SizedBox(width: 8.0));
        } else {
          res.add(_renderEndGame(context, widget.room));
          res.add(const SizedBox(width: 8.0));
        }
      }
      //过麦菜单
      bool needPass = WolfOpUtil.isNeedPass(widget.room);
      if (needPass) {
        res.add(_renderPass(widget.room));
        res.add(const SizedBox(width: 8.0));
      }
    } else {
      //还未上麦
      res.add(_renderJoinMic(widget.room));
      res.add(const SizedBox(width: 8.0));
    }

    // 排麦列表入口
    if (widget.room.showWaitMic) {
      res.add(_renderWaitMic());
      res.add(const SizedBox(width: 8.0));
    }

    res.add(_renderMute(widget.room));
    res.add(_renderInput(marginStart: WolfOpUtil.getRoomPosition(widget.room) == null ? 0.0 : 8.0));
    res.add(_renderGift());
    res.add(const SizedBox(width: 8.0));
    res.add(_renderChatMessage());
    res.add(const SizedBox(width: 8.0));
    res.add(_renderShare());
    res.add(const SizedBox(width: 12.0));

    return Container(
      height: bottomControllerHeight,
      margin: EdgeInsets.only(bottom: Util.iphoneXBottom),
      child: Row(
        children: res,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
