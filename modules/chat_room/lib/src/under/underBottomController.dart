import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/controller_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'model/underData.dart';
import 'model/underRepository.dart';

class UnderBottomController {
  static List<Widget> getControllers(BuildContext context, ChatRoomData room) {
    List<Widget> widgets = [];

    //非严格模式取麦位的isAdmin字段
    bool isAdmin = room.config?.underData?.isStrict == false && room.positionForCurrentUser?.underData?.isAdmin == true;

    //严格模式管理员为一号麦位
    isAdmin |= room.config?.underData?.isStrict == true && room.positions.isNotEmpty && room.positions[0].uid == Session.uid;

    if (room.config!.underData?.isStrict == true) {
      Widget? widget = _renderEndDesc(room);
      if (widget != null) {
        widgets.add(widget);
      }
    } else {
      Widget? widget = _renderStartVote(room);
      if (widget != null) {
        widgets.add(widget);
      }
      widget = _renderEndVote(room);
      if (widget != null) {
        widgets.add(widget);
      }
    }

    if (isAdmin) {
      if (room.config?.underData?.gameUnderState == GameUnderState.Wait || room.config?.underData?.gameUnderState == GameUnderState.End) {
        widgets.add(_renderStartGameUnder(room));
      } else {
        widgets.add(_renderEndGameUnder(context, room));
      }
    }

    widgets.add(_renderMute(room));

    return widgets;
  }

  static Widget _renderControllerIcon({required String text, required VoidCallback onPress, Color? backgroundColor, double? textSize}) {
    return ControllerIconButton(
      buttonType: 1,
      buttonText: text,
      textSize: textSize ?? 11,
      backgroundColor: backgroundColor ?? R.color.secondaryBrandColor,
      onClick: (BuildContext context, bool selected) {
        onPress();
      },
    );

//    return GestureDetector(
//      onTap: onPress,
//      child: Container(
//          margin: EdgeInsets.symmetric(horizontal: 8),
//          width: 34,
//          height: 34,
//          child: Stack(
//            children: <Widget>[
//              Image.asset(btnBg ?? 'assets/images/room/btn_bg_controller.png'),
//              Center(
//                child: Text(
//                  text,
//                  style: TextStyle(
//                      fontSize: 8,
//                      color: textColor ?? Color(0xFFFF7A1D),
//                    fontFamily: Util.fontFamily,
//                    fontWeight: FontWeight.bold
//                  ),
//                ),
//              ),
//            ],
//          )
//      ),
//    );
  }

  static Widget? _renderStartVote(ChatRoomData room) {
    if (room.config?.underData?.gameUnderState == GameUnderState.Desc && room.positionForCurrentUser?.underData?.isAdmin == true) {
      return _renderControllerIcon(
        text: K.room_start_vote,
        textSize: 8,
        onPress: () => UnderRepository.startVote(room.rid, Session.uid),
      );
    } else {
      return null;
    }
  }

  static Widget? _renderEndVote(ChatRoomData room) {
    if (room.config?.underData?.gameUnderState == GameUnderState.Vote && room.positionForCurrentUser?.underData?.isAdmin == true) {
      return _renderControllerIcon(
        text: K.room_end_vote,
        textSize: 8,
        backgroundColor: R.color.mainBrandColor,
        onPress: () => UnderRepository.endVote(room.rid, Session.uid),
      );
    } else {
      return null;
    }
  }

  static Widget? _renderEndDesc(ChatRoomData room) {
    Log.d(
        'DEBUG: gameUnderState: ${room.config?.underData?.gameUnderState}, isStrict: ${room.config?.underData?.isStrict}, isCurrent: ${room.positionForCurrentUser?.position == room.config?.underData?.gameUnderCurrent}');
    if (room.config?.underData?.gameUnderState == GameUnderState.Desc &&
        room.positionForCurrentUser?.position == room.config?.underData?.gameUnderCurrent) {
      return _renderControllerIcon(
        text: K.room_pass_mic,
        backgroundColor: R.color.mainBrandColor,
        onPress: () => UnderRepository.endDesc(room.rid, Session.uid),
      );
    } else {
      return null;
    }
  }

  /// 开始-卧底房
  static Widget _renderStartGameUnder(ChatRoomData room) {
    return _renderControllerIcon(
        text: K.start,
        onPress: () {
          // int inMicCounts = 0;
          // room.positions.forEach((RoomPosition roomPosition) {
          //   if (roomPosition.uid > 0 || roomPosition.underData.gameUnderOrigin > 0) {
          //     inMicCounts++;
          //   }
          // });
          //
          // if (inMicCounts < 5) {
          //   Fluttertoast.showToast(
          //       msg: R.string('room_cant_play_less_user'), gravity: ToastGravity.CENTER);
          // } else {
          UnderRepository.startGameUnder(room.rid, Session.uid);
          // }
        });
  }

  /// 结束-卧底房
  static Widget _renderEndGameUnder(BuildContext context, ChatRoomData room) {
    return _renderControllerIcon(
        text: K.end,
        backgroundColor: R.color.mainBrandColor,
        onPress: () async {
          bool? result = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                    content: Text(
                      K.room_notice_end_game_in_under,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    actions: <Widget>[
                      CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(K.cancel)),
                      CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text(K.sure)),
                    ]);
              });

          int? aid = room.positions.isEmpty ? null : room.positions[0].underData?.gameUnderId;
          if (result == true) await UnderRepository.endGameUnder(room.rid, aid ?? 0);
        });
  }

  static Widget _renderMute(ChatRoomData room) {
    bool enabled = !room.isForbidden;
    String disabledStr = K.room_cant_open_while_close_mic;
    if (room.isMic && room.config?.game == Games.Under && room.config!.underData!.isStrict) {
      if (room.config?.underData?.gameUnderState == GameUnderState.Desc) {
        enabled = room.config?.underData?.gameUnderCurrent == room.positionForCurrentUser?.position;
      } else if (room.config?.underData?.gameUnderState == GameUnderState.Vote ||
          room.config?.underData?.gameUnderState == GameUnderState.Ready) {
        enabled = false;
      }
      if (room.config?.underData?.gameUnderState == GameUnderState.Desc) {
        disabledStr = K.room_not_your_turn_to_speak;
      } else if (room.config?.underData?.gameUnderState == GameUnderState.Vote) {
        disabledStr = K.room_cant_open_mic_in_vote;
      }
    }
    return ControllerIconButton(
        buttonText: 'mute',

        /// 点击埋点用
        isNewStyle: true,
        normalIcon: 'controller/ic_mute.png',
        selectedIcon: 'controller/ic_mute_disable.png',
        selected: room.mute,
        disabled: !enabled,
        onClick: (BuildContext context, bool selected) async {
          await room.setMute(!selected);
          RoomPosition? curPos = room.positionForCurrentUser;
          RoomRepository.opMic(room.rid, curPos?.position ?? 0, selected ? 'openMic' : 'closeMic');
        },
        onDisabledClick: () {
          Fluttertoast.showToast(msg: disabledStr, gravity: ToastGravity.CENTER);
        });
  }
}
