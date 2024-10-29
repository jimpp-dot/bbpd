import 'dart:math';

import 'package:flutter/material.dart';

import '../shared.dart';

/// A Tinder-Like Widget.
class CustomFlipCards extends StatefulWidget {
  CardBuilder cardBuilder;
  AmassOrientation orientation;
  int totalNum;
  int stackNum;
  int animDuration;
  double swipeEdge;
  CardSwipeCompleteCallback? swipeCompleteCallback;
  CardDragUpdateCallback? swipeUpdateCallback;
  CardController? cardController;

  double maxWidth;
  double maxHeight;
  double minWidth;
  double minHeight;
  double bottomStackOffsetDx;
  double bottomStackOffsetDy;
  late List<Size> _cardSizes;
  late List<Offset> _cardOffsets;
  bool enableRightSwipe;
  bool nextAnimLeft;
  double? backCardAlpha;

  @override
  _CustomFlipCardsState createState() => _CustomFlipCardsState();

  /// Constructor requires Card Widget Builder [cardBuilder] & your card count [totalNum]
  /// , option includes: stack orientation [orientation], number of card display in same time [stackNum]
  /// , [swipeEdge] is the edge to determine action(recover or swipe) when you release your swiping card
  /// it is the value of alignment, 0.0 means middle, so it need bigger than zero.
  /// , and size control params;
  CustomFlipCards(
      {super.key,
      required this.cardBuilder,
      required this.totalNum,
      this.enableRightSwipe = true,
      this.nextAnimLeft = false,
      this.backCardAlpha,
      this.orientation = AmassOrientation.BOTTOM,
      this.stackNum = 3,
      this.animDuration = 350,
      this.swipeEdge = 30.0,
      required this.maxWidth,
      required this.maxHeight,
      required this.minWidth,
      required this.minHeight,
      this.bottomStackOffsetDx = 10.0,
      this.bottomStackOffsetDy = 16.0,
      this.cardController,
      this.swipeCompleteCallback,
      this.swipeUpdateCallback}) {
    double widthGap = maxWidth - minWidth;
    double heightGap = maxHeight - minHeight;

    _cardOffsets = [];
    _cardSizes = [];

    for (int i = 0; i < stackNum; i++) {
      _cardSizes.add(Size(minWidth + (widthGap / (stackNum - 1)) * i,
          minHeight + (heightGap / (stackNum - 1)) * i));
    }

    for (int i = 0; i < stackNum; i++) {
      switch (orientation) {
        case AmassOrientation.BOTTOM:
          double deltaY =
              _cardSizes[stackNum - 1].height - _cardSizes[i].height;
          Offset offset = Offset(bottomStackOffsetDx * (stackNum - i - 1),
              bottomStackOffsetDy * ((stackNum - i - 1)) + deltaY);
          _cardOffsets.add(offset);
          break;
        case AmassOrientation.COVER:
          double deltaY =
              _cardSizes[stackNum - 1].height - _cardSizes[i].height;
          Offset offset = Offset(10.0 * (stackNum - i - 1),
              1.0 * ((stackNum - i - 1)) + deltaY / 2);
          _cardOffsets.add(offset);
          break;
        default:
          break;
//        case AmassOrientation.TOP:
//          _cardAligns.add(Alignment(0.0, (-0.5 / (stackNum - 1)) * (stackNum - i)));
//          break;
//        case AmassOrientation.LEFT:
//          _cardAligns.add(Alignment((-0.5 / (stackNum - 1)) * (stackNum - i), 0.0));
//          break;
//        case AmassOrientation.RIGHT:
//          _cardAligns.add(Alignment((0.5 / (stackNum - 1)) * (stackNum - i), 0.0));
//          break;
      }
    }
  }
}

