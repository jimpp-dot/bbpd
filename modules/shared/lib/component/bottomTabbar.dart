// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:collection' show Queue;
import 'dart:math' as math;

import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:flutter/material.dart';

const double _kActiveFontSize = 14.0;
const double _kInactiveFontSize = 12.0;
const double _kTopMargin = 8.0;
const double _kBottomMargin = 0.0;
const double kBottomTabBarHeight = 40.0;

/// Defines the layout and behavior of a [BottomTabBar].
///
/// See also:
///
///  * [BottomTabBar]
///  * [BottomNavigationBarItem]
///  * <https://material.google.com/components/bottom-navigation.html#bottom-navigation-specs>
enum BottomTabBarType {
  /// The [BottomTabBar]'s [BottomNavigationBarItem]s have fixed width, always
  /// display their text labels, and do not shift when tapped.
  fixed,

  /// The location and size of the [BottomTabBar] [BottomNavigationBarItem]s
  /// animate and labels fade in when they are tapped. Only the selected item
  /// displays its text label.
  shifting,
}

/// A material widget displayed at the bottom of an app for selecting among a
/// small number of views, typically between three and five.
///
/// The bottom navigation bar consists of multiple items in the form of
/// text labels, icons, or both, laid out on top of a piece of material. It
/// provides quick navigation between the top-level views of an app. For larger
/// screens, side navigation may be a better fit.
///
/// A bottom navigation bar is usually used in conjunction with a [Scaffold],
/// where it is provided as the [Scaffold.BottomTabBar] argument.
///
/// The bottom navigation bar's [type] changes how its [items] are displayed.
/// If not specified it's automatically set to [BottomTabBarType.fixed]
/// when there are less than four items, [BottomTabBarType.shifting]
/// otherwise.
///
///  * [BottomTabBarType.fixed], the default when there are less than
///    four [items]. The selected item is rendered with [fixedColor] if it's
///    non-null, otherwise the theme's [ThemeData.primaryColor] is used. The
///    navigation bar's background color is the default [Material] background
///    color, [ThemeData.canvasColor] (essentially opaque white).
///  * [BottomTabBarType.shifting], the default when there are four
///    or more [items]. All items are rendered in white and the navigation bar's
///    background color is the same as the
///    [BottomNavigationBarItem.backgroundColor] of the selected item. In this
///    case it's assumed that each item will have a different background color
///    and that background color will contrast well with white.
///
/// ## Sample Code
///
/// This example shows a [BottomTabBar] as it is used within a [Scaffold]
/// widget. The [BottomTabBar] has three [BottomNavigationBarItem]
/// widgets and the [currentIndex] is set to index 1. The color of the selected
/// item is set to  a purple color. A function is called whenever any item is
/// tapped and the function helps display the appropriate [WrapText] in the body of
/// the [Scaffold].
///
/// ```dart
/// class MyHomePage extends StatefulWidget {
///  MyHomePage({Key key}) : super(key: key);
///
///  @override
///  _MyHomePageState createState() => _MyHomePageState();
/// }
///
/// class _MyHomePageState extends State<MyHomePage> {
///  int _selectedIndex = 1;
///  final _widgetOptions = [
///    WrapText('Index 0: Home'),
///    WrapText('Index 1: Business'),
///    WrapText('Index 2: School'),
///  ];
///
///  @override
///  Widget build(BuildContext context) {
///    return Scaffold(
///      appBar: AppBar(
///        title: WrapText('BottomTabBar Sample'),
///      ),
///      body: Center(
///        child: _widgetOptions.elementAt(_selectedIndex),
///      ),
///      BottomTabBar: BottomTabBar(
///        items: <BottomNavigationBarItem>[
///          BottomNavigationBarItem(icon: Icon(Icons.home), title: WrapText('Home')),
///          BottomNavigationBarItem(icon: Icon(Icons.business), title: WrapText('Business')),
///          BottomNavigationBarItem(icon: Icon(Icons.school), title: WrapText('School')),
///        ],
///        currentIndex: _selectedIndex,
///        fixedColor: Colors.deepPurple,
///        onTap: _onItemTapped,
///      ),
///    );
///  }
///
///  void _onItemTapped(int index) {
///    setState(() {
///      _selectedIndex = index;
///    });
///  }
/// }
/// ```
///
/// See also:
///
///  * [BottomNavigationBarItem]
///  * [Scaffold]
///  * <https://material.google.com/components/bottom-navigation.html>
class BottomTabBar extends StatefulWidget {
  /// Creates a bottom navigation bar, typically used in a [Scaffold] where it
  /// is provided as the [Scaffold.BottomTabBar] argument.
  ///
  /// The length of [items] must be at least two and each item's icon and title must be not null.
  ///
  /// If [type] is null then [BottomTabBarType.fixed] is used when there
  /// are two or three [items], [BottomTabBarType.shifting] otherwise.
  ///
  /// If [fixedColor] is null then the theme's primary color,
  /// [ThemeData.primaryColor], is used. However if [BottomTabBar.type] is
  /// [BottomTabBarType.shifting] then [fixedColor] is ignored.
  const BottomTabBar({
    super.key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
    BottomTabBarType? type,
    this.fixedColor,
    this.iconSize = 24.0,
  })  : assert(items.length >= 2),
        assert(0 <= currentIndex && currentIndex < items.length),
        type = type ??
            (items.length <= 3
                ? BottomTabBarType.fixed
                : BottomTabBarType.shifting);

