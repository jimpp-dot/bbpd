import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class DevToolsWidget extends StatefulWidget {
  final Widget child;
  final bool enable;

  const DevToolsWidget({Key? key, required this.child, this.enable = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DevToolsState();
}

class _DevToolsState extends State<DevToolsWidget> {
  bool _overlayEntryInserted = false;

  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    super.initState();
    _injectOverlay();
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  void didUpdateWidget(DevToolsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enable != oldWidget.enable && widget.enable) {
      _injectOverlay();
    }
    if (!widget.enable) {
      _removeOverlay();
    }
  }

  void _removeOverlay() {
    if (_overlayEntryInserted) {
      _overlayEntry?.remove();
      _overlayEntryInserted = false;
    }
  }

  void _injectOverlay() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_overlayEntryInserted) {
        return;
      }
      if (widget.enable) {
        var overlayState = Overlay.of(System.context);

        _overlayEntry = OverlayEntry(
          builder: (context) => const _DevToolsTopIcon(),
        );
        overlayState.insert(_overlayEntry!);
        _overlayEntryInserted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

const String DEV_DOT_X_Y = 'DEV_DOT_X_Y';

class _DevToolsTopIcon extends StatefulWidget {
  const _DevToolsTopIcon({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DevToolsTopIconState();
}

class _DevToolsTopIconState extends State<_DevToolsTopIcon> {
  final Size _windowSize = Size(Util.width, Util.height);
  final Size dotSize = const Size(50, 50);
  final double horizontalMargin = 10;
  final double verticalMargin = 30;

  double _dx = 0;
  double _dy = 0;

  @override
  void initState() {
    super.initState();
    String? value = fetchDotPos();
    if (value != null && value.split(',').length == 2) {
      final x = double.parse(value.split(',').first);
      final y = double.parse(value.split(',').last);
      _dx = x;
      _dy = y;
    }
    if (_dx == 0 && _dy == 0) {
      _dx = horizontalMargin;
      _dy = _windowSize.height - dotSize.height - verticalMargin * 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _windowSize.width,
      height: _windowSize.height,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PositionedDirectional(
            start: _dx,
            top: _dy,
            child: GestureDetector(
              onTap: onTap,
              onLongPress: onLongPress,
              onVerticalDragEnd: dragEnd,
              onHorizontalDragEnd: dragEnd,
              onHorizontalDragUpdate: dragEvent,
              onVerticalDragUpdate: dragEvent,
              child: Container(
                width: dotSize.width,
                height: dotSize.height,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 2, spreadRadius: 1)
                  ],
                ),
                child:
                    Icon(Icons.build, size: 24, color: R.color.mainBrandColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dragEvent(DragUpdateDetails details) {
    _dx = details.globalPosition.dx - dotSize.width / 2;
    _dy = details.globalPosition.dy - dotSize.height / 2;
    refresh(() {});
  }

  void dragEnd(DragEndDetails details) {
    if (_dx + dotSize.width / 2 < _windowSize.width / 2) {
      _dx = horizontalMargin;
    } else {
      _dx = _windowSize.width - dotSize.width - horizontalMargin;
    }
    if (_dy + dotSize.height > _windowSize.height) {
      _dy = _windowSize.height - dotSize.height - verticalMargin;
    } else if (_dy < 0) {
      _dy = verticalMargin;
    }
    storeDotPos(_dx, _dy);
    refresh(() {});
  }

  void onTap() {
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    mainManager.showDeveloperOptionScreen(context);
  }

  void onLongPress() async {
    bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ConfirmDialog(
          title: '关闭开发者选项',
          content: '关闭后可在首页-我的Tab页中再次打开',
          positiveButton: PositiveButton(text: '确认隐藏'),
        );
      },
    );
    if (result == true) {
      Util.showDevEntrance = false;
    }
  }

  String? fetchDotPos() {
    return Config.get(DEV_DOT_X_Y);
  }

  void storeDotPos(double x, double y) {
    Config.set(DEV_DOT_X_Y, '$x,$y');
  }
}
