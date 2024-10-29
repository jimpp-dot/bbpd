import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/widget/largeWelcome.dart';

import '../../../chat_room.dart';

/// 入场飘屏容器
/// 显示条件满足任何一个：1. 有座驾 2. 爵位为国王或者皇帝 or 九五至尊
///
class LargeWelcomeWidget extends StatefulWidget {
  const LargeWelcomeWidget({super.key});

  @override
  _LargeWelcomeWidgetState createState() => _LargeWelcomeWidgetState();
}

class _LargeWelcomeWidgetState extends State<LargeWelcomeWidget> {
  Welcome? _large; //国王皇帝欢迎
  final List<Welcome> _largeWelcomeBuf = [];

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        RoomConstant.EVENT_Large_Welcome, _onReceivedLargeWelcome);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(
        RoomConstant.EVENT_Large_Welcome, _onReceivedLargeWelcome);
  }

  _refreshState() {
    if (mounted) setState(() {});
  }

  _onReceivedLargeWelcome(String type, dynamic welcome) {
    if (welcome is Welcome) {
      if (_large == null) {
        _large = welcome;
      } else {
        _largeWelcomeBuf.add(welcome);
      }
      _refreshState();
    }
  }

  _onLargeComplete(Welcome data) {
    setState(() {
      _large = null;
    });

    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      if (mounted && _large == null && _largeWelcomeBuf.isNotEmpty) {
        setState(() {
          _large = _largeWelcomeBuf.removeAt(0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Session.lowDeviceSpecialEffect == 1) const SizedBox.shrink();
    if (_large != null) {
      return Stack(
        children: [
          _renderLargeWelcome(context),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget _renderLargeWelcome(BuildContext context) {
    return LargeWelcome(
      key: _large!.key,
      data: _large!,
      onComplete: _onLargeComplete,
    );
  }
}
