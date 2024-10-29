import 'dart:math' as math;
import 'package:shared/shared.dart';
import 'package:shared/widget/time_count_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:gift/assets.dart';
import 'package:gift/src/constellation_clap/constellation_clap_manager.dart';
import 'package:gift/src/constellation_clap/constellation_clap_repo.dart';
import 'package:gift/src/constellation_clap/constellation_clap_result_dialog.dart';
import 'package:gift/src/constellation_clap/pb/generated/zodiac.pb.dart';

class ConstellationClapFloatWrapper extends StatefulWidget {
  const ConstellationClapFloatWrapper({super.key});

  @override
  State<ConstellationClapFloatWrapper> createState() =>
      _ConstellationClapFloatWrapperState();
}

class _ConstellationClapFloatWrapperState
    extends State<ConstellationClapFloatWrapper> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        ConstellationClapManager.eventFloatUpdateKey, _onFloatUpdate);
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        ConstellationClapManager.eventFloatUpdateKey, _onFloatUpdate);
    super.dispose();
  }

  void _onFloatUpdate(String key, Object? data) {
    refresh();
  }

  bool requesting = false;

  @override
  Widget build(BuildContext context) {
    ZodiacPaiResultData? data = ConstellationClapManager.getResultData();
    if (data == null) {
      return const SizedBox.shrink();
    }
    return _ConstellationClapFloatBox(
      data: data,
      bottom: 120,
      onTapView: () async {
        if (requesting) {
          return;
        }
        requesting = true;
        final res = await ConstellationClapRepo.resultDialog();
        requesting = false;
        if (res.success) {
          ConstellationClapResultDialog.show(context, data: res.data);
          ConstellationClapManager.notifyHomeFloatUpdate(null);
        } else {
          Fluttertoast.showCenter(msg: res.message);
        }
      },
      onTapClose: () {
        ConstellationClapManager.notifyHomeFloatUpdate(null);
      },
    );
  }
}

class _ConstellationClapFloatBox extends StatefulWidget {
  final ZodiacPaiResultData data;
  final double bottom;
  final GestureTapCallback onTapView;
  final GestureTapCallback onTapClose;

  const _ConstellationClapFloatBox(
      {required this.data,
      this.bottom = 0,
      required this.onTapView,
      required this.onTapClose});

  @override
  _ConstellationClapFloatBoxState createState() =>
      _ConstellationClapFloatBoxState();
}

const double _headSize = 46;

