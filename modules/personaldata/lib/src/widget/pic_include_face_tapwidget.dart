import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/widget/pic_include_face_bubble.dart';
import 'package:shared/shared.dart';
import 'dart:math';

class PicIncludeFaceTap extends StatefulWidget {
  final Widget child; //自身样式
  final double bubbleWidth;
  final double bubbleHeight;
  final double arrowHeight;
  final int arrowAngle;
  final Widget bubbleChild; //弹出的气泡的内容
  final double bubbleRadius;
  final int duration; //seconds

  const PicIncludeFaceTap({
    super.key,
    required this.child,
    required this.bubbleChild,
    this.bubbleWidth = 123.0, //箭头向左右时 宽度包含箭头宽度
    this.bubbleHeight = 34.0, //箭头向上下时 高度包含箭头高度
    this.duration = 3,
    this.arrowHeight = 6.0,
    this.arrowAngle = 70, // 箭头角度 0-180之间
    this.bubbleRadius = 8.0,
  });

  @override
  _PicIncludeFaceTapState createState() {
    return _PicIncludeFaceTapState();
  }
}

class _PicIncludeFaceTapState extends State<PicIncludeFaceTap>
    with SingleTickerProviderStateMixin {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      child: widget.child ?? Container(),
      onTap: () {
        _showBubble(
          context,
          widgetKey: _key,
          duration: widget.duration,
          child: widget.bubbleChild ?? Container(),
          bubbleWidth: widget.bubbleWidth,
          bubbleHeight: widget.bubbleHeight,
          arrowHeight: widget.arrowHeight,
          arrowAngle: widget.arrowAngle,
          bubbleRadius: widget.bubbleRadius,
        );
      },
    );
  }
}

void _showBubble(BuildContext context,
    {required GlobalKey widgetKey,
    required int duration,
    required Widget child,
    required double bubbleWidth,
    required double bubbleHeight,
    required double arrowHeight,
    required int arrowAngle,
    double bubbleRadius = 0}) {
  RenderBox? box = widgetKey.currentContext!.findRenderObject() as RenderBox?;
  Offset offset = box?.localToGlobal(Offset.zero) ?? Offset.zero;

  //获取点击控件的size
  Size size = box?.size ?? Size.zero;

  // Log.d('PicIncludeFaceTap=======offset:${offset} size:${size}');

  double bubbleStart = 0.0;
  double defaultBubbleLeftMargin = 5.0;
  double defaultBubblerightMargin = 5.0;

  //尖角三角形底部宽度
  double trangleBottomWidth =
      arrowHeight * tan(arrowAngle * 0.5 * pi / 180) * 2;
  double arrowLengthDelta = bubbleRadius + trangleBottomWidth / 2;

  double arrowLength = bubbleWidth / 2 - arrowLengthDelta;
  double selfMidToLeft = size.width / 2 + offset.dx;
  double selfMidToRight = Util.width - selfMidToLeft;

  Alignment scaleTransitionAlignment = Alignment.bottomCenter;

  if (selfMidToLeft >= bubbleWidth / 2 && selfMidToRight >= bubbleWidth / 2) {
    bubbleStart = selfMidToLeft - bubbleWidth / 2;
  } else if (selfMidToLeft < bubbleWidth / 2) {
    bubbleStart = defaultBubbleLeftMargin;
    arrowLength = bubbleWidth +
        defaultBubbleLeftMargin -
        selfMidToLeft -
        arrowLengthDelta;
    scaleTransitionAlignment = Alignment(
        (bubbleWidth - arrowLength - trangleBottomWidth) * 2.0 / bubbleWidth -
            1.0,
        1.0);
  } else if (selfMidToRight < bubbleWidth / 2) {
    bubbleStart = Util.width - bubbleWidth - defaultBubblerightMargin;
    arrowLength = selfMidToRight - defaultBubblerightMargin - arrowLengthDelta;
    scaleTransitionAlignment = Alignment(
        (bubbleWidth - arrowLength - trangleBottomWidth) * 2.0 / bubbleWidth -
            1.0,
        1.0);
  }

  // Log.d('scaleTransitionAlignment' + '$scaleTransitionAlignment');

  Navigator.push(
      context,
      PicIncludeFacePopRoute(
        child: PicIncludeFacePopup(
          duration: duration,
          padding: EdgeInsetsDirectional.only(
            start: bubbleStart,
            top: offset.dy - bubbleHeight,
          ),
          scaleTransitionAlignment: scaleTransitionAlignment,
          child: PicIncludeFaceBubbleWidget(
            bubbleWidth,
            bubbleHeight,
            R.color.mainBrandColor,
            PicIncludeFaceBubbleArrowDirection.bottom,
            length: arrowLength,
            arrHeight: arrowHeight,
            arrAngle: arrowAngle,
            radius: bubbleRadius,
            child: child ?? Container(),
          ),
        ),
      ));
}
