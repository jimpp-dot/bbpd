import 'dart:async';
import 'dart:math' as math;

import 'package:shared/dart_extensions/widget/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// 光的宽度根据widget总宽度计算，最大150，最小总宽度的1/2
double _defaultShimmerWidthBuild(double totalWidth) =>
    math.min<double>(150.0, totalWidth * 0.5);

/// 计算光的宽度
/// [totalWidth] widget的宽度
typedef ColorfulShimmerWidthBuild = double Function(double totalWidth);

/// [offset] widget位置
/// [size] widget大小
typedef ColorfulChildBuild = Widget Function(
    Key? key, Offset offset, Size size);

///
/// 炫彩昵称控件
///
/// [loop] 光的移动次数，0表示循环移动
/// [period] 光移动一次周期时间
/// [shimmerTiltAngel] 光的倾斜角度
/// [shimmerGradient] 光的渐变
/// [childBuild] child
/// [shimmerWidthBuild] 自定义光的宽度
///
class ColorfulContainer extends StatefulWidget {
  final int loop;
  final Duration period;
  final double shimmerTiltAngel;
  final Gradient? shimmerGradient;
  final ColorfulChildBuild childBuild;
  final ColorfulShimmerWidthBuild shimmerWidthBuild;
  final bool isPrettyId;

  const ColorfulContainer({
    super.key,
    required this.childBuild,
    this.loop = 0,
    this.period = const Duration(milliseconds: 1000),
    this.shimmerTiltAngel = 40,
    this.shimmerGradient,
    this.shimmerWidthBuild = _defaultShimmerWidthBuild,
    this.isPrettyId = false,
  });

  @override
  _ColorfulContainerState createState() => _ColorfulContainerState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('loop', loop, defaultValue: 0));
    properties.add(
        DiagnosticsProperty<Duration>('period', period, defaultValue: null));
    properties.add(
        DoubleProperty('shimmerTiltAngel', shimmerTiltAngel, defaultValue: 40));
    properties.add(DiagnosticsProperty<Gradient>('gradient', shimmerGradient,
        defaultValue: null));
  }
}

