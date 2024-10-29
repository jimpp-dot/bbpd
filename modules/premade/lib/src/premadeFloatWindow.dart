import 'package:shared/assets.dart';
import 'package:premade/k.dart';
import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:premade/premade.dart';
import 'package:premade/src/model/gamePremadeItem.dart';
import 'package:premade/src/premadeV2GameScreen.dart';
import 'dart:math' as math;
import 'package:shared/k.dart' as BaseK;

class PremadeFloatingWindow {
  static OverlayEntry? _overlayEntry;
  static GlobalKey<PremadeFloatingState>? _floatingKey;
  static bool isStartMatching = false;
  static bool showRoomExistsToast = false;

  static show(
    List<GamePremadeItem> premadeItem, {
    int? initTimeSec = 60,
    int overTime = 600,
    String? premadeTitle,
    Map<String, DateTime>? matchStartTimes,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      hide();
      OverlayState? overlayState = Overlay.of(System.context);

      _floatingKey = GlobalKey();
      _overlayEntry = OverlayEntry(builder: (context) {
        return PremadeFloatingWidget(
          key: _floatingKey,
          premadeItems: premadeItem,
          matchStartTimes: matchStartTimes,
          overTimeSec: overTime,
          initTimeSec: initTimeSec,
          title: premadeTitle,
        );
      });
      overlayState.insert(_overlayEntry!);
    });
  }

  static hide({bool showAnimation = false}) {
    if (_overlayEntry == null) return;
    _overlayEntry?.remove();
    _overlayEntry = null;
    _floatingKey = null;
  }

  static void destroy() {
    PremadeRequestManager.stopMatch(Session.uid.toString());
    if (_floatingKey != null) {
      String type;
      if (_floatingKey!.currentState?.widget.premadeItems.isNotEmpty == true) {
        type = _floatingKey!.currentState?.widget.premadeItems.first.roomType ??
            '';
      } else {
        type = '';
      }
      Tracker.instance.track(TrackEvent.game_match_quit, properties: {
        'room_type': type,
        'game_type': type,
        'refer': 'minimize'
      });
    }
    hide();
    reset();
  }

  static void reset() {
    showRoomExistsToast = false;
    isStartMatching = false;
  }

  static bool get isMatching => _overlayEntry != null && _floatingKey != null;

  /// true 拦截，继续等待
  static Future<bool> checkAndIntercept() async {
    if (_overlayEntry != null && _floatingKey != null) {
      bool? wait = await showDialog(
          context: System.context,
          builder: (context) {
            return ConfirmDialog(
              title: K.premade_sure_todo_title,
              content: K.premade_sure_todo_content,
              negativeButton: NegativeButton(
                text: K.premade_continue_wait,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              positiveButton: PositiveButton(
                text: K.premade_just_todo,
                onPressed: () {
                  destroy();
                  Navigator.of(context).pop(false);
                },
              ),
            );
          });
      if (wait == null || wait) {
        return true;
      }
      return false;
    } else {
      return Future.value(false);
    }
  }
}

class PremadeFloatingWidget extends StatefulWidget {
  final List<GamePremadeItem> premadeItems;
  final int? initTimeSec;
  final int overTimeSec;
  final Map<String, DateTime>? matchStartTimes;
  final String? title;

