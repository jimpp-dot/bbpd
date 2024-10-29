import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

typedef OnCompleteCallback = void Function(Key? key);

class AvatarGift extends StatefulWidget {
  final PositionOffset beginAvatarOffset;
  final PositionOffset endAvatarOffset;
  final int flyingTime;
  final OnCompleteCallback? onComplete;
  final String url;

  const AvatarGift(
      {super.key,
      required this.url,
      required this.beginAvatarOffset,
      required this.endAvatarOffset,
      this.flyingTime = 800,
      this.onComplete});

  @override
  _AvatarGiftState createState() => _AvatarGiftState();
}

class _AvatarGiftState extends State<AvatarGift> with TickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> _translationXAnim;
  late Animation<double> _translationYAnim;
  late Animation<double> _bezierAnim;

  double _giftSize = 170.0;

  ///起点头像的中心点
  late Offset _beginCenter;

  ///终点头像的中心点
  late Offset _endCenter;

  ///贝塞尔曲线的控制点
  late Offset _p1;

  @override
  void initState() {
    super.initState();

    _calculateGiftSize();

    _calculatePositions();

    _initAnimations();

    _controller?.forward();
  }

  void _calculateGiftSize() {
    double iconSize = widget.endAvatarOffset.size?.width ?? 0;
    _giftSize = iconSize * (170.0 / 66.0);
  }

  void _initAnimations() {
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.flyingTime), vsync: this);
    final Animation<double> curve = CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0, 1.0, curve: Curves.easeInOut));
    _translationXAnim =
        Tween<double>(begin: _beginCenter.dx, end: _endCenter.dx)
            .animate(curve);
    _translationYAnim =
        Tween<double>(begin: _beginCenter.dy, end: _endCenter.dy)
            .animate(curve);
    _bezierAnim = Tween<double>(begin: 0, end: 1.0).animate(_controller!);
    _translationXAnim.addListener(_refresh);
    _translationYAnim.addListener(_refresh);
  }

  bool _nearlySame(double v1, double v2) {
    return (v1 - v2).abs() <= 10;
  }

  void _calculatePositions() {
    _calcBeginCenter();
    _calcEndCenter();
    _calcBezierPoint();
    Log.d('_AvatarGiftState._calculatePositions');
  }

  void _calcBezierPoint() {
    if (_nearlySame(_beginCenter.dx, _endCenter.dx) ||
        _nearlySame(_beginCenter.dy, _endCenter.dy)) {
      _p1 = (_beginCenter + _endCenter) / 2;
    } else {
      bool left2right = _beginCenter.dx <= _endCenter.dx;
      double sign = left2right ? 1 : -1;
      double distance = (_endCenter - _beginCenter).distance;
      _p1 = (_beginCenter.translate(
          sign * distance / 2 / sqrt(2), -distance / 3 / sqrt(2)));
    }
  }

  void _calcEndCenter() {
    _endCenter = Offset(
        widget.endAvatarOffset.offset.dx +
            widget.endAvatarOffset.size!.width / 2,
        widget.endAvatarOffset.offset.dy +
            widget.endAvatarOffset.size!.height / 2);
  }

  void _calcBeginCenter() {
    if (widget.beginAvatarOffset.inPosition) {
      _beginCenter = Offset(
          widget.beginAvatarOffset.offset.dx +
              widget.beginAvatarOffset.size!.width / 2,
          widget.beginAvatarOffset.offset.dy +
              widget.beginAvatarOffset.size!.height / 2);
    } else {
      //发送方不在麦位时，从屏幕底部中间飞出
      _beginCenter = Offset(Util.width / 2, Util.height - 200);
    }
  }

  Offset _calculateBezier(double t) {
    return _beginCenter * pow(1 - t, 2).toDouble() +
        _p1 * (2 * t * (1 - t)) +
        _endCenter * pow(t, 2).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    Offset movingCenter = _calculateBezier(_bezierAnim.value);
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: movingCenter.dx - _giftSize / 2,
          top: movingCenter.dy - _giftSize / 2,
          child: IgnorePointer(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: _giftSize,
                maxHeight: _giftSize,
              ),
              child: MultiframeImage.network(
                widget.url,
                'avatar_gifts',
                onComplete: () {
                  _refresh();

                  if (widget.onComplete != null) {
                    widget.onComplete!(widget.key);
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
    super.dispose();
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }
}
