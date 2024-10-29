import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

class RelationshipMessageItem extends StatelessWidget {
  final MessageContent message;

  const RelationshipMessageItem(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    Map extra = message.extra ?? {};
    int subType = Util.parseInt(extra['sub_type']);
    if (subType == 1) {
      return _renderRoomMessage(context, message);
    } else if (subType == 0) {
      return _renderNormalMessage(context, message);
    }
    return const SizedBox.shrink();
  }

  Widget _renderNormalMessage(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    String leftName = Util.notNullStr(extra['user_name1']);
    String rightName = Util.notNullStr(extra['user_name2']);
    return RichText(
      text: TextSpan(
        style: messageTextStyle.copyWith(
          fontFamily: Util.fontFamily,
          color: Colors.white,
        ),
        children: [
          TextSpan(
              text: K.room_congratulations,
              style: messageTextStyle.copyWith(color: Colors.white)),
          TextSpan(
              text: '【$leftName】',
              style: messageTextStyle.copyWith(color: const Color(0xffFCE88D))),
          TextSpan(
              text: K.room_with,
              style: messageTextStyle.copyWith(color: Colors.white)),
          TextSpan(
              text: '【$rightName】',
              style: messageTextStyle.copyWith(color: const Color(0xffFCE88D))),
          TextSpan(
              text: '牵手成功！祝福他们，一路相伴。',
              style: messageTextStyle.copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _renderRoomMessage(BuildContext context, MessageContent message) {
    Map extra = message.extra ?? {};
    int rid = Util.parseInt(extra['room_id']);
    String leftName = Util.notNullStr(extra['user_name1']);
    String rightName = Util.notNullStr(extra['user_name2']);
    String des1 = Util.notNullStr(extra['msg1']);
    String des2 = Util.notNullStr(extra['msg2']);
    String des3 = Util.notNullStr(extra['msg3']);
    return RichText(
      text: TextSpan(
        style: messageTextStyle.copyWith(
          fontFamily: Util.fontFamily,
          color: Colors.white,
        ),
        children: [
          TextSpan(
              text: des1,
              style: messageTextStyle.copyWith(color: Colors.white)),
          TextSpan(
              text: leftName,
              style: messageTextStyle.copyWith(color: Colors.white)),
          TextSpan(
              text: des2,
              style: messageTextStyle.copyWith(color: Colors.white)),
          TextSpan(
              text: rightName,
              style: messageTextStyle.copyWith(color: Colors.white)),
          TextSpan(
              text: des3,
              style: messageTextStyle.copyWith(color: Colors.white)),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                IRoomManager roomManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_BASE_ROOM);
                roomManager.openChatRoomScreenShow(context, rid);
              },
              child: Text('点击围观>>',
                  style: messageTextStyle.copyWith(
                      color: const Color(0xffFCE88D),
                      decoration: TextDecoration.underline)),
            ),
          ),
        ],
      ),
    );
  }
}
