import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import './custom_gesture_detector.dart' as gd;
import './float_widget_model.dart';
import './child_widget_model.dart';

class ScaleChangedModel {
  double scale;
  Offset offset;
  ScaleChangedModel({required this.scale, required this.offset});

  @override
  String toString() {
    return 'ScaleChangedModel(scale: $scale, offset:$offset)';
  }
}

class TouchableContainer extends StatefulWidget {
  final ChildWidgetModel childWidget;
  final List<FloatWidgetModel>? floatWidgets;
  final ValueChanged<ScaleChangedModel>? scaleChanged;

  const TouchableContainer({
    super.key,
    this.scaleChanged,
    required this.childWidget,
    this.floatWidgets,
  });

  @override
  _TouchableContainerState createState() => _TouchableContainerState();
}

class _TouchableContainerState extends State<TouchableContainer>
    with SingleTickerProviderStateMixin {
  // double _kMinFlingVelocity = 800.0;
  late AnimationController _controller;
  // Animation<Offset> _flingAnimation;
  late Offset _normalizedOffset;
  // late double _previousScale;
  // Offset doubleDownPositon;
  late Offset _offset;
  late double _scale; //1.0;4.33
  late Widget _child;
  late double _childWidth;
  late double _childHeight;
  // List<double> _onDoubleScaleList = [1.25, 1.25, 0.8, 0.8]; //循环
  // int _onDoubleScaleIndex = -1;

  @override
  void initState() {
    super.initState();
    _init();
    Log.d(
        "TouchableContainer _offset=${_offset.dx},${_offset.dy} _scale=$_scale _childWidth=$_childWidth _childHeight=$_childHeight");
    _controller = AnimationController(vsync: this)
      ..addListener(_handleFlingAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(TouchableContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.childWidget.widgetKey != oldWidget.childWidget.widgetKey) {
      _init();
      setState(() {});
    }
  }

  _init() {
    _offset = widget.childWidget.offset;
    _scale = widget.childWidget.scale;
    _child = widget.childWidget.widget;
    _childWidth = widget.childWidget.childWidth;
    _childHeight = widget.childWidget.childHeight;
    // _onDoubleScaleIndex = -1;
  }

  // The maximum offset value is 0,0. If the size of this renderer's box is w,h
  // then the minimum offset value is w - _scale * w, h - _scale * h.
  //也就是最小值是原点0，0，点从最大值到0的区间，也就是这个图可以从最大值移动到原点
  Offset _clampOffset(Offset offset) {
    final Size size = context.size ?? Size.zero; //容器的大小
    Log.d('buildbuild111-1 ${size.width} ${size.height} ');
    double minDx = (size.width - _childWidth * _scale).toInt().toDouble();
    if (minDx > 0) {
      minDx = 0;
    }
    double minDy = (size.height - _childHeight * _scale).toInt().toDouble();
    if (minDy > 0) {
      minDy = 0;
    }

    final Offset minOffset = Offset(minDx, minDy);
    Log.d('buildbuild111-2 ${minOffset.dx} ${minOffset.dy} ');
    //以左上角为原点
    Offset o = Offset(
        offset.dx.clamp(minOffset.dx, 0.0), offset.dy.clamp(minOffset.dy, 0.0));
    Log.d('buildbuild111-31 ${offset.dx} ${offset.dy} ');
    Log.d('buildbuild111-32 ${o.dx} ${o.dy} ');
    return o;
  }

  void _handleFlingAnimation() {
    // setState(() {
    //   _offset = _flingAnimation.value;
    // });
  }

  void _handleOnScaleStart(gd.ScaleStartDetails details) {
    setState(() {
      // _previousScale = _scale;
      _normalizedOffset = (details.focalPoint - _offset) / _scale;
      // The fling animation stops if an input gesture starts.
      _controller.stop();
    });
  }

  void _handleOnScaleUpdate(gd.ScaleUpdateDetails details) {
    setState(() {
      ///屏蔽掉触控缩放，有问题，待处理
//      if (details.pointCount > 1) {
//        _scale = (_previousScale * details.scale).clamp(1.0, double.infinity);
//      }
      ///屏蔽掉触控缩放，有问题，待处理
      // Ensure that image location under the focal point stays in the same place despite scaling.
//      Log.d('_handleOnScaleUpdate 111 ${details.focalPoint.dx} ${details.focalPoint.dy}');
      _offset = _clampOffset(details.focalPoint - _normalizedOffset * _scale);
//      Log.d('_handleOnScaleUpdate 222 ${_offset.dx} ${_offset.dy}');
    });
    ScaleChangedModel model = ScaleChangedModel(scale: _scale, offset: _offset);
    if (widget.scaleChanged != null) widget.scaleChanged!(model);
  }

//  void _handleOnScaleEnd(gd.ScaleEndDetails details) {
//    final double magnitude = details.velocity.pixelsPerSecond.distance;
//    if (magnitude < _kMinFlingVelocity) return;
//    final Offset direction = details.velocity.pixelsPerSecond / magnitude;
//    final double distance = (Offset.zero & context.size).shortestSide;
//    _flingAnimation = new Tween<Offset>(
//            begin: _offset, end: _clampOffset(_offset + direction * distance))
//        .animate(_controller);
//    _controller
//      ..value = 0.0
//      ..fling(velocity: magnitude / 1000.0);
//  }

  ///屏蔽掉双击缩放，有问题，待处理
  void _onDoubleTap(gd.DoubleDetails details) {
//    _normalizedOffset = (details.pointerEvent.position - _offset) / _scale;
//    setState(() {
//
//      _onDoubleScaleIndex = _onDoubleScaleIndex + 1;
//
//      _onDoubleScaleIndex = _onDoubleScaleIndex % _onDoubleScaleList.length;
//
//      double onDoubleScale = _onDoubleScaleList[_onDoubleScaleIndex];
//
//      _scale *= onDoubleScale;
//
//      Log.d('_onDoubleTap $_onDoubleScaleIndex $onDoubleScale $_scale');
//
//      // Ensure that image location under the focal point stays in the same place despite scaling.
//      // _offset = doubleDownPositon;
//      _offset = _clampOffset(
//          details.pointerEvent.position - _normalizedOffset * _scale);
//    });
//
//    ScaleChangedModel model =
//        new ScaleChangedModel(scale: _scale, offset: _offset);
//    if (widget.scaleChanged != null) widget.scaleChanged(model);
  }

  Widget _renderContent() {
    List<Widget> res = [];
    res.add(
      Transform(
        transform: Matrix4.identity()
          ..translate(_offset.dx, _offset.dy)
          ..scale(_scale, _scale, 1.0),
        child: _child,
      ),
    );
    if (widget.floatWidgets != null && widget.floatWidgets!.isNotEmpty) {
      for (var item in widget.floatWidgets!) {
        res.add(
          PositionedDirectional(
            top: item.offset.dy + _offset.dy,
            start: item.offset.dx + _offset.dx,
            child: item.widget,
          ),
        );
      }
    }

    return gd.GestureDetector(
      // onPanDown: _onPanDown,
      onDoubleTap: _onDoubleTap,
      onScaleStart: _handleOnScaleStart,
      onScaleUpdate: _handleOnScaleUpdate,
      // onScaleEnd: _handleOnScaleEnd,
      child: Container(
//      color: Colors.red, //调试，后续去掉
        child: Stack(
          clipBehavior: Clip.none,
          children: res,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Log.d('buildbuild ${_offset.dx} ${_offset.dy}');
    return _renderContent();
  }
}
