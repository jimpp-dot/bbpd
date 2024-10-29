import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/k.dart';
import 'package:message/message.dart';
import 'message_list_page_new.dart';

/// 房间消息面板
class RoomMessagePanel extends StatefulWidget {
  const RoomMessagePanel({super.key});

  static Future openRoomMessagePanel(BuildContext context, {Key? key}) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1.0,
      disableTapDismissible: true,
      settings: const RouteSettings(name: '/RoomMessagePanel'),
      builder: (BuildContext context) {
        return RoomMessagePanel(key: key);
      },
    );
  }

  @override
  _RoomMessagePanelState createState() => _RoomMessagePanelState();
}

class _RoomMessagePanelState extends State<RoomMessagePanel> {
  _onItemTap() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Util.height * 0.67,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
        color: R.colors.homeBgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildTitle(),
          Expanded(
            child: Material(
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 20.0, start: 20, end: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            K.msg_new_message,
            style: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return NewMessagePageScreen(
        paddingBottom: 48,
        itemBuilder: (
          Conversation conv,
          bool isLast, {
          Key? key,
          UserConfig? config,
          OnConversationOperate? onChanged,
          OnAwaitRemoveList? onRemoveHiList,
          OnHiTap? onHiTap,
          Map? userTagMap,
        }) {
          return MessageItem(
            conv: conv,
            config: config,
            isLast: isLast,
            padding: 10,
            onTap: _onItemTap,
            onHiTap: onHiTap,
            onChanged: onChanged,
            refer: const PageRefer('room_icon'),
            onRemoveHiList: onRemoveHiList,
            onLongTap: () {},
            fromRoomPanel: true,
            userTagMap: userTagMap,
          );
        });
  }
}