class _ColorfulContainerState extends State<ColorfulContainer>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  int _count = 0; // 循环次数

  Widget? _child;
  late GlobalKey _childGlobalKey;
  Timer? _timer; // 定时器
  int _suspendCount = 0; // 暂停次数
  Offset? _lastOffset;

  bool get showShimmer => widget.shimmerGradient != null;

  @override
  void initState() {
    super.initState();
    _childGlobalKey = GlobalKey();
    if (showShimmer) {
      _initAnimController();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) => refresh());
    }
  }

  void _initAnimController() {
    _controller = AnimationController(vsync: this, duration: widget.period);
    Tween(begin: 0.0, end: 1.0)
        .animate(_controller!)
        .addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.loop <= 0) {
          _controller?.repeat();
        } else if (_count < widget.loop) {
          _controller?.forward(from: 0.0);
        } else {
          if (widget.isPrettyId) {
            _controller?.stop();
            _createTimer();
          }
        }
        _count++;
      }
    });
    _controller?.forward();
  }

  void _createTimer() {
    _cancelTimer();
    _suspendCount = 0;
    _count = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      _suspendCount++;
      if (_suspendCount == 6) {
        t.cancel();
        _controller?.forward(from: 0.0);
      }
    });
  }

  void _cancelTimer() {
    if (widget.isPrettyId && _timer != null) {
      if (_timer!.isActive) {
        _timer!.cancel();
      }
    }
  }

  Widget _getChild() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox?.size != null) {
      Offset offset = renderBox!.localToGlobal(Offset.zero);
      // 位置发生变化时，也需要重新刷新一下
      if (_child != null && _lastOffset == offset) {
        return _child!;
      }
      _lastOffset = offset;
      _child = widget.childBuild(_childGlobalKey, offset, renderBox.size);
      return _child!;
    }
    return widget.childBuild(null, Offset.zero, Size.zero);
  }

  @override
  Widget build(BuildContext context) {
    if (!showShimmer) {
      return _getChild();
    }
    return AnimatedBuilder(
      animation: _controller!,
      child: _getChild(),
      builder: (BuildContext context, Widget? child) {
        return _ColorfulRender(
          percent: _controller!.value,
          shimmerGradient: widget.shimmerGradient!,
          shimmerTiltAngel: widget.shimmerTiltAngel,
          shimmerWidthBuild: widget.shimmerWidthBuild,
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _cancelTimer();
    super.dispose();
  }
}

class _ColorfulRender extends SingleChildRenderObjectWidget {
  final double percent;
  final double shimmerTiltAngel;
  final Gradient shimmerGradient;
  final ColorfulShimmerWidthBuild shimmerWidthBuild;

  const _ColorfulRender(
      {Widget? child,
      required this.percent,
      required this.shimmerGradient,
      required this.shimmerTiltAngel,
      required this.shimmerWidthBuild})
      : super(child: child);

  @override
  _ColorfulBox createRenderObject(BuildContext context) {
    return _ColorfulBox(
      shimmerGradient: shimmerGradient,
      shimmerTiltAngel: shimmerTiltAngel,
      shimmerWidthBuild: shimmerWidthBuild,
      percent: percent,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _ColorfulBox shimmer) {
    shimmer.updatePercent(percent);
  }
}

class _ColorfulBox extends RenderProxyBox {
  final Paint _gradientPaint = Paint()..blendMode = BlendMode.srcATop;
  final Gradient shimmerGradient; // 光的渐变色
  final double shimmerTiltAngel; // 光的倾斜角度
  final ColorfulShimmerWidthBuild? shimmerWidthBuild;

  double percent; // 光移动比例

  _ColorfulBox({
    required this.shimmerGradient,
    required this.shimmerTiltAngel,
    required this.shimmerWidthBuild,
    required this.percent,
  });

  @override
  bool get alwaysNeedsCompositing => child != null;

  @override
  ShaderMaskLayer? get layer => super.layer as ShaderMaskLayer?;

  void updatePercent(double newValue) {
    if (newValue != percent) {
      percent = newValue;
      markNeedsPaint();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      assert(needsCompositing);

      final width = child!.size.width;
      final height = child!.size.height;

      // 计算光的宽度
      double shimmerWidth = _getWidth(width);

      // 光的起始点
      double dx = percent * (width + shimmerWidth) - shimmerWidth / 2;
      double startX = dx + offset.dx;

      // 光占的矩形区域
      Rect rect = Rect.fromLTWH(dx, 0, shimmerWidth, height);

      final Shader shader =
          shimmerGradient.createShader(rect, textDirection: TextDirection.ltr);

      layer ??= ShaderMaskLayer();
      layer!
        ..shader = shader
        ..maskRect = offset & child!.size
        ..blendMode = BlendMode.srcATop;
      context.pushLayer(layer!, super.paint, offset);

      // 光倾斜角度投影水平宽度
      double tiltWidth = height / math.atan(30);
      // 光的宽度如果较小，不设置倾斜角度
      tiltWidth = (shimmerWidth > tiltWidth * 3) ? tiltWidth : 0;
      // 绘制光柱
      if (tiltWidth > 0) {
        _gradientPaint.shader = shader;
        final path = Path();
        path.moveTo(startX, offset.dy);
        path.lineTo(startX + shimmerWidth - tiltWidth, offset.dy);
        path.lineTo(startX + shimmerWidth, offset.dy + height);
        path.lineTo(startX + tiltWidth, offset.dy + height);
        context.canvas.drawPath(path, _gradientPaint);
        context.canvas.restore();
      }
    }
  }

  /// 计算光的宽度
  double _getWidth(double totalWidth) {
    if (shimmerWidthBuild != null) return shimmerWidthBuild!(totalWidth);
    return _defaultShimmerWidthBuild(totalWidth);
  }
}
