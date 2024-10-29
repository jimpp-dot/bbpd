import 'dart:math' as math;

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/lottery/lottery_manager.dart';
import 'package:pulse_log/pulse_log.dart';

import '../../chat_room_screen.dart';

class TopLiveTool {
  static OverlayEntry? _overlayEntry;
  static GlobalKey<TopLiveState>? _topLiveKey;

  /// 判断直播小浮窗是否正在展示
  static bool get isShowing => _overlayEntry != null;

  static show(ChatRoomData room) {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      hide();
      var overlayState = Overlay.of(System.context);

      _topLiveKey = GlobalKey();
      _overlayEntry = OverlayEntry(builder: (context) {
        return TopLive(key: _topLiveKey, room: room);
      });
      overlayState.insert(_overlayEntry!);
    });

    ///显示小窗时，如果是laya-wolf房型且在开麦状态，则直接闭麦
    // if (ChatRoomUtil.isLayaWolf(room?.config)) {
    //   if (!room.mute) {
    //     //如果当前开麦了,闭麦
    //     room.setMute(true);
    //   }
    // }
  }

  static hide({bool showAnimation = false}) {
    if (showAnimation && _topLiveKey != null) {
      _topLiveKey?.currentState?.hideWithAnimation(() {
        _overlayEntry?.remove();
        _overlayEntry = null;
        _topLiveKey = null;
      });
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _topLiveKey = null;
    }
  }

  static String hasCloseToday = 'has_close_room_today';
  static String hasShowFateAfterRoom = 'has_show_fate_after_room';

  static destroy({bool exitDirect = true, bool showAnimation = false}) async {
    Log.d("TopLiveTool destroy");
    int realRid = ChatRoomData.getInstance()?.realRid ?? 0;
    bool result = true;
    int identity = 0;
    if (ChatRoomData.getInstance()?.isCreator ?? false) {
      identity = 2;
    } else if (ChatRoomData.getInstance()?.isMic ?? false) {
      identity = 1;
    }
    if (!exitDirect && realRid > 0) {
      result = await ChatRoomUtil.checkToDispose(Constant.context);
    }

    if (result == true) {
      ChatRoomData.getInstance()?.dispose();
      int index = appNavigatorObserver.appNavigatorObserverGetIndex("/room/");
      if (index > -1) {
        bool find = false;
        Navigator.of(System.context).popUntil((Route route) {
          if (find) return true;
          if (route.settings.name == null) return false;
          String name = route.settings.name?.toLowerCase() ?? '';
          if (name.startsWith("/room/")) {
            find = true;
            return false;
          }
          if (name != '/') {
            return false;
          }
          return true;
        });
      }
      hide(showAnimation: showAnimation);

      ChatRoomScreen.ridList = [];
      ChatRoomScreen.lastFrom = RoomFrom.default_from;

      /// 房间退出接口
      RoomRepository.reportWillDestroyRoom(realRid, identity);

      /// 房间退出的回调
      eventCenter.emit('Room.Exit.Event');
    }
  }
}

class TopLive extends StatefulWidget {
  final ChatRoomData room;

  const TopLive({super.key, required this.room});

  @override
  TopLiveState createState() => TopLiveState();
}

