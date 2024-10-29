import 'package:flutter/material.dart';

class ChildWidgetModel {
  String widgetKey; //使用该key来判断是否同一个widget，必须填一个
  Widget widget;
  double scale;
  double childWidth;
  double childHeight;
  Offset offset; //需要偏移的坐标

  ChildWidgetModel({
    required this.widgetKey,
    required this.widget,
    required this.scale,
    required this.childWidth,
    required this.childHeight,
    this.offset = Offset.zero,
  });
}
