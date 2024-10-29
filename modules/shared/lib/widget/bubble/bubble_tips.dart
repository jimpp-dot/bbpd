import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'bubble_widget.dart';

const BubbleDefaultDuration = Duration(milliseconds: 7 * 1000);

enum BubbleDirection { top, bottom, right, left }

class TipWidgetConfig {
  Widget child;
  Alignment alignment;

  TipWidgetConfig(this.child, this.alignment);
}

class BubbleTips {
  static AnimationController? _controllerShowAnim;
  static BubbleToastView? _preToast;

  static showTips(
      BuildContext context,
      String msg,
      double width,
      double height,
      BubbleDirection bubbleDirection,
      double arrStartPosition,
      double bottom,
      double left,
      double right,
      {double arrHeight = 7.0,
      double arrAngle = 80.0,
      double radius = 8.0,
      Duration duration = BubbleDefaultDuration,
      Color? borderColor,
      double borderWidth = 1.0,
      Widget? widget,
      Color? msgColor,
      List<Color>? gradientColors}) async {
    TipWidgetConfig tipWidgetConfig = getTipsWidget(
        context, msg, width, height, bubbleDirection, arrStartPosition,
        arrHeight: arrHeight,
        arrAngle: arrAngle,
        radius: radius,
        borderColor: borderColor,
        borderWidth: borderWidth,
        widget: widget,
        msgColor: msgColor,
        gradientColors: gradientColors);

    _show(
      context,
      duration,
      tipWidgetConfig.child,
      tipWidgetConfig.alignment,
      bottom,
      left,
      right,
    );
  }

  static TipWidgetConfig getTipsWidget(
      BuildContext context,
      String msg,
      double width,
      double height,
      BubbleDirection bubbleDirection,
      double arrStartPosition,
      {double arrHeight = 7.0,
      double arrAngle = 80.0,
      double radius = 8.0,
      Color? borderColor,
      double borderWidth = 1.0,
      Widget? widget,
      Color? msgColor,
      List<Color>? gradientColors}) {
    Alignment sAlignment;
    double x = 0.0;
    double y = 0.0;

    BubbleArrowDirection bubbleArrowDirection = BubbleArrowDirection.top;
    if (bubbleDirection == BubbleDirection.top) {
      if (arrStartPosition == -1) {
        x = 0;
      } else {
        x = (2 * arrStartPosition + 2 * radius - width) / width;
      }
      y = -1.0;
      bubbleArrowDirection = BubbleArrowDirection.top;
    } else if (bubbleDirection == BubbleDirection.bottom) {
      if (arrStartPosition == -1) {
        x = 0;
      } else {
        x = (2 * arrStartPosition + 2 * radius - width) / width;
      }
      y = 1.0;
      bubbleArrowDirection = BubbleArrowDirection.bottom;
    } else if (bubbleDirection == BubbleDirection.left) {
      if (arrStartPosition == -1) {
        y = 0;
      } else {
        y = (2 * arrStartPosition + 2 * radius - height) / height;
      }
      x = -1.0;
      bubbleArrowDirection = BubbleArrowDirection.left;
    } else if (bubbleDirection == BubbleDirection.right) {
      if (arrStartPosition == -1) {
        y = 0;
      } else {
        y = (2 * arrStartPosition + 2 * radius - height) / height;
      }
      x = 1.0;
      bubbleArrowDirection = BubbleArrowDirection.right;
    }
    sAlignment = Alignment(x, y);

    Widget bubbleWidget = BubbleToast.builder(msg, width, height + arrHeight,
        bubbleArrowDirection, arrStartPosition, arrHeight, arrAngle, radius,
        borderColor: borderColor,
        borderWidth: borderWidth,
        widget: widget,
        msgColor: msgColor,
        gradientColors: gradientColors);

    TipWidgetConfig tipWidgetConfig = TipWidgetConfig(bubbleWidget, sAlignment);

    return tipWidgetConfig;
  }

