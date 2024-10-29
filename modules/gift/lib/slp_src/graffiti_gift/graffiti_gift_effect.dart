import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart' hide Image;

import 'graffiti_gift_mixin.dart';
import 'graffiti_painter.dart';

/// 涂鸦礼物动效
class GraffitiGiftEffect extends StatefulWidget {
  final String icon;
  final List<Offset> points;
  final VoidCallback onComplete;

  const GraffitiGiftEffect({
    super.key,
    required this.icon,
    required this.points,
    required this.onComplete,
  });

  @override
  State<GraffitiGiftEffect> createState() => _GraffitiGiftEffectState();
}

class _GraffitiGiftEffectState extends State<GraffitiGiftEffect>
    with GraffitiGiftMixin, SingleTickerProviderStateMixin {
  Timer? _timer;

  /// 缩放比例
  double _ratio = 0.0;

  /// 动效宽度
  double _width = 0.0;

  int _endShowIndex = 1;

  late AnimationController _controller;
  late Animation<double> _hideAnimation;

  @override
  String? get icon => widget.icon;

  @override
  double get ratio => _ratio;

  @override
  bool needUpdate(GraffitiGiftEffect oldWidget) => oldWidget.icon != icon;

  @override
  void onImageLoaded(bool success) {
    if (success) {
      _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
        if (_endShowIndex < widget.points.length) {
          // 未添加完
          _endShowIndex++;
          refresh();
        } else {
          // 全部添加完成,
          _timer?.cancel();
          _controller.forward();
        }
      });
    } else {
      // 图片下载或者加载失败时,结束播放
      widget.onComplete.call();
    }
  }

  @override
  void initState() {
    super.initState();
    _initRatio();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onComplete.call();
        }
      });
    _hideAnimation = CurveTween(curve: Curves.easeInQuint).animate(_controller);
  }

  void _initRatio() {
    if (widget.points.length <= 1) return;
    Offset sizeOffset = widget.points.first;
    double maxWidth = Util.width - 16 * 2; // 最大显示宽度
    if (sizeOffset.dx > maxWidth) {
      // 播放动效的最大宽度大于最大显示宽度,需要缩放
      _ratio = maxWidth / sizeOffset.dx;
      _width = maxWidth;
    } else {
      _ratio = 1.0;
      _width = sizeOffset.dx;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (image == null || _ratio == 0 || _width == 0)
      return const SizedBox.shrink();
    return Container(
      width: Util.width,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(start: 16, top: 60, end: 16),
      child: SizedBox(
        width: _width,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => CustomPaint(
            painter: GraffitiPainter(
              list: _list,
              image: image!,
              showSize: imageShowSize,
              animValue: _hideAnimation.value,
            ),
            child: const SizedBox.expand(),
          ),
        ),
      ),
    );
  }

  List<Offset> get _list {
    List<Offset> list = [];
    for (int i = 1; i < _endShowIndex; i++) {
      list.add(widget.points[i] * ratio);
    }
    return list;
  }
}
