import 'package:flutter/material.dart';
import './touchable_container.dart';
import './float_widget_model.dart';
import './child_widget_model.dart';

@immutable
class DragScaleContainer extends StatefulWidget {
  final ChildWidgetModel childWidget;
  final List<FloatWidgetModel> floatWidgets;

//  /// 双击内容是否一致放大，默认是true，也就是一致放大
//  /// 如果为false，第一次双击放大两倍，再次双击恢复原本大小
//  bool doubleTapStillScale;

  const DragScaleContainer(
      {super.key,
      required ChildWidgetModel childWidget,
      required List<FloatWidgetModel> floatWidgets})
      : childWidget = childWidget,
        floatWidgets = floatWidgets;
  @override
  State<StatefulWidget> createState() {
    return _DragScaleContainerState();
  }
}

class _DragScaleContainerState extends State<DragScaleContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: TouchableContainer(
        childWidget: widget.childWidget,
        floatWidgets: widget.floatWidgets,
      ),
    );
  }
}
