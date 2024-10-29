import 'package:flutter/material.dart';

class CommonUnderlineTabIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const CommonUnderlineTabIndicator(
      {this.borderSide = const BorderSide(width: 3.0, color: Colors.white),
      this.insets = EdgeInsets.zero,
      this.wantWidth = 8.0,
      this.draggingWidth = 0});

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the
  /// tab indicator's bounds in terms of its (centered) tab widget with
  /// [TabIndicatorSize.label], or the entire tab with [TabIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  // indicator宽度
  final double wantWidth;
  // TabBar切换时，indicator根据拖动位置进行拉伸，draggingWidth为最大拉伸宽度，
  // indicator宽度 = wantWidth + draggingWidth * t， 其中t为0-1的系数
  final double draggingWidth;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is CommonUnderlineTabIndicator) {
      return CommonUnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is CommonUnderlineTabIndicator) {
      double width = wantWidth + draggingWidth * t;
      return CommonUnderlineTabIndicator(
          borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
          insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
          wantWidth: width);
    }
    return super.lerpTo(b, t);
  }

  @override
  _CommonUnderlinePainter createBoxPainter([VoidCallback? onChanged]) {
    return _CommonUnderlinePainter(this, onChanged);
  }
}

class _CommonUnderlinePainter extends BoxPainter {
  _CommonUnderlinePainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  final CommonUnderlineTabIndicator decoration;

  BorderSide get borderSide => decoration.borderSide;
  EdgeInsetsGeometry get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
//		return Rect.fromLTWH(
//			indicator.left,
//			indicator.bottom - borderSide.width,
//			indicator.width,
//			borderSide.width,
//		);

    //取中间坐标
    double cw = (indicator.left + indicator.right) / 2;
    return Rect.fromLTWH(
        cw - decoration.wantWidth / 2,
        indicator.bottom - borderSide.width,
        decoration.wantWidth,
        borderSide.width);
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = _indicatorRectFor(
        rect, textDirection); //.deflate(borderSide.width / 2.0)
    final Paint paint = borderSide.toPaint()..style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(indicator, const Radius.circular(7.0)), paint);
  }
}
