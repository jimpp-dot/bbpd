import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

class KnightExpireItem extends StatelessWidget {
  final MessageContent message;

  const KnightExpireItem(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return _renderKnightExpire(context, message);
  }

  Widget _renderKnightExpire(BuildContext context, MessageContent message) {
    int knightLevel = Util.parseInt(message.extra?['knight_level']);
    int expireDays = Util.parseInt(message.extra?['expire_days']);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          K.knight_expire_msg_text_1,
          style: messageTextStyle.copyWith(color: Colors.white),
        ),
        const SizedBox(width: 4),
        UserKnightWidget(
          knightLevel: Util.parseInt(knightLevel),
        ),
        const SizedBox(width: 4),
        Text(
          K.knight_expire_msg_text_2,
          style: messageTextStyle.copyWith(color: const Color(0xFFF6F7F9)),
        ),
        Text(
          K.knight_expire_msg_text_3(['$expireDays']),
          style: messageTextStyle.copyWith(
              color: const Color(0xFFF6F7F9), fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () {
            IRoomManager roomManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            roomManager.openBuyKnightScreen(context, level: knightLevel);
          },
          child: Container(
            height: 22,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: const Color(0xFFFF5F7D),
            ),
            child: Text(
              K.room_renew,
              style: messageTextStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
