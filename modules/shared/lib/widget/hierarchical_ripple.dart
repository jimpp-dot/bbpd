import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 多层次的水波纹动画
class HierarchicalRipple extends StatefulWidget {
  final int layers; // 波纹层数
  final double beginRadius; // 波纹起始半径
  final double endRadius; // 波纹最大半径
  final Color beginColor; // 波纹起始颜色
  final Color endColor; // 波纹结束颜色
  final Duration duration;
  final Duration? reverseDuration;
  final bool autoStart; // 自动开始动画
  final Widget? child;
  final bool onlyBorder;

  /// 仅边框，非实心
  final double borderWidth;

  HierarchicalRipple({
    super.key,
    this.beginRadius = 1,
    this.endRadius = 200,
    this.layers = 3,
    Color? beginColor,
    Color? endColor,
    this.duration = const Duration(milliseconds: 2000),
    this.reverseDuration,
    this.autoStart = false,
    this.child,
    this.onlyBorder = false,
    this.borderWidth = 1,
  })  : assert(beginRadius > 0 && endRadius > 0 && endRadius > beginRadius),
        assert(layers > 0),
        assert(duration.inMilliseconds > 0),
        beginColor = beginColor ??= R.color.mainBrandColor.withOpacity(0.12),
        endColor = endColor ??= R.color.mainBrandColor.withOpacity(0);

  @override
  HierarchicalRippleState createState() {
    return HierarchicalRippleState();
  }
}

class HierarchicalRippleState extends State<HierarchicalRipple>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _scaleAnimations;
  late List<Animation<Color?>> _colorAnimations;

  @override
  void initState() {
    super.initState();
    int num = widget.layers;
    _controllers = [];
    _scaleAnimations = [];
    _colorAnimations = [];

    for (int i = 0; i < num; i++) {
      _controllers.add(AnimationController(
        vsync: this,
        duration: widget.duration,
        reverseDuration: widget.reverseDuration,
      ));
      _scaleAnimations.add(
          Tween(begin: widget.beginRadius, end: widget.endRadius).animate(
              CurvedAnimation(parent: _controllers[i], curve: Curves.linear))
            ..addListener(() {
              if (mounted) {
                setState(() {});
              }
            }));
      _colorAnimations.add(
          ColorTween(begin: widget.beginColor, end: widget.endColor).animate(
              CurvedAnimation(parent: _controllers[i], curve: Curves.linear))
            ..addListener(() {
              if (mounted) {
                setState(() {});
              }
            }));
    }

    if (widget.autoStart == true) {
      repeat();
    }
  }

  void _scaleListener() {
    for (int i = 1; i < widget.layers; i++) {
      if (_scaleAnimations[0].value >=
          widget.beginRadius +
              (widget.endRadius - widget.beginRadius) / widget.layers * i) {
        _controllers[i].repeat();
        if (i == widget.layers - 1) {
          _scaleAnimations[0].removeListener(_scaleListener);
        }
      }
    }
  }

  @override
  void dispose() {
    for (var e in _controllers) {
      e.dispose();
    }
    super.dispose();
  }

  bool get isAnimating =>
      _controllers.isNotEmpty && _controllers[0].isAnimating;

  /// 开始循环动画
  repeat() {
    if (!isAnimating) {
      _controllers[0].repeat();
      _scaleAnimations[0].addListener(_scaleListener);
    }
  }

  /// 取消动画
  reset() {
    for (var e in _controllers) {
      e.reset();
    }
  }

  /// 反向动画
  reverse({VoidCallback? onDismissed}) {
    if (onDismissed != null) {
      AnimationStatusListener? statusListener;
      statusListener = (status) {
        if (status == AnimationStatus.dismissed && _controllers.isNotEmpty) {
          _controllers.last.removeStatusListener(statusListener!);
          onDismissed();
        }
      };
      if (_controllers.isNotEmpty) {
        _controllers.last.addStatusListener(statusListener);
      }
    }
    for (var e in _controllers) {
      e.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        List<Widget> widgets = [];
        for (int i = 0; i < widget.layers; i++) {
          double scaleValue = _scaleAnimations[i].value / widget.beginRadius;
          widgets.add(
            Transform.scale(
              scale: scaleValue,
              child: Container(
                width: widget.beginRadius * 2,
                height: widget.beginRadius * 2,
                decoration: BoxDecoration(
                  color: widget.onlyBorder ? null : _colorAnimations[i].value,
                  shape: BoxShape.circle,
                  border: widget.onlyBorder
                      ? Border.all(
                          color: _colorAnimations[i].value ?? Colors.black,
                          width: widget.borderWidth)
                      : null,
                ),
              ),
            ),
          );
        }
        if (widget.child != null) {
          widgets.add(widget.child!);
        }
        return Stack(
          alignment: Alignment.center,
          children: widgets,
        );
      },
    );
  }
}
