import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';

import 'model/underData.dart';
import 'package:flutter/material.dart';
import '../base/config.dart';
import '../chatRoomData.dart';
import 'dart:async';
import 'package:shared/shared.dart';

class UnderMicCounter extends StatefulWidget {
  final ChatRoomData room;
  final RoomPosition roomPosition;
  final UserIconStyle style;

  const UnderMicCounter(
      {super.key,
      required this.room,
      required this.roomPosition,
      required this.style});

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<UnderMicCounter> {
  Timer? _timer;
  int _diff = 0;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  @override
  void didUpdateWidget(UnderMicCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
    if (oldWidget.roomPosition.counter != widget.roomPosition.counter) {
      _init();
    }
  }

  _onTimer(Timer timer) {
    Log.d("onTimer ${widget.roomPosition.counter} => ${widget.room.timestamp}");
    int diff = widget.roomPosition.counter - widget.room.timestamp;
    Log.d(diff);
    if (!shouldShowTimer()) {
      _stop();
    }
    setState(() {
      _diff = diff;
    });
  }

  _init() {
    _diff = widget.room.serverTime > 0
        ? widget.roomPosition.counter - widget.room.timestamp
        : 0;

    if (shouldShowTimer()) _start();
  }

  _start() {
    _stop();
    Duration duration = const Duration(milliseconds: 1000);
    _timer = Timer.periodic(duration, _onTimer);
  }

  _stop() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  bool shouldShowTimer() {
    if (_diff <= 0) return false;

    return (widget.room.config?.underData?.gameUnderState ==
                GameUnderState.Vote &&
            widget.roomPosition.uid == Session.uid &&
            !widget.roomPosition.underData!.gameUnderVoted) ||
        (widget.room.config?.underData?.gameUnderState == GameUnderState.Desc &&
            widget.room.config?.underData?.gameUnderCurrent ==
                widget.roomPosition.position);
  }

  Map<String, dynamic>? _getLabel() {
    Map<String, dynamic> labelPropties = {};
    if (widget.roomPosition.uid <= 0 &&
        widget.roomPosition.underData!.gameUnderOrigin <= 0) {
      return null;
    } else if (widget.roomPosition.underData?.gameUnderRole ==
        GameUnderRole.Populace_Loser) {
      labelPropties['text'] = K.room_civilian;
      labelPropties['text_color'] = Colors.white;
      labelPropties['bg'] = R.imagePath('counter_bg_loser.png',
          package: ComponentManager.MANAGER_BASE_ROOM);
      return labelPropties;
    } else if (widget.roomPosition.underData?.gameUnderRole ==
        GameUnderRole.Under_Loser) {
      labelPropties['text'] = K.room_under;
      labelPropties['text_color'] = Colors.white;
      labelPropties['bg'] = R.imagePath('counter_bg_loser.png',
          package: ComponentManager.MANAGER_BASE_ROOM);
      return labelPropties;
    } else if (shouldShowTimer()) {
      labelPropties['text'] = '${_diff}S';
      labelPropties['text_color'] = Colors.white;
      labelPropties['bg'] = R.imagePath('counter_bg_counter.png',
          package: ComponentManager.MANAGER_BASE_ROOM);
      if (widget.room.config?.underData?.gameUnderState ==
          GameUnderState.Vote) {
        labelPropties['bg'] = R.imagePath('counter_bg_vote.png',
            package: ComponentManager.MANAGER_BASE_ROOM);
      }
      return labelPropties;
    } else if (widget.room.config?.underData?.gameUnderState ==
        GameUnderState.Vote) {
      String? voteDesc =
          widget.roomPosition.underData!.gameUnderVoted ? null : K.voting;
      Color textColor = Colors.white;
      String bg = R.imagePath('counter_bg_counter.png',
          package: ComponentManager.MANAGER_BASE_ROOM);

      if (widget.room.isMic) {
        //在麦上
        if (widget.room.positionForCurrentUser!.underData!.gameUnderVoted) {
          //已经投票
        } else if (widget.room.positionForCurrentUser!.underData!
                .gameUnderEnableToVote &&
            widget.roomPosition.underData!.gameUnderEnableVotedByOther) {
          //当前用户可投票，且当前位置可被投票
          voteDesc = K.vote;
          textColor = const Color(0xFF34294E);
          bg = R.imagePath('counter_bg_vote.png',
              package: ComponentManager.MANAGER_BASE_ROOM);
        }
      } else {
        //不在麦上
      }

      if (voteDesc != null && voteDesc.isNotEmpty) {
        labelPropties['text'] = voteDesc;
        labelPropties['text_color'] = textColor;
        labelPropties['bg'] = bg;
        return labelPropties;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    double width = IconStyles[widget.style]?.width ?? 60;
    double height = 15.0 * width / IconStyles[UserIconStyle.Normal]!.width;

    Map<String, dynamic>? labelProps = _getLabel();

    if (widget.roomPosition.uid > 0 ||
        widget.roomPosition.underData!.gameUnderOrigin > 0) {
//      Log.d('DEBUG: In build getLabel, label: $label, role: ${this.widget.roomPosition.underData.gameUnderRole}');
    }

    if (labelProps == null || labelProps.isEmpty) {
      return const SizedBox(
        width: 0.0,
        height: 0.0,
      );
    }
    return PositionedDirectional(
        start: 0.0,
        top: 0.0,
        end: 0.0,
        bottom: 0.0,
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              start: 0.0,
              bottom: 0.0,
              width: width,
              height: height,
              child: IgnorePointer(
                  child: Image.asset(
                Util.notNullStr(labelProps['bg']),
                width: width,
                height: height,
              )),
            ),
            PositionedDirectional(
              start: 0.0,
              bottom: 0.0,
              width: width,
              height: height,
              child: IgnorePointer(
                  child: Center(
                child: Text(
                  Util.notNullStr(labelProps['text']),
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Util.parseColor(labelProps['text_color'])),
                ),
              )),
            ),
          ],
        ));
  }
}