  const PremadeFloatingWidget({
    Key? key,
    required this.premadeItems,
    this.initTimeSec = 0,
    this.overTimeSec = 600,
    this.matchStartTimes,
    this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PremadeFloatingState();
  }
}

class PremadeFloatingState extends State<PremadeFloatingWidget>
    with TickerProviderStateMixin {
  double _width = 0, _height = 0;

  double _iconsWidth = 0;

  double _startX = 0, _startY = 0;

  bool _moved = false;

  double _dx = 0, _dy = 0;

  double _left = 0, _top = 0;

  double _minTop = 0;
  double _maxTop = 0;
  double _minLeft = 0;
  double _maxLeft = 0;

  static double lastLeft = 0;
  static double lastTop = 0;

  final double _maxWidth = Util.width;
  final double _maxHeight = Util.height - Util.iphoneXBottom;

  Animation<Offset>? _positionAnimation;
  AnimationController? _positionAnimationController;

  GlobalKey<MatchingTimerState> timerKey = GlobalKey();

  Timer? _inRoomTimer;
  final IRoomManager _roomManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
  bool _roomExists = false;

  @override
  void initState() {
    super.initState();
    _initCalculate();
    _roomExists = _roomManager.chatRoomDataExists();
    eventCenter.addListener(EventConstant.ChangeLan, _changeLan);
    eventCenter.addListener(EventConstant.EventLogout, _onLogout);
    eventCenter.addListener(
        EventConstant.WebsocketEventMessage, _onSocketMessage);
    eventCenter.addListener('JoinMic.Success', _onJoinMicSuccess);
    eventCenter.addListener(EventConstant.EventRouteChanged, _onPageChanged);
    eventCenter.addListener(EventConstant.EventIapRecharge, _onIapRecharge);
    eventCenter.addListener(EventConstant.EventBeanExchange, _onBeanExchanged);

    if (_roomExists && !PremadeFloatingWindow.showRoomExistsToast) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        PremadeFloatingWindow.showRoomExistsToast = true;
        Fluttertoast.showToast(msg: K.premade_match_suc_join_room_toast);
      });
    }
  }

  void _initCalculate() {
    _height = 56;
    _iconsWidth = 16.0 * (widget.premadeItems.length - 1) + 40;
    InlineSpan span = TextSpan(
        text: widget.title ?? K.premade_matching,
        style: R.textStyle.title.copyWith(fontSize: 15));
    final tp =
        TextPainter(text: span, maxLines: 1, textDirection: TextDirection.ltr);
    tp.layout(maxWidth: Util.width);
    double tw = tp.width;
    _width = 8 * 4 + _iconsWidth + tw + 28;

    _left = ((Util.width - _width));
    _top = (Util.height - 140 - Util.iphoneXBottom);
    _minLeft = 0.0;
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
  }

  @override
  void dispose() {
    Log.d('PremadeFloatingState dispose');
    eventCenter.removeListener(EventConstant.ChangeLan, _changeLan);
    eventCenter.removeListener(
        EventConstant.WebsocketEventMessage, _onSocketMessage);
    eventCenter.removeListener(EventConstant.EventRouteChanged, _onPageChanged);
    eventCenter.removeListener(EventConstant.EventIapRecharge, _onIapRecharge);
    eventCenter.removeListener(
        EventConstant.EventBeanExchange, _onBeanExchanged);
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);
    eventCenter.removeListener('JoinMic.Success', _onJoinMicSuccess);

    _positionAnimation?.removeListener(onAnimation);
    _positionAnimation = null;
    _positionAnimationController?.dispose();

    _inRoomTimer?.cancel();
    _inRoomTimer = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _minTop =
        MediaQuery.of(context).padding.top + (Util.isIphoneX ? 44.0 : 0.0);
    if (widget.premadeItems.isEmpty) {
      return const SizedBox.shrink();
    }

    double xOffset = _positionAnimation?.value.dx ?? 0;
    double yOffset = _positionAnimation?.value.dy ?? 0;
    Log.d('In build _xOffset: $xOffset');

    return PositionedDirectional(
      start: _left + _dx + xOffset,
      top: _top + _dy + yOffset,
      width: _width,
      height: _height,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      height: _height,
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: _moved
            ? BorderRadius.circular(28)
            : const BorderRadiusDirectional.only(
                topStart: Radius.circular(28),
                bottomStart: Radius.circular(28)),
        border: Border.all(color: R.color.dividerColor, width: 0.5),
        boxShadow: [getCardBoxShadow()],
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Expanded(
            child: Listener(
              onPointerDown: _onPointerDown,
              onPointerMove: _onPointerMove,
              onPointerUp: _onPointerUp,
              onPointerCancel: _onPointerCancel,
              behavior: HitTestBehavior.opaque,
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  const SizedBox(width: 8),
                  _buildIcons(),
                  const SizedBox(width: 8),
                  Builder(
                    builder: (context) {
                      bool showCountDown = true;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.title ?? K.premade_matching,
                              style: R.textStyle.title.copyWith(fontSize: 15)),
                          if (showCountDown)
                            MatchingTimerWidget(
                              key: timerKey,
                              initTimeSec: widget.initTimeSec,
                              timeCallback: (time) {
                                if (time >= widget.overTimeSec) {
                                  timerKey.currentState?.resetTimer();
                                  _timeOver();
                                }
                              },
                              textStyle: R.textStyle.body1.copyWith(
                                  fontSize: 10, color: R.color.secondTextColor),
                            )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (!_moved)
            GestureDetector(
              onTap: () {
                PremadeFloatingWindow.destroy();
              },
              child: Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(4),
                child: R.img(
                  BaseAssets.shared$titlebar_ic_titlebar_close_svg,
                  width: 24,
                  height: 24,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildIcons() {
    List<Widget> children = [];
    int len = widget.premadeItems.length;
    for (int i = len - 1; i >= 0; i--) {
      GamePremadeItem item = widget.premadeItems[i];
      children.add(PositionedDirectional(
        start: i * 16.0,
        top: 0,
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          decoration:
              BoxDecoration(color: R.color.mainBgColor, shape: BoxShape.circle),
          child: ClipOval(
            child: Builder(
              builder: (context) {
                return CachedNetworkImage(
                  imageUrl: Utility.formatImageUrl(item.icon),
                  width: 40,
                  height: 40,
                  placeholder: Container(
                      width: 40, height: 40, color: R.color.dividerColor),
                  errorWidget: Container(
                      width: 40, height: 40, color: R.color.dividerColor),
                );
              },
            ),
          ),
        ),
      ));
    }

    return SizedBox(
      width: _iconsWidth,
      height: 40,
      child: Stack(children: children),
    );
  }

  void _onPointerDown(PointerDownEvent event) {
    Log.d("live onPointerDown");
    _startX = event.position.dx;
    _startY = event.position.dy;
    Log.d("live onPointerDown, _startX=$_startX, _startY=$_startY");
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
      Log.d('Pointer up, overlaps');
      if (_left < _minLeft) {
        dx = _minLeft - _left;
      } else if (_left > _maxLeft) {
        dx = _maxLeft - _left;
      }
      dx = (Util.width - _width) - _left;

      if (_top < _minTop) {
        dy = _minTop - _top;
      } else if (_top > _maxTop) {
        dy = _maxTop - _top;
      }
    }

    Log.d(
        'Pointer up, dx:$dx, this._dx:$_dx, this._left:$_left, _maxLeft: $_maxLeft');

    if (dx != 0 || dy != 0) {
      _positionAnimationController = AnimationController(
          duration: kFloatingActionButtonSegue, vsync: this);
      _positionAnimation = _positionAnimationController!
          .drive(Tween<Offset>(begin: Offset(_dx, _dy), end: Offset(dx, dy)))
        ..addListener(onAnimation)
        ..addStatusListener((status) {
          Log.d('Position Animation status changed: $status');
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
      setState(() {
        _moved = false;
      });
    }
  }

  void _onPointerUp(PointerUpEvent event) {
    _cancel(event);
    if (_moved == false) {
      PremadeV2GameScreen.show(context,
          selectGames: widget.premadeItems,
          initTimeSec: timerKey.currentState?.waitedTimes);
      Tracker.instance.track(TrackEvent.reenter_matchmaking);
    } else {
      _checkPosition();
    }
  }

  void _onPointerCancel(PointerCancelEvent event) {
    Log.d("live onPointerCancel");
    _moved = false;
    _cancel(event);
  }

  void _cancel(PointerEvent event) {
    Log.d("live _cancel");
    _left += _dx;
    _top += _dy;
    _dx = 0.0;
    _dy = 0.0;
  }

  void onAnimation() {
    if (mounted) setState(() {});
  }

  _changeLan(String type, Object? data) {
    _initCalculate();
    if (mounted) setState(() {});
  }

  _onLogout(String type, Object? data) {
    PremadeFloatingWindow.destroy();
  }

  _onSocketMessage(String type, Object? data) {
    if (!Session.isLogined || data == null || data is! Map) return false;
    Log.d('match msg: $data');
    Map<String, dynamic> msg = data as Map<String, dynamic>;
    switch (msg['name']) {
      case 'match.succ':
        Map data = msg['data'];
        _onMatchResult(data);
        break;
      case 'match.fail':
        _onMatchResult({'type': 'fail'});
        break;
    }
  }

  bool hasMatch = false;

  void _onMatchResult(Map? data) async {
    if (hasMatch == true) {
      return;
    }
    hasMatch = true;
    if (data != null) {
      if (Util.parseInt(data['can_join_machine'], 0) == 1) {
        //进人机局
        IWereWolfManager wereWolfManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_WERE_WOLF);
        wereWolfManager.openWolfGuideScreen(System.context);
        PremadeFloatingWindow.destroy();
        return;
      }

      String? matchType = data['type'];
      String? roomType = data['room_type'];
      if (matchType != null && matchType.isNotEmpty) {
        DateTime now = DateTime.now();
        DateTime? pre = (widget.matchStartTimes ?? {})[roomType];
        int ds = now.difference(pre ?? now).inSeconds;
        switch (matchType) {
          case 'fail':
            DataReporter.reportEvent(MatchEvent('-1', roomType, ds, 'error'));
            Fluttertoast.showToast(
                msg: K.premade_failure, gravity: ToastGravity.CENTER);
            PremadeFloatingWindow.destroy();
            break;
          case 'close':
            DataReporter.reportEvent(MatchEvent('-1', roomType, ds, 'close'));
            Fluttertoast.showToast(
                msg: K.premade_failure, gravity: ToastGravity.CENTER);
            PremadeFloatingWindow.destroy();
            break;
          case 'm_look_on':
            DataReporter.reportEvent(
                MatchEvent('-1', matchType, ds, 'm_look_on'));
            break;
        }
        return;
      }

      try {
        int rid = Util.parseInt(data['rid']);
        if (rid > 0) {
          Tracker.instance.track(TrackEvent.game_match_success, properties: {
            'game_type': roomType,
          });
          DateTime now = DateTime.now();
          DateTime? pre = (widget.matchStartTimes ?? {})[roomType];
          int ds = now.difference(pre ?? now).inSeconds;
          DataReporter.reportEvent(MatchEvent('$rid', roomType, ds, 'succ'));

          IRoomManager roomManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(
            Constant.context,
            rid,
            from: RoomFrom(roomType ?? '', RoomFrom.home),
            autoMatch: data['auto_create'],
            autoJoin: data['auto_join'],
            matchRid: rid,
            refer: 'batch_match',
          );

          PremadeFloatingWindow.destroy();
        }
      } catch (e) {
        Log.d(e);
      }
    }
  }

  _onJoinMicSuccess(String type, Object? data) {
    Fluttertoast.showToast(msg: K.premade_cancel_match_joinmic);
    PremadeFloatingWindow.hide();
  }

  _onPageChanged(String type, Object? data) {
    if (data != null && data is List) {
      List routes = data;
      String cur = routes[0];
      if (cur == '/room') {
        if (!_roomExists && (_inRoomTimer == null || !_inRoomTimer!.isActive)) {
          _inRoomTimer = Timer(const Duration(seconds: 5), () {
            _inRoomTimer?.cancel();
            _inRoomTimer = null;
            PremadeFloatingWindow.destroy();
            Fluttertoast.showToast(msg: K.premade_inroom_overtime_toast);
          });
        }
      } else if (cur == '/gift_panel') {
        PremadeFloatingWindow.destroy();
        Fluttertoast.showToast(msg: K.premade_send_gift_cancel_toast);
      } else if (_inRoomTimer != null && !_roomManager.chatRoomDataExists()) {
        _inRoomTimer?.cancel();
        _inRoomTimer = null;
      }
    }
  }

  _onIapRecharge(String type, Object? data) {
    PremadeFloatingWindow.destroy();
    Fluttertoast.showToast(msg: K.premade_recharge_cancel_toast);
  }

  _onBeanExchanged(String type, Object? data) {
    PremadeFloatingWindow.destroy();
    Fluttertoast.showToast(msg: K.premade_exchange_cancel_toast);
  }

  void _timeOver() async {
    PremadeFloatingWindow.destroy();

    bool? reMatch = await showDialog(
        context: System.context,
        builder: (context) {
          return ConfirmDialog(
            title: K.premade_match_overtime_title,
            negativeButton: NegativeButton(
              text: BaseK.K.gift_risk_dialog_button_sure,
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            positiveButton: PositiveButton(
              text: K.premade_rematch,
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          );
        });

    if (reMatch != null && reMatch) {
      PremadeV2GameScreen.show(System.context,
          type: widget.premadeItems[0].roomType,
          selectGames: widget.premadeItems,
          reMatch: true);
    }
  }
}
