import 'dart:async';
import 'package:flutter/material.dart';

// 侧边弹出弹窗
class SideSheet extends StatefulWidget {
  final SideSheetDirection? direction;
  final Color? backgroundColor;
  final Widget? child;
  final double? transFormWidth;

  const SideSheet(
      {super.key,
      this.child,
      this.direction,
      this.backgroundColor,
      this.transFormWidth});

  @override
  _SideSheetState createState() => _SideSheetState();

  static Future<T?> show<T extends Object>(
      {required BuildContext context,
      required Widget child,
      Decoration? decoration,
      double? transFormWidth,
      direction = SideSheetDirection.LEFT,
      backgroundColor = Colors.transparent,
      Color barrierColor = Colors.transparent}) {
    return Navigator.push<T>(
      context,
      SideSheetPageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return SideSheet(
            direction: direction,
            backgroundColor: backgroundColor,
            transFormWidth: transFormWidth,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: decoration,
                child: child,
              ),
            ),
          );
        },
        opaque: false,
        barrierColor: barrierColor,
      ),
    );
  }
}

class _SideSheetState extends State<SideSheet> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  final GlobalKey globalKey = GlobalKey();

  final _childKey = GlobalKey();

  double? get _childWidth {
    final RenderBox? renderBox =
        _childKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.width;
  }

  bool get _dismissUnderway =>
      _animationController.status == AnimationStatus.reverse;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _animation = Tween<double>(begin: _isDirectionLeft ? -1 : 1, end: 0)
        .animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Navigator.pop(context);
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_dismissUnderway) return;

    var change = details.primaryDelta! / (_childWidth ?? details.primaryDelta!);
    if (_isDirectionLeft) {
      _animationController.value += change;
    } else {
      _animationController.value -= change;
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway) return;

    if (details.velocity.pixelsPerSecond.dx > 0 && _isDirectionLeft) return;
    if (details.velocity.pixelsPerSecond.dx < 0 && !_isDirectionLeft) return;

    if (details.velocity.pixelsPerSecond.dx > 700) {
      final double flingVelocity =
          -details.velocity.pixelsPerSecond.dx / _childWidth!;
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
    double width = widget.transFormWidth ?? MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: onBackPressed,
      child: GestureDetector(
        onHorizontalDragUpdate: _handleDragUpdate,
        onHorizontalDragEnd: _handleDragEnd,
        excludeFromSemantics: true,
        child: Scaffold(
          backgroundColor: widget.backgroundColor,
          body: Row(
            key: _childKey,
            children: <Widget>[
              _isDirectionLeft ? Container() : const Spacer(),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.translationValues(
                        width * _animation.value, 0.0, 0.0),
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
        ),
      ),
    );
  }

  bool get _isDirectionLeft {
    return widget.direction == SideSheetDirection.LEFT;
  }

  Future<bool> onBackPressed() {
    _animationController.reverse();
    return Future<bool>.value(false);
  }
}

enum SideSheetDirection { LEFT, RIGHT }

/// copy from PageRouteBuilder，为了解决房间弹窗时出现TopLiveTool
abstract class SideSheetPageRoute<T> extends ModalRoute<T> {
  /// Creates a modal route that replaces the entire screen.
  SideSheetPageRoute({
    super.settings,
    this.fullscreenDialog = false,
  });

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
      nextRoute is SideSheetPageRoute;

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) =>
      previousRoute is SideSheetPageRoute;
}

Widget _defaultTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return child;
}

class SideSheetPageRouteBuilder<T> extends SideSheetPageRoute<T> {
  /// Creates a route that delegates to builder callbacks.
  ///
  /// The [pageBuilder], [transitionsBuilder], [opaque], [barrierDismissible],
  /// [maintainState], and [fullscreenDialog] arguments must not be null.
  SideSheetPageRouteBuilder({
    super.settings,
    required this.pageBuilder,
    this.transitionsBuilder = _defaultTransitionsBuilder,
    this.transitionDuration = const Duration(milliseconds: 100),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
    super.fullscreenDialog = false,
  });

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