class _CustomFlipCardsState extends State<CustomFlipCards>
    with SingleTickerProviderStateMixin {
  Offset frontCardOffset = const Offset(0, 0);
  late AnimationController _animationController;
  int _currentFront = 0;

  /// 表示当前手指是否正在触摸
  bool _touching = false;

  /// 表示滑动偏移不够，正在回弹原位的过程中
  bool _recovering = false;

  Animation<Offset>? _frontOffsetAnimation;
  Animation<double>? _frontRotateAnimation;
  Animation<double>? _frontOpacityAnimation;
  Animation<double>? _frontNextAnimation;
  bool _isNextCardChanging = false;

  /// realIndex代表从底往上数，在整个虚拟叠层中的序号
  Widget _buildCard(BuildContext context, int realIndex) {
    if (realIndex < 0) {
      return Container();
    }

    /// 此处index代码可见叠层的序号，从底往上数
    int index = realIndex - _currentFront;
    Log.d('_FlipCardsState._buildCard realIndex = $realIndex, index = $index');

    if (index == widget.stackNum - 1) {
      //如果是可见的最上面一层
      double start;
      if (_isNextCardChanging) {
        start = _frontNextAnimation!.value;
      } else {
        start = _animationController.status == AnimationStatus.forward
            ? _frontOffsetAnimation!.value.dx
            : frontCardOffset.dx;
      }
      double top;
      if (_isNextCardChanging) {
        top = 0;
      } else {
        top = _animationController.status == AnimationStatus.forward
            ? _frontOffsetAnimation!.value.dy
            : frontCardOffset.dy;
      }
      double rotate;
      if (_isNextCardChanging) {
        rotate = _calcRotationByDx(_frontNextAnimation!.value);
      } else {
        rotate = _animationController.status == AnimationStatus.forward
            ? _frontRotateAnimation!.value
            : _calcRotationByDx(frontCardOffset.dx);
      }
      return PositionedDirectional(
        start: start,
        top: top,
        child: Transform.rotate(
            angle: (pi / 180.0) * (rotate),
            child: SizedBox.fromSize(
              size: widget._cardSizes[index],
              child: Opacity(
                opacity: _animationController.status == AnimationStatus.forward
                    ? _frontOpacityAnimation!.value
                    : 1.0,
                child: GestureDetector(
                  onPanDown: (DragDownDetails details) {
                    _touching = true;
                  },
                  onPanUpdate: (DragUpdateDetails details) {
                    setState(() {
                      frontCardOffset += details.delta;

                      if (widget.swipeUpdateCallback != null) {
                        widget.swipeUpdateCallback!(
                            details,
                            Alignment(frontCardOffset.dx, frontCardOffset.dy),
                            widget.totalNum - widget.stackNum - _currentFront);
                      }
                    });
                  },
                  onPanEnd: (DragEndDetails details) {
                    _touching = false;

                    _recovering = frontCardOffset.dx.abs() < widget.swipeEdge ||
                        (!widget.enableRightSwipe && frontCardOffset.dx > 0);

                    _frontOffsetAnimation = CardAnimation.frontCardOffset(
                        _animationController,
                        frontCardOffset,
                        widget._cardOffsets[widget.stackNum - 1],
                        widget.swipeEdge,
                        widget.enableRightSwipe);
                    _frontRotateAnimation = CardAnimation.frontCardRota(
                        _animationController,
                        _calcRotationByDx(frontCardOffset.dx),
                        _recovering);
                    _frontOpacityAnimation = CardAnimation.frontCardOpacity(
                        _animationController, _recovering);

                    int duration = _calcAnimDuration(details);
                    _animationController.duration =
                        Duration(milliseconds: duration);
                    animateCards(0);
                  },
                  child: widget.cardBuilder(context,
                      widget.totalNum - realIndex - 1, true, _onNextCard),
                ),
              ),
            )),
      );
    }

    double start = _animationController.status == AnimationStatus.forward
        ? CardAnimation.backCardOffset(_animationController,
                widget._cardOffsets[index], widget._cardOffsets[index + 1])
            .value
            .dx
        : widget._cardOffsets[index].dx;
    double top = _animationController.status == AnimationStatus.forward
        ? CardAnimation.backCardOffset(_animationController,
                widget._cardOffsets[index], widget._cardOffsets[index + 1])
            .value
            .dy
        : widget._cardOffsets[index].dy;
    return PositionedDirectional(
      start: start,
      top: top,
      child: SizedBox.fromSize(
        size: _animationController.status == AnimationStatus.forward
            /*&&
                (frontCardAlign.x > 3.0 || frontCardAlign.x < -3.0)*/
            ? CardAnimation.backCardSize(_animationController,
                    widget._cardSizes[index], widget._cardSizes[index + 1])
                .value
            : widget._cardSizes[index],
        child: Opacity(
            opacity: _touching ||
                    _animationController.status == AnimationStatus.forward
                ? 1.0
                : (widget.backCardAlpha ?? 0.7),
            child: widget.cardBuilder(
                context, widget.totalNum - realIndex - 1, false, null)),
      ),
    );
  }

  void _onNextCard() {
    if (_isNextCardChanging) return;

    _frontNextAnimation =
        CardAnimation.frontCardNext(_animationController, widget.nextAnimLeft);
    _frontOpacityAnimation =
        CardAnimation.frontCardOpacity(_animationController, false);
    _isNextCardChanging = true;
    animateCards(0);
  }

  double _calcRotationByDx(double dx) {
    return dx / 20.0;
  }

  List<Widget> _buildCards(BuildContext context) {
    List<Widget> cards = [];
    for (int i = _currentFront; i < _currentFront + widget.stackNum; i++) {
      cards.add(_buildCard(context, i));
    }

    return cards;
  }

  int _calcAnimDuration(DragEndDetails details) {
    Offset velocity = details.velocity.pixelsPerSecond;
    double speed;
    if (velocity.dx.abs() > velocity.dy.abs()) {
      speed = velocity.dx.abs();
    } else {
      speed = velocity.dy.abs();
    }
    int duration = speed > 0.0 ? 500000 ~/ speed : widget.animDuration;
    duration = duration > widget.animDuration ? widget.animDuration : duration;
    Log.d('_FlipCardsState._buildCards speed = $speed, duration = $duration');
    return duration;
  }

  animateCards(int trigger) {
    if (_animationController.isAnimating ||
        _currentFront + widget.stackNum == 0) {
      return;
    }
    _animationController.stop();
    _animationController.value = 0.0;
    _animationController.forward();
  }

  void triggerSwap(int trigger) {
    animateCards(trigger);
  }

  @override
  void didUpdateWidget(CustomFlipCards oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.totalNum != widget.totalNum) {
      _currentFront = widget.totalNum - widget.stackNum;
      Log.d(
          '_CustomFlipCardsState.didUpdateWidget _currentFront = $_currentFront');
    }
  }

  @override
  void initState() {
    super.initState();
    _currentFront = widget.totalNum - widget.stackNum;

    frontCardOffset = widget._cardOffsets[widget.stackNum - 1];
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.animDuration));
    _animationController.addListener(() {
      if (mounted) setState(() {});
    });
    _animationController.addStatusListener((AnimationStatus status) {
      if (!mounted) return;
      int index = widget.totalNum - widget.stackNum - _currentFront;
      if (status == AnimationStatus.completed) {
        if (_isNextCardChanging) {
          _isNextCardChanging = false;

          if (widget.swipeCompleteCallback != null) {
            widget.swipeCompleteCallback!(
                CardSwipeOrientation.CLICK_NEXT, index);
          }
          changeCardOrder();
        } else if ((frontCardOffset.dx < widget.swipeEdge &&
                frontCardOffset.dx > -widget.swipeEdge) ||
            (!widget.enableRightSwipe && frontCardOffset.dx > 0)) {
          Offset lastFontCardOffset =
              Offset(frontCardOffset.dx, frontCardOffset.dy);
          frontCardOffset = widget._cardOffsets[widget.stackNum - 1];

          if (widget.swipeCompleteCallback != null) {
            bool rightSwipeDisabledRecover = !widget.enableRightSwipe &&
                lastFontCardOffset.dx > widget.swipeEdge;
            widget.swipeCompleteCallback!(
                rightSwipeDisabledRecover
                    ? CardSwipeOrientation.RIGHT_DISABLED_RECOVER
                    : CardSwipeOrientation.RECOVER,
                index);
          }
        } else {
          if (widget.swipeCompleteCallback != null) {
            widget.swipeCompleteCallback!(
                frontCardOffset.dx < 0
                    ? CardSwipeOrientation.LEFT
                    : CardSwipeOrientation.RIGHT,
                index);
          }

          changeCardOrder();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.cardController?.addListener((trigger) => triggerSwap(trigger));

    return Stack(
      clipBehavior: Clip.none,
      children: _buildCards(context),
    );
  }

  changeCardOrder() {
    setState(() {
      _currentFront--;
      Log.d(
          '_CustomFlipCardsState.changeCardOrder _currentFront = $_currentFront');
      frontCardOffset = widget._cardOffsets[widget.stackNum - 1];
    });
  }
}

typedef CardBuilder = Widget Function(
    BuildContext context, int index, bool isTop, VoidCallback? onNext);

enum CardSwipeOrientation {
  LEFT,
  RIGHT,
  RECOVER,
  CLICK_NEXT,
  RIGHT_DISABLED_RECOVER
}

/// swipe card to [CardSwipeOrientation.LEFT] or [CardSwipeOrientation.RIGHT]
/// , [CardSwipeOrientation.RECOVER] means back to start.
typedef CardSwipeCompleteCallback = void Function(
    CardSwipeOrientation orientation, int index);

/// [DragUpdateDetails] of swiping card.
typedef CardDragUpdateCallback = void Function(
    DragUpdateDetails details, Alignment align, int index);

enum AmassOrientation { TOP, BOTTOM, COVER, LEFT, RIGHT }

class CardAnimation {
  static Animation<Offset> frontCardOffset(
      AnimationController controller,
      Offset beginOffset,
      Offset baseOffset,
      double swipeEdge,
      bool enableRightSwipe) {
    double endX, endY;
    bool recovering = false;
    if (beginOffset.dx.abs() < swipeEdge ||
        (!enableRightSwipe && beginOffset.dx > 0)) {
      recovering = true;
    }
    if (!recovering) {
      endX = beginOffset.dx > 0
          ? (beginOffset.dx > swipeEdge ? beginOffset.dx + 50 : baseOffset.dx)
          : (beginOffset.dx < -swipeEdge
              ? beginOffset.dx - 50.0
              : baseOffset.dx);
      endY = beginOffset.dy > 0
          ? (beginOffset.dy > swipeEdge ? beginOffset.dy + 50 : baseOffset.dy)
          : (beginOffset.dy < -swipeEdge
              ? beginOffset.dy - 50.0
              : baseOffset.dy);
    } else {
      endX = baseOffset.dx;
      endY = baseOffset.dy;
    }
    return OffsetTween(begin: beginOffset, end: Offset(endX, endY))
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<Offset> backCardOffset(
      AnimationController controller, Offset beginOffset, Offset endOffset) {
    return OffsetTween(begin: beginOffset, end: endOffset)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<double> frontCardRota(
      AnimationController controller, double beginRot, bool recovering) {
    return Tween<double>(begin: beginRot, end: recovering ? 0 : beginRot * 1.1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<double> frontCardOpacity(
      AnimationController controller, bool recovering) {
    return Tween<double>(begin: 1.0, end: recovering ? 1.0 : 0.8)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<double> frontCardNext(
      AnimationController controller, bool nextAnimLeft) {
    return Tween<double>(begin: 0.0, end: nextAnimLeft ? -200 : 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<Size?> backCardSize(
      AnimationController controller, Size beginSize, Size endSize) {
    return SizeTween(begin: beginSize, end: endSize)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }
}

class OffsetTween extends Tween<Offset> {
  /// Creates a fractional offset tween.
  ///
  /// The [begin] and [end] properties may be null; the null value
  /// is treated as meaning the center.
  OffsetTween({super.begin, super.end});

  /// Returns the value this variable has at the given animation clock value.
  @override
  Offset lerp(double t) => Offset.lerp(begin, end, t) ?? Offset.zero;
}

typedef TriggerListener = void Function(int trigger);

class CardController {
  TriggerListener? _listener;

  void triggerLeft() {
    if (_listener != null) {
      _listener!(-1);
    }
  }

  void triggerRight() {
    if (_listener != null) {
      _listener!(1);
    }
  }

  void addListener(listener) {
    _listener = listener;
  }

  void removeListener() {
    _listener = null;
  }
}
