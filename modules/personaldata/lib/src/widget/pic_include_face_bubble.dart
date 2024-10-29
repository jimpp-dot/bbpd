import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

enum PicIncludeFaceBubbleArrowDirection { top, bottom, right, left, topLeft }

class PicIncludeFaceBubbleWidget extends StatelessWidget {
  // 尖角位置
  final position;

  // 尖角高度
  var arrHeight;

  // 尖角角度
  var arrAngle;

  // 圆角半径
  var radius;

  // 宽度
  final width;

  // 高度
  final height;

  // 尖角距离边缘的 边距
  double length;

  // 颜色
  Color color;

  // 边框颜色
  Color? borderColor;

  // 边框宽度
  final strokeWidth;

  // 填充样式
  final style;

  // 子 Widget
  final child;

  // 子 Widget 与起泡间距
  var innerPadding;

  PicIncludeFaceBubbleWidget(
    this.width,
    this.height,
    this.color,
    this.position, {
    Key? key,
    this.length = 1,
    this.arrHeight = 6.0,
    this.arrAngle = 60.0,
    this.radius = 8.0,
    this.strokeWidth = 4.0,
    this.style = PaintingStyle.fill,
    this.borderColor,
    this.child,
    this.innerPadding = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (style == PaintingStyle.stroke && borderColor == null) {
      borderColor = color;
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
    if (position == PicIncludeFaceBubbleArrowDirection.top ||
        position == PicIncludeFaceBubbleArrowDirection.bottom) {
      if (length < 0.0 || length >= width - 2 * radius) {
        length = width * 0.5 - arrHeight * tan(_angle(arrAngle * 0.5)) - radius;
      }
    } else {
      if (length < 0.0 || length >= height - 2 * radius) {
        length =
            height * 0.5 - arrHeight * tan(_angle(arrAngle * 0.5)) - radius;
      }
    }
    if (innerPadding < 0.0 ||
        innerPadding >= width * 0.5 ||
        innerPadding >= height * 0.5) {
      innerPadding = 2.0;
    }
    Widget bubbleWidget;
    if (style == PaintingStyle.fill) {
      bubbleWidget = SizedBox(
          width: width,
          height: height,
          child: Stack(children: <Widget>[
            CustomPaint(
                painter: BubbleCanvas(context, width, height, color, position,
                    arrHeight, arrAngle, radius, strokeWidth, style, length)),
            _paddingWidget()
          ]));
    } else {
      bubbleWidget = SizedBox(
          width: width,
          height: height,
          child: Stack(children: <Widget>[
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
                    length)),
            CustomPaint(
                painter: BubbleCanvas(
                    context,
                    width,
                    height,
                    borderColor,
                    position,
                    arrHeight,
                    arrAngle,
                    radius,
                    strokeWidth,
                    style,
                    length)),
            _paddingWidget()
          ]));
    }
    return bubbleWidget;
  }

  Widget _paddingWidget() {
    return Padding(
        padding: EdgeInsetsDirectional.only(
            top: (position == PicIncludeFaceBubbleArrowDirection.top)
                ? arrHeight + innerPadding
                : innerPadding,
            end: (position == PicIncludeFaceBubbleArrowDirection.right)
                ? arrHeight + innerPadding
                : innerPadding,
            bottom: (position == PicIncludeFaceBubbleArrowDirection.bottom)
                ? arrHeight + innerPadding
                : innerPadding,
            start: (position == PicIncludeFaceBubbleArrowDirection.left)
                ? arrHeight + innerPadding
                : innerPadding),
        child: Center(child: child));
  }
}

