import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///指定widget上下左右循环移动控件
class WolfCycleMoveWidget extends StatefulWidget {
  final int milliseconds; //循环单程毫秒
  final double height; //循环单程高度
  final int delayMillis; //延迟多少毫秒开始做动画
  final Widget childWidget; //指定用来循环的widget
  final double dx; //指定widget初始位置x
  final double dy; //指定widget初始位置y
  final int moveDirect; //移动方向 0垂直移动,1水平移动

  const WolfCycleMoveWidget({
    super.key,
    this.milliseconds = 500,
    this.height = 5.0,
    this.delayMillis = 350,
    required this.childWidget,
    required this.dx,
    required this.dy,
    this.moveDirect = 0,
  });

  @override
  _WolfCycleMoveWidgetState createState() {
    return _WolfCycleMoveWidgetState();
  }
}

class _WolfCycleMoveWidgetState extends State<WolfCycleMoveWidget>
    with TickerProviderStateMixin<WolfCycleMoveWidget> {
  late AnimationController _animationController;

  double _height = 0;
  late int durationMilliseconds;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _onUpdate() {
    setState(() {
      _height = _animationController.value * widget.height;
    });
  }

  _init() async {
    durationMilliseconds = widget.milliseconds;

    _animationController = AnimationController(
      duration: Duration(milliseconds: durationMilliseconds),
      vsync: this,
    );
    _animationController.addListener(_onUpdate);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (!mounted) {
          return;
        }
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        if (!mounted) {
          return;
        }
        _animationController.forward(from: 0.0);
      }
    });

    if (widget.delayMillis > 0) {
      await Future.delayed(Duration(milliseconds: widget.delayMillis));
    }

    if (mounted) {
      _animationController.forward(from: 0.0);
    }
  }

  Widget _getContent() {
    //水平移动
    if (widget.moveDirect == 1) {
      return PositionedDirectional(
        start: widget.dx - _height,
        top: widget.dy,
        child: widget.childWidget,
      );
    }

    //垂直移动
    return PositionedDirectional(
      start: widget.dx,
      top: widget.dy - _height,
      child: widget.childWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }
}
