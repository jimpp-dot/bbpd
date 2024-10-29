import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';

///_renderWaitIcon内容需要点击的部分
class RenderWaitIconDown extends StatefulWidget {
  final ChatRoomData room;

  const RenderWaitIconDown({super.key, required this.room});

  @override
  _RenderWaitIconDownState createState() => _RenderWaitIconDownState();
}

class _RenderWaitIconDownState extends State<RenderWaitIconDown> {
  @override
  Widget build(BuildContext context) {
    return _renderWaitIconDown();
  }

  _displayWaitList() {
    MicUpWaitList.show(
        context: context,
        builder: (BuildContext context) {
          return MicUpWaitList(
            room: widget.room,
            admin: true,
          );
        });
  }

  Widget _renderWaitIconDown() {
    if (!widget.room.showWaitMic) return const SizedBox.shrink();

    Color bgColor = Colors.white12;
    Games? game = widget.room.config?.game;
    if (game == Games.Under ||
        game == Games.Guess ||
        widget.room.config?.types == RoomTypes.PartyGame) {
      bgColor = Colors.black.withOpacity(0.2);
    }

    double topMore = 0.0;
    if (widget.room.config?.types == RoomTypes.CpLove) {
      //CpLove有抱人,向下偏移掉倒计时高度
      topMore = 40.0;
    }
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 15.0, end: 12.0, top: 39 + topMore, bottom: 30),
      child: GestureDetector(
        onTap: _displayWaitList,
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: bgColor,
          ),
          padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
          alignment: AlignmentDirectional.center,
          child: Text(
            K.room_wait_list(['${widget.room.waitMicTotalNum}']),
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
