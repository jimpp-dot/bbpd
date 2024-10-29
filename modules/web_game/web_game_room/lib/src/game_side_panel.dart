import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'game_msg_panel.dart';

enum GameSidePanelType {
  msg, //公屏
  chat, //私聊消息
  gift, //礼物面板
}

class GameSidePanel extends StatefulWidget {
  final ChatRoomData room;
  final GameSidePanelType selected;

  const GameSidePanel({
    Key? key,
    required this.room,
    this.selected = GameSidePanelType.msg,
  }) : super(key: key);

  @override
  _GameSidePanelState createState() => _GameSidePanelState();

  static final double panelWidth = 276.dp;

  static Future show(
    BuildContext context,
    ChatRoomData room,
    GameSidePanelType selected,
  ) async {
    return SideSheet.show(
      context: context,
      transFormWidth: panelWidth,
      child: GameSidePanel(
        room: room,
        selected: selected,
      ),
      direction: SideSheetDirection.RIGHT,
    );
  }
}

class _GameSidePanelState extends State<GameSidePanel> {
  late GameSidePanelType _select;

  @override
  void initState() {
    super.initState();
    _select = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Util.height,
      width: GameSidePanel.panelWidth,
      decoration: const BoxDecoration(
        color: Color(0xFF1D1D37),
        borderRadius:
            BorderRadiusDirectional.only(topStart: Radius.circular(8)),
      ),
      child: Column(
        children: [
          Row(
            children: GameSidePanelType.values
                .map(
                  (type) => getButton(
                      type: type,
                      selected: _select == type,
                      onTap: () {
                        _select = type;
                        setState(() {});
                      }),
                )
                .toList(),
          ),
          Expanded(child: getSubPanel(context, _select, widget.room)),
        ],
      ),
    );
  }

  String _getImgName(GameSidePanelType type, bool selected) =>
      'room_game/ic_${describeEnum(type)}${selected ? '_selected' : ''}.svg';

  Widget getButton({
    required GameSidePanelType type,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return IconButton(
      onPressed: onTap,
      iconSize: 34,
      icon: R.img(
        _getImgName(type, selected),
        width: 21,
        height: 21,
        color: Colors.white,
        package: ComponentManager.MANAGER_BASE_ROOM,
      ),
    );
  }

  Widget getSubPanel(
      BuildContext context, GameSidePanelType type, ChatRoomData room) {
    switch (type) {
      case GameSidePanelType.msg:
        return GameMsgPanel(room: room);
      case GameSidePanelType.chat:
        return ErrorWidget('not implemented');
      // IMessageManager manager = ComponentManager.instance
      //     .getManager(ComponentManager.MANAGER_MESSAGE);
      // bool isShow = false;
      // return manager.getChatMessagePanel(context, canCreateFanGroup: isShow);
      case GameSidePanelType.gift:
        return ErrorWidget('not implemented');
      // IGiftManager giftManager =
      //     ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      // return giftManager.getGiftPanel(room: room, crossAxisCount: 3);
      default:
        return const SizedBox();
    }
  }
}
