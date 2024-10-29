import 'dart:math';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

/// 集字符
/// tip:很久没用了
class MatchMessageItem extends StatelessWidget {
  final MessageContent message;

  const MatchMessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return _renderMatchMessage(context, message);
  }

  Widget _renderMatchMessage(BuildContext context, MessageContent message) {
    TextStyle defaultStyle = messageTextStyle;

    Map extra = message.extra ?? {};
    String msg = Util.notNullStr(extra['message']);
    String subType = Util.notNullStr(extra['sub_type']);
    if (subType != 'black') {
      return Text(
        msg,
        style: defaultStyle,
      );
    } else {
      return RichText(
          text: TextSpan(
        text: '欢迎开黑萌新 ',
        style: defaultStyle,
        children: [
          TextSpan(
            text: Util.notNullStr(extra['name']),
            style: const TextStyle(
              color: Color(0xFFE6D8A7),
            ),
          ),
          TextSpan(
            text: ' 开始自己的开黑之旅，参与${extra['ta']}的首次开黑将触发',
          ),
          const TextSpan(
            text: '萌新礼包',
            style: TextStyle(
              color: Color(0xFF57E2FF),
            ),
          ),
          const TextSpan(
            text: '，所有开黑小伙伴都将获得额外字符掉落！',
          ),
        ],
      ));
    }
  }
}

/// 集字符
///
class PieceMessageItem extends StatelessWidget {
  final MessageContent message;
  final ChatRoomData room;

  const PieceMessageItem(
      {super.key, required this.room, required this.message});

  @override
  Widget build(BuildContext context) {
    return _renderPiece(context, message);
  }

  Widget _renderPiece(BuildContext context, MessageContent message) {
    Map? extra = message.extra;
    Map? gift = extra == null ? null : extra['gift'];
    if (gift == null) return const Text('');

    int vip = Util.parseInt(message.extra?['vip_new']);
    int title = Util.parseInt(message.extra?['title']);
    int titleNew = Util.parseInt(message.extra?['title_new']);

    String name = Util.removeUnsupportedCharacters(extra?['from']) ?? '';
    name = name.safeSubstring(0, min(name.length, 6));

    return InkWell(
      onTap: () => goToImageScreenDialog(
          context, Util.parseInt(message.extra?['uid']), room),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (room.config?.types == RoomTypes.Live && message.hasFansLabel())
            renderFansLabel(
                Util.notNullStr(extra?['fans_label']['label']),
                Util.parseInt(extra?['fans_label']['level']),
                Util.parseBool(room.config?.liveDataV3?.newLabel)),
          UserPopularity(
            popularityLevel: Util.parseInt(extra?['popularity_level']),
            height: kNameplateHeight,
            padding: const EdgeInsetsDirectional.only(end: 3),
          ),
          renderNewer(
              isNewer: Util.parseInt(extra?['is_newer']) > 0,
              isNewNoble: Util.parseBool(extra?['new_noble'])),
          renderUserVip(vip, Util.parseBool(extra?['icongray'])),
          renderUserTitle(title, titleNew),
          RichText(
              text: TextSpan(
            text: '$name集齐',
            style: TextStyle(
                color: const Color(0xFFafafaf), fontFamily: Util.fontFamily),
            children: [
              const TextSpan(
                text: '一起冲鸭',
                style: TextStyle(
                  color: Color(0xFFE6D8A7),
                ),
              ),
              const TextSpan(
                text: '获得了',
              ),
              TextSpan(
                text: '${gift['name']}',
                style: const TextStyle(
                  color: Color(0xFF57E2FF),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
