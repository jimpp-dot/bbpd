// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Used with [TabBar.indicator] to draw a horizontal line below the
/// selected tab.
///
/// The selected tab underline is inset from the tab's boundary by [insets].
/// The [borderSide] defines the line's color and weight.
///
/// The [TabBar.indicatorSize] property can be used to define the indicator's
/// bounds in terms of its (centered) widget with [TabIndicatorSize.label],
/// or the entire tab with [TabIndicatorSize.tab].
class CustomUnderlineTabIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const CustomUnderlineTabIndicator({
//    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
    this.color = Colors.white,
    this.width = 20.0,
    this.height = 4.0,
  });

  final double width;
  final double height;
  final Color color;

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide =
      const BorderSide(width: 2.0, color: Colors.white);

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the
  /// tab indicator's bounds in terms of its (centered) tab widget with
  /// [TabIndicatorSize.label], or the entire tab with [TabIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  @override
  _UnderlinePainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged, width, height);
  }
}

class _UnderlinePainter extends BoxPainter {
  double width;
  double height;

  _UnderlinePainter(
      this.decoration, VoidCallback? onChanged, this.width, this.height)
      : super(onChanged);

  final CustomUnderlineTabIndicator decoration;

  BorderSide get borderSide => decoration.borderSide;

  EdgeInsetsGeometry get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection? textDirection) {
//    assert(rect != null);
//    assert(textDirection != null);
//    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
//    return Rect.fromLTWH(
//      indicator.left,
//      indicator.bottom - borderSide.width,
//      indicator.width,
//      borderSide.width,
//    );

    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);

    //希望的宽度
    double wantWidth = width;
    //取中间坐标
    double cw = (indicator.left + indicator.right) / 2;
    return Rect.fromLTWH(
        cw - wantWidth / 2, indicator.bottom - 8, wantWidth, height);
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection? textDirection = configuration.textDirection;
    final Rect indicator = _indicatorRectFor(
        rect, textDirection) /*.deflate(borderSide.width / 2.0)*/;
//    final Paint paint = borderSide.toPaint();
//    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);

    Paint paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
//      ..strokeJoin = StrokeJoin.round
      ..color = Colors.white;
    RRect rRect = RRect.fromRectAndRadius(indicator, const Radius.circular(4));
    canvas.drawRRect(rRect, paint);
  }
}
