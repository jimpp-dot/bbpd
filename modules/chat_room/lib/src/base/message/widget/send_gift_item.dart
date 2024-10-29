import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

class SendGiftItem extends StatelessWidget {
  final MessageContent message;
  final ChatRoomData room;

  const SendGiftItem(this.message, this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    return _renderSendGift(context, message);
  }

  Widget _renderSendGift(BuildContext context, MessageContent message) {
    int giftId = Util.parseInt(message.extra?['gift_id']);
    int uid = Util.parseInt(message.extra?['to_uid']);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(message.message ?? '',
            style: messageTextStyle.copyWith(color: Colors.white)),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            IGiftManager giftManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_GIFT);
            giftManager.showRoomGiftPanel(context,
                room: room, uid: uid, defaultId: giftId);

            Tracker.instance
                .track(TrackEvent.room_lollipop_tips_click, properties: {
              'rid': room.rid,
              'room_type': room.config?.type,
              'room_types': describeEnum(room.config?.types),
              'room_property': describeEnum(room.config?.property),
            });
          },
          child: Container(
            height: 17,
            width: 38,
            decoration: const ShapeDecoration(
              color: Color(0xFFFF5F7D),
              shape: StadiumBorder(),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.room_send_gift,
              style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
