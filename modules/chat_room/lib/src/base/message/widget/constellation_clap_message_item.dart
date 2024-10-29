import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

class ConstellationClapMessageItem extends StatelessWidget {
  final MessageContent message;

  const ConstellationClapMessageItem(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    Map? extra = message.extra;
    String name1 = Util.notNullStr(extra?['user_name1']);
    String name2 = Util.notNullStr(extra?['user_name2']);
    String msg1 = Util.notNullStr(extra?['msg1']);
    String msg2 = Util.notNullStr(extra?['msg2']);
    TextStyle style = messageTextStyle.copyWith(
      fontFamily: Util.fontFamily,
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
    return RichText(
      text: TextSpan(
        style: style,
        children: [
          TextSpan(
              text: name1,
              style: style.copyWith(color: const Color(0xFFFCE78D))),
          const WidgetSpan(child: SizedBox(width: 2)),
          TextSpan(text: msg1),
          const WidgetSpan(child: SizedBox(width: 2)),
          TextSpan(
              text: name2,
              style: style.copyWith(color: const Color(0xFFFCE78D))),
          const WidgetSpan(child: SizedBox(width: 2)),
          TextSpan(text: msg2),
        ],
      ),
    );
  }
}
