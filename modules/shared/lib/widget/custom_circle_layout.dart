import 'dart:math' as math;

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 圆弧型布局
class CustomCircleLayout extends StatefulWidget {
  final List<Widget> childList;
  final double childSize;
  final double parentSize;
  final double? radius;
  final bool reverse; //默认顺时针

  const CustomCircleLayout(
      {super.key,
      required this.childList,
      required this.childSize,
      required this.parentSize,
      this.radius,
      this.reverse = false});

  @override
  _CustomCircleLayoutState createState() => _CustomCircleLayoutState();
}

class _CustomCircleLayoutState extends State<CustomCircleLayout> {
  ///用于 LayoutId 指定
  ///CircleLayoutDelegate 操作具体 Child 的 ChildId 是通过 LayoutId 指定的
  List<int> get customLayoutId =>
      widget.childList.mapIndexed((i, e) => i).toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.parentSize,
      height: widget.parentSize,

      ///使用 CustomMultiChildLayout
      child: CustomMultiChildLayout(
        ///使用 CircleLayoutDelegate 实现 child 的布局
        delegate: CircleLayoutDelegate(
            customLayoutId, widget.radius ?? widget.parentSize / 2,

            ///这里外部指定 child 的大小
            childSize: Size(widget.childSize, widget.childSize),

            ///中心点位置
            center: Offset(widget.parentSize / 2, widget.parentSize / 2),
            reverse: widget.reverse),

        children: <Widget>[
          ///使用 LayoutId 指定 childId
          for (int index in customLayoutId)
            LayoutId(id: index, child: widget.childList[index]),
        ],
      ),
    );
  }
}

///自定义实现圆形布局
class CircleLayoutDelegate extends MultiChildLayoutDelegate {
  final List<int> customLayoutId;

  final Offset center;

  Size? childSize;

  final double radius;

  final bool reverse;

  CircleLayoutDelegate(this.customLayoutId, this.radius,
      {this.center = Offset.zero, this.childSize, this.reverse = false});

  @override
  void performLayout(Size size) {
    for (var index in customLayoutId) {
      if (hasChild(index)) {
        double step = 360 / customLayoutId.length;

        double hd = (2 * math.pi / 360) * step * index;

        var x = reverse
            ? center.dx - math.sin(hd) * radius
            : center.dx + math.sin(hd) * radius;

        var y = center.dy - math.cos(hd) * radius;

        childSize ??= Size(size.width / customLayoutId.length,
            size.height / customLayoutId.length);

        ///设置 child 大小
        layoutChild(index, BoxConstraints.loose(childSize!));

        final double centerX = childSize!.width / 2.0;

        final double centerY = childSize!.height / 2.0;

        var result = Offset(x - centerX, y - centerY);

        ///设置 child 位置
        positionChild(index, result);
      }
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}
