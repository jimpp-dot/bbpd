import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/accompany/model/accompany_pay_model.dart';
import 'package:chat_room/src/accompany/widget/mic_time_select_widget.dart';

///付费陪聊房
class AccompanyPayWidget extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmote;

  const AccompanyPayWidget(
      {super.key, required this.room, required this.displayEmote});

  @override
  _AccompanyPayWidgetState createState() => _AccompanyPayWidgetState();
}

class _AccompanyPayWidgetState extends State<AccompanyPayWidget> {
  AccompanyPayData? _accompanyData;
  Timer? _timer;
  final Throttle _messageAction =
      Throttle(duration: const Duration(seconds: 2));

  bool get isAccompany {
    if (widget.room.positions.length < 2) return false;
    return widget.room.positions[1].uid > 0 &&
        _remainTime > 0 &&
        Util.parseInt(_accompanyData?.totalTime) > 0;
  }

  int get _accompanyTime {
    if (_accompanyData == null) return 0;
    return max(0, _accompanyData!.totalTime - _remainTime);
  }

  int get _remainTime {
    if (_accompanyData == null) return 0;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        _accompanyData!.accompanyEndTime * 1000);
    DateTime dateNow = DateTime.now();
    int diff = dateTime.difference(dateNow).inSeconds;
    return max(diff, 0);
  }

  @override
  void initState() {
    super.initState();

    if (widget.room.config?.configExpendData is AccompanyPayData) {
      _accompanyData = widget.room.config?.configExpendData as AccompanyPayData;
    }
    widget.room.addListener(RoomConstant.Event_Refresh, _onAccompanyRefresh);
    widget.room.addListener(RoomConstant.Event_End_Remain_Time, _endMic);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _onTick();
    });
  }

  @override
  dispose() {
    widget.room.removeListener(RoomConstant.Event_Refresh, _onAccompanyRefresh);
    widget.room.removeListener(RoomConstant.Event_End_Remain_Time, _endMic);
    _timer?.cancel();
    _messageAction.dispose();
    super.dispose();
  }

  _onTick() {
    if (_accompanyData == null || _accompanyData!.totalTime <= 0) return;
    if (widget.room.positions[1].uid == Session.uid) {
      int remainTime = _remainTime;
      Log.d('remainTime:$remainTime');
      if (remainTime == 31) {
        MicTimeSelectWidget.show(context, widget.room, _remainTime,
            remain: true);
      }
      if (remainTime == 0) {
        _endMic('', '');
      }
      if (remainTime < 31) {
        widget.room.emit(RoomConstant.Event_Refresh_Remain_Time, remainTime);
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  void _onAccompanyRefresh(String name, dynamic data) {
    if (widget.room.config?.configExpendData is AccompanyPayData) {
      _accompanyData = widget.room.config?.configExpendData as AccompanyPayData;
      if (_remainTime <= 0 && widget.room.positions[1].uid == Session.uid) {
        _endMic('', '');
      }
    }
    if (mounted) setState(() {});
  }

  _endMic(String name, dynamic data) async {
    _messageAction.call(() {
      widget.room.emit(RoomConstant.Event_Send_End_Mic_Msg, _accompanyTime);
    });
    widget.room.emit(RoomConstant.Event_Refresh_Remain_Time, 0);
    await ChatRoomUtil.handleIconTap(
        context, widget.room, widget.room.positions[1], 'mic-leavel');
    if (mounted) setState(() {});
  }

  Widget _buildUserPosition(RoomPosition? roomPosition) {
    if (roomPosition == null) return const SizedBox();
    return SizedBox(
      width: 77 * Util.ratio,
      child: Column(
        children: [
          UserIcon(
            room: widget.room,
            position: roomPosition,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            roomPosition.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11, color: Colors.white),
          ),
        ],
      ),
    );
  }

  String _getFormattedDuration(int duration) {
    return Utility.formatTimeClock(duration);
  }

  Widget _buildAccompanyProgress() {
    return SizedBox(
      height: isAccompany ? 16 : 20,
      child: isAccompany
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100 * Util.ratio,
                  alignment: AlignmentDirectional.centerEnd,
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: Text(
                    _getFormattedDuration(_accompanyTime),
                    style: const TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ),
                AccompanyProgressIndicator(
                  value: max(
                      min(_accompanyTime / _accompanyData!.totalTime * 1.0,
                          1.0),
                      0.05),
                  height: 6,
                  width: 149 * Util.ratio,
                ),
                Container(
                  width: 100 * Util.ratio,
                  alignment: AlignmentDirectional.centerStart,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        _getFormattedDuration(_accompanyData!.totalTime),
                        style:
                            const TextStyle(fontSize: 11, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          MicTimeSelectWidget.show(
                              context, widget.room, _remainTime);
                        },
                        child: Container(
                          padding: const EdgeInsetsDirectional.only(
                              start: 4, end: 4),
                          child: R.img('ic_add_time.webp',
                              width: 20,
                              height: 20,
                              package: ComponentManager.MANAGER_BASE_ROOM),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_accompanyData == null) return const SizedBox();
    return SizedBox(
      width: 355 * Util.ratio,
      height: 300 * Util.ratio,
      child: Stack(
        children: [
          CachedNetworkImage(
            key: GlobalKey(),
            width: 355 * Util.ratio,
            height: 300 * Util.ratio,
            imageUrl: _accompanyData!.decorate,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80 * Util.ratio,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildUserPosition(widget.room.positions[0]),
                  SizedBox(
                    width: 22 * Util.ratio,
                  ),
                  _buildUserPosition(widget.room.positions[1]),
                ],
              ),
              SizedBox(
                height: 89 * Util.ratio,
              ),
              if (_accompanyData!.totalTime > 0) _buildAccompanyProgress(),
            ],
          ),
        ],
      ),
    );
  }
}

class AccompanyProgressIndicator extends StatelessWidget {
  final double value;
  final double height;
  final double width;

  const AccompanyProgressIndicator(
      {super.key,
      required this.value,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: SizedBox(
            width: width,
            height: height,
            child: Row(
              children: [
                Container(
                  width: width * value,
                  height: height,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFE360FE), Color(0xFF76FFDF)])),
                ),
                Container(
                  width: width * (1 - value),
                  height: height,
                  color: const Color(0x33FFFFFF),
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          start: max(width * value - 10, 0),
          child: R.img('ic_accompany_indicator.svg',
              package: ComponentManager.MANAGER_BASE_ROOM,
              height: 8,
              width: 14),
        ),
      ],
    );
  }
}
