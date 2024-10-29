import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 可拖动Overlay组件，交互参考[TopLiveTool]
class DraggableOverlay extends StatefulWidget {
  final double width;
  final double height;
  final Widget? child;
  final VoidCallback onCloseTap;
  final VoidCallback? onChildTap;

  const DraggableOverlay(
      {super.key,
      this.width = 60,
      this.height = 60,
      this.child,
      required this.onCloseTap,
      this.onChildTap});

  static OverlayEntry? show({
    Widget? child,
    VoidCallback? onChildTap,
    GlobalKey<DraggableOverlayState>? overlayKey,
    double width = 60,
    double height = 60,
  }) {
    var overlayState = Overlay.of(System.context);

    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return DraggableOverlay(
        key: overlayKey,
        onChildTap: onChildTap,
        width: width,
        height: height,
        onCloseTap: () {
          DraggableOverlay.hide(
              overlayEntry: overlayEntry, overlayKey: overlayKey);
        },
        child: child,
      );
    });
    overlayState.insert(overlayEntry);

    return overlayEntry;
  }

  static void hide(
      {OverlayEntry? overlayEntry,
      GlobalKey<DraggableOverlayState>? overlayKey,
      bool showAnimation = true}) {
    if (showAnimation &&
        overlayKey != null &&
        overlayKey.currentState != null) {
      overlayKey.currentState?.hideWithAnimation(() {
        overlayEntry?.remove();
        overlayEntry = null;
        overlayKey = null;
      });
    } else {
      overlayEntry?.remove();
      overlayEntry = null;
      overlayKey = null;
    }
  }

  @override
  DraggableOverlayState createState() => DraggableOverlayState();
}

