import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

class RiskWheelItem extends StatelessWidget {
  final MessageContent message;

  const RiskWheelItem(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return _renderRiskWheel(context, message);
  }

  Widget _renderRiskWheel(BuildContext context, MessageContent message) {
    Color textColor = Colors.white;
    String? color = Util.parseStr(message.extra?['color']);
    if (color != null) textColor = HexColor(color);
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 6),
      child: Row(
        children: [
          R.img(RoomAssets.chat_room$riskwheel_room_riskwheel_small_webp,
              width: 31, height: 29),
          Container(
            padding: const EdgeInsetsDirectional.only(
                start: 12, end: 8.0, top: 2, bottom: 3),
            margin: const EdgeInsetsDirectional.only(start: 3, end: 8.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12.5)),
              color: Colors.black.withOpacity(0.2),
            ),
            child: Text(
              message.message ?? '',
              style: messageTextStyle.copyWith(color: textColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
