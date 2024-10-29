library draggable_widget;

import 'dart:math';

import 'package:flutter/material.dart';

enum DragDirection {
  all,
  vertical,
  horizontal,
}

enum DragStatus {
  onDragStart,
  onDragging,
  onDragEnd,
}

typedef DragCallback = void Function(DragStatus status, Offset location);

class DraggableWidget extends StatefulWidget {
  /// The widget that will be displayed as dragging widget
  final Widget child;

  /// The horizontal padding around the widget
  final double horizontalSpace;

  /// The vertical padding around the widget
  final double verticalSpace;

  /// Intial location of the widget
  final Offset initialPosition;

  /// Intially should the widget be visible or not, default to [true]
  final bool intialVisibility;

  /// The top bottom pargin to create the bottom boundary for the widget, for example if you have a [BottomNavigationBar],
  /// then you may need to set the bottom boundary so that the draggable button can't get on top of the [BottomNavigationBar]
  final double bottomMargin;

  /// The top bottom pargin to create the top boundary for the widget, for example if you have a [AppBar],
  /// then you may need to set the bottom boundary so that the draggable button can't get on top of the [AppBar]
  final double topMargin;

  /// Shadow's border radius for the draggable widget, default to 10
  final double shadowBorderRadius;

  /// A drag controller to show/hide or move the widget around the screen
  final DraggableController? dragController;

  /// [BoxShadow] when the widget is not being dragged, default to
  /// ```Dart
  ///const BoxShadow(
  ///     color: Colors.black38,
  ///    offset: Offset(0, 4),
  ///    blurRadius: 2,
  ///  ),
  /// ```

  final List<BoxShadow>? normalShadow;

  /// [BoxShadow] when the widget is being dragged
  ///```Dart
  ///const BoxShadow(
  ///     color: Colors.black38,
  ///    offset: Offset(0, 10),
  ///    blurRadius: 10,
  ///  ),
  /// ```
  final List<BoxShadow>? draggingShadow;

  /// How much should the [DraggableWidget] be scaled when it is being dragged, default to 1.1
  final double dragAnimationScale;

  /// Touch Delay Duration. Default value is zero. When set, drag operations will trigger after the duration.
  final Duration touchDelay;

  final DragDirection dragDirection;

  final DragCallback? dragCallback;