class TopLiveState extends State<TopLive>
    with TickerProviderStateMixin<TopLive> {
  final TopLiveStatus _state = TopLiveStatus.Top;

  final double _width = 69.0;
  final double _height = 69.0;

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
  bool _enabled = true;
  Animation<Offset>? _positionAnimation;
  AnimationController? _positionAnimationController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAni;
  late AnimationController _fadeAnimationController;
  static const Duration longAnimationDuration = Duration(milliseconds: 800);
  static const Duration shortAnimationDuration = Duration(milliseconds: 150);

  double getDefaultLeft() {
    return Util.width - 69 - 8;
  }

  double getDefaultTop() {
    return Util.height - 69 - 182;
  }

  @override
  void initState() {
    Log.d('TopLiveTool init state...');

    _left = (lastLeft ?? getDefaultLeft());
    _top = (lastTop ?? getDefaultTop());
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
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener('Navigator.Gesture.Start', _onGestureStart);
    eventCenter.addListener('Navigator.Gesture.Stop', _onGestureStop);
    eventCenter.addListener(EventConstant.WebsocketEventMessage, _onRefresh);
    _fadeAnimationController =
        AnimationController(duration: longAnimationDuration, vsync: this);
    _fadeAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: 1.0), weight: 300),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.0, end: 1.0), weight: 800.0 - 300),
    ]).animate(_fadeAnimationController);
    _fadeAnimation.addListener(onAnimation);
    _scaleAni = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeAnimationController,
        curve: const Interval(0.0, 1.0, curve: ElasticOutCurve(0.8)),
      ),
    );
    _fadeAnimationController.reset();
    _fadeAnimationController.forward();

    _checkPosition();
    super.initState();
  }

  void onAnimation() {
    if (mounted) {
      setState(() {});
    }
  }

  void hideWithAnimation(VoidCallback onAnimationFinished) {
    _fadeAnimationController.duration = shortAnimationDuration;
    _fadeAnimation.removeListener(onAnimation);
    _fadeAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_fadeAnimationController);
    _scaleAni = Tween(begin: 1.0, end: 0.0).animate(_fadeAnimationController);
    _fadeAnimation.addListener(onAnimation);
    _fadeAnimationController.addStatusListener((status) {
      Log.d('In hideWithAnimation, status: $status');
      if (status == AnimationStatus.completed) {
        onAnimationFinished();
      }
    });
    _fadeAnimationController.reset();
    _fadeAnimationController.forward();
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    eventCenter.removeListener('Navigator.Gesture.Start', _onGestureStart);
    eventCenter.removeListener('Navigator.Gesture.Stop', _onGestureStop);
    eventCenter.removeListener(EventConstant.WebsocketEventMessage, _onRefresh);
    _fadeAnimation.removeListener(onAnimation);
    _fadeAnimationController.dispose();

    _positionAnimation?.removeListener(onAnimation);
    _positionAnimation = null;
    _positionAnimationController?.dispose();
    super.dispose();
  }

  _onRefresh(type, data) {
    if (type == EventConstant.WebsocketEventMessage) {
      if (LotteryManager.instance.handleLotteryDrawWhenRoomInBackground(data))
        return;
    }
    if (mounted) setState(() {});
  }

  _onLogout(String type, dynamic value) {
    TopLiveTool.destroy();
  }

  _onLogin(String type, dynamic value) {
    if (value is Map) {
      Map data = value;
      if (data['origin'] != data['now']) {
        TopLiveTool.destroy();
      }
    }
  }

  _onGestureStart(String type, dynamic data) {
    Log.d("live onPointer_onGestureStart");
    _enabled = false;
  }

  _onGestureStop(String type, dynamic data) {
    Log.d("live onPointer_onGestureStop");
    _enabled = true;
  }

  void _onPointerDown(PointerDownEvent event) {
    Log.d("live onPointerDown");
    _startX = event.position.dx;
    _startY = event.position.dy;
    Log.d("live onPointerDown, _startX=$_startX, _startY=$_startY");
    _moved = false;
  }

  void _onPointerMove(PointerMoveEvent event) {
    // Log.d("live onPointerMove, dx=${event.position.dx}, dy=${event.position.dy}");

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
      // if (_left < _minLeft) {
      //   dx = _minLeft - _left;
      // } else if (_left > _maxLeft) {
      //   dx = _maxLeft - _left;
      // }

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

    // Log.d('Pointer up, dx:$dx, _dx:${_dx}, _left:${_left}, _maxLeft: $_maxLeft');

    if (dx != 0 || dy != 0) {
      _positionAnimationController =
          AnimationController(duration: shortAnimationDuration, vsync: this);
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
      _moved = false;
    }
  }

  void _onPointerUp(PointerUpEvent event) {
    // Log.d("Live onPointerUp, _moved=${_moved}, _enabled=${_enabled}");
    _cancel(event);
    if (_moved == false && _enabled == true) {
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'top_live_click_enter',
      });
      _enterRoom();
    } else {
      _checkPosition();
    }
  }

  void _enterRoom() {
    if (ChatRoomData.getInstance() != null) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(
          System.context, ChatRoomData.getInstance()!.realRid,
          from: ChatRoomScreen.lastFrom,
          refer: ChatRoomData.getInstance()?.refer);
      eventCenter.emit(EventConstant.EventTopLiveClick);
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

  _onCloseTaped() async {
    if (_enabled) {
      eventCenter.emit('top.live.close.taped');
      _enabled = false;
      await TopLiveTool.destroy(exitDirect: false, showAnimation: true);
      _enabled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    _minTop =
        MediaQuery.of(context).padding.top + (Util.isIphoneX ? 44.0 : 0.0);
    if (_state != TopLiveStatus.Top || widget.room.config == null) {
      return const SizedBox.shrink();
    }

    double xOffset = _positionAnimation?.value.dx ?? 0;
    double yOffset = _positionAnimation?.value.dy ?? 0;

    return PositionedDirectional(
      start: _left + _dx + xOffset,
      top: _top + _dy + yOffset,
      width: _width,
      height: _height,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: _buildNormal(),
      ),
    );
  }

  Widget _buildNormal() {
    return SizedBox(
      width: _width,
      height: _height,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        clipBehavior: Clip.none,
        children: [
          Listener(
            onPointerDown: _onPointerDown,
            onPointerMove: _onPointerMove,
            onPointerUp: _onPointerUp,
            onPointerCancel: _onPointerCancel,
            behavior: HitTestBehavior.opaque,
            child: _buildAniIcon(),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _onCloseTaped,
            child: R.img('ic_top_live_close.png',
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: 20,
                height: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildAniIcon() {
    String? icon = widget.room.config?.icon;
    if (icon == null || icon.isEmpty) {
      //连线场景房没icon 使用自己的头像
      icon =
          ChatRoomData.getInstance()?.createor?.icon ?? Session.icon; //优先使用房主头像
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 11, end: 11),
      child: ScaleTransition(
        scale: _scaleAni,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF4B4B4B),
                border: Border.all(width: 1, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    offset: const Offset(0, 0),
                    blurRadius: 16,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ),
            CommonAvatar(
              path: icon,
              shape: BoxShape.circle,
              size: 56,
            ),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.2),
              ),
              alignment: AlignmentDirectional.center,
              child: RepaintBoundary(
                child: MultiframeImage.asset(
                  R.imagePath(
                    'ic_top_live_ani.webp',
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                  width: 32,
                  height: 32,
                  loop: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
