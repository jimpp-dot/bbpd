import 'dart:math' as math;

import 'package:shared/shared.dart';

import 'package:shared/util/log/event_log/event_log_plugin.dart';
import 'package:shared/util/log/widget/dev_log_plugins.dart';
import 'package:flutter/material.dart';
import '../../log/widget/asset_data_plugin.dart';
import 'pluggable.dart';
import 'package:pie_menu/pie_menu.dart';

import 'plugin_manager.dart';

class GuaguaOverlay {
  static OverlayEntry? _overlayEntry;
  static OverlayEntry? get overlayEntry => _overlayEntry;

  static GlobalKey<_GuaguaWidgetState>? _guaguaOverlayKey;

  static init({List<Pluggable>? plugins}) {
    if (!Constant.isDevMode) return;
    if (plugins != null) {
      PluginManager.instance.registerAll(plugins);
    }

    PluginManager.instance.registerAll([
      HttpLogPlugin(),
      ConsoleLogPlugin(),
      RoomScoketLogPlugin(),
      WebConsolePlugin(),
      AssetDataPlugin(),
      EventLogPlugin()
    ]);

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      hide();
      final overlayState = Overlay.of(System.context);

      _guaguaOverlayKey = GlobalKey(debugLabel: 'guaguaOverlay');
      _overlayEntry = OverlayEntry(builder: (context) {
        return _GuaguaWidget(
          key: _guaguaOverlayKey,
        );
      });
      overlayState.insert(_overlayEntry!);
    });
  }

  static hide({bool showAnimation = false}) {
    if (showAnimation && _guaguaOverlayKey != null) {
      _guaguaOverlayKey!.currentState!.hideWithAnimation(() {
        _overlayEntry?.remove();
        _overlayEntry = null;
        _guaguaOverlayKey = null;
      });
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _guaguaOverlayKey = null;
    }
  }

  static destroy(
      {bool exitDirect = true,
      bool showAnimation = false,
      BuildContext? context}) async {
    hide(showAnimation: showAnimation);
  }
}

class _GuaguaWidget extends StatefulWidget {
  const _GuaguaWidget({Key? key}) : super(key: key);

  @override
  _GuaguaWidgetState createState() => _GuaguaWidgetState();
}

