import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

/// 画猜公屏消息
class GuessMsg extends StatelessWidget {
  final MessageContent message;

  const GuessMsg({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.extra != null && message.type == MessageType.Guess) {
      String? subType = message.extra?['subType'];
      if (subType != 'image') {
        // 不显示轨迹图像
        int uid = Util.parseInt(message.extra?['uid']);
        String name = message.extra?['name'] ?? '';
        bool showUser = uid > 0 && !Util.isStringEmpty(name);
        return RichText(
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            style: TextStyle(
              fontFamily: Util.fontFamily,
            ),
            children: [
              if (showUser)
                TextSpan(
                  text: '$name ',
                  style: const TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              TextSpan(
                text: message.message ?? '',
                style: messageTextStyle,
              ),
            ].toList(),
          ),
        );
      }
    }
    return const SizedBox.shrink();
  }
}
