import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:premade/assets.dart';
import 'package:premade/k.dart';
import 'package:premade/premade.dart';
import 'package:premade/src/model/BatchMatchConfig.dart';
import 'package:premade/src/model/gamePremadeItem.dart';
import 'package:premade/src/premadeFloatWindow.dart';

class PremadeV2GameScreen extends StatefulWidget {
  final String? type;
  final int? initTimeSec;
  final List<GamePremadeItem>? selectGames;

  ///重新匹配
  final bool reMatch;
  final int quick; // 1.首页快速匹配按钮,   其他场景不用传

  const PremadeV2GameScreen({
    Key? key,
    this.type,
    this.initTimeSec,
    this.selectGames,
    this.reMatch = false,
    this.quick = 0,
  }) : super(key: key);

  static Future show(
    BuildContext context, {
    String? type,
    int? initTimeSec,
    List<GamePremadeItem>? selectGames,
    bool reMatch = false,
    int quick = 0,
  }) {
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return Future.value(0);
    }

    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    bool inMic = roomManager.isUidOnPosition(Session.uid);
    if (inMic) {
      Fluttertoast.showToast(msg: K.premade_inmic_toast);
      return Future.value(0);
    }

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        backgroundColor: R.color.mainBgColor,
        routeSettings: const RouteSettings(name: '/premade_new_game'),
        builder: (BuildContext context) {
          return PremadeV2GameScreen(
            type: type,
            initTimeSec: initTimeSec,
            selectGames: selectGames,
            reMatch: reMatch,
            quick: quick,
          );
        });
  }

  @override
  PremadeV2GameState createState() {
    return PremadeV2GameState();
  }
}