class DraggableOverlayState extends State<DraggableOverlay>
    with TickerProviderStateMixin<DraggableOverlay> {
  double _width = 69.0;
  double _height = 69.0;

  late double _minTop;
  late double _maxTop;
  late double _minLeft;
  late double _maxLeft;

  late double _left;
  late double _top;

  static double? lastLeft;
  static double? lastTop;

  double _dx = 0.0;
  double _dy = 0.0;

  double _startX = 0.0;
  double _startY = 0.0;

  final double _maxWidth = Util.width;
  final double _maxHeight = Util.height - Util.iphoneXBottom;

  bool _moved = false;
  Animation<Offset>? _positionAnimation;
  AnimationController? _positionAnimationController;

  late Animation<double> _fadeAnimation;
  late AnimationController _fadeAnimationController;
  Duration longAnimationDuration = const Duration(milliseconds: 800);
  Duration shortAnimationDuration = const Duration(milliseconds: 150);

  double get defaultLeft => Util.width - 69 - 8;

  double get defaultTop => Util.height - 69 - 182;

  @override
  void initState() {
    super.initState();
    Log.d('DraggableOverlay init state...');

    _width = widget.width;
    _height = widget.height;
    _left = (lastLeft ?? defaultLeft);
    _top = (lastTop ?? defaultTop);
    _minLeft = 8.0;
    _maxLeft = _maxWidth - _width - _minLeft;

    double minTop = 48.0;
    if (Util.isIphoneX) {
      minTop += 44.0;
    }
    if (_top < minTop) {
      _top = minTop;
    }
    _minTop = minTop;
    _maxTop = _maxHeight - _height;

    eventCenter.addListener(EventConstant.EventLogout, _onLogout);

    _fadeAnimationController =
        AnimationController(duration: longAnimationDuration, vsync: this);
    _fadeAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: 1.0), weight: 300),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.0, end: 1.0), weight: 800.0 - 300),
    ]).animate(_fadeAnimationController);
    _fadeAnimation.addListener(onAnimation);
    _fadeAnimationController.reset();
    _fadeAnimationController.forward();

    _checkPosition();
  }

  void onAnimation() {
    if (mounted) setState(() {});
  }

  void hideWithAnimation(VoidCallback? onAnimationFinished) {
    _fadeAnimationController.duration = shortAnimationDuration;
    _fadeAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_fadeAnimationController);
    _fadeAnimation.addListener(onAnimation);
    _fadeAnimationController.addStatusListener((status) {
      // Log.d('In hideWithAnimation, status: $status');
      if (status == AnimationStatus.completed && onAnimationFinished != null) {
        onAnimationFinished();
      }
    });
    _fadeAnimationController.reset();
    _fadeAnimationController.forward();
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);

    _fadeAnimation.removeListener(onAnimation);
    _fadeAnimationController.dispose();

    _positionAnimation?.removeListener(onAnimation);
    _positionAnimation = null;
    _positionAnimationController?.dispose();
    super.dispose();
  }

  _onLogout(String type, dynamic value) => _close();

  void _onPointerDown(PointerDownEvent event) {
    _startX = event.position.dx;
    _startY = event.position.dy;
    // Log.d('DraggableOverlay onPointerDown, _startX=$_startX, _startY=$_startY');
    _moved = false;
  }

  void _onPointerMove(PointerMoveEvent event) {
    // Log.d('DraggableOverlay onPointerMove, dx=${event.position.dx}, dy=${event.position.dy}');

    double dx = event.position.dx - _startX;
    double dy = event.position.dy - _startY;

    _moved = sqrt(dx * dx + dy * dy) > 3.0;

    if (mounted) {
      _dx = dx;
      _dy = dy;
      lastLeft = _left + _dx;
      lastTop = _top + _dy;

      setState(() {});
    }
  }

  void _checkPosition() {
    double dx = 0;
    double dy = 0;

    Rect curRect = Rect.fromLTRB(_left, _top, _left + _width, _top + _height);

    Offset friendsPlayingOffset = Offset(Util.width, Util.height);
    Rect disallowedRect = Rect.fromLTRB(friendsPlayingOffset.dx,
        friendsPlayingOffset.dy, Util.width, Util.height);
    if (disallowedRect.overlaps(curRect)) {
      Offset curCenter = Offset(_left + (_width / 2.0), _top + (_height / 2.0));
      Offset disallowedCenter = disallowedRect.center;

      Offset topCenter = disallowedCenter.translate(
          0, -(_height / 2.0) - (disallowedRect.height / 2.0) - 5);
      Offset leftCenter = disallowedCenter.translate(
          -(_width / 2.0) - (disallowedRect.width / 2.0) - 5, 0);

      double topDx = topCenter.dx - curCenter.dx;
      double topDy = topCenter.dy - curCenter.dy;

      double leftDx = leftCenter.dx - curCenter.dx;
      double leftDy = leftCenter.dy - curCenter.dy;

      double topDis = topDx * topDx + topDy * topDy;
      double leftDis = leftDx * leftDx + leftDy * leftDy;

      if (topDis > leftDis) {
        dx = leftDx;
        if (_top < _minTop) {
          dy = _minTop - _top;
        } else if (_top > _maxTop) {
          dy = _maxTop - _top;
        }
      } else {
        dy = topDy;
        if (_left < _minLeft) {
          dx = _minLeft - _left;
        } else if (_left > _maxLeft) {
          dx = _maxLeft - _left;
        }
      }
    } else {
      if (_left < (_maxWidth / 2 - _width / 2)) {
        dx = _minLeft - _left;
      } else {
        dx = _maxLeft - _left;
      }

      if (_top < _minTop) {
        dy = _minTop - _top;
      } else if (_top > _maxTop) {
        dy = _maxTop - _top;
      }
    }

    // Log.d('Pointer up, dx:$dx, _dx:$_dx, _left:$_left, _maxLeft: $_maxLeft');

    if (dx != 0 || dy != 0) {
      _positionAnimationController =
          AnimationController(duration: shortAnimationDuration, vsync: this);
      _positionAnimation = _positionAnimationController!
          .drive(Tween<Offset>(begin: Offset(_dx, _dy), end: Offset(dx, dy)))
        ..addListener(onAnimation)
        ..addStatusListener((status) {
          // Log.d('Position Animation status changed: $status');
          if (status == AnimationStatus.completed && mounted) {
            setState(() {
              _dx = 0;
              _left = _left + dx;
              lastLeft = _left;

              _dy = 0;
              _top = _top + dy;
              lastTop = _top;

              _moved = false;
              _positionAnimation = null;
            });
          }
        });
      _positionAnimationController?.forward();
    } else {
      _moved = false;
    }
  }

  void _onPointerUp(PointerUpEvent event) {
    Log.d('DraggableOverlay onPointerUp, _moved=$_moved');
    _cancel(event);
    if (_moved == false) {
      if (widget.onChildTap != null) widget.onChildTap!();
    } else {
      _checkPosition();
    }
  }

  void _onPointerCancel(PointerCancelEvent event) {
    _moved = false;
    _cancel(event);
  }

  void _cancel(PointerEvent event) {
    _left += _dx;
    _top += _dy;
    _dx = 0.0;
    _dy = 0.0;
  }

  _close() => widget.onCloseTap();

  @override
  Widget build(BuildContext context) {
    _minTop =
        MediaQuery.of(context).padding.top + (Util.isIphoneX ? 44.0 : 0.0);

    double xOffset = _positionAnimation?.value.dx ?? 0;
    double yOffset = _positionAnimation?.value.dy ?? 0;

    return PositionedDirectional(
      start: _left + _dx + xOffset,
      top: _top + _dy + yOffset,
      width: _width,
      height: _height,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: [
          Listener(
            onPointerDown: _onPointerDown,
            onPointerMove: _onPointerMove,
            onPointerUp: _onPointerUp,
            onPointerCancel: _onPointerCancel,
            behavior: HitTestBehavior.opaque,
            child: widget.child ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