class _ConstellationClapFloatBoxState extends State<_ConstellationClapFloatBox>
    with TickerProviderStateMixin<_ConstellationClapFloatBox> {
  final double _width = _headSize * 2 - 2.5;
  final double _height = 38 + _headSize;

  late double _minTop;
  late double _maxTop;
  late double _minLeft;
  late double _maxLeft;

  late double _left;
  late double _top;

  late double lastLeft;
  late double lastTop;

  double _dx = 0.0;
  double _dy = 0.0;

  double _startX = 0.0;
  double _startY = 0.0;

  final double _maxWidth = Util.width;
  final double _maxHeight = Util.height - Util.iphoneXBottom;

  bool _moved = false;
  bool _enabled = true;
  Animation<Offset>? _positionAnimation;
  AnimationController? _positionAnimationController;

  Animation<double>? _fadeAnimation;
  Animation<double>? _scaleAni;
  AnimationController? _fadeAnimationController;
  Duration longAnimationDuration = const Duration(milliseconds: 800);
  Duration shortAnimationDuration = const Duration(milliseconds: 150);

  double getDefaultLeft() {
    return Util.width - _width - 4.5;
  }

  double getDefaultTop() {
    return Util.height -
        Util.iphoneXBottom -
        _height -
        54 -
        kToolbarHeight -
        Util.statusHeight -
        20 -
        widget.bottom;
  }

  @override
  void initState() {
    super.initState();
    _left = getDefaultLeft();
    _top = getDefaultTop();
    _minLeft = 4.5;
    _maxLeft = _maxWidth - _width - _minLeft;

    double minTop = 0;
    if (_top < minTop) {
      _top = minTop;
    }
    _minTop = minTop;
    _maxTop = _maxHeight -
        _height -
        54 -
        kToolbarHeight -
        Util.statusHeight -
        20 -
        widget.bottom;

    _fadeAnimationController =
        AnimationController(duration: longAnimationDuration, vsync: this);
    _fadeAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: 1.0), weight: 300),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.0, end: 1.0), weight: 800.0 - 300),
    ]).animate(_fadeAnimationController!);
    _fadeAnimation!.addListener(onAnimation);
    _scaleAni = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeAnimationController!,
        curve: const Interval(0.0, 1.0, curve: ElasticOutCurve(0.8)),
      ),
    );
    _fadeAnimationController!.reset();
    _fadeAnimationController!.forward();

    _checkPosition();
  }

  void onAnimation() {
    if (mounted) {
      setState(() {});
    }
  }

  void hideWithAnimation(VoidCallback onAnimationFinished) {
    _fadeAnimationController!.duration = shortAnimationDuration;
    _fadeAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_fadeAnimationController!);
    _scaleAni = Tween(begin: 1.0, end: 0.0).animate(_fadeAnimationController!);
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

    if (dx != 0 || dy != 0) {
      _positionAnimationController =
          AnimationController(duration: shortAnimationDuration, vsync: this);
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

  void _onPointerUp(PointerUpEvent event) {
    _cancel(event);
    if (_moved == false && _enabled == true) {
      widget.onTapView();
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

  _onCloseTaped() async {
    if (_enabled) {
      _enabled = false;
      hideWithAnimation(() {
        widget.onTapClose();
        _enabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double xOffset = _positionAnimation?.value.dx ?? 0;
    double yOffset = _positionAnimation?.value.dy ?? 0;

    return PositionedDirectional(
      start: _left + _dx + xOffset,
      top: _top + _dy + yOffset,
      width: _width,
      height: _height,
      child: Opacity(
        opacity: _fadeAnimation!.value,
        child: _buildMove(),
      ),
    );
  }

  Widget _buildMove() {
    return SizedBox(
      width: _width,
      height: _height,
      child: Stack(
        children: [
          PositionedDirectional(
            bottom: 0,
            child: Listener(
              onPointerDown: _onPointerDown,
              onPointerMove: _onPointerMove,
              onPointerUp: _onPointerUp,
              onPointerCancel: _onPointerCancel,
              behavior: HitTestBehavior.opaque,
              child: _buildContent(),
            ),
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _onCloseTaped,
              child: Padding(
                padding: const EdgeInsets.all(1.5),
                child: R.img(Assets.gift$constellation_clap_ic_move_close_webp,
                    width: 12.5, height: 12.5, color: R.colors.mainTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return ScaleTransition(
      scale: _scaleAni!,
      child: Column(
        children: [
          TimerCountDownWidget(
            duration: widget.data.endTime -
                DateTime.now().millisecondsSinceEpoch ~/ 1000,
            autoStart: true,
            onEnd: () {
              _onCloseTaped();
            },
            builder: (context, remainTime) {
              return NumText(
                Utility.formatTimeDHMS(remainTime),
                style: TextStyle(
                  fontSize: 16,
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w500,
                  shadows: const <Shadow>[
                    Shadow(
                        color: Color(0x99000000),
                        offset: Offset(0, 2),
                        blurRadius: 4.0)
                  ],
                ),
              );
            },
          ),
          SizedBox(
            width: _headSize * 2 - 8,
            height: _headSize,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                PositionedDirectional(
                  start: 0,
                  child: CommonAvatar(
                    path: widget.data.me.icon,
                    shape: BoxShape.circle,
                    size: _headSize,
                  ),
                ),
                PositionedDirectional(
                  end: 0,
                  child: CommonAvatar(
                    path: widget.data.spokesman.icon,
                    shape: BoxShape.circle,
                    size: _headSize,
                  ),
                ),
                R.img(Assets.gift$constellation_clap_ic_drag_heart_webp,
                    width: 45, height: 33.5),
                NumText('${widget.data.score}',
                    style: const TextStyle(fontSize: 13, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
