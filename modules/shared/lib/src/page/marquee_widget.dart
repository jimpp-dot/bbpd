import 'dart:async';

import 'package:flutter/material.dart';

class MarqueeWidget extends StatefulWidget {
  final Widget child;

  ///滚动方向，水平或者垂直
  final Axis scrollAxis;

  /// 空白部分占用宽度
  final double ratioOfBlankToScreen;

  /// 子widget的宽度是否必须大于当前widget
  final bool childWiderThanSelf;

  final double speed;

  /// 延迟指定毫秒后再开始滚动
  final int delayMillis;

  const MarqueeWidget({
    Key? key,
    required this.child,
    this.scrollAxis = Axis.horizontal,
    this.ratioOfBlankToScreen = 80,
    this.childWiderThanSelf = true,
    this.speed = 1.0,
    this.delayMillis = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MarqueeWidgetState();
  }
}

class MarqueeWidgetState extends State<MarqueeWidget>
    with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  double position = 0.0;
  Timer? timer;
  late double _moveDistance;
  final int _timerRest = 100;
  final GlobalKey _key = GlobalKey();
  final GlobalKey _keyChild1 = GlobalKey();
  final GlobalKey _keyChild2 = GlobalKey();

  bool _showChild2 = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    _moveDistance = 5.0 * widget.speed;
    WidgetsBinding.instance.addPostFrameCallback((callback) => startTimer());
  }

  void startTimer() async {
    RenderObject? renderObject = _key.currentContext?.findRenderObject();
    if (!mounted || renderObject == null) return;
    double widgetWidth = renderObject.paintBounds.size.width;
    double widgetHeight = renderObject.paintBounds.size.height;
    double childWidth =
        _keyChild1.currentContext!.findRenderObject()!.paintBounds.size.width;

    // Log.d('widgetWidth:$widgetWidth');
    // Log.d('childWidth:$childWidth');
    // Log.d('maxScrollExtent:$maxScrollExtent');
    if (widget.childWiderThanSelf && childWidth <= widgetWidth) {
      _showChild2 = false;
      if (mounted) setState(() {});
      return;
    }
    if (widget.delayMillis > 0) {
      await Future.delayed(Duration(milliseconds: widget.delayMillis));
    }
    if (!mounted) {
      return;
    }
    timer = Timer.periodic(Duration(milliseconds: _timerRest), (timer) {
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double pixels = scrollController.position.pixels;
      if (pixels + _moveDistance >= maxScrollExtent) {
        if (widget.scrollAxis == Axis.horizontal) {
          position =
              (maxScrollExtent - widget.ratioOfBlankToScreen + widgetWidth) /
                      2 -
                  widgetWidth +
                  pixels -
                  maxScrollExtent;
        } else {
          position =
              (maxScrollExtent - widget.ratioOfBlankToScreen + widgetHeight) /
                      2 -
                  widgetHeight +
                  pixels -
                  maxScrollExtent;
        }
        scrollController.jumpTo(position);
      }
      position += _moveDistance;
      scrollController.animateTo(position,
          duration: Duration(milliseconds: _timerRest), curve: Curves.linear);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget getBothEndsChild(GlobalKey key) {
    return Center(
      key: key,
      child: widget.child,
    );
  }

  Widget getCenterChild() {
    if (widget.scrollAxis == Axis.horizontal) {
      return Container(width: widget.ratioOfBlankToScreen);
    } else {
      return Container(height: widget.ratioOfBlankToScreen);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: _key,
      scrollDirection: widget.scrollAxis,
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        getBothEndsChild(_keyChild1),
        getCenterChild(),
        if (_showChild2) getBothEndsChild(_keyChild2),
      ],
    );
  }
}