  /// The interactive items laid out within the bottom navigation bar where each item has an icon and title.
  final List<BottomNavigationBarItem> items;

  /// The callback that is called when a item is tapped.
  ///
  /// The widget creating the bottom navigation bar needs to keep track of the
  /// current index and call `setState` to rebuild it with the newly provided
  /// index.
  final ValueChanged<int>? onTap;

  /// The index into [items] of the current active item.
  final int currentIndex;

  /// Defines the layout and behavior of a [BottomTabBar].
  ///
  /// See documentation for [BottomTabBarType] for information on the meaning
  /// of different types.
  final BottomTabBarType type;

  /// The color of the selected item when bottom navigation bar is
  /// [BottomTabBarType.fixed].
  ///
  /// If [fixedColor] is null then the theme's primary color,
  /// [ThemeData.primaryColor], is used. However if [BottomTabBar.type] is
  /// [BottomTabBarType.shifting] then [fixedColor] is ignored.
  final Color? fixedColor;

  /// The size of all of the [BottomNavigationBarItem] icons.
  ///
  /// See [BottomNavigationBarItem.icon] for more information.
  final double iconSize;

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

// This represents a single tile in the bottom navigation bar. It is intended
// to go into a flex container.
class _BottomNavigationTile extends StatelessWidget {
  const _BottomNavigationTile(
    this.type,
    this.item,
    this.animation,
    this.iconSize, {
    this.onTap,
    this.colorTween,
    this.flex,
    this.selected = false,
    this.indexLabel,
  });

  final BottomTabBarType type;
  final BottomNavigationBarItem item;
  final Animation<double> animation;
  final double iconSize;
  final VoidCallback? onTap;
  final ColorTween? colorTween;
  final double? flex;
  final bool selected;
  final String? indexLabel;

  Widget _buildIcon() {
    double tweenStart;
    Color? iconColor;
    switch (type) {
      case BottomTabBarType.fixed:
//        tweenStart = 8.0;
        tweenStart = _kTopMargin;
        iconColor = colorTween?.evaluate(animation);
        break;
      case BottomTabBarType.shifting:
        tweenStart = 16.0;
        iconColor = Colors.white;
        break;
    }
    return Align(
      alignment: Alignment.topCenter,
      heightFactor: 1.0,
      child: Container(
        margin: EdgeInsets.only(
          top: Tween<double>(
            begin: tweenStart,
            end: _kTopMargin,
          ).evaluate(animation),
        ),
        child: IconTheme(
          data: IconThemeData(
            color: iconColor,
            size: iconSize,
          ),
          child: selected ? item.activeIcon : item.icon,
        ),
      ),
    );
  }