  const DraggableWidget({
    Key? key,
    required this.child,
    this.horizontalSpace = 0,
    this.verticalSpace = 0,
    this.initialPosition = const Offset(0, 0),
    this.intialVisibility = true,
    this.bottomMargin = 0,
    this.topMargin = 0,
    this.shadowBorderRadius = 10,
    this.dragController,
    this.dragAnimationScale = 1,
    this.touchDelay = Duration.zero,
    this.normalShadow,
    this.draggingShadow,
    this.dragDirection = DragDirection.all,
    this.dragCallback,
  })  : assert(horizontalSpace >= 0),
        assert(verticalSpace >= 0),
        assert(bottomMargin >= 0),
        super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget>
    with SingleTickerProviderStateMixin {
  double top = 0, left = 0;
  double boundary = 0;
  late AnimationController animationController;
  late Animation animation;
  double hardLeft = 0, hardTop = 0;
  bool offstage = true;

  double widgetHeight = 18;
  double widgetWidth = 50;

  final key = GlobalKey();

  bool dragging = false;

  late Offset currentlyDocked;

  bool? visible;

  bool get currentVisibility => visible ?? widget.intialVisibility;

  bool isStillTouching = false;

  @override
  void initState() {
    currentlyDocked = widget.initialPosition;
    hardTop = widget.topMargin;
    animationController = AnimationController(
      value: 1,
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )
      ..addListener(() {
        animateWidget(currentlyDocked);
      })
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            hardLeft = left;
            hardTop = top;
          }
        },
      );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    widget.dragController?._addState(this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (!mounted) return;
      final widgetSize = getWidgetSize(key);
      if (widgetSize != null) {
        setState(() {
          widgetHeight = widgetSize.height;
          widgetWidth = widgetSize.width;
        });
      }

      await Future.delayed(const Duration(milliseconds: 100));
      if (!mounted) return;
      setState(() {
        offstage = false;
        boundary = MediaQuery.of(context).size.height - widget.bottomMargin;
        left = widget.initialPosition.dx;
        top = widget.initialPosition.dy;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DraggableWidget oldWidget) {
    if (offstage == false) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (!mounted) return;
        final widgetSize = getWidgetSize(key);
        if (widgetSize != null) {
          setState(() {
            widgetHeight = widgetSize.height;
            widgetWidth = widgetSize.width;
          });
        }
        setState(() {
          boundary = MediaQuery.of(context).size.height - widget.bottomMargin;
          animateWidget(currentlyDocked);
        });
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double finalTop = top;
    double finalStart = left;
    if (widget.dragDirection == DragDirection.vertical) {
      finalStart = widget.initialPosition.dx;
    } else if (widget.dragDirection == DragDirection.horizontal) {
      finalTop = widget.initialPosition.dy;
    }

    return PositionedDirectional(
      top: finalTop,
      start: finalStart,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: !currentVisibility
            ? Container()
            : GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanEnd: (v) {
                  if (!isStillTouching) {
                    return;
                  }
                  isStillTouching = false;

                  setState(() {
                    dragging = false;
                  });
                  if (animationController.isAnimating) {
                    animationController.stop();
                  }
                  animationController.reset();
                  animationController.forward();
                  widget.dragCallback
                      ?.call(DragStatus.onDragEnd, Offset(left, top));
                },
                onPanDown: (v) async {
                  isStillTouching = false;
                  await Future.delayed(widget.touchDelay);
                  isStillTouching = true;
                  widget.dragCallback
                      ?.call(DragStatus.onDragStart, Offset(left, top));
                },
                onPanUpdate: (v) async {
                  if (!isStillTouching) {
                    return;
                  }
                  if (animationController.isAnimating) {
                    animationController.stop();
                    animationController.reset();
                  }

                  setState(() {
                    dragging = true;
                    if (v.globalPosition.dy < boundary &&
                        v.globalPosition.dy > widget.topMargin) {
                      top = max(v.globalPosition.dy - (widgetHeight) / 2, 0);
                    }
                    if (top < widget.topMargin) {
                      top = widget.topMargin;
                    }
                    final double totalWidth = MediaQuery.of(context).size.width;
                    left = max(v.globalPosition.dx - (widgetWidth) / 2, 0);
                    if (left > (totalWidth - widgetWidth)) {
                      left = totalWidth - widgetWidth;
                    }

                    hardLeft = left;
                    hardTop = top;
                    currentlyDocked = Offset(left, top);
                  });
                  widget.dragCallback
                      ?.call(DragStatus.onDragging, Offset(left, top));
                },
                child: Offstage(
                  offstage: offstage,
                  child: Container(
                    key: key,
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.horizontalSpace,
                      vertical: widget.verticalSpace,
                    ),
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(widget.shadowBorderRadius),
                          boxShadow: dragging
                              ? widget.draggingShadow
                              : widget.normalShadow,
                        ),
                        child: Transform.scale(
                            scale: dragging ? widget.dragAnimationScale : 1,
                            child: widget.child)),
                  ),
                ),
              ),
      ),
    );
  }

  void animateWidget(Offset docker) {
    setState(() {
      left = docker.dx;
      top = docker.dy;
      currentlyDocked = docker;
    });
  }

  Size? getWidgetSize(GlobalKey key) {
    final keyContext = key.currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      return box.size;
    } else {
      return null;
    }
  }

  void _showWidget() {
    setState(() {
      visible = true;
    });
  }

  void _hideWidget() {
    setState(() {
      visible = false;
    });
  }

  void _animateTo(Offset anchoringPosition) {
    if (animationController.isAnimating) {
      animationController.stop();
    }
    animationController.reset();
    currentlyDocked = anchoringPosition;
    animationController.forward();
  }

  Offset _getCurrentPosition() {
    return Offset(left, top);
  }
}

class DraggableController {
  _DraggableWidgetState? _widgetState;

  void _addState(_DraggableWidgetState widgetState) {
    _widgetState = widgetState;
  }

  /// Jump to any [AnchoringPosition] programatically
  void jumpTo(Offset anchoringPosition) {
    _widgetState?._animateTo(anchoringPosition);
  }

  /// Get the current screen [Offset] of the widget
  Offset? getCurrentPosition() {
    return _widgetState?._getCurrentPosition();
  }

  /// Makes the widget visible
  void showWidget() {
    _widgetState?._showWidget();
  }

  /// Hide the widget
  void hideWidget() {
    _widgetState?._hideWidget();
  }
}
