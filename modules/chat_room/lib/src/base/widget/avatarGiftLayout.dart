import 'dart:async';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

import 'avatarGift.dart';

class AvatarGiftLayout extends StatefulWidget {
  final ChatRoomData roomData;
  final GiftGetPositionByUid? getPositionByUid;

  const AvatarGiftLayout(
      {super.key, required this.roomData, this.getPositionByUid});

  @override
  _AvatarGiftLayoutState createState() => _AvatarGiftLayoutState();
}

class _AvatarGiftLayoutState extends State<AvatarGiftLayout>
    with WidgetsBindingObserver {
  final List<_AvatarGiftItem> _displayingItems = [];
  final int _maxDisplayNum = 3;
  final List<_AvatarGiftItem> _bufferedItems = [];
  final int _maxBufferNum = 30;
  AppLifecycleState _appLifecycleState = AppLifecycleState.resumed;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.roomData.addListener(RoomConstant.Event_Message, _onMessageChanged);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        child: Stack(
          children: _buildAvatarGifts(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.roomData
        .removeListener(RoomConstant.Event_Message, _onMessageChanged);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appLifecycleState = state;
    if (AppLifecycleState.resumed == _appLifecycleState &&
        _bufferedItems.isNotEmpty &&
        _displayingItems.length < _maxDisplayNum) {
      _delayToPlay();
    }
  }

  _delayToPlay() async {
    await Future.delayed(const Duration(milliseconds: 250));
    int now = DateTime.now().millisecondsSinceEpoch;
    bool changed = false;
    _bufferedItems.removeWhere((item) => now - item.dateline >= 30 * 1000);
    for (_AvatarGiftItem item in _bufferedItems) {
      if (_displayingItems.length < _maxDisplayNum) {
        _displayingItems.add(item);
        changed = true;
      } else {
        break;
      }
    }
    if (mounted && changed) {
      setState(() {
        _bufferedItems.clear();
      });
    }
  }

  List<AvatarGift> _buildAvatarGifts() {
    _displayingItems.removeWhere(_isNoPositionGift);
    _bufferedItems.removeWhere(_isNoPositionGift);
    if (_displayingItems.length < _maxDisplayNum && _bufferedItems.isNotEmpty) {
      _displayingItems.add(_bufferedItems.removeAt(0));
    }

    return _displayingItems.map(_buildAvatarGift).toList(growable: false);
  }

  bool _isNoPositionGift(_AvatarGiftItem avatarGiftItem) {
//    PositionOffset beginAvatarOffset = widget.roomData.getPointByUid(avatarGiftItem.fromUid);
    PositionOffset endAvatarOffset = widget.getPositionByUid != null
        ? widget.getPositionByUid!(avatarGiftItem.toUid)
        : widget.roomData.getPointByUid(avatarGiftItem.toUid);
    return /*beginAvatarOffset.size == null || */ endAvatarOffset.size == null;
  }

  AvatarGift _buildAvatarGift(_AvatarGiftItem avatarGiftItem) {
    PositionOffset beginAvatarOffset = widget.getPositionByUid != null
        ? widget.getPositionByUid!(avatarGiftItem.fromUid)
        : widget.roomData.getPointByUid(avatarGiftItem.fromUid);
    PositionOffset endAvatarOffset = widget.getPositionByUid != null
        ? widget.getPositionByUid!(avatarGiftItem.toUid)
        : widget.roomData.getPointByUid(avatarGiftItem.toUid);
    return AvatarGift(
      key: avatarGiftItem.key,
      url: avatarGiftItem.url,
      beginAvatarOffset: beginAvatarOffset,
      endAvatarOffset: endAvatarOffset,
      flyingTime: avatarGiftItem.flyingTimeInMilliSeconds,
      onComplete: _onComplete,
    );
  }

  void _onComplete(Key? key) {
    _displayingItems.removeWhere((item) => item.key == key);

    _refresh();
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  _onMessageChanged(String type, dynamic data) {
    MessageContent message = data;

    if (message.type == MessageType.AvatarGift && message.extra != null) {
      Log.d('_AvatarGiftLayoutState._onMessageChanged: ${message.type}');
      Log.d('_AvatarGiftLayoutState._onMessageChanged: ${message.extra}');
      Map? extra = message.extra;

      if (extra?.containsKey('gift') == true && extra?['gift'] != null) {
        Map gift = extra!['gift'];
        _AvatarGiftItem item = _AvatarGiftItem.fromJson(gift);
        if (_appLifecycleState == AppLifecycleState.resumed &&
            _displayingItems.length < _maxDisplayNum) {
          if (mounted) {
            setState(() {
              _displayingItems.add(item);
            });
          }
        } else {
          if (_bufferedItems.length >= _maxBufferNum) {
            _bufferedItems.removeAt(0);
          }
          _bufferedItems.add(item);
        }
      }
    }
  }
}

class _AvatarGiftItem {
  int fromUid;
  int toUid;
  String url;
  int flyingTimeInMilliSeconds;

  int dateline;
  GlobalKey key;

  _AvatarGiftItem.fromJson(Map data)
      : fromUid = Util.parseInt(data['fromUid']),
        toUid = Util.parseInt(data['toUid']),
        url = Util.notNullStr(data['url']),
        flyingTimeInMilliSeconds = Util.parseInt(data['flyingTime']),
        key = GlobalKey(),
        dateline = DateTime.now().millisecondsSinceEpoch;
}
