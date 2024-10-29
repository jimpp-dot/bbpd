import 'dart:async';
import 'dart:math';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/biz_plugin/birthday_sprite/birthday_sprite_rule_panel.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class BirthdaySpritePlugin extends StatefulWidget {
  final int rid;

  const BirthdaySpritePlugin({super.key, required this.rid});

  @override
  State<BirthdaySpritePlugin> createState() => _BirthdaySpritePluginState();
}

class _BirthdaySpritePluginState extends State<BirthdaySpritePlugin>
    with SingleTickerProviderStateMixin {
  final List<String> _events = [
    EventConstant.EventShowBirthdaySprite,
    EventConstant.EventMicStatusChanged
  ];

  /// 精灵icon
  String? _spriteIcon;

  /// icon资源是否已经下载
  bool _iconHasLoaded = false;

  /// 召唤精灵规则链接
  String? _ruleUrl;

  /// 是否在显示时间范围内
  bool _isInShowTime = false;

  /// 是否已经领取过奖励
  bool _hasReward = false;

  /// 是否关闭
  bool _close = false;

  /// 是否显示生日精灵
  bool _showSprite = false;

  bool get _canShowSprite =>
      _iconHasLoaded && ChatRoomUtil.isMic && _isInShowTime && !_hasReward;

  /// 生日精灵位置
  Offset _spriteOffset = const Offset(0, 500);

  AnimationController? _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    eventCenter.addListeners(_events, _onEvent);
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller = null;
    _timer?.cancel();
    eventCenter.removeListeners(_events, _onEvent);
    super.dispose();
  }

  void _onEvent(String type, dynamic data) {
    if (type == EventConstant.EventMicStatusChanged && data is Map) {
      List<int> onMicUids = data['onMicUids'] as List<int>;
      List<int> offMicUids = data['offMicUids'] as List<int>;
      if (onMicUids.contains(Session.uid) || offMicUids.contains(Session.uid)) {
        /// 自己的麦位状态发生变化时刷新，即上下麦
        _checkShowStatus();
      }
    } else if (type == EventConstant.EventShowBirthdaySprite) {
      if (data is ResRoomPositionPluginItem) {
        _isInShowTime =
            _checkShowTime(data.stageInfo.startTime, data.stageInfo.endTime);
        _spriteIcon = Util.squareResize(data.icon, 100);
        _ruleUrl = data.stageInfo.clickExtra;
      }
      _checkShowStatus();
    }
  }

  void _checkShowStatus() async {
    if (Util.validStr(_spriteIcon)) {
      _iconHasLoaded =
          await CachedImageManager.instance().downloadAsync(_spriteIcon!);
    }
    _showSprite = _canShowSprite;
    if (_showSprite) {
      _startTipsPlayTimer();
    } else {
      _timer?.cancel();
    }
    refresh();
  }

  /// 启动提示动画播放计时器
  void _startTipsPlayTimer() {
    if (!mounted) return;
    // 先执行一次播放提示动画，然后每10分钟执行一次
    _playTipsAnim();
    _timer?.cancel();
    _timer =
        Timer.periodic(const Duration(minutes: 10), (timer) => _playTipsAnim());
  }

  /// 播放提示动画
  void _playTipsAnim() async {
    if (_controller == null) return;
    // 播放显示动画，显示5s，播放隐藏动画
    _controller?.forward(from: 0.0);
    await Future.delayed(const Duration(milliseconds: 5000));
    _controller?.reverse(from: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    if (!_showSprite || _close) return const SizedBox.shrink();
    return Stack(
      fit: StackFit.expand,
      children: [
        DraggableWidget(
          dragCallback: (status, location) {
            _spriteOffset = location;
            refresh();
          },
          horizontalSpace: 10,
          bottomMargin: Util.bottomMargin,
          topMargin: Util.statusHeight,
          intialVisibility: true,
          initialPosition: _spriteOffset,
          child: _buildSprite(),
        ),
      ],
    );
  }

  Widget _buildSprite() {
    bool showTipsAtLeft = Util.width / 2 < _spriteOffset.dx + 30;
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          GestureDetector(
            onTap: () async {
              bool? needRefresh = await BirthdaySpriteRulePanel.show(
                  context, widget.rid, _spriteIcon!, _ruleUrl);
              if (needRefresh == true) {
                _hasReward = true;
                _checkShowStatus();
              }
            },
            child: R.img(_spriteIcon!, width: 60, height: 60),
          ),
          PositionedDirectional(
            top: -3,
            end: -3,
            child: GestureDetector(
              onTap: () {
                _close = true;
                refresh();
              },
              child: R.img(RoomAssets.chat_room$cp_close_svg,
                  width: 20, height: 20),
            ),
          ),
          PositionedDirectional(
            start: showTipsAtLeft ? -122 : 65,
            top: 0,
            bottom: 0,
            child: _buildTips(showTipsAtLeft),
          ),
        ],
      ),
    );
  }

  Widget _buildTips(bool showAtLeft) {
    return ScaleTransition(
      scale: _controller!,
      child: FadeTransition(
        opacity: _controller!,
        child: SizedBox(
          width: 117,
          height: 28,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Transform.rotate(
                angle: showAtLeft ? 0 : pi,
                child: R.img(RoomAssets.chat_room$birthday_sprite_tips_bg_webp,
                    width: 117, height: 28),
              ),
              Text(
                K.room_birthday_sprite_tips,
                style: const TextStyle(
                    color: Color(0xFF6B2B5E),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _checkShowTime(int startTime, int endTime) {
    int nowTime = DateTime.now().secondsSinceEpoch;
    return nowTime > startTime && nowTime < endTime;
  }
}
