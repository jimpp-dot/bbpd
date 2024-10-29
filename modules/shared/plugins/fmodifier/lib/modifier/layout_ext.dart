import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

/// Layouts
extension LayoutExt on Widget {
  /// 自动填充剩余空间
  Widget expandExt({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  /// 填充方式，多用于图片
  Widget fitExt(BoxFit fit, {Alignment alignment = Alignment.center}) {
    return FittedBox(
      fit: fit,
      alignment: alignment,
      child: this,
    );
  }

  /// 对齐方式
  Widget alignExt(Alignment align) {
    return Align(
      alignment: align,
      child: this,
    );
  }

  /// 约束为固定的Size
  Widget sizeFixedExt({double? width, double? height, Key? key}) {
    return SizedBox(
      key: key,
      width: width,
      height: height,
      child: this,
    );
  }

  /// 约束为一定范围内的Size
  Widget sizeConstrainedExt(
      {double minWidth = 0.0,
      double maxWidth = double.infinity,
      double minHeight = 0.0,
      double maxHeight = double.infinity,
      Key? key}) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: this,
    );
  }

  /// 约束为指定的比例的Size
  Widget sizeAspectRatioExt(double aspectRatio) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: this,
    );
  }

  /// 指定Child的宽高，以Parent的宽高为基准，因子为 0～infinity
  Widget sizeFractionExt({double? widthFactor, double? heightFactor}) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }

  /// 安全区域约束
  Widget safeAreaExt(
      {bool left = true,
      bool bottom = true,
      bool right = true,
      bool top = true,
      Key? key}) {
    return SafeArea(
      key: key,
      left: left,
      bottom: bottom,
      right: right,
      top: top,
      child: this,
    );
  }

  /// 内边距
  Widget paddingExt(EdgeInsetsDirectional edges, {Key? key}) {
    return Padding(
      key: key,
      padding: edges,
      child: this,
    );
  }

  /// 外边距
  Widget marginExt(EdgeInsetsDirectional edges, {Key? key}) {
    return Container(
      key: key,
      margin: edges,
      child: this,
    );
  }

  /// 前景
  Widget overlayExt(Widget overlay,
      {AlignmentDirectional alignment = AlignmentDirectional.center,
      Key? key}) {
    return Stack(
        key: key, alignment: alignment, children: <Widget>[this, overlay]);
  }

  /// 背景
  Widget backgroundExt(Widget background,
      {AlignmentDirectional alignment = AlignmentDirectional.center,
      Key? key}) {
    return Stack(
        key: key, alignment: alignment, children: <Widget>[background, this]);
  }
}
