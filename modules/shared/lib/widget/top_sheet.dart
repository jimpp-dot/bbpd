// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class TopSheet extends StatefulWidget {
  static const EVENT_POP = "event.topsheet.pop.close";

  final TopSheetDirection direction;
  final Color? backgroundColor;
  final Widget child;
  final double? transFormHeight;
  final bool transparentBg;
  final int animationMilliseconds;
  final bool topSafe;

  const TopSheet({
    Key? key,
    required this.child,
    this.direction = TopSheetDirection.BOTTOM,
    this.backgroundColor,
    this.transFormHeight,
    this.transparentBg = false,
    this.animationMilliseconds = 200,
    this.topSafe = true,
  }) : super(key: key);

  @override
  _TopSheetState createState() => _TopSheetState();

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    Decoration? decoration,
    double? transFormHeight,
    topSafe = true,
    direction = TopSheetDirection.BOTTOM,
    backgroundColor = const Color(0xb3212121),
    transparentBg = false,
    animationMilliseconds = 200,
  }) {
    return Navigator.push<T>(
      context,
      TopSheetPageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return TopSheet(
            direction: direction,
            backgroundColor: backgroundColor,
            transFormHeight: transFormHeight,
            transparentBg: transparentBg,
            animationMilliseconds: animationMilliseconds,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: decoration ??
                    BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(16)),
                      color: Colors.black.withOpacity(0.8),
                    ),
                child: SafeArea(
                  bottom: false,
                  top: topSafe,
                  child: child,
                ),
              ),
            ),
          );
        },
        opaque: false,
      ),
    );
  }
}

class _TopSheetState extends State<TopSheet> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;
  late AnimationController _animationController;

  final GlobalKey globalKey = GlobalKey();

  final _childKey = GlobalKey();

  double? get _childHeight {
    if (_childKey.currentContext?.findRenderObject() == null) return null;

    final RenderBox renderBox =
        _childKey.currentContext?.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  bool get _dismissUnderway =>
      _animationController.status == AnimationStatus.reverse;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.animationMilliseconds));

    _animation = Tween<double>(begin: _isDirectionTop ? -1 : 1, end: 0)
        .animate(_animationController);

    _opacityAnimation =
        Tween<double>(begin: 0, end: 0.7).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) Navigator.pop(context);
    });

    _animationController.forward();
    eventCenter.addListener(TopSheet.EVENT_POP, _onPop);
  }

  @override
  void dispose() {
    _animationController.dispose();
    eventCenter.removeListener(TopSheet.EVENT_POP, _onPop);
    super.dispose();
  }

  _onPop(String type, dynamic data) {
    _animationController.reverse();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_dismissUnderway || details.primaryDelta == null) return;

    var change =
        details.primaryDelta! / (_childHeight ?? details.primaryDelta!);
    if (_isDirectionTop) {
      _animationController.value += change;
    } else {
      _animationController.value -= change;
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway) return;

    if (details.velocity.pixelsPerSecond.dy > 0 && _isDirectionTop) return;
    if (details.velocity.pixelsPerSecond.dy < 0 && !_isDirectionTop) return;

    if (details.velocity.pixelsPerSecond.dy > 700) {
      final double flingVelocity =
          -details.velocity.pixelsPerSecond.dy / (_childHeight ?? 1);
      if (_animationController.value > 0.0)
        _animationController.fling(velocity: flingVelocity);
    } else if (_animationController.value < 0.5) {
      if (_animationController.value > 0.0)
        _animationController.fling(velocity: -1.0);
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = widget.transFormHeight ?? width;

    return WillPopScope(
      onWillPop: onBackPressed,
      child: GestureDetector(
        onVerticalDragUpdate: _handleDragUpdate,
        onVerticalDragEnd: _handleDragEnd,
        excludeFromSemantics: true,
        child: AnimatedBuilder(
          animation: _opacityAnimation,
          builder: (context, child) {
            return Scaffold(
              backgroundColor: widget.transparentBg
                  ? Colors.transparent
                  : widget.backgroundColor
                      ?.withOpacity(_opacityAnimation.value),
              body: Column(
                key: _childKey,
                children: <Widget>[
                  _isDirectionTop ? const SizedBox.shrink() : const Spacer(),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            0.0, height * _animation.value, 0.0),
                        child: child,
                      );
                    },
                    child: SizedBox(
                      key: globalKey,
                      width: width,
                      child: widget.child,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool get _isDirectionTop {
    return widget.direction == TopSheetDirection.TOP;
  }

  Future<bool> onBackPressed() {
    _animationController.reverse();
    return Future<bool>.value(false);
  }
}

enum TopSheetDirection {
  TOP,
  BOTTOM,
}

/// copy from PageRouteBuilder，为了解决房间弹窗时出现TopLiveTool
abstract class TopSheetPageRoute<T> extends ModalRoute<T> {
  /// Creates a modal route that replaces the entire screen.
  TopSheetPageRoute({
    RouteSettings? settings,
    this.fullscreenDialog = false,
  }) : super(settings: settings);

  /// Whether this page route is a full-screen dialog.
  ///
  /// In Material and Cupertino, being fullscreen has the effects of making
  /// the app bars have a close button instead of a back button. On
  /// iOS, dialogs transitions animate differently and are also not closeable
  /// with the back swipe gesture.
  final bool fullscreenDialog;

  @override
  bool get opaque => true;

  @override
  bool get barrierDismissible => false;

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) =>
      nextRoute is TopSheetPageRoute;

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) =>
      previousRoute is TopSheetPageRoute;
}

Widget _defaultTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return child;
}

class TopSheetPageRouteBuilder<T> extends TopSheetPageRoute<T> {
  /// Creates a route that delegates to builder callbacks.
  ///
  /// The [pageBuilder], [transitionsBuilder], [opaque], [barrierDismissible],
  /// [maintainState], and [fullscreenDialog] arguments must not be null.
  TopSheetPageRouteBuilder({
    RouteSettings? settings,
    required this.pageBuilder,
    this.transitionsBuilder = _defaultTransitionsBuilder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
    bool fullscreenDialog = false,
  }) : super(settings: settings, fullscreenDialog: fullscreenDialog);

  /// Used build the route's primary contents.
  ///
  /// See [ModalRoute.buildPage] for complete definition of the parameters.
  final RoutePageBuilder pageBuilder;

  /// Used to build the route's transitions.
  ///
  /// See [ModalRoute.buildTransitions] for complete definition of the parameters.
  final RouteTransitionsBuilder transitionsBuilder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return pageBuilder(context, animation, secondaryAnimation);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return transitionsBuilder(context, animation, secondaryAnimation, child);
  }
}
