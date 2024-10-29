import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/accompany/widget/mic_time_select_widget.dart';
import 'package:flutter/material.dart';

///付费陪伴房结束提示消息
class EndMicItem extends StatelessWidget {
  final MessageContent message;
  final ChatRoomData room;

  const EndMicItem(this.message, this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    return _renderEndMic(context, message);
  }

  Widget _renderEndMic(BuildContext context, MessageContent message) {
    int time = Util.parseInt(message.extra?['time']);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${K.room_end_mic_total_time} ${Utility.formatTimeClock(time)}',
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            MicTimeSelectWidget.show(context, room, 0);
          },
          child: Container(
            margin: const EdgeInsetsDirectional.only(start: 4),
            padding: const EdgeInsetsDirectional.only(
                start: 6, end: 6, top: 1, bottom: 1),
            decoration: ShapeDecoration(
              color: R.color.mainBrandColor,
              shape: const StadiumBorder(),
            ),
            child: Text(
              K.room_apply_upmic,
              style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
