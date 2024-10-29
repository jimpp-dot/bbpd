import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/util/operateUtil.dart';
import 'package:chat_room/src/base/widget/input_message.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';

class GameMsgPanel extends StatefulWidget {
  final ChatRoomData room;

  const GameMsgPanel({Key? key, required this.room}) : super(key: key);

  @override
  State<GameMsgPanel> createState() => _GameMsgPanelState();
}

class _GameMsgPanelState extends State<GameMsgPanel> {
  final IRoomManager _roomManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _roomManager.getMessageList(room: widget.room),
        input,
      ],
    );
  }

  /// 输入框
  Widget get input {
    bool disabled = !(widget.room.config?.displayMessage ?? false);
    String inputStr = K.room_input;

    return disabled
        ? _renderDisableInput()
        : GestureDetector(
            onTap: () async {
              await _onInputTaped(context);
              setState(() {});
            },
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white.withOpacity(0.12),
              ),
              margin: EdgeInsetsDirectional.only(
                  start: Util.isLocale ? 12 : 8, end: Util.isLocale ? 10 : 8),
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      inputStr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6), fontSize: 14),
                    ),
                  ),
                  InkWell(
                    onTap: _displayEmotePanel,
                    // key: widget.emoteIconKey,
                    child: R.img(
                      'controller/ic_room_input_emote.svg',
                      package: ComponentManager.MANAGER_BASE_ROOM,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  /// 发送消息点击
  _onInputTaped(BuildContext context) async {
    if (await OperateUtil.checkAuth(context, widget.room, 'room:send_msg'))
      _displayInputMessage(context);
  }

  _displayInputMessage(BuildContext context) async {
    bool? displayEmote = await displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      builder: (BuildContext context) {
        return InputMessage(room: widget.room);
      },
      maxHeightRatio: 0.75,
    );

    if (displayEmote != null && displayEmote) {
      _displayEmotePanel();
    }
  }

  /// 限制发言
  Widget _renderDisableInput() {
    return Container(
      height: 34,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              K.room_input_disable,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
            ),
          ),
          InkWell(
            onTap: _displayEmotePanel,
            // key: widget.emoteIconKey,
            child: R.img(
              'controller/ic_emote_disable.svg',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
    );
  }

  /// 调起emote 面板
  _displayEmotePanel() {
    if (widget.room.config == null) return;

    bool disable = widget.room.config?.displayMessage == false &&
        widget.room.role != ClientRole.Broadcaster;
    if (disable) return;

    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openEmotePanel(
      context,
      widget.room,
      defineBarrierColor: Colors.transparent,
      onSendSuccess: _onEmoteSendSuccess,
    );
  }

  _onEmoteSendSuccess() {
    Tracker.instance.track(TrackEvent.room_public_chat, properties: {
      'rid': widget.room.rid,
      'msg_type': 'emoji',
      if (!Util.isNullOrEmpty(widget.room.config?.typeName))
        'type_label': widget.room.config?.typeName,
      if (!Util.isNullOrEmpty(widget.room.config?.originalRFT))
        'room_factory_type': widget.room.config?.originalRFT,
      if (!Util.isNullOrEmpty(widget.room.config?.settlementChannel))
        'settlement_channel': widget.room.config?.settlementChannel,
    });
  }
}
