import 'dart:math';
import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/src/base/config.dart';
import 'package:chat_room/src/base/message/messageItem.dart';
import 'package:chat_room/src/base/message/messageNotifyItem.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 房间消息弹幕，不能和公屏列表同时存在，否则会收到两次麦上表情
class GameFloatingMsg extends StatefulWidget {
  final ChatRoomData room;
  final double? startTop;
  final double? endTop;

  const GameFloatingMsg({
    Key? key,
    required this.room,
    this.startTop = 0,
    this.endTop = 0,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _MsgItemConfig {
  GlobalKey key;
  MessageContent msg;
  final double startTop;
  final double endTop;

  _MsgItemConfig(this.key, this.msg, this.startTop, this.endTop);
}

class _State extends State<GameFloatingMsg> {
  final List<_MsgItemConfig> _data = [];
  double _startTop = 0;
  double _endTop = 0;

  @override
  void initState() {
    super.initState();
    Log.d("WidgetFloatPlayer init");
    if (widget.startTop != null) {
      _startTop = widget.startTop!;
    } else {
      _startTop = 0;
    }
    if (widget.endTop != null) {
      _endTop = widget.endTop!;
    } else {
      _endTop = Util.height - Util.iphoneXBottom;
    }
    widget.room.addListener(RoomConstant.Event_Message, _onMsgReceive);
  }

  @override
  void dispose() {
    widget.room.removeListener(RoomConstant.Event_Message, _onMsgReceive);
    super.dispose();
  }

  _onMsgReceive(String type, dynamic data) {
    try {
      MessageContent message = data;
      Map extra = message.extra ?? {};
      Log.d('Msg received: ${message.message}');

      if (Util.appState != AppLifecycleState.resumed) return;

      // 忽略画猜房的轨迹图像数据
      if (message.message == null || extra['subType'] == 'image') {
        return;
      }

      if (extra.containsKey('emote_position') &&
          extra['emote_position'] > 0 &&
          extra['emote_sender'] > 0) {
        // important: 这里emit麦上表情，如果有公屏widget同时存在的话，可能会收到两次麦上表情
        if (Util.appState == AppLifecycleState.resumed) {
          eventCenter.emit('Room.Emote', extra);
        }
        return;
      }

      if (extra['type'] == 'walcome') {
        return;
      }

      if (message.type == MessageType.Message ||
          message.type == MessageType.Notify) {
        //普通消息，欢迎消息
        _playMsg(message);
      }
    } catch (e) {
      Log.d(e);
    }
  }

  _playMsg(MessageContent message) {
    Log.d('Play msg: ${message.message}');

    setState(() {
      _data.add(_MsgItemConfig(
        GlobalKey(),
        message,
        _startTop,
        _endTop,
      ));
    });
  }

  _onComplete(_MsgItemConfig config) {
    setState(() {
      _data.remove(config);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: _data.map((_MsgItemConfig config) {
          return EmojiAni(
            key: config.key,
            config: config,
            onComplete: _onComplete,
          );
        }).toList(),
      ),
    );
  }
}

typedef OnWidgetComplete = Function(_MsgItemConfig config);

class EmojiAni extends StatefulWidget {
  final _MsgItemConfig config;
  final OnWidgetComplete onComplete;

  const EmojiAni({Key? key, required this.config, required this.onComplete})
      : super(key: key);

  @override
  _EmojiAniState createState() => _EmojiAniState();
}

class _EmojiAniState extends State<EmojiAni>
    with SingleTickerProviderStateMixin<EmojiAni> {
  late AnimationController _controller;
  late Animation _left;
  double _top = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
      animationBehavior: AnimationBehavior.preserve,
    );

    _left = Tween(begin: -100.0, end: Util.width).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
    );

    Random random = Random();
    int randomInt = random.nextInt(100);
    _top = (randomInt * (widget.config.endTop - widget.config.startTop) / 100)
            .toDouble() +
        widget.config.startTop.toDouble();
    // Log.d("${this.widget.config.startTop} ${this.widget.config.endTop} $_top");
    _controller.addStatusListener(_onChanged);
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onComplete(widget.config);
    }
  }

  Widget _buildItem(MessageContent msg) {
    if (msg.type == MessageType.Notify) {
      return MessageNotifyItem(
        message: msg,
        room: ChatRoomData.getInstance(),
      );
    }
    return MessageItem(
      message: msg,
      room: ChatRoomData.getInstance(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _left,
      builder: (BuildContext context, Widget? child) {
        return PositionedDirectional(
          top: _top,
          end: _left.value,
          child: child!,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
        child: _buildItem(widget.config.msg),
      ),
    );
  }
}