  static _show(BuildContext? context,
      [Duration duration = BubbleDefaultDuration,
      Widget? widget,
      Alignment? sAlignment,
      double bottom = 0,
      double left = 0,
      double right = 0]) {
    if (_preToast != null) {
      _preToast!.dismiss();
    }

    if (widget == null) return;

    var overlayState = Overlay.of(context ?? System.context);

    _controllerShowAnim?.dispose();
    _controllerShowAnim = AnimationController(
      vsync: overlayState,
      duration: const Duration(milliseconds: 300),
    );
    var opacityAnim1 =
        Tween(begin: 0.0, end: 1.0).animate(_controllerShowAnim!);

    var controllerShowOffset = AnimationController(
      vsync: overlayState,
      duration: const Duration(milliseconds: 300),
    );
    var controllerCurvedShowOffset = CurvedAnimation(
        parent: controllerShowOffset, curve: const _BubbleBounceOutCurve._());
    var offsetAnim =
        Tween(begin: 30.0, end: 0.0).animate(controllerCurvedShowOffset);

    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return BubbleToastWidget(
        opacityAnim1: opacityAnim1,
        offsetAnim: offsetAnim,
        child: _buildToastLayout(
            widget: widget,
            sAlignment: sAlignment,
            bottom: bottom,
            left: left,
            right: right),
      );
    });

    var toastView = BubbleToastView(
        overlayEntry, _controllerShowAnim!, controllerShowOffset, overlayState);
    _preToast = toastView;
    toastView._show(duration);
  }

  static LayoutBuilder _buildToastLayout(
      {Widget? widget,
      Alignment? sAlignment,
      required double bottom,
      required double left,
      required double right}) {
    Widget? toastWidget;
    if (widget != null) {
      toastWidget = InkWell(
        onTap: () {
          if (_preToast != null) {
            _preToast!.dismiss();
          }
        },
        child: widget,
      );
    }

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (bottom.isNaN || left.isNaN || right.isNaN) return Container();
      return IgnorePointer(
        ignoring: true,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.white.withOpacity(0), //Colors.red,
            child: Container(
              margin: EdgeInsetsDirectional.only(
                bottom: bottom, //constraints.biggest.height * bottom,
                start: left, //constraints.biggest.width * 0.52,
                end: right, //12.0, //constraints.biggest.width * 0.1,
              ),
              child: ScaleTransition(
                //设置动画的缩放中心
                alignment:
                    sAlignment ?? Alignment.center, //Alignment(0.88, -1.0),
                //动画控制器
                scale: _controllerShowAnim!,
                child: toastWidget,
              ),
            ),
          ),
        ),
      );
    });
  }

  static Future<bool> hide() async {
    bool flag = false;
    if (_preToast != null) {
      flag = await _preToast!.dismiss();
    }
    return flag;
  }

  static isShowIng() {
    bool flag = false;
    if (_preToast != null) {
      flag = _preToast!.isShowing;
    }
    return flag;
  }
}

class BubbleToastView {
  final OverlayEntry overlayEntry;
  final AnimationController controllerShowAnim;
  final AnimationController controllerShowOffset;
  final OverlayState overlayState;
  bool dismissed = false;
  bool isShowing = false;

  BubbleToastView(this.overlayEntry, this.controllerShowAnim,
      this.controllerShowOffset, this.overlayState);

  _show(Duration duration) async {
    overlayState.insert(overlayEntry);
    controllerShowAnim.forward();
//		await Future.delayed(Duration(milliseconds: 300));
//		controllerShowOffset.forward();
    isShowing = true;
    await Future.delayed(duration);
    dismiss();
  }

  Future<bool> dismiss() async {
    if (dismissed) {
      return false;
    }
    dismissed = true;
    controllerShowAnim.reverse();
    await Future.delayed(const Duration(milliseconds: 300));
    overlayEntry.remove();
    isShowing = false;
    return true;
  }
}

class BubbleToastWidget extends StatelessWidget {
  final Widget? child;
  final Animation<double> opacityAnim1;
  final Animation<double> offsetAnim;

  const BubbleToastWidget({
    super.key,
    this.child,
    required this.offsetAnim,
    required this.opacityAnim1,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAnim1,
      child: child,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: opacityAnim1,
          child: AnimatedBuilder(
            animation: offsetAnim,
            builder: (BuildContext context, _) {
              return Transform.translate(
                offset: Offset(0, offsetAnim.value),
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}

class _BubbleBounceOutCurve extends Curve {
  const _BubbleBounceOutCurve._();

  @override
  double transform(double t) {
    t -= 1.0;
    return t * t * ((2 + 1) * t + 2) + 1.0;
  }
}

class BubbleToast extends StatelessWidget {
  final String? msg;
  final double width;
  final double height;
  final double arrHeight;
  final double arrAngle;
  final double radius;
  final double arrStartPosition;
  final BubbleArrowDirection position;

  // 边框颜色
  final Color? borderColor;
  final double borderWidth;
  final Widget? widget; //内容widget  与 msg互斥
  final Color? msgColor;
  final List<Color>? gradientColors;

  const BubbleToast(
      {super.key,
      this.msg,
      required this.width,
      required this.height,
      required this.arrHeight,
      required this.arrAngle,
      required this.radius,
      required this.arrStartPosition,
      required this.position,
      this.borderColor,
      required this.borderWidth,
      this.widget,
      this.msgColor,
      this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: BubbleWidget(
        width,
        height,
        const Color(0xffffffff),
        position,
        arrStartPosition: arrStartPosition,
        arrHeight: arrHeight,
        arrAngle: arrAngle,
        radius: radius,
        innerPadding: 10.0,
        borderColor: borderColor,
        strokeWidth: borderWidth,
        style: borderColor != null ? PaintingStyle.stroke : PaintingStyle.fill,
        gradientColors: gradientColors,
        child: widget ??
            Text(
              msg ?? '',
              style: TextStyle(
                color: msgColor ?? const Color(0xFF222222),
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
      ),
    );
  }

  static Widget builder(
      String? msg,
      double width,
      double height,
      BubbleArrowDirection position,
      double arrStartPosition,
      double arrHeight,
      double arrAngle,
      double radius,
      {Color? borderColor,
      required double borderWidth,
      Widget? widget,
      Color? msgColor,
      List<Color>? gradientColors}) {
    return BubbleToast(
      msg: msg,
      width: width,
      height: height,
      position: position,
      arrStartPosition: arrStartPosition,
      arrHeight: arrHeight,
      arrAngle: arrAngle,
      radius: radius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      widget: widget,
      msgColor: msgColor,
      gradientColors: gradientColors,
    );
  }
}
