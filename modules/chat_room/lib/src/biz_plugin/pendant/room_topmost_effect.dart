import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:flutter/material.dart';
import 'package:vap_player/vap_player.dart';

import 'pendant_util.dart';

/// 房间最顶层动效
class RoomTopmostEffect extends StatefulWidget {
  final ChatRoomData room;

  const RoomTopmostEffect({super.key, required this.room});

  @override
  State<RoomTopmostEffect> createState() => _RoomTopmostEffectState();
}

class _RoomTopmostEffectState extends State<RoomTopmostEffect> {
  Timer? _timer;
  int? _curPluginId;
  int? _curStageId;
  String? _curPluginType;
  String? _vapPath;
  VoidCallback? _onTap;

  @override
  void initState() {
    super.initState();
    widget.room.addListener(roomTopmostEffectKey, _onEvent);
  }

  void _onEvent(String type, dynamic data) {
    Log.d(tag: TAG, 'curPluginId=$_curPluginId  data=$data');
    if (data is! Map<String, dynamic> ||
        data['pluginItem'] is! ResRoomPositionPluginItem) return;

    var pluginItem = data['pluginItem'] as ResRoomPositionPluginItem;

    // 非正在播放插件的消息,直接舍弃
    if (_curPluginId != null && pluginItem.pluginId != _curPluginId) return;
    _onTap = data['onTap'];

    if (Util.isStringEmpty(pluginItem.stageInfo.stageMp4)) {
      // 此阶段不需要播放动效
      _stopEffect();
    } else {
      _curPluginId = pluginItem.pluginId;
      _curStageId = pluginItem.stageInfo.stageId;
      _curPluginType = pluginItem.stageInfo.pluginType;
      // 未开始状态下,开始准备播放动效
      _startEffect(pluginItem.stageInfo);
    }
  }

  void _initTimer(int endTime) {
    _cancelTimer();
    _timer = Timer(Duration(seconds: endTime), _stopEffect);
  }

  @override
  void dispose() {
    widget.room.removeListener(roomTopmostEffectKey, _onEvent);
    _cancelTimer();
    super.dispose();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  /// 停止播放动效
  void _stopEffect() {
    _curPluginId = null;
    _curPluginType = null;
    _curStageId = null;
    _vapPath = null;
    _cancelTimer();
    refresh();
  }

  void _startEffect(ResRoomPositionPluginItemStageInfo stageInfo) async {
    String? resPath = await cacheUrlWithTry(stageInfo.stageMp4, 0);
    int endTime = remainderTime(stageInfo.endTime);
    if (resPath != null &&
        endTime > 0 &&
        mounted &&
        stageInfo.stageId == _curStageId) {
      _vapPath = resPath;
      _initTimer(endTime);
      refresh();
    } else {
      _stopEffect();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_vapPath == null) return const SizedBox.shrink();
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        _buildClickArea(),
        _buildVapView(),
        PositionedDirectional(
          top: 50,
          end: 30,
          child: _buildCloseBtn(),
        ),
      ],
    );
  }

  Widget _buildVapView() {
    if (Constant.isDevMode && Util.isIOSSimulator) {
      return const IgnorePointer(
          child: VapSimulatorWidget()); // 拦截iOS模拟器播放VAP动画
    }
    return IgnorePointer(
      child: Container(
        color: Colors.black54,
        width: Util.width,
        height: Util.height,
        child: VapView(filePath: _vapPath!, repeatCount: -1),
      ),
    );
  }

  /// 事件响应区域,底部留出房间底部操作栏的高度
  Widget _buildClickArea() {
    return GestureDetector(
      onTap: () {
        _stopEffect();
        _onTap?.call();
      },
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: Util.width,
        height: Util.height - 45 - Util.iphoneXBottom,
      ),
    );
  }

  Widget _buildCloseBtn() {
    return GestureDetector(
      onTap: () {
        if (_curPluginId != null && _curPluginType != null) {
          handClosePluginEffect(_curPluginId!, _curPluginType!);
        }
        _stopEffect();
      },
      child: R.img(
        RoomAssets.chat_room$confess_v2_ic_dialog_close_webp,
        width: 50,
        height: 50,
      ),
    );
  }
}
