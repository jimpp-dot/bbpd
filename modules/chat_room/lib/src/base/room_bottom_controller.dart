import 'dart:async';

import 'package:chat_room/k.dart';
import 'package:chat_room/src/accompany/widget/mic_time_select_widget.dart';
import 'package:chat_room/src/base/room_controller_button_mix.dart';
import 'package:chat_room/src/base/widget/bounce_scale_animation_widget.dart';
import 'package:chat_room/src/base/widget/input_message.dart';
import 'package:chat_room/src/base/widget/render_gift.dart';
import 'package:chat_room/src/base/widget/superadmin_quick_answer_widget.dart';
import 'package:chat_room/src/bonus/model/bonus_beans.dart';
import 'package:chat_room/src/bonus/model/bonus_model.dart';
import 'package:chat_room/src/ktv/utils/reporter.dart';
import 'package:chat_room/src/talent/talent_module.dart';
import 'package:chat_room/src/talent_new/list/talent_programme_widget_new.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart' hide Selector;
import 'package:shared/shared.dart';

import '../../chat_room.dart';
import '../base/widget/defendBuyPanel.dart';
import '../under/model/underData.dart';
import '../under/underBottomController.dart';
import 'art_center_can_not_join_mic_dialog.dart';
import 'model/pb/quick_reply_repo.dart';
import 'model/room_quick_reply_msg.dart';
import 'widget/controller_icon_button.dart';

const double bottomControllerHeight = 50;

/// 房间底部操作栏
class RoomBottomController extends StatefulWidget {
  final ChatRoomData room;
  final Key? emoteIconKey;

  const RoomBottomController({
    Key? key,
    required this.room,
    this.emoteIconKey,
  }) : super(key: key);

  @override
  State<RoomBottomController> createState() => RoomBottomControllerState();
}

class RoomBottomControllerState extends State<RoomBottomController> with RoomControllerButtonMixin {
  final IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

  List<RoomQuickReplyMsgData> quickMsgData = [];

  /// 时间对象
  Timer? _timer;

  @override
  ChatRoomData get roomData => widget.room;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(RoomConstant.Event_Room_Display_Input, _handleDisplayInput);

    eventCenter.addListener(RoomConstant.Event_Room_User_Mute, _handleUserMute);

    _quickMsgList();