  Widget _buildFixedLabel() {
    return Align(
      alignment: Alignment.bottomCenter,
      heightFactor: 1.0,
      child: Container(
        margin: const EdgeInsets.only(bottom: _kBottomMargin),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: _kActiveFontSize,
            color: colorTween?.evaluate(animation),
          ),
          // The font size should grow here when active, but because of the way
          // font rendering works, it doesn't grow smoothly if we just animate
          // the font size, so we use a transform instead.
          child: Transform(
            transform: Matrix4.diagonal3(
              Vector3.all(
                Tween<double>(
                  begin: _kInactiveFontSize / _kActiveFontSize,
                  end: 1.0,
                ).evaluate(animation),
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Text(item.label ?? ''),
          ),
        ),
      ),
    );
  }

  Widget _buildShiftingLabel() {
    return Align(
      alignment: Alignment.bottomCenter,
      heightFactor: 1.0,
      child: Container(
        margin: EdgeInsets.only(
          bottom: Tween<double>(
            // In the spec, they just remove the label for inactive items and
            // specify a 16dp bottom margin. We don't want to actually remove
            // the label because we want to fade it in and out, so this modifies
            // the bottom margin to take that into account.
            begin: 2.0,
            end: _kBottomMargin,
          ).evaluate(animation),
        ),
        child: FadeTransition(
          alwaysIncludeSemantics: true,
          opacity: animation,
          child: DefaultTextStyle.merge(
            style: const TextStyle(
              fontSize: _kActiveFontSize,
              color: Colors.white,
            ),
            child: Text(item.label ?? ''),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // In order to use the flex container to grow the tile during animation, we
    // need to divide the changes in flex allotment into smaller pieces to
    // produce smooth animation. We do this by multiplying the flex value
    // (which is an integer) by a large number.
    int size;
    Widget label;
    switch (type) {
      case BottomTabBarType.fixed:
        size = 1;
        label = _buildFixedLabel();
        break;
      case BottomTabBarType.shifting:
        size = ((flex ?? 0) * 1000.0).round();
        label = _buildShiftingLabel();
        break;
    }
    return Expanded(
      flex: size,
      child: Stack(
        children: <Widget>[
          InkResponse(
            onTap: onTap,
            enableFeedback: false,
            splashColor: Colors.transparent,
            highlightShape: BoxShape.rectangle,
            highlightColor: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildIcon(),
                label,
              ],
            ),
          ),
          Semantics(
            label: indexLabel,
          )
        ],
      ),
    );
  }
}

class _BottomTabBarState extends State<BottomTabBar>
    with TickerProviderStateMixin {
  List<AnimationController> _controllers = <AnimationController>[];
  late List<CurvedAnimation> _animations;

  // A queue of color splashes currently being animated.
  final Queue<_Circle> _circles = Queue<_Circle>();

  // Last splash circle's color, and the final color of the control after
  // animation is complete.
  Color? _backgroundColor;

  static final Animatable<double> _flexTween =
      Tween<double>(begin: 1.0, end: 1.5);

  void _resetState() {
    for (AnimationController controller in _controllers) {
      controller.dispose();
    }
    for (_Circle circle in _circles) {
      circle.dispose();
    }
    _circles.clear();

    _controllers =
        List<AnimationController>.generate(widget.items.length, (int index) {
      return AnimationController(
        duration: kThemeAnimationDuration,
        vsync: this,
      )..addListener(_rebuild);
    });
    _animations =
        List<CurvedAnimation>.generate(widget.items.length, (int index) {
      return CurvedAnimation(
        parent: _controllers[index],
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastOutSlowIn.flipped,
      );
    });
    _controllers[widget.currentIndex].value = 1.0;
    _backgroundColor = widget.items[widget.currentIndex].backgroundColor;
  }

  @override
  void initState() {
    super.initState();
    _resetState();
  }

  void _rebuild() {
    setState(() {
      // Rebuilding when any of the controllers tick, i.e. when the items are
      // animated.
    });
  }

  @override
  void dispose() {
    for (AnimationController controller in _controllers) {
      controller.dispose();
    }
    for (_Circle circle in _circles) {
      circle.dispose();
    }
    super.dispose();
  }

  double _evaluateFlex(Animation<double> animation) =>
      _flexTween.evaluate(animation);

  void _pushCircle(int index) {
    if (widget.items[index].backgroundColor != null) {
      _circles.add(
        _Circle(
          state: this,
          index: index,
          color: widget.items[index].backgroundColor!,
          vsync: this,
        )..controller.addStatusListener(
            (AnimationStatus status) {
              switch (status) {
                case AnimationStatus.completed:
                  setState(() {
                    final _Circle circle = _circles.removeFirst();
                    _backgroundColor = circle.color;
                    circle.dispose();
                  });
                  break;
                case AnimationStatus.dismissed:
                case AnimationStatus.forward:
                case AnimationStatus.reverse:
                  break;
              }
            },
          ),
      );
    }
  }

  @override
  void didUpdateWidget(BottomTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // No animated segue if the length of the items list changes.
    if (widget.items.length != oldWidget.items.length) {
      _resetState();
      return;
    }

    if (widget.currentIndex != oldWidget.currentIndex) {
      switch (widget.type) {
        case BottomTabBarType.fixed:
          break;
        case BottomTabBarType.shifting:
          _pushCircle(widget.currentIndex);
          break;
      }
      _controllers[oldWidget.currentIndex].reverse();
      _controllers[widget.currentIndex].forward();
    }

    if (_backgroundColor != widget.items[widget.currentIndex].backgroundColor) {
      _backgroundColor = widget.items[widget.currentIndex].backgroundColor;
    }
  }

  List<Widget> _createTiles() {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final List<Widget> children = <Widget>[];
    switch (widget.type) {
      case BottomTabBarType.fixed:
        final ThemeData themeData = Theme.of(context);
        final TextTheme textTheme = themeData.textTheme;
        Color themeColor;
        switch (themeData.brightness) {
          case Brightness.light:
            themeColor = themeData.primaryColor;
            break;
          case Brightness.dark:
            themeColor = themeData.colorScheme.secondary;
            break;
        }
        final ColorTween colorTween = ColorTween(
          begin: textTheme.bodySmall?.color,
          end: widget.fixedColor ?? themeColor,
        );
        for (int i = 0; i < widget.items.length; i += 1) {
          children.add(
            _BottomNavigationTile(
              widget.type,
              widget.items[i],
              _animations[i],
              widget.iconSize,
              onTap: () {
                if (widget.onTap != null) widget.onTap!(i);
              },
              colorTween: colorTween,
              selected: i == widget.currentIndex,
              indexLabel: localizations.tabLabel(
                  tabIndex: i + 1, tabCount: widget.items.length),
            ),
          );
        }
        break;
      case BottomTabBarType.shifting:
        for (int i = 0; i < widget.items.length; i += 1) {
          children.add(
            _BottomNavigationTile(
              widget.type,
              widget.items[i],
              _animations[i],
              widget.iconSize,
              onTap: () {
                if (widget.onTap != null) widget.onTap!(i);
              },
              flex: _evaluateFlex(_animations[i]),
              selected: i == widget.currentIndex,
              indexLabel: localizations.tabLabel(
                  tabIndex: i + 1, tabCount: widget.items.length),
            ),
          );
        }
        break;
    }
    return children;
  }

  Widget _createContainer(List<Widget> tiles) {
    return DefaultTextStyle.merge(
      overflow: TextOverflow.ellipsis,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tiles,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasDirectionality(context));
    assert(debugCheckHasMaterialLocalizations(context));

    // Labels apply up to _bottomMargin padding. Remainder is media padding.
    final double additionalBottomPadding =
        math.max(MediaQuery.of(context).padding.bottom - _kBottomMargin, 0.0);
    Color? backgroundColor;
    switch (widget.type) {
      case BottomTabBarType.fixed:
        break;
      case BottomTabBarType.shifting:
        backgroundColor = _backgroundColor;
        break;
    }
    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Material(
              // Casts shadow.
              elevation: 8.0,
              color: backgroundColor,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: kBottomTabBarHeight + additionalBottomPadding),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: CustomPaint(
                    painter: _RadialPainter(
                      circles: _circles.toList(),
                      textDirection: Directionality.of(context),
                    ),
                  ),
                ),
                Material(
                  // Splashes.
                  type: MaterialType.transparency,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: additionalBottomPadding),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      child: _createContainer(_createTiles()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Describes an animating color splash circle.
class _Circle {
  _Circle({
    required this.state,
    required this.index,
    required this.color,
    required TickerProvider vsync,
  }) {
    controller = AnimationController(
      duration: kThemeAnimationDuration,
      vsync: vsync,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    controller.forward();
  }

  final _BottomTabBarState state;
  final int index;
  final Color color;
  late AnimationController controller;
  late CurvedAnimation animation;

  double get horizontalLeadingOffset {
    double weightSum(Iterable<Animation<double>> animations) {
      // We're adding flex values instead of animation values to produce correct
      // ratios.
      return animations
          .map<double>(state._evaluateFlex)
          .fold<double>(0.0, (double sum, double value) => sum + value);
    }

    final double allWeights = weightSum(state._animations);
    // These weights sum to the start edge of the indexed item.
    final double leadingWeights =
        weightSum(state._animations.sublist(0, index));

    // Add half of its flex value in order to get to the center.
    return (leadingWeights +
            state._evaluateFlex(state._animations[index]) / 2.0) /
        allWeights;
  }

  void dispose() {
    controller.dispose();
  }
}

// Paints the animating color splash circles.
class _RadialPainter extends CustomPainter {
  _RadialPainter({
    required this.circles,
    required this.textDirection,
  });

  final List<_Circle> circles;
  final TextDirection textDirection;

  // Computes the maximum radius attainable such that at least one of the
  // bounding rectangle's corners touches the edge of the circle. Drawing a
  // circle larger than this radius is not needed, since there is no perceivable
  // difference within the cropped rectangle.
  static double _maxRadius(Offset center, Size size) {
    final double maxX = math.max(center.dx, size.width - center.dx);
    final double maxY = math.max(center.dy, size.height - center.dy);
    return math.sqrt(maxX * maxX + maxY * maxY);
  }

  @override
  bool shouldRepaint(_RadialPainter oldPainter) {
    if (textDirection != oldPainter.textDirection) return true;
    if (circles == oldPainter.circles) return false;
    if (circles.length != oldPainter.circles.length) return true;
    for (int i = 0; i < circles.length; i += 1) {
      if (circles[i] != oldPainter.circles[i]) {
        return true;
      }
    }
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (_Circle circle in circles) {
      final Paint paint = Paint()..color = circle.color;
      final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
      canvas.clipRect(rect);
      double leftFraction;
      switch (textDirection) {
        case TextDirection.rtl:
          leftFraction = 1.0 - circle.horizontalLeadingOffset;
          break;
        case TextDirection.ltr:
          leftFraction = circle.horizontalLeadingOffset;
          break;
      }
      final Offset center =
          Offset(leftFraction * size.width, size.height / 2.0);
      final Tween<double> radiusTween = Tween<double>(
        begin: 0.0,
        end: _maxRadius(center, size),
      );
      canvas.drawCircle(
        center,
        radiusTween.transform(circle.animation.value),
        paint,
      );
    }
  }
}