class PremadeV2GameState extends State<PremadeV2GameScreen>
    with TickerProviderStateMixin {
  double _startY = 0;
  double _dy = 0;
  double _topOffset = 0;

  bool _moved = false;
  bool _dragUp = false;
  Animation<Offset>? _positionAnimation;
  AnimationController? _positionAnimationController;
  bool _isOverThreshold = false; //是否超出阀值时间
  double _defMultipleMathHeight = 0;

  List<GamePremadeItem> _gameItems = [];
  List<GamePremadeItem> _selectGames = [];

  final GlobalKey<MatchingTimerState> _matchingTimerKey = GlobalKey();

  int _thresholdSec = 15; //阀值时间
  int _matchOverTime = 600; //匹配超时时间

  final Map<String, DateTime> _matchStartTimes = {};

  final GlobalKey _multipleTopKey = GlobalKey();

  bool _isAlreadyMatching = false;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        EventConstant.WebsocketEventMessage, _onSocketMessage);
    eventCenter.addListener(EventConstant.EventTopLiveClick, _onPageChanged);

    _isAlreadyMatching = PremadeFloatingWindow.isMatching;

    PremadeFloatingWindow.hide();
    _defMultipleMathHeight = Util.height * 1 / 2;
    _topOffset = _defMultipleMathHeight;
    _selectGames = widget.selectGames ?? [];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_selectGames.length > 1) {
        _displayMultipleMath();
        if (widget.reMatch) {
          _reMatch();
        }
      } else if (!_isAlreadyMatching) {
        _matchRoom(widget.type, quick: widget.quick);
      }
    });

    _loadConfig();

    if (!_isAlreadyMatching) {
      Tracker.instance.timeEvent(TrackEvent.game_match_quit);
      Tracker.instance.timeEvent(TrackEvent.select_multi_matchmaking);
    }
  }

  void _reMatch() async {
    if (_selectGames.isEmpty) return;
    for (GamePremadeItem item in _selectGames) {
      await _matchRoom(item.roomType);
    }
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventConstant.WebsocketEventMessage, _onSocketMessage);
    eventCenter.removeListener(EventConstant.EventTopLiveClick, _onPageChanged);
    hasMatch = false;
    super.dispose();
  }

  _onPremadeSmallTaped() {
    PremadeFloatingWindow.show(
      _selectGames,
      matchStartTimes: _matchStartTimes,
      overTime: _matchOverTime,
      initTimeSec: _matchingTimerKey.currentState?.waitedTimes,
    );
    Navigator.of(context).pop();

    Tracker.instance.track(TrackEvent.minimize_matchmaking);
  }

  Widget _buildBg() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
    );
  }

  Widget _buildHeader(double opacityValue) {
    return Opacity(
      opacity: opacityValue,
      child: Container(
        height: kToolbarHeight,
        width: Util.width,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: [
            PositionedDirectional(
              start: 0,
              child: GestureDetector(
                onTap: _onPremadeSmallTaped,
                child: Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(Icons.keyboard_arrow_down,
                      size: 20, color: R.color.mainBrandColor),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(K.premade_match_quick,
                  style: R.textStyle.title.copyWith(color: Colors.white)),
            ),
            PositionedDirectional(
              end: 0,
              child: Offstage(
                offstage: !_isOverThreshold,
                child: GestureDetector(
                  onTap: _cancelTap,
                  child: Container(
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      K.premade_game_match_cancel,
                      style: R.textStyle.title
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    double dTop = Util.height;
    if (_isOverThreshold) {
      if (_positionAnimation == null || _positionAnimation!.isCompleted) {
        dTop = _topOffset + _dy;
      } else {
        dTop = _positionAnimation!.value.dy;
      }
      if (_moved) {
        if (dTop < 0) {
          dTop = 0;
        } else if (dTop > _defMultipleMathHeight) {
          dTop = _defMultipleMathHeight;
        }
      }
    } else {
      dTop = Util.height;
    }

    double opacityValue = dTop / _defMultipleMathHeight;
    if (opacityValue > 1) {
      opacityValue = 1;
    } else if (opacityValue < 0) {
      opacityValue = 0;
    }

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned.fill(
          child: _buildBg(),
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          top: MediaQuery.of(System.context).padding.top,
          child: _buildHeader(opacityValue),
        ),
        PositionedDirectional(
          start: 0,
          top: 140,
          child: SizedBox(
            width: Util.width,
            height: Util.width,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  /// 多层次的水波纹动画
                  child: HierarchicalRipple(
                    beginRadius: 43,
                    endRadius: Util.width * 2 / 3,
                    beginColor: Colors.white.withOpacity(0.24),
                    endColor: Colors.white.withOpacity(0),
                    autoStart: true,
                    duration: Duration(
                        milliseconds: (3000 * Util.width / 360).floor()),
                  ),
                ),
                Align(
                  /// 头像周围一圈的圆环
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IntrinsicWidth(
                        child: Container(
                          height: 40,
                          constraints: const BoxConstraints(minWidth: 120),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: MatchingTimerWidget(
                              key: _matchingTimerKey,
                              prefixText: '${K.premade_has_waitted} ',
                              initTimeSec: widget.initTimeSec ?? 0,
                              textStyle: R.textStyle.title.copyWith(
                                  color: const Color(0xFF313131), fontSize: 13),
                              timeCallback: (time) {
                                if (time >= _matchOverTime) {
                                  _overTime();
                                  return;
                                }
                                if (time >= _thresholdSec) {
                                  if (_isAlreadyMatching &&
                                      (widget.initTimeSec ?? 0) <
                                          _thresholdSec) {
                                    _displayMultipleMath();
                                  } else {
                                    _displayMultipleMath();
                                  }
                                }
                              }),
                        ),
                      ),
                      R.img(Assets.premade$triangleImage_png,
                          width: 8, height: 4, color: Colors.white),
                      const SizedBox(height: 12),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [getCardBoxShadow()],
                        ),
                        width: 108,
                        height: 108,
                        child: CommonAvatar(
                          path: Session.icon,
                          size: 100,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(R.string('is_matching'),
                          style: R.textStyle.title
                              .copyWith(fontSize: 21, color: Colors.white))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: 74,
          child: Opacity(
            opacity: 1 - opacityValue,
            child: Text(K.premade_match_max_num,
                style: R.textStyle.body1.copyWith(color: Colors.white)),
          ),
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          top: 118,
          bottom: 0,
          child: Transform.translate(
            offset: Offset(0, dTop),
            child: Listener(
              onPointerDown: _onPointerDown,
              onPointerMove: _onPointerMove,
              onPointerUp: _onPointerUp,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: R.color.mainBgColor,
                  boxShadow: [getCardBoxShadow()],
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(20),
                      topEnd: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      key: _multipleTopKey,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Util.width,
                          height: 35,
                          alignment: Alignment.center,
                          child: dTop == 0
                              ? Container(
                                  width: 40,
                                  height: 4,
                                  decoration: dTop == 0
                                      ? BoxDecoration(
                                          color: R.color.dividerColor,
                                          borderRadius:
                                              BorderRadius.circular(2))
                                      : null,
                                )
                              : R.img(
                                  Assets.premade$ic_drag_open_svg,
                                  width: 48,
                                  height: 16,
                                  color: R.color.dividerColor,
                                ),
                        ),
                        Text(
                          K.premade_match_multiple_notice,
                          style: R.textStyle.title,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 8),
                        _buildMatchingItems(),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Expanded(child: _buildMultipleGames())
                  ],
                ),
              ),
            ),
          ),
        ),
        if (!_isOverThreshold)
          PositionedDirectional(
            bottom: 80 + Util.iphoneXBottom,
            start: 0,
            end: 0,
            height: 56,
            child: GestureDetector(
              onTap: _cancelTap,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 85),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                alignment: Alignment.center,
                child: Text(K.premade_game_match_cancel,
                    style: R.textStyle.title.copyWith(color: Colors.white)),
              ),
            ),
          )
      ],
    );
  }

  Widget _buildMatchingItems() {
    if (_selectGames.isEmpty) return const SizedBox.shrink();
    List<Widget> children = [];
    for (var element in _selectGames) {
      children.add(IntrinsicWidth(
        child: Container(
          height: 16,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsetsDirectional.only(end: 4),
          decoration: BoxDecoration(
              border: Border.all(color: R.color.mainTextColor, width: 0.5),
              borderRadius: BorderRadius.circular(4)),
          child: Text(element.name ?? '',
              style: R.textStyle.body1.copyWith(fontSize: 10)),
        ),
      ));
    }
    return Wrap(children: children);
  }

  void _onPointerMove(PointerMoveEvent event) {
    _dy = event.position.dy - _startY;
    _moved = _dy.abs() > 3.0;
    _dragUp = _dy < 0;
    // _topOffset = _dy;
    setState(() {});
  }

  void _onPointerDown(PointerDownEvent event) {
    _startY = event.position.dy;
    _moved = false;
    _dragUp = false;
    // _topOffset = _startY;
  }

  void _onPointerUp(PointerUpEvent event) {
    _topOffset += event.position.dy - _startY;

    if (_topOffset < 0) _topOffset = 0;
    if (_topOffset > _defMultipleMathHeight)
      _topOffset = _defMultipleMathHeight;
    _dy = 0;

    if (_multipleTopKey.currentContext?.findRenderObject() == null) return;
    final RenderBox box =
        _multipleTopKey.currentContext!.findRenderObject() as RenderBox;
    final size = box.size;
    final topLeftPosition = box.localToGlobal(Offset.zero);
    if (!_moved) {
      if (topLeftPosition.dy + size.height > event.position.dy) {
        _checkPosition();
      }
    } else {
      _checkPosition();
    }
  }

  void _checkPosition() {
    double endY;
    if (_moved) {
      endY = _dragUp ? 0 : _defMultipleMathHeight;
    } else {
      endY = _topOffset == 0 ? _defMultipleMathHeight : 0;
    }
    _positionAnimationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _positionAnimation =
        Tween<Offset>(begin: Offset(0, _topOffset), end: Offset(0, endY))
            .animate(CurvedAnimation(
                parent: _positionAnimationController!,
                curve: Curves.decelerate))
          ..addListener(onAnimation)
          ..addStatusListener((status) {
            Log.d('Position Animation status changed: $status');
            if (status == AnimationStatus.completed && mounted) {
              setState(() {
                _dy = 0;
                _topOffset = endY;
                _moved = false;
                _positionAnimation = null;
              });
            }
          });
    _positionAnimationController!.forward();
  }

  void onAnimation() {
    if (mounted) {
      setState(() {});
    }
  }

  void _displayMultipleMath() {
    if (_isOverThreshold) return;
    _isOverThreshold = true;
    _positionAnimationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _positionAnimation = Tween<Offset>(
            begin: Offset(0, Util.height),
            end: Offset(0, _defMultipleMathHeight))
        .animate(CurvedAnimation(
            parent: _positionAnimationController!, curve: Curves.decelerate))
      ..addListener(onAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && mounted) {
          setState(() {
            _positionAnimation = null;
          });
        }
      });
    _positionAnimationController!.forward();
  }

  Widget _buildMultipleGames() {
    if (_gameItems.isEmpty) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        GamePremadeItem item = _gameItems[index];
        bool isMatching = _selectGames.contains(item);
        return Container(
          width: Util.width,
          height: 68,
          alignment: Alignment.center,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: Utility.formatImageUrl(item.icon),
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  placeholder: Container(
                      width: 56, height: 56, color: R.color.dividerColor),
                  errorWidget: Container(
                      width: 56, height: 56, color: R.color.dividerColor),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item.name ?? '',
                        style: R.textStyle.title.copyWith(fontSize: 15)),
                    const SizedBox(height: 3),
                    isMatching
                        ? Row(
                            children: [
                              Text(K.premade_matching,
                                  style: R.textStyle.body1.copyWith(
                                      color: R.color.secondTextColor,
                                      fontSize: 12)),
                              const SizedBox(width: 3),
                              SizedBox(
                                width: 8,
                                height: 8,
                                child: CircularProgressIndicator(
                                    strokeWidth: 1,
                                    valueColor: AlwaysStoppedAnimation(
                                        R.color.secondTextColor)),
                              ),
                            ],
                          )
                        : Text(
                            R.string('room_play_game_count',
                                args: ['${item.onlineNum}']),
                            style: R.textStyle.body1.copyWith(
                                color: R.color.secondTextColor, fontSize: 12),
                          )
                  ],
                ),
              ),
              GradientButton(
                R.string(isMatching ? 'cancel' : 'personal_match'),
                colors: isMatching
                    ? [Colors.transparent, Colors.transparent]
                    : R.color.mainBrandGradientColors,
                height: 32,
                width: 60,
                textStyle: R.textStyle.title.copyWith(
                    color: isMatching ? R.color.secondTextColor : Colors.white,
                    fontSize: 14),
                border: isMatching
                    ? Border.all(color: R.color.dividerColor, width: 0.5)
                    : null,
                onTap: () async {
                  bool teammateHandleVerify = await Util.teammateHandleVerify(
                      context, item.type ?? '', null);
                  if (!teammateHandleVerify) {
                    return;
                  }

                  if (!isMatching && _selectGames.length >= 4) {
                    Fluttertoast.showCenter(msg: K.premade_max_match_toast);
                    return;
                  }
                  if (isMatching && _selectGames.length == 1) {
                    Fluttertoast.showCenter(msg: K.premade_min_match_toast);
                    return;
                  }
                  DialogLoadingController loadingController =
                      DialogLoadingController();
                  loadingController.show(context: System.context);
                  if (isMatching) {
                    await _cancelMatch(item);
                    Tracker.instance.track(TrackEvent.multi_matchmaking_quit,
                        properties: {'game_type': item.roomType});
                  } else {
                    bool suc = await _matchRoom(item.roomType);
                    if (suc) {
                      _selectGames.add(item);
                      Fluttertoast.showCenter(msg: K.premade_add_suc);
                    }
                  }
                  loadingController.close();
                  if (mounted) setState(() {});

                  Tracker.instance.track(TrackEvent.multi_matchmaking_select,
                      properties: {'game_type': item.roomType});
                },
              )
            ],
          ),
        );
      },
      itemCount: _gameItems.length,
      itemExtent: 68,
    );
  }

  void _cancelTap() async {
    bool? cancel = await showDialog(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            title: K.premade_just_waitting,
            content: K.premade_match_mult_games_content,
            negativeButton: NegativeButton(
              text: K.premade_game_match_cancel,
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            positiveButton: PositiveButton(
              text: K.premade_try_other_game,
              onPressed: () {
                Navigator.of(context).pop(false);
                _displayMultipleMath();
                Tracker.instance.track(TrackEvent.select_multi_matchmaking);
              },
            ),
          );
        });
    if (cancel != null && cancel) {
      _stopMatch();
      Navigator.of(context).pop();
    }
  }

  /// 取消匹配
  void _stopMatch() {
    PremadeRequestManager.stopMatch(Session.uid.toString());
    _matchingTimerKey.currentState?.resetTimer();

    Tracker.instance.track(
      TrackEvent.game_match_quit,
      properties: {
        'room_type': widget.type,
        'game_type': widget.type,
        'refer': _isOverThreshold ? 'main_many' : 'main'
      },
    );
  }

  void _overTime() async {
    _stopMatch();
    Navigator.pop(context);
    bool? reMatch = await showDialog(
        context: System.context,
        builder: (context) {
          return ConfirmDialog(
            content: K.premade_match_overtime_title,
            negativeButton: NegativeButton(
              text: base.K.gift_risk_dialog_button_sure,
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

    if (reMatch != null && reMatch && _selectGames.isNotEmpty == true) {
      PremadeV2GameScreen.show(System.context,
          type: _selectGames[0].roomType,
          selectGames: _selectGames,
          reMatch: true);
    }
  }

  void _loadConfig() async {
    DataRsp<BatchMatchConfig> response =
        await PremadeRequestManager.loadBatchMatchConfig();
    if (response.success == true && response.data != null) {
      _gameItems = response.data!.games;
      _thresholdSec = response.data!.thresholdTime;
      _matchOverTime = response.data!.overTime;
      for (GamePremadeItem item in _gameItems) {
        if (widget.type == item.roomType) {
          if (!_selectGames.contains(item)) _selectGames.add(item);
          break;
        }
      }
      if (mounted) setState(() {});
    }
  }

  Future<void> _cancelMatch(GamePremadeItem item) async {
    DataRsp<bool> response =
        await PremadeRequestManager.cancelMatch(item.roomType ?? '');
    if (response.success == true) {
      _selectGames.remove(item);
    } else {
      Fluttertoast.showToast(msg: response.msg);
    }
  }

  /// 房间匹配
  Future<bool> _matchRoom(String? type, {int quick = 0}) async {
    _matchStartTimes[type ?? ''] = DateTime.now();
    PremadeFloatingWindow.isStartMatching = true;
    Tracker.instance.track(TrackEvent.game_match, properties: {
      'game_type': type,
    });
    Tracker.instance.timeEvent(TrackEvent.game_match_success);
    Map result = await HomeRepository.matchRoom(type ?? '', quick: quick);
    if (!mounted || result.isEmpty) {
      return false;
    }
    bool showWaiting = Util.parseInt(result['waiting']) > 0;
    if (showWaiting) {
      // 通过socket推送匹配结果
    } else {
      // 匹配上房间，直接进房
      _stopMatch();
      result['room_type'] = type;
      _onMatchResult(result);
    }
    return true;
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
        Navigator.of(context).pop();
        IWereWolfManager wereWolfManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_WERE_WOLF);
        wereWolfManager.openWolfGuideScreen(System.context);
        return;
      }

      String? matchType = data['type'];
      String? roomType = data['room_type'];
      if (matchType != null && matchType.isNotEmpty) {
        DateTime now = DateTime.now();
        int ds = now.difference(_matchStartTimes[roomType] ?? now).inSeconds;
        switch (matchType) {
          case 'fail':
            DataReporter.reportEvent(MatchEvent('-1', roomType, ds, 'error'));
            Fluttertoast.showToast(
                msg: K.premade_failure, gravity: ToastGravity.CENTER);
            Navigator.pop(context);
            break;
          case 'close':
            DataReporter.reportEvent(MatchEvent('-1', roomType, ds, 'close'));
            Navigator.pop(context);
            break;
          case 'm_look_on':
            DataReporter.reportEvent(
                MatchEvent('-1', matchType, ds, 'm_look_on'));
            Fluttertoast.showToast(
                msg: K.premade_failure, gravity: ToastGravity.CENTER);
            Navigator.pop(context);
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

          Navigator.of(context).pop();

          DateTime now = DateTime.now();
          int ds = now.difference(_matchStartTimes[roomType] ?? now).inSeconds;
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
            source: data['room_type'],
            refer: 'batch_match',
          );
        }
      } catch (e) {
        Log.d(e);
      }
    }
  }

  _onSocketMessage(String type, Object? data) {
    if (!Session.isLogined || data == null) return false;
    Log.d('match msg: $data');
    Map<String, dynamic> msg = data as Map<String, dynamic>;
    switch (msg['name']) {
      case 'match.succ':
        Map data = msg['data'];
        _stopMatch();
        _onMatchResult(data);

        break;
      case 'match.fail':
        _stopMatch();
        _onMatchResult({'type': 'fail'});
        break;
    }
  }

  _onPageChanged(String type, Object? data) {
    Navigator.pop(context);
    PremadeFloatingWindow.show(
      _selectGames,
      matchStartTimes: _matchStartTimes,
      overTime: _matchOverTime,
      initTimeSec: _matchingTimerKey.currentState?.waitedTimes ?? 60,
    );
  }
}