    if (widget.room.isRoomMuted) {
      startCountDown();
    }
  }

  @override
  void dispose() {
    eventCenter.removeListener(RoomConstant.Event_Room_Display_Input, _handleDisplayInput);
    eventCenter.removeListener(RoomConstant.Event_Room_User_Mute, _handleUserMute);
    cancelCountDown();
    super.dispose();
  }

  /// 开始倒计时
  void startCountDown() {
    cancelCountDown();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.room.muteCountdown <= 0) {
        cancelCountDown();
        widget.room.roomMute = false;
        widget.room.muteCountdown = 0;
      } else {
        widget.room.muteCountdown--;
      }
      refresh(() {});
    });
  }

  /// 取消倒计时
  void cancelCountDown() {
    _timer?.cancel();
    _timer = null;
  }

  void _handleDisplayInput(String type, Object? data) {
    BonusModel bonusModel = context.read<BonusModel>();
    BonusInfo? curBonus = bonusModel.value?.curBonus;
    if ((curBonus?.sign?.isNotEmpty ?? false)) {
      Clipboard.setData(ClipboardData(text: curBonus?.sign ?? ''));
    }

    _onInputTaped(context);
  }

  /// 禁言通知事件
  void _handleUserMute(String type, Object? data) {
    if (data is int) {
      int countdown = Util.parseInt(data);
      Log.d('_handleUserMute data:$countdown');
      if (countdown > 0) {
        widget.room.roomMute = true;
        widget.room.muteCountdown = countdown;
        if (widget.room.isRoomMuted) {
          startCountDown();
        }
      }
    }
  }

  _wantJoinDefend() async {
    if (widget.room.positions.isEmpty || widget.room.positions[0].uid == 0) {
      Fluttertoast.showToast(msg: K.room_empty_reception_cant_protect, gravity: ToastGravity.CENTER);
      return;
    }
    String url = "room/defend";
    Map<String, String> post = {
      'rid': widget.room.rid.toString(),
      'uid': widget.room.positions[0].uid.toString(),
    };
    Map? res = await RoomRepository.xhrAutoError(url, post, toastSuccess: false);
    if (res?['success'] == true) {
      displayDefendTypes(System.context, res!['data']['to'], res['data']['name'], res['data']['defend'], widget.room);
      return;
    }
  }

  /// 发送消息点击
  _onInputTaped(BuildContext context) async {
    if (await OperateUtil.checkAuth(context, widget.room, 'room:send_msg')) _displayInputMessage(context);
  }

  Widget _renderJoinMic() {
    bool normal = widget.room.wait.contains(Session.uid);
    bool boss = widget.room.waitForBoss.contains(Session.uid);
    bool auction = widget.room.waitForAuction.contains(Session.uid);

    int type = 0;
    if (normal) {
      type = 1;
    } else if (boss) {
      type = 2;
    } else if (auction) {
      type = 3;
    }
    return _renderJoinMicAction(type);
  }

  Widget _renderJoinMicAction(int joined) {
    bool isWaitingMic = Util.parseInt(joined) > 0; // true：排麦中 false：未排麦

    String text = isWaitingMic ? K.room_joining_mic : '上麦';
    Color bgColor = R.color.mainBrandColor;
    if (widget.room.isBusinessCpLove) {
      text = isWaitingMic ? K.room_joining_mic : K.room_join;
      bgColor = R.color.secondaryBrandColor;
    } else if (widget.room.config?.game == Games.Under || widget.room.config?.game == Games.Guess) {
      text = isWaitingMic ? K.room_joining_mic : K.room_join;
    }

    return ControllerIconButton(
      buttonText: text,
      buttonType: isWaitingMic ? 1 : 3,
      backgroundColor: bgColor,
      textColor: isWaitingMic ? Colors.white38 : Colors.black,
      normalIcon: 'controller/ic_mic_sofa.webp',
      textSize: 13,
      isOval: false,
      onClick: (BuildContext context, bool selected) async {
        if (roomData.isArtCenterInsertOtherRoom) {
          /// 麦序房在转入其他房间时，不能上麦
          ArtCenterCanNotJoinMicDialog.show(context: context, toRid: roomData.config!.rid);
          return;
        }
        // 婚礼房 麦位点击拦截
        if (ChatRoomUtil.isWedding(widget.room.config)) {
          Fluttertoast.showToast(msg: K.room_wedding_mic_click_tip);
          return;
        }
        if (widget.room.config?.factoryType == RoomFactoryType.BusinessPayVoice) {
          MicTimeSelectWidget.show(context, widget.room, 0);
          return;
        }

        int underOfflinePosition = -1;
        for (int i = 0; i < widget.room.positions.length; i++) {
          if (Session.uid > 0 && widget.room.positions[i].underData?.gameUnderOrigin == Session.uid) {
            underOfflinePosition = i;
            break;
          }
        }

        //卧底房游戏过程中不能上麦
        if (widget.room.config != null &&
            widget.room.config?.game == Games.Under &&
            widget.room.config?.underData?.gameUnderState != GameUnderState.Wait &&
            widget.room.config?.underData?.gameUnderState != GameUnderState.End &&
            underOfflinePosition == -1) {
          Fluttertoast.showToast(msg: K.room_cant_join_mic_in_playing, gravity: ToastGravity.CENTER);
          return;
        }

        bool isGranted = await widget.room.checkAudioAuthorization();
        if (!isGranted) {
          return;
        }

        if (widget.room.config != null && widget.room.config?.ktvInfo != null) {
          KtvReporter.applyOnMic(widget.room.realRid);
        }

        /// 才艺厅0麦位为当前表演者，如果在表演列表前3后3,且当前没有表演者，可以直接上麦
        if (ChatRoomUtil.isLiveTalent(widget.room.config) && !TalentModule.hasPerformerUser(widget.room, errVal: true)) {
          bool canAutoUpMic = false;
          if (widget.room.isCreator) {
            canAutoUpMic = true;
          } else {
            canAutoUpMic = await TalentModule.isQueueAnchor(widget.room.realRid, toastError: true);
          }

          if (canAutoUpMic == true) {
            RoomRepository.joinMic(
              widget.room.realRid,
              0,
              needCertify: true,
              type: widget.room.needVerify,
              newType: widget.room.needVerifyNew,
            );

            return;
          }
        }

        int pos = -1;

        //如果是8麦位模式的房主或者已经在麦位上
        if (((widget.room.isEightPosition || widget.room.isFivePosition) && widget.room.config?.uid == Session.uid) ||
            widget.room.positionForCurrentUser != null) {
          if (widget.room.role == ClientRole.Audience) {
            await widget.room.setRole(ClientRole.Broadcaster);
          }
        } else if (widget.room.config?.types == RoomTypes.RadioDefend) {
          _wantJoinDefend();
        } else if (joined == 0) {
          bool boos = false;

          /// 开启了房主位 && 当前用户是房主 直接上麦
          if (widget.room.config!.showOwnerSeat && widget.room.isCreator) {
            RoomRepository.joinMic(
              widget.room.realRid,
              pos,
              needCertify: true,
              type: widget.room.needVerify,
              newType: widget.room.needVerifyNew,
            );
            return;
          }
          if ((widget.room.config?.paier ?? 0) > 0) {
            //有老板位
            int bossPosition = widget.room.bossPosition;
            List<SheetItem> res = [];
            res.add(SheetItem(K.room_be_boss_chair, "join", bossPosition));
            res.add(SheetItem(K.room_normal_chair, "join", -1));

            SheetCallback? result = await displayModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return RadioBottomSheet(data: res);
                });
            if (result == null || result.reason == SheetCloseReason.Active) {
              return;
            }
            pos = result.value?.extra;
            boos = (pos == bossPosition);
          }
          if (widget.room.config?.mode == RoomMode.Auto ||
              ((widget.room.isKtvRoom || widget.room.isKtvChorusRoom) && Session.uid == widget.room.config?.uid)) {
            RoomRepository.joinMic(
              widget.room.realRid,
              pos,
              needCertify: true,
              type: widget.room.needVerify,
              newType: widget.room.needVerifyNew,
            );
          } else {
            displayWaitList(System.context, widget.room, boos, false);
          }
        } else {
          displayWaitList(System.context, widget.room);
        }
      },
    );
  }

  List<Widget> _renderInMic() {
    List<Widget> widgets = [];
    if (widget.room.config?.game == Games.Under) {
      widgets.addAll(UnderBottomController.getControllers(context, widget.room));
      return widgets;
    } else if (widget.room.config?.game == Games.Guess && widget.room.positions[0].uid == Session.uid) {
      IDrawGuessManager drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
      if (!drawGuessManager.isGaming()) {
        widgets.add(_renderStartGameGuess());
      } else {
        widgets.add(_renderEndGameGuess());
      }
    } else if (widget.room.isGuessQueue && widget.room.positions[0].uid == Session.uid) {
      IDrawGuessManager drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
      if (!drawGuessManager.isGuessQueueGaming(context)) {
        widgets.add(_renderStartGameGuessQueue());
      } else {
        widgets.add(_renderEndGameGuessQueue());
      }
    }

    widgets.add(_renderMute());
    return widgets;
  }

  /// 开始-画猜房
  Widget _renderStartGameGuess() {
    int inMicCounts = 0;
    for (var roomPosition in widget.room.positions) {
      IDrawGuessManager drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
      int originUid = drawGuessManager.getOriginUid(roomPosition.positionExpendData);
      if (roomPosition.uid > 0 || originUid > 0) {
        inMicCounts++;
      }
    }

    bool disabled = inMicCounts < 4;
    return ControllerIconButton(
        buttonText: K.start,
        buttonType: 1,
        backgroundColor: R.color.secondaryBrandColor,
        disabled: disabled,
        onClick: (BuildContext context, bool selected) async {
          widget.room.emit('room.game.guess.start');
        },
        onDisabledClick: () {
          Fluttertoast.showToast(msg: K.room_cant_play_less_user, gravity: ToastGravity.CENTER);
        });
  }

  /// 结束-画猜房
  Widget _renderEndGameGuess() {
    return ControllerIconButton(
      buttonType: 1,
      buttonText: K.end,
      backgroundColor: R.color.mainBrandColor,
      onClick: (BuildContext context, bool selected) async {
        bool? result = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                content: Text(
                  K.room_notice_end_game,
                  style: const TextStyle(fontSize: 16.0),
                ),
                actions: <Widget>[
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(K.cancel),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text(K.sure),
                  ),
                ],
              );
            });

        IDrawGuessManager drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
        int aid = drawGuessManager.getAid(widget.room.positions[0].positionExpendData);
        if (result == true) {
          widget.room.emit('room.game.guess.end', {'rid': widget.room.rid, 'aid': aid});
        }
      },
    );
  }

  /// 开始-画猜接龙房
  Widget _renderStartGameGuessQueue() {
    return ControllerIconButton(
      buttonText: K.start,
      buttonType: 1,
      backgroundColor: R.color.secondaryBrandColor,
      onClick: (BuildContext context, bool selected) async {
        eventCenter.emit(EventConstant.EventGuessQueueStart);
      },
    );
  }

  /// 结束-画猜接龙房
  Widget _renderEndGameGuessQueue() {
    return ControllerIconButton(
      buttonType: 1,
      buttonText: K.end,
      backgroundColor: R.color.mainBrandColor,
      onClick: (BuildContext context, bool selected) async {
        bool? result = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                content: Text(
                  K.room_notice_end_game,
                  style: const TextStyle(fontSize: 16.0),
                ),
                actions: <Widget>[
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(K.cancel),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text(K.sure),
                  ),
                ],
              );
            });

        if (result == true) {
          eventCenter.emit(EventConstant.EventGuessQueueEnd);
        }
      },
    );
  }

  /// 闭麦，开麦
  Widget _renderMute() {
    bool disabled = widget.room.isForbidden || widget.room.canOperateMic == false;
    String disabledStr = K.room_cant_open_while_close_mic;
    RoomPosition? curPos = widget.room.positionForCurrentUser;
    if (widget.room.isMic && widget.room.config?.game == Games.Guess) {
      if (curPos != null) {
        IDrawGuessManager drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
        bool flag = drawGuessManager.isDrawerChooseOrDrawing(curPos.positionExpendData);
        if (flag) {
          disabled = true;
          disabledStr = K.room_cant_open_mic_in_choosing_word;
        }
      }
    }

    return ControllerIconButton(
        buttonText: 'mute',
        isNewStyle: false,
        normalIcon: 'controller/ic_mute.png',
        selectedIcon: 'controller/ic_mute_disable.png',
        selected: widget.room.mute,
        disabled: disabled,
        onClick: (BuildContext context, bool selected) async {
          if (widget.room.shouldVerify()) {
            ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
            bool suc = await loginManager.openAuthDialog(System.context,
                type: widget.room.needVerify, newType: widget.room.needVerifyNew, refer: 'open_mic');
            if (!suc) return;

            // 发消息刷新chatRoomData
            eventCenter.emit(EventConstant.EventCertifyChange, 0);
          }
          await widget.room.setMute(!selected);

          if (curPos?.position != roomPositionVirtual) {
            Map? data = await RoomRepository.opMic(widget.room.realRid, curPos?.position, selected ? 'openMic' : 'closeMic');
            if (data != null && data['success'] == true) {
              /// 本地设置下麦位的状态，防止服务端做限流时，没有及时刷socket.
              if (curPos != null) {
                curPos.micStatus = widget.room.mute ? 0 : 1;
              }
              widget.room.emit(RoomConstant.Event_Refresh);
            }
          }
          widget.room.rtcController.checkLocalAudioState();
        },
        onDisabledClick: () {
          Fluttertoast.showToast(msg: disabledStr, gravity: ToastGravity.CENTER);
        });
  }

  Widget _renderGift({bool? isStatic}) {
    return RenderGift(room: widget.room, isStatic: isStatic ?? false);
  }

  /// 私聊消息入口
  Widget _renderChatMessage() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        ControllerIconButton(
          buttonText: 'chat',
          isNewStyle: false,
          normalIcon: 'controller/ic_chat_message.png',
          disabledIcon: 'controller/ic_chat_message.png',
          type: 'chat',
          disabled: false,
          onClick: (BuildContext context, bool selected) async {
            if (!Session.isLogined) {
              Fluttertoast.showToast(msg: K.room_dropped_relogin);
              return;
            }

            Tracker.instance.track(TrackEvent.game_room, properties: {
              'game_room_click': 'messagelist',
              'rid': widget.room.realRid,
              'room_type': widget.room.config?.type,
            });
            IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
            manager.openChatMessagePanel(context);
          },
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: RoomMessageRedPoint(width: 10, height: 10),
        ),
      ],
    );
  }

  /// 调起emote 面板
  _displayEmotePanel() {
    bool disable = (widget.room.config?.displayMessage ?? false) == false && widget.room.role != ClientRole.Broadcaster;
    if (disable) {
      return;
    }

    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openEmotePanel(context, widget.room, defineBarrierColor: Colors.transparent);
  }

  /// 所有人都展示更多入口，因为有很多玩法入口是服务端下发的
  Widget _renderMenu() {
    bool showRedDot = widget.room.moreMenuController.showMenuRedDot(widget.room);

    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topEnd,
      children: [
        ControllerIconButton(
          buttonText: 'menu',
          isNewStyle: false,
          normalIcon: 'controller/ic_room_menu.png',
          disabledIcon: 'controller/ic_room_menu.png',
          disabled: false,
          iconShowRedPoint: showRedDot,
          onClick: (BuildContext context, bool selected) async {
            eventCenter.emit(EventConstant.EventClickRoomMoreMenu);
            IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
            await roomManager.openRoomBottomMenu(context, widget.room);
            refresh();
          },
        ),
      ],
    );
  }

  Widget _renderNormalLeft() {
    List<Widget> res = [];
    if (widget.room.role == ClientRole.Broadcaster) {
      _renderInMic().forEach((widget) {
        res.add(widget);
      });
    } else {
      res.add(_renderJoinMic());
    }

    List<Widget> widgets = [];
    for (var iconWidget in res) {
      widgets.add(const SizedBox(width: 8));
      widgets.add(iconWidget);
    }

    return Row(
      children: widgets,
    );
  }

  //试音
  Widget _renderOrderLeftNormal([bool isWaitingMic = false]) {
    return ControllerIconButton(
      buttonType: isWaitingMic ? 1 : 2,
      buttonText: isWaitingMic ? K.room_joining_mic : K.room_try_voice,
      backgroundColor: R.color.mainBrandColor,
      normalIcon: 'controller/ic_mic_sofa.webp',
      textSize: 13,
      onClick: (BuildContext context, bool selected) async {
        displayWaitList(System.context, widget.room, false, false);
      },
    );
  }

  //点单
  Widget _renderOrderLeftBoss([bool isWaitingMic = false]) {
    return ControllerIconButton(
      buttonText: isWaitingMic ? K.room_joining_mic : K.room_order,
      buttonType: isWaitingMic ? 1 : 2,
      backgroundColor: R.color.mainBrandColor,
      normalIcon: 'controller/ic_mic_sofa.webp',
      textSize: 13,
      onClick: (BuildContext context, bool selected) async {
        displayWaitList(System.context, widget.room, true, false);
      },
    );
  }

  Widget _renderOrderLeft() {
    if (widget.room.role == ClientRole.Broadcaster) {
      return Row(
        children: <Widget>[
          _renderMute(),
        ],
      );
    } else {
      List<Widget> res = [];
      bool addMargin = false;
      if (Session.role == UserRole.GOD) {
        addMargin = true;
        if (widget.room.wait.contains(Session.uid)) {
          res.add(Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              _renderOrderLeftNormal(true),
            ],
          ));
        } else {
          res.add(_renderOrderLeftNormal());
        }
      }

      if (addMargin) res.add(_renderMargin());
      if (widget.room.waitForBoss.contains(Session.uid)) {
        res.add(Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            _renderOrderLeftBoss(true),
          ],
        ));
      } else {
        res.add(_renderOrderLeftBoss());
      }

      return Row(
        children: res,
      );
    }
  }

  Widget _renderInput() {
    return _renderNormalInput();
  }

  /// 输入框
  Widget _renderNormalInput() {
    bool disabled = !(widget.room.config?.displayMessage ?? false);
    RoomPosition? curPos = widget.room.positionForCurrentUser;
    String inputStr = '聊点什么...';

    if (curPos != null && widget.room.config?.game == Games.Guess) {
      IDrawGuessManager drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
      bool flag = drawGuessManager.isDrawerChooseOrDrawing(curPos.positionExpendData);
      if (flag) {
        disabled = true;
      }
      if (drawGuessManager.isGaming()) {
        inputStr = K.room_guess_gaming_input_msg;
      }
    }

    if (widget.room.isRoomMuted) {
      disabled = true;
    }

    return Expanded(
      child: disabled
          ? _renderDisableInput()
          : GestureDetector(
              onTap: () => _onInputTaped(context),
              child: Container(
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  gradient: ThemeColors.gradient,
                ),
                margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
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
                      key: widget.emoteIconKey,
                      child: R.img(
                        'controller/ic_room_input_emote.png',
                        package: ComponentManager.MANAGER_BASE_ROOM,
                        width: 34,
                        height: 34,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  /// 限制发言
  Widget _renderDisableInput() {
    return Container(
      height: 34,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              widget.room.isRoomMuted ? K.room_user_moted_seconds(['${widget.room.muteCountdown}']) : K.room_input_disable,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
            ),
          ),
          InkWell(
            onTap: widget.room.isRoomMuted ? null : _displayEmotePanel,
            key: widget.emoteIconKey,
            child: R.img(
              'controller/ic_room_input_emote.png',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderMargin() {
    return const SizedBox(width: 8.0);
  }

  /// 麦序房节目单按钮
  Widget _renderArtCenterMenuBtn() {
    return ControllerIconButton(
      buttonText: 'ArtCenterMenu',
      normalIcon: R.imagePath('controller/ic_art_center_menu.svg', package: ComponentManager.MANAGER_BASE_ROOM),
      type: 'artCenterMenu',
      onClick: (BuildContext context, bool selected) async {
        if (!Session.isLogined) {
          Fluttertoast.showToast(msg: K.room_dropped_relogin);
          return;
        }

        /// 麦序房菜单按钮点击
        TalentProgrammeListNewWidget.showOptionsPanel(context, widget.room);
      },
    );
  }

  Widget _buildNormal() {
    bool showGiftCombo = false;
    // 暂时只在直播间有连击礼物，房主（主播）不展示连击礼物按钮
    // KTV房增加连击礼物
    // if (widget.room.comboGift != null &&
    //     widget.room.comboGift!.id > 0 &&
    //     ((widget.room.isKtvRoom || widget.room.isKtvChorusRoom) || widget.room.createor?.uid != Session.uid)) {
    //   showGiftCombo = true;
    // }

    bool isShowShare = false;
    int inputRightBtnMaxNum = 4; //输入框右边按钮数 最多4个
    int inputRightBtnNum = 0;
    bool isSuper = widget.room.isSuper;

    /// 麦序房节目单按钮
    inputRightBtnNum += roomData.isArtCenterAll ? 1 : 0;

    inputRightBtnNum += isSuper ? 1 : 0; // 巡管快捷回复
    inputRightBtnNum += showGiftCombo ? 1 : 0;
    inputRightBtnNum += (widget.room.config?.displayChat ?? false) ? 1 : 0; //私信
    inputRightBtnNum += (widget.room.showStarSign) ? 1 : 0;
    inputRightBtnNum += 1; //更多

    /// 小于4个时显示邀请好友，否则不显示
    if (inputRightBtnNum < inputRightBtnMaxNum) {
      inputRightBtnNum++;
      isShowShare = true;
    }

    return Row(
      children: [
        _renderInput(),

        //
        // if (showGiftCombo) ...[
        //   ComboGiftButton(widget.room),
        //   _renderMargin(),
        // ],

        ...[
          _renderGift(isStatic: true),
          _renderMargin(),
        ],

        if (isSuper) ...[
          _renderQuickAnswer(),
          _renderMargin(),
        ],

        /// 分享入口
        if (isShowShare) ...[
          _renderShare(),
          _renderMargin(),
        ],

        /// 消息入口
        if ((widget.room.config?.displayChat ?? false)) ...[
          _renderChatMessage(),
          _renderMargin(),
        ],

        _renderMenu(),
        _renderNormalLeft(),
        if (widget.room.showWaitMic) ...[
          _renderMargin(),
          _renderWaitMic(),
        ],
      ],
    );
  }

  /// 超管快捷回复
  Widget _renderQuickAnswer() {
    return ControllerIconButton(
      buttonText: 'QuickAnswer',
      normalIcon: 'controller/ic_quickanswer.webp',
      onClick: (BuildContext context, bool selected) async {
        SuperAdminQuickAnswerWidget.show(context, room: widget.room);
      },
    );
  }

  _displayInputMessage(BuildContext context) async {
    _quickMsgList();

    bool? displayEmote = await displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      builder: (BuildContext context) {
        return InputMessage(
          room: widget.room,
          displayPresetSpeechContent: true,
          quickMsg: quickMsgData,
          updateQuickReplyMsgCallback: (List<RoomQuickReplyMsgData> value) {
            quickMsgData = value;
          },
        );
      },
      maxHeightRatio: 0.75,
    );

    if (displayEmote == true) {
      _displayEmotePanel();
    }
  }

  void _quickMsgList() async {
    RoomQuickReplyMsg quickReplyMsg = await QuickReplyRepo.quickMsgList(widget.room.rid);
    if (quickReplyMsg.success == true) {
      quickMsgData = quickReplyMsg.data ?? [];
    }
  }

  // 排麦列表入口
  Widget _renderWaitMic() {
    return BounceScaleAnimationWidget(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ControllerIconButton(
            buttonText: K.room_wait_mic_entrance,
            buttonType: 1,
            backgroundColor: R.color.secondaryBrandColor,
            onClick: (BuildContext context, bool selected) async {
              displayWaitList(context, widget.room, false, false, true);
            },
          ),
          PositionedDirectional(
            end: -8.0,
            top: -3.0,
            child: IgnorePointer(
              child: RoomBadgeNum(num: widget.room.waitMicTotalNum),
            ),
          )
        ],
      ),
    );
  }

  // 分享
  Widget _renderShare() => shareBtn;

  /// 召唤入口
  // Widget _buildSkillEntrance() {
  //   return GestureDetector(

  //     onTap: () {
  //       IRankManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
  //       manager.showMateSkillListScreen(context, rid: roomData.realRid);
  //     },
  //     child: R.img(
  //       RoomAssets.controller_ic_room_skill_webp,
  //       width: 32,
  //       height: 32,
  //       package: RoomAssets.package,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomControllerHeight,
      margin: const EdgeInsetsDirectional.only(end: 8.0),
      child: _buildNormal(),
    );
  }
}