class _GuaguaWidgetState extends State<_GuaguaWidget>
    with TickerProviderStateMixin<_GuaguaWidget> {
  final double _width = 100.0;
  final double _height = 28.0;

  final ValueNotifier<bool> _piemenuVisible = ValueNotifier<bool>(false);

  late double _minTop;
  double _maxTop = 0;
  late double _minLeft;
  double _maxLeft = 0;

  double _left = 0;
  double _top = 0;

  static double? lastLeft;
  static double? lastTop;

  double _dx = 0.0;
  double _dy = 0.0;

  double _startX = 0.0;
  double _startY = 0.0;

  bool _moved = false;
  bool _enabled = true;
  Animation<Offset>? _positionAnimation;
  AnimationController? _positionAnimationController;

  Animation<double>? _fadeAnimation;
  AnimationController? _fadeAnimationController;
  static const Duration animationDuration = Duration(milliseconds: 200);

  String disPlayTimeStr = '';

  @override
  void initState() {
    _left = (lastLeft ?? 10);
    _top = (lastTop ?? 200.0);
    _minLeft = 8.0;
    // _maxLeft = MediaQuery.of(context).size.width - _width - _minLeft;

    double minTop = 48.0;

    if (_top < minTop) {
      _top = minTop;
    }
    _minTop = minTop;
    // _maxTop = MediaQuery.of(context).size.height - _height;

    _fadeAnimationController =
        AnimationController(duration: animationDuration, vsync: this);
    _fadeAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_fadeAnimationController!);
    _fadeAnimation!.addListener(onAnimation);
    _fadeAnimationController!.reset();
    _fadeAnimationController!.forward();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _maxLeft = MediaQuery.of(context).size.width - _width - _minLeft;
      _maxTop = MediaQuery.of(context).size.height - _height;
      setState(() {});
    });

    super.initState();
  }

  void onAnimation() {
    if (mounted) {
      setState(() {});
    }
  }

  void hideWithAnimation(VoidCallback onAnimationFinished) {
    _fadeAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_fadeAnimationController!);
    _fadeAnimation!.addListener(onAnimation);
    _fadeAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onAnimationFinished();
      }
    });
    _fadeAnimationController!.reset();
    _fadeAnimationController!.forward();
  }

  @override
  void dispose() {
    _fadeAnimation?.removeListener(onAnimation);
    _fadeAnimation = null;
    _fadeAnimationController?.dispose();

    _positionAnimation?.removeListener(onAnimation);
    _positionAnimation = null;
    _positionAnimationController?.dispose();
    super.dispose();
  }

  void _onPointerDown(PointerDownEvent event) {
    _startX = event.position.dx;
    _startY = event.position.dy;
    _moved = false;
  }

  void _onPointerMove(PointerMoveEvent event) {
    double dx = event.position.dx - _startX;
    double dy = event.position.dy - _startY;

    _moved = math.sqrt(dx * dx + dy * dy) > 3.0;

    if (mounted) {
      _dx = dx;
      _dy = dy;
      setState(() {});
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

  void _onPointerUp(PointerUpEvent event) {
    _cancel(event);
    if (_moved == false && _enabled == true) {
      _enabled = false;
    } else {
      if (!_piemenuVisible.value && !_moved) {
        PluginManager.instance.activatePlugin(name: 'httplog');
      }
      _checkPosition();
    }
  }

  void _checkPosition() {
    double dx = 0;
    double dy = 0;

    Rect curRect = Rect.fromLTRB(_left, _top, _left + _width, _top + _height);

    Offset friendsPlayingOffset = Offset(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    Rect disallowedRect = Rect.fromLTRB(
        friendsPlayingOffset.dx,
        friendsPlayingOffset.dy,
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height);
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
      if (_left < _minLeft) {
        dx = _minLeft - _left;
      } else if (_left > _maxLeft) {
        dx = _maxLeft - _left;
      }

      if (_top < _minTop) {
        dy = _minTop - _top;
      } else if (_top > _maxTop) {
        dy = _maxTop - _top;
      }
    }

    //没有移出屏幕就再做一次位置修正 强制tag移动到左边或者右边
    if (dx == 0) {
      double finalLeft = _left;
      if (finalLeft > (MediaQuery.of(context).size.width / 2 - (_width / 2))) {
        dx = MediaQuery.of(context).size.width - 10 - (finalLeft + (_width));
      } else if (finalLeft <
          (MediaQuery.of(context).size.width / 2 - (_width / 2))) {
        dx = dx - (finalLeft - 10);
      }
    }

    if (dx != 0 || dy != 0) {
      _positionAnimationController =
          AnimationController(duration: animationDuration, vsync: this);
      _positionAnimation = _positionAnimationController!
          .drive(Tween<Offset>(begin: Offset(_dx, _dy), end: Offset(dx, dy)))
        ..addListener(onAnimation)
        ..addStatusListener((status) {
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
      _positionAnimationController!.forward();
    } else {
      _moved = false;
    }
  }

  Widget _buildContent() {
    const buildNumber = String.fromEnvironment('TC_NUMBER');
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerMove: _onPointerMove,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerCancel,
      behavior: HitTestBehavior.opaque,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(
                color: R.color.dividerColor.withOpacity(0.08), width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  offset: const Offset(0, 2),
                  blurRadius: 12)
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            children: [
              R.img(
                'logo.png',
                package: ComponentManager.MANAGER_BASE_CORE,
                width: 25,
                height: 25,
              ),
              const SizedBox(width: 2),
              Text(buildNumber.isNotEmpty ? '#$buildNumber' : 'bbpd',
                  style: const TextStyle(color: Colors.black)),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    _minTop = MediaQuery.of(context).padding.top;

    double xOffset = _positionAnimation?.value.dx ?? 0;
    double yOffset = _positionAnimation?.value.dy ?? 0;

    return PieCanvas(
      onMenuToggle: (bool menuVisible) {
        _piemenuVisible.value = menuVisible;
      },
      theme: PieTheme(
          buttonSize: 44,
          pointerSize: 20,
          distance: 170,
          buttonTheme: PieButtonTheme(
              backgroundColor: R.color.mainBrandColor,
              iconColor: Colors.black)),
      child: Stack(
        children: [
          Positioned.fill(
              child: ValueListenableBuilder(
            valueListenable: _piemenuVisible,
            builder: (context, dynamic value, child) {
              return value ? const AbsorbPointer() : const SizedBox();
            },
          )),
          Positioned(
              left: _left + _dx + xOffset,
              top: _top + _dy + yOffset,
              child: Opacity(
                opacity: _fadeAnimation!.value,
                child: PieMenu(
                    actions: PluginManager.instance.pluginsMap.values
                        .map((e) => PieAction(
                              tooltip: e!.displayName,
                              child: Icon(e.iconData),
                              onSelect: e.onTrigger,
                            ))
                        .toList(),
                    child: _buildContent()),
              )),
        ],
      ),
    );
  }
}