class BubbleCanvas extends CustomPainter {
  BuildContext context;
  final position;
  final arrHeight;
  final arrAngle;
  final radius;
  final width;
  final height;
  final length;
  final color;
  final strokeWidth;
  final style;

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
      this.length);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.arcTo(
        Rect.fromCircle(
            center: Offset(
                (position == PicIncludeFaceBubbleArrowDirection.left)
                    ? radius + arrHeight
                    : radius,
                (position == PicIncludeFaceBubbleArrowDirection.top)
                    ? radius + arrHeight
                    : radius),
            radius: radius),
        pi,
        pi * 0.5,
        false);
    if (position == PicIncludeFaceBubbleArrowDirection.top) {
      path.lineTo(length + radius, arrHeight);
      path.lineTo(
          length + radius + arrHeight * tan(_angle(arrAngle * 0.5)), 0.0);
      path.lineTo(length + radius + arrHeight * tan(_angle(arrAngle * 0.5)) * 2,
          arrHeight);
    }
    path.lineTo(
        (position == PicIncludeFaceBubbleArrowDirection.right)
            ? width - radius - arrHeight
            : width - radius,
        (position == PicIncludeFaceBubbleArrowDirection.top) ? arrHeight : 0.0);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(
                (position == PicIncludeFaceBubbleArrowDirection.right)
                    ? width - radius - arrHeight
                    : width - radius,
                (position == PicIncludeFaceBubbleArrowDirection.top)
                    ? radius + arrHeight
                    : radius),
            radius: radius),
        -pi * 0.5,
        pi * 0.5,
        false);
    if (position == PicIncludeFaceBubbleArrowDirection.right) {
      path.lineTo(width - arrHeight, length + radius);
      path.lineTo(
          width, length + radius + arrHeight * tan(_angle(arrAngle * 0.5)));
      path.lineTo(width - arrHeight,
          length + radius + arrHeight * tan(_angle(arrAngle * 0.5)) * 2);
    }
    path.lineTo(
        (position == PicIncludeFaceBubbleArrowDirection.right)
            ? width - arrHeight
            : width,
        (position == PicIncludeFaceBubbleArrowDirection.bottom)
            ? height - radius - arrHeight
            : height - radius);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(
                (position == PicIncludeFaceBubbleArrowDirection.right)
                    ? width - radius - arrHeight
                    : width - radius,
                (position == PicIncludeFaceBubbleArrowDirection.bottom)
                    ? height - radius - arrHeight
                    : height - radius),
            radius: radius),
        pi * 0,
        pi * 0.5,
        false);
    if (position == PicIncludeFaceBubbleArrowDirection.bottom) {
      //画箭头位置
      path.lineTo(width - radius - length, height - arrHeight);

      //圆角 箭头朝其他方向也可以用贝塞尔曲线方式改成圆角
      path.quadraticBezierTo(
          width - radius - length - arrHeight * tan(_angle(arrAngle * 0.5)),
          height + arrHeight - 3,
          width - radius - length - arrHeight * tan(_angle(arrAngle * 0.5)) * 2,
          height - arrHeight);

      //尖角
      // path.lineTo(width - radius - length - arrHeight * tan(_angle(arrAngle * 0.5)), height);
      // path.lineTo(width - radius - length - arrHeight * tan(_angle(arrAngle * 0.5)) * 2, height - arrHeight);
    }
    path.lineTo(
        (position == PicIncludeFaceBubbleArrowDirection.left)
            ? radius + arrHeight
            : radius,
        (position == PicIncludeFaceBubbleArrowDirection.bottom)
            ? height - arrHeight
            : height);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(
                (position == PicIncludeFaceBubbleArrowDirection.left)
                    ? radius + arrHeight
                    : radius,
                (position == PicIncludeFaceBubbleArrowDirection.bottom)
                    ? height - radius - arrHeight
                    : height - radius),
            radius: radius),
        pi * 0.5,
        pi * 0.5,
        false);
    if (position == PicIncludeFaceBubbleArrowDirection.left) {
      path.lineTo(arrHeight, height - radius - length);
      path.lineTo(0.0,
          height - radius - length - arrHeight * tan(_angle(arrAngle * 0.5)));
      path.lineTo(
          arrHeight,
          height -
              radius -
              length -
              arrHeight * tan(_angle(arrAngle * 0.5)) * 2);
    }
    path.lineTo(
        (position == PicIncludeFaceBubbleArrowDirection.left) ? arrHeight : 0.0,
        (position == PicIncludeFaceBubbleArrowDirection.top)
            ? radius + arrHeight
            : radius);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = style
          ..strokeCap = StrokeCap.round
          ..strokeWidth = strokeWidth);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

double _angle(angle) {
  return angle * pi / 180;
}

class PicIncludeFacePopup extends StatefulWidget {
  final Widget child;
  final Function? onClick; //点击child事件
  final EdgeInsetsGeometry? padding;
  final int duration;
  final Alignment scaleTransitionAlignment;

  const PicIncludeFacePopup({
    super.key,
    required this.child,
    this.onClick,
    this.padding,
    this.duration = 0,
    this.scaleTransitionAlignment = Alignment.bottomCenter,
  });

  @override
  _PicIncludeFacePopupState createState() {
    return _PicIncludeFacePopupState();
  }
}

class _PicIncludeFacePopupState extends State<PicIncludeFacePopup>
    with SingleTickerProviderStateMixin {
  late Timer t;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(milliseconds: widget.duration * 100), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    animation.addListener(() {
      setState(() {});
    });

    controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.duration > 0) {
        t = Timer(Duration(seconds: widget.duration), () {
          if (animation.status == AnimationStatus.completed) {
            controller.reverse();
          }
          if (mounted) {
            Navigator.of(context).pop();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
            ),
            Padding(
              padding: widget.padding ?? EdgeInsetsDirectional.zero,
              child: ScaleTransition(
                scale: controller,
                alignment: widget.scaleTransitionAlignment,
                child: FadeTransition(
                  opacity: controller,
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          //点击空白处
          if (animation.status == AnimationStatus.completed) {
            controller.reverse();
          }

          Navigator.of(context).pop();
          t.cancel();
        },
      ),
    );
  }
}

class PicIncludeFacePopRoute extends PopupRoute {
  final Duration _duration = const Duration(milliseconds: 300);
  Widget child;

  PicIncludeFacePopRoute({required this.child});

  @override
  Color get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => '';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
