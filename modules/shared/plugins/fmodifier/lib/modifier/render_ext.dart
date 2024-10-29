import 'package:flutter/material.dart';
import 'dart:ui' as UI;

/// Render
extension RenderExt on Widget {
  /// 剪切为圆形
  Widget clipToCircleExt({Key? key}) {
    return ClipOval(
      key: key,
      child: this,
    );
  }

  /// 圆角设置
  Widget cornerRadiusExt(
      {double radius = 0,
      double topLeft = 0,
      double topRight = 0,
      double bottomLeft = 0,
      double bottomRight = 0,
      Key? key}) {
    if (radius > 0) {
      return ClipRRect(
        key: key,
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );
    } else {
      return ClipRRect(
        key: key,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight)),
        child: this,
      );
    }
  }

  /// 变形：位移
  Widget translateExt(double x, double y, {Key? key}) {
    return Transform.translate(
      key: key,
      offset: Offset(x, y),
      child: this,
    );
  }

  /// 变形：旋转
  Widget rotateExt(double angle, {Key? key}) {
    return Transform.rotate(
      key: key,
      angle: angle,
      child: this,
    );
  }

  /// 变形：拉伸
  Widget scaleExt(double scale, {Key? key}) {
    return Transform.scale(
      key: key,
      scale: scale,
      child: this,
    );
  }

  /// 模糊
  Widget blurExt(double radius, {Key? key}) {
    return Stack(
      key: key,
      fit: StackFit.expand,
      children: <Widget>[
        this,
        BackdropFilter(
          filter: UI.ImageFilter.blur(sigmaX: radius, sigmaY: radius),
          child: Container(
            color: Colors.transparent,
          ),
        )
      ],
    );
  }

  /// 隐藏，保留在布局中，但占用空间大小为0
  Widget visibleExt(bool visible, {Key? key}) {
    return Visibility(
      key: key,
      visible: visible,
      maintainState: true,
      child: this,
    );
  }

  /// 隐藏，并从布局中移除， child 依旧活跃
  Widget offstageExt(bool offstage, {Key? key}) {
    return Offstage(
      key: key,
      offstage: offstage,
      child: this,
    );
  }

  /// 设置透明度
  Widget opacityExt(double opacity, {int duration = 250, Key? key}) {
    return AnimatedOpacity(
      key: key,
      duration: Duration(milliseconds: duration),
      opacity: opacity,
      child: this,
    );
  }

  /// 设置阴影
  Widget shadowExt(Color color, double radius, double x, double y, {Key? key}) {
    return Container(
      key: key,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: color, offset: Offset(x, y), blurRadius: radius)
      ]),
      child: this,
    );
  }

  /// 设置背景色
  Widget backgroundColorExt(Color color, {Key? key}) {
    return DecoratedBox(
      key: key,
      decoration: BoxDecoration(color: color),
      child: this,
    );
  }

  /// 设置渐变背景色
  Widget gradientBGColorExt(List<Color> colors, {double borderRadius = 0}) {
    return DecoratedBox(
        key: key,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: colors),
            borderRadius: BorderRadius.circular(borderRadius)),
        child: this);
  }

  /// 设置边框 + 背景色
  Widget borderExt(Color color,
      {double width = 1,
      BorderRadius radius = BorderRadius.zero,
      Color bgColor = Colors.transparent,
      Key? key}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
          border: Border.all(color: color, width: width),
          borderRadius: radius,
          color: bgColor),
      child: this,
    );
  }
}
