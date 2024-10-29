import 'dart:math';
import 'package:flutter/material.dart';

enum BubbleArrowDirection { top, bottom, right, left }

// ignore: must_be_immutable
class BubbleWidget extends StatelessWidget {
  // 尖角位置
  final BubbleArrowDirection position;

  // 尖角高度
  double arrHeight;

  // 尖角角度
  double arrAngle;

  // 尖角开始位置(除掉圆角后),上/下从左开始,左/右从上开始
  double arrStartPosition;

  // 圆角半径
  double radius;

  // 宽度,包含尖角高度
  final double width;

  // 高度,包含尖角高度
  final double height;

  // 颜色
  Color color;

  // 边框颜色
  Color? borderColor;

  // 边框宽度
  final double strokeWidth;

  // 填充样式
  final PaintingStyle style;

  // 子 Widget
  final Widget? child;

  // 子 Widget 与起泡间距
  double innerPadding;

  final List<Color>? gradientColors;

  BubbleWidget(this.width, this.height, this.color, this.position,
      {super.key,
      this.arrStartPosition = -1.0,
      this.arrHeight = 7.0,
      this.arrAngle = 80.0,
      this.radius = 4.0,
      this.strokeWidth = 1.0,
      this.style = PaintingStyle.fill,
      this.borderColor,
      this.child,
      this.innerPadding = 0.0,
      this.gradientColors});

  @override
  Widget build(BuildContext context) {
    if (style == PaintingStyle.stroke) {
      borderColor ??= color;
    }
    if (arrAngle < 0.0 || arrAngle >= 180.0) {
      arrAngle = 60.0;
    }
    if (arrHeight < 0.0) {
      arrHeight = 0.0;
    }
    if (radius < 0.0 || radius > width * 0.5 || radius > height * 0.5) {
      radius = 0.0;
    }
    if (position == BubbleArrowDirection.top ||
        position == BubbleArrowDirection.bottom) {
      if (arrStartPosition < 0.0 || arrStartPosition >= width - 2 * radius) {
        arrStartPosition =
            width * 0.5 - arrHeight * tan(_angle(arrAngle * 0.5)) - radius;
      }
    } else {
      if (arrStartPosition < 0.0 || arrStartPosition >= height - 2 * radius) {
        arrStartPosition =
            height * 0.5 - arrHeight * tan(_angle(arrAngle * 0.5)) - radius;
      }
    }
    if (innerPadding < 0.0 ||
        innerPadding >= width * 0.5 ||
        innerPadding >= height * 0.5) {
      innerPadding = 0.0;
    }
    Widget bubbleWidget;
    if (style == PaintingStyle.fill) {
      bubbleWidget = SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            CustomPaint(
              painter: BubbleCanvas(
                  context,
                  width,
                  height,
                  color,
                  position,
                  arrHeight,
                  arrAngle,
                  radius,
                  strokeWidth,
                  style,
                  arrStartPosition,
                  gradientColors),
            ),
            _paddingWidget(),
          ],
        ),
      );
    } else {
      bubbleWidget = SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            CustomPaint(
              painter: BubbleCanvas(
                  context,
                  width,
                  height,
                  color,
                  position,
                  arrHeight,
                  arrAngle,
                  radius,
                  strokeWidth,
                  PaintingStyle.fill,
                  arrStartPosition,
                  gradientColors),
            ),
            CustomPaint(
              painter: BubbleCanvas(
                  context,
                  width,
                  height,
                  borderColor!,
                  position,
                  arrHeight,
                  arrAngle,
                  radius,
                  strokeWidth,
                  style,
                  arrStartPosition,
                  gradientColors),
            ),
            _paddingWidget(),
          ],
        ),
      );
    }
    return bubbleWidget;
  }

  Widget _paddingWidget() {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: (position == BubbleArrowDirection.top)
                ? arrHeight + innerPadding
                : innerPadding,
            end: (position == BubbleArrowDirection.right)
                ? arrHeight + innerPadding
                : innerPadding,
            bottom: (position == BubbleArrowDirection.bottom)
                ? arrHeight + innerPadding
                : innerPadding,
            start: (position == BubbleArrowDirection.left)
                ? arrHeight + innerPadding
                : innerPadding),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

double _angle(double angle) {
  return angle * pi / 180;
}

class BubbleCanvas extends CustomPainter {
  BuildContext context;
  final BubbleArrowDirection position;
  final double arrHeight;
  final double arrAngle;
  final double radius;
  final double width;
  final double height;
  final double arrStartPosition;
  final Color color;
  final double strokeWidth;
  final PaintingStyle style;
  final List<Color>? shapeColors;

  BubbleCanvas(
      this.context,
      this.width,
      this.height,
      this.color,
      this.position,
      this.arrHeight,
      this.arrAngle,
      this.radius,
      this.strokeWidth,
      this.style,
      this.arrStartPosition,
      this.shapeColors);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    //左上圆角
    path.arcTo(
      //关注圆心x,y坐标
      Rect.fromCircle(
        center: Offset(
          (position == BubbleArrowDirection.left) ? radius + arrHeight : radius,
          (position == BubbleArrowDirection.top) ? radius + arrHeight : radius,
        ),
        radius: radius,
      ),
      pi,
      pi * 0.5,
      false,
    );

