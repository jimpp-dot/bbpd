import 'dart:convert';

import 'package:chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DisplayGiftWrapper extends StatefulWidget {
  const DisplayGiftWrapper({super.key});

  @override
  _DisplayGiftWrapperState createState() => _DisplayGiftWrapperState();
}

class _DisplayGiftWrapperState extends State<DisplayGiftWrapper> {
  final List<Object> _gifts = [];
  final List<Object> _queue = [];

  @override
  void initState() {
    super.initState();
    eventCenter.addListener("UserChat.PlayGift", _onEvent);
  }

  @override
  void dispose() {
    eventCenter.removeListener("UserChat.PlayGift", _onEvent);
    super.dispose();
  }

  void _onEvent(String type, dynamic data) async {
    switch (type) {
      case 'UserChat.PlayGift':
        MessageContent message = data as MessageContent;
        if (message.extra == null || message.extra?.isEmpty == true) return;
        try {
          Map? map = json.decode(message.extra ?? '');
          if (mounted && map != null && map.containsKey('type') && (map['type'] == 'gift' || map['type'] == 'magic_msg')) {
            Object data = map['type'] == 'gift' ? GiftConfig.fromJson(map) : _MagicMsgConfig.fromJson(map, message.content);
            if (data is! _MagicMsgConfig || Util.validStr(data.resourceUrl)) {
              if (_gifts.isEmpty) {
                _gifts.add(data);
              } else {
                _queue.add(data);
              }
            }
            setState(() {});
            Im.setMessageExtra(message.messageId, json.encode({'time': DateTime.now().millisecondsSinceEpoch}));
          }
        } catch (e) {
          Log.d(e.toString());
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _buildGift(),
    );
  }

  List<Widget> _buildGift() {
    List<Widget> bodyStack = [];
    if (_gifts.isNotEmpty) {
      for (var config in _gifts) {
        if (config is GiftConfig) {
          GiftConfig msgConfig = config;
          bodyStack.add(DisplayGift(
            key: msgConfig.key,
            config: msgConfig,
            onComplete: _onPlayGiftComplete,
          ));
        }
      }
    }

    return bodyStack;
  }

  _onPlayGiftComplete(Object config) {
    if (_gifts.contains(config) || _queue.isNotEmpty) {
      if (mounted) {
        _gifts.remove(config);
        if (_queue.isNotEmpty) {
          _gifts.add(_queue.removeAt(0));
        }
        setState(() {});
      }
    }
  }
}

class _MagicMsgConfig {
  final String text;
  final int magicId;
  final String resourceUrl;
  final int resourceSize;
  final GlobalKey viewKey;

  _MagicMsgConfig.fromJson(Map res, String textStr)
      : text = textStr,
        magicId = Util.parseInt(res['magic_id']),
        resourceUrl = Util.parseStr(res['resource_url']) ?? '',
        resourceSize = Util.parseInt(res['resource_size']),
        viewKey = GlobalKey();
}