/// 匹配计时器widget
class MatchingTimerWidget extends StatefulWidget {
  final ValueChanged<int>? timeCallback;
  final TextStyle? textStyle;
  final String? prefixText;
  final int? initTimeSec;
  final bool reverse;

  const MatchingTimerWidget(
      {Key? key,
      this.textStyle,
      this.prefixText,
      this.initTimeSec,
      this.timeCallback,
      this.reverse = false})
      : super(key: key);

  @override
  MatchingTimerState createState() {
    return MatchingTimerState();
  }
}

class MatchingTimerState extends State<MatchingTimerWidget>
    with WidgetsBindingObserver {
  Timer? _waitTimer;
  int _waitSeconds = 0;

  DateTime? _pausedTime;
  int _pausedSec = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _waitTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        if (_pausedTime != null) {
          Duration diff = DateTime.now().difference(_pausedTime!);
          int ds = _waitSeconds - _pausedSec;
          if (diff.inSeconds - ds > 2) {
            if (mounted) {
              setState(() {
                if (widget.reverse) {
                  _waitSeconds = _pausedSec - diff.inSeconds;
                } else {
                  _waitSeconds = _pausedSec + diff.inSeconds;
                }
              });
            }
          }
        }
        break;
      case AppLifecycleState.paused: // 应用程序不可见，后台
        _pausedTime = DateTime.now();
        _pausedSec = _waitSeconds;
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.prefixText ?? ''}${_waitSeconds ~/ 60 >= 10 ? '' : '0'}${_waitSeconds ~/ 60} : ${_waitSeconds % 60 >= 10 ? '' : '0'}${_waitSeconds % 60}',
      maxLines: 1,
      style: widget.textStyle ?? R.textStyle.title.copyWith(fontSize: 13),
    );
  }

  resetTimer() {
    _waitTimer?.cancel();
    _waitTimer = null;
    _waitSeconds = 0;
  }

  startTimer() {
    _waitSeconds = widget.initTimeSec ?? 1;
    _waitTimer =
        Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) {
      if (widget.reverse) {
        _waitSeconds--;
      } else {
        _waitSeconds++;
      }

      if (mounted) {
        setState(() {});
      }
      if (widget.timeCallback != null) {
        widget.timeCallback!(_waitSeconds);
      }
    });
    if (mounted) {
      setState(() {});
    }
  }

  int get waitedTimes => _waitSeconds;
}