    //上面部分
    if (position == BubbleArrowDirection.top) {
      //如果上面有尖角,画4条线(横斜斜横)
      path.lineTo(arrStartPosition + radius, arrHeight);
      path.lineTo(
          arrStartPosition + radius + arrHeight * tan(_angle(arrAngle * 0.5)),
          0.0);
      path.lineTo(
          arrStartPosition +
              radius +
              arrHeight * tan(_angle(arrAngle * 0.5)) * 2,
          arrHeight);
      path.lineTo(width - radius, arrHeight);
    } else {
      //画一条直线
      path.lineTo(
        (position == BubbleArrowDirection.right)
            ? width - radius - arrHeight
            : width - radius,
        (position == BubbleArrowDirection.top) ? arrHeight : 0.0,
      );
    }

    //右上圆角
    path.arcTo(
      //关注圆心x,y坐标
      Rect.fromCircle(
        center: Offset(
          (position == BubbleArrowDirection.right)
              ? width - radius - arrHeight
              : width - radius,
          (position == BubbleArrowDirection.top) ? radius + arrHeight : radius,
        ),
        radius: radius,
      ),
      -pi * 0.5,
      pi * 0.5,
      false,
    );

    //右边部分
    if (position == BubbleArrowDirection.right) {
      //如果右边有尖角,画4条线(竖斜斜竖)
      path.lineTo(width - arrHeight, arrStartPosition + radius);
      path.lineTo(width,
          arrStartPosition + radius + arrHeight * tan(_angle(arrAngle * 0.5)));
      path.lineTo(
          width - arrHeight,
          arrStartPosition +
              radius +
              arrHeight * tan(_angle(arrAngle * 0.5)) * 2);
      path.lineTo(width - arrHeight, height - radius);
    } else {
      //画一条直线
      path.lineTo(
        (position == BubbleArrowDirection.right) ? width - arrHeight : width,
        (position == BubbleArrowDirection.bottom)
            ? height - radius - arrHeight
            : height - radius,
      );
    }

    //右下圆角
    path.arcTo(
      //关注圆心x,y坐标
      Rect.fromCircle(
        center: Offset(
          (position == BubbleArrowDirection.right)
              ? width - radius - arrHeight
              : width - radius,
          (position == BubbleArrowDirection.bottom)
              ? height - radius - arrHeight
              : height - radius,
        ),
        radius: radius,
      ),
      pi * 0,
      pi * 0.5,
      false,
    );

    //下面部分
    if (position == BubbleArrowDirection.bottom) {
      //如果下面有尖角,画4条线(横斜斜横)
      path.lineTo(
          arrStartPosition +
              radius +
              arrHeight * tan(_angle(arrAngle * 0.5)) * 2,
          height - arrHeight);
      path.lineTo(
          arrStartPosition + radius + arrHeight * tan(_angle(arrAngle * 0.5)),
          height);
      path.lineTo(arrStartPosition + radius, height - arrHeight);
      path.lineTo(radius, height - arrHeight);
    } else {
      //画一条直线
      path.lineTo(
        (position == BubbleArrowDirection.left) ? radius + arrHeight : radius,
        (position == BubbleArrowDirection.bottom) ? height - arrHeight : height,
      );
    }

    //左下圆角
    path.arcTo(
      //关注圆心x,y坐标
      Rect.fromCircle(
        center: Offset(
          (position == BubbleArrowDirection.left) ? radius + arrHeight : radius,
          (position == BubbleArrowDirection.bottom)
              ? height - radius - arrHeight
              : height - radius,
        ),
        radius: radius,
      ),
      pi * 0.5,
      pi * 0.5,
      false,
    );

    //左边部分
    if (position == BubbleArrowDirection.left) {
      //如果右边有尖角,画4条线(竖斜斜竖)
      path.lineTo(
          arrHeight,
          radius +
              arrStartPosition +
              arrHeight * tan(_angle(arrAngle * 0.5)) * 2);
      path.lineTo(0.0,
          radius + arrStartPosition + arrHeight * tan(_angle(arrAngle * 0.5)));
      path.lineTo(arrHeight, radius + arrStartPosition);
      path.lineTo(
        arrHeight,
        radius,
      );
    } else {
      //画一条直线
      path.lineTo(
        (position == BubbleArrowDirection.left) ? arrHeight : 0.0,
        (position == BubbleArrowDirection.top) ? radius + arrHeight : radius,
      );
    }

    path.close();

    Paint paint = Paint()
      ..color = color
      ..style = style
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    if (shapeColors != null && shapeColors!.length > 1) {
      paint.shader = LinearGradient(colors: shapeColors!)
          .createShader(Rect.fromLTWH(0, 0, width, height));
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
