import 'dart:math';
import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';
import 'package:chat_room/src/cplink/model/cplink_repo.dart';
import 'package:chat_room/src/cplink/widget/hand_success_widget.dart';
import 'package:chat_room/src/cplink/model/cplink_event.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;

import '../../../k.dart';
import '../../protobuf/generated/auction.pb.dart';
import '../../protobuf/generated/cplink.pb.dart';
import 'cplink_diy_apply_dialog.dart';
import 'cplink_diy_relation_widget.dart';
import 'cplink_v2_operate_panel.dart';
import 'cplink_total_progress_widget.dart';
import 'cplink_user_icon.dart';
import 'heart_link.dart';

class CpLinkV2StartWidget extends StatefulWidget {
  final double circleSize;
  final bool displayEmote;
  final ChatRoomData room;

  const CpLinkV2StartWidget(
      {Key? key,
      required this.circleSize,
      required this.displayEmote,
      required this.room})
      : super(key: key);

  @override
  _CpLinkV2StartWidgetState createState() => _CpLinkV2StartWidgetState();
}

class _CpLinkV2StartWidgetState extends State<CpLinkV2StartWidget>
    with TickerProviderStateMixin {
  double smallIconR = 28.0;
  double bigIconR = 28.0;

  double get r => widget.circleSize / 2;

  double get bigR => widget.circleSize / 2 + bigIconR;

  late List<Offset> _offsets;

  late List<RoomPosition> positionList;
  CpLinkState? _cpLinkState;
  final List<int> _animatingUids = <int>[];

  late Animation<double> _animation;
  late AnimationController _animationController;

  PositionChangeEvent? _curChangeEvent;
  final List<PositionChangeEvent> _changeEvents = <PositionChangeEvent>[];
  int? _checkedRelationIndex;

  late Throttle _delayTimeThrottle;

  CpLinkConfigData? _lastCpData;

  CplinkMessage? _relationData;

  @override
  void initState() {
    super.initState();
    _offsets = [
      Offset(bigR - r / 2, bigR - r * cos(pi / 6)), //0
      Offset(bigR - r, bigR), //1
      Offset(bigR - r / 2, bigR + r * cos(pi / 6)), //2
      Offset(bigR + r / 2, bigR - r * cos(pi / 6)), //3
      Offset(bigR + r, bigR), //4
      Offset(bigR + r / 2, bigR + r * cos(pi / 6)), //5
    ];
    positionList = widget.room.positions.sublist(1, 7);
    _cpLinkState = cpLinkConfig?.state;
    _delayTimeThrottle = Throttle();
    widget.room.addListener(RoomConstant.Event_Refresh, _onPositionChanged);
    widget.room
        .addListener(RoomConstant.Event_CpLink_V2_Sync, _onRelationRefresh);
    widget.room.addListener(
        '${RoomConstant.Event_Prefix}auction.defend.diy.emit',
        _onAuctionDiyEvent);
    _lastCpData = cpLinkConfig;

    if (_cpLinkState == CpLinkState.hand) {
      _loadRelations();
    }

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animationController.addStatusListener(_onAnimationStatus);
    _animationController.addListener(_onAnimation);
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
  }

  List<RoomPosition> switchPosition(
      int firstIndex, int secondIndex, List<RoomPosition> listData) {
    List<RoomPosition> tempList = List.from(listData);

    RoomPosition firstRp = tempList[firstIndex];
    RoomPosition secondRp = tempList[secondIndex];

    tempList[firstIndex] = secondRp;
    tempList[secondIndex] = firstRp;

    return tempList;
  }

  @override
  void didUpdateWidget(covariant CpLinkV2StartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.room.config?.configExpendData is CpLinkConfigData &&
        _lastCpData != null) {
      CpLinkConfigData oldCpData = _lastCpData!;
      CpLinkConfigData newCpData =
          widget.room.config?.configExpendData as CpLinkConfigData;
      Log.d(
          tag: 'cp-link',
          'oldCpData.state=${oldCpData.state},newCpdata.state=${newCpData.state}');
      bool loadRelation = false;
      if (oldCpData.state != CpLinkState.hand &&
          newCpData.state == CpLinkState.hand) {
        loadRelation = true;
      } else if (oldCpData.state == CpLinkState.hand &&
          newCpData.state == CpLinkState.hand &&
          newCpData.fetchRelation) {
        loadRelation = true;
      } else if (newCpData.state != CpLinkState.hand) {
        _clearRelation();
      }
      if (loadRelation) {
        _loadRelations();
      }
    }
  }

  _loadRelations() async {
    RespCplinkDefendProgressApi resp =
        await CpLinkRepo.progressList(widget.room.rid);
    if (resp.success && cpLinkData?.state == CpLinkState.hand) {
      _relationData = resp.data;
      _refresh();
    }
  }

  _clearRelation() {
    _relationData = null;
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.room.removeListener(RoomConstant.Event_Refresh, _onPositionChanged);
    widget.room
        .removeListener(RoomConstant.Event_CpLink_V2_Sync, _onRelationRefresh);
    widget.room.removeListener(
        '${RoomConstant.Event_Prefix}auction.defend.diy.emit',
        _onAuctionDiyEvent);
    _changeEvents.clear();
    _delayTimeThrottle.dispose();
    _animationController.stop();
    _animationController.removeListener(_onAnimation);
    _animationController.removeStatusListener(_onAnimationStatus);
    _animationController.dispose();

    super.dispose();
  }

  CpLinkConfigData? get cpLinkConfig =>
      widget.room.config?.configExpendData as CpLinkConfigData?;

  _onPositionChanged(String type, dynamic data) {
    Log.d(
        'In cplink widget, receive position changed msg, type: $type, data:$data');
    _addChange(widget.room.positions.sublist(1, 7));

    if (_cpLinkState == CpLinkState.wait &&
        cpLinkConfig?.state == CpLinkState.heart) {
      _refresh();
    }
  }

  _onRelationRefresh(String type, dynamic value) {
    Log.d('_onRelationRefresh, type: $type');
    if (value != null && value is Uint8List) {
      _relationData = CplinkMessage.fromBuffer(value);
      Log.d('_onRelationRefresh, _relationData: $_relationData');
      refresh();
    }
  }

  void _onAuctionDiyEvent(String name, dynamic value) {
    if (value is Map) {
      try {
        AuctionDefendDiyEmitMessage? data;
        if (value.containsKey('pb')) {
          data = AuctionDefendDiyEmitMessage.fromBuffer(
              List<int>.from(value['pb']));
        }
        if (data != null && data.targetUid == Session.uid) {
          Log.d(data.toProto3Json());
          CpLinkDiyApplyDialog.show(context, data: data);
        }
      } catch (e, st) {
        Log.e(e, stackTrace: st);
      }
    }
  }

  void _addChange(List<RoomPosition> data) {
    List<RoomPosition> newPositionList = data;

    int tempUid = -1;
    int tempIndex = -1;
    PositionChangeEvent changeEvent = PositionChangeEvent(
        positionList: newPositionList, data: <PositionChangeData>[]);

    List<RoomPosition> lastList = positionList;
    if (_changeEvents.isNotEmpty) {
      lastList = _changeEvents.last.positionList ?? [];
    }

    for (int i = 0; i < lastList.length; i++) {
      tempUid = lastList[i].uid;

      if (tempUid <= 0) continue;

      tempIndex = newPositionList.indexWhere((_) => _.uid == tempUid);

      if (tempIndex < 0) continue;

      if (tempIndex != i) {
        changeEvent.data?.add(
            PositionChangeData(uid: tempUid, fromIndex: i, toIndex: tempIndex));
      }
    }

    if (_changeEvents.isEmpty) {
      _changeEvents.add(changeEvent);
    } else {
      PositionChangeEvent lastEvent = _changeEvents.last;
      if (lastEvent.data?.isEmpty == true &&
          changeEvent.data?.isEmpty == true) {
        //不需要麦位移动动画，更新list
        lastEvent.positionList = data;
      } else {
        _changeEvents.add(changeEvent);
      }
    }

    _scheduleChangeEvents();
  }

  bool get isAnimating =>
      _curChangeEvent != null && _curChangeEvent?.data?.isNotEmpty == true;

  void _scheduleChangeEvents() {
    Log.d(
        'In cplink widget, schedule change event, event size: ${_changeEvents.length}, isAnimating: $isAnimating');
    if (_changeEvents.isEmpty) return;

    if (isAnimating) return;

    PositionChangeEvent changeEvent = _changeEvents[0];
    if (changeEvent.data?.isEmpty == true) {
      setState(() {
        positionList = changeEvent.positionList ?? [];
        _changeEvents.remove(changeEvent);
      });
    } else {
      _startAnimation(changeEvent);
    }
  }

  Widget _buildItem(RoomPosition roomPosition) {
    int index = positionList.indexOf(roomPosition);
    if (index < 0 || index >= _offsets.length) return const SizedBox();

    double iconSize =
        (index == 1 || index == 4) ? bigIconR * 2 : smallIconR * 2;

    Offset offset = getIconTopLeftOffset(index);

    bool isAnimating = _animatingUids.contains(roomPosition.uid);

    bool showCrown = false;
    if (widget.room.config != null &&
        widget.room.config?.configExpendData != null &&
        (widget.room.config?.configExpendData is CpLinkConfigData)) {
      CpLinkState cpLinkState =
          (widget.room.config?.configExpendData as CpLinkConfigData).state;
      showCrown = roomPosition.uid > 0 &&
          (roomPosition.position == 2 || roomPosition.position == 5) &&
          cpLinkState == CpLinkState.heart &&
          (widget.room.config?.configExpendData as CpLinkConfigData)
              .heartValue
              .isNotEmpty;
    }

    return PositionedDirectional(
      start: offset.dx,
      top: showCrown ? offset.dy - 24 : offset.dy,
      child: CpLinkUserIcon(
        iconSize: iconSize,
        room: widget.room,
        displayEmote: widget.displayEmote,
        isAnimating: isAnimating,
        roomPosition: roomPosition,
        assist: widget.room.cpLinkAssist,
      ),
    );
  }

  Widget _buildAnimatedItem(RoomPosition roomPosition) {
    return SizedBox(
      width: smallIconR * 2,
      height: smallIconR * 2 + 4,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: CommonAvatar(
              path: roomPosition.icon,
              shape: BoxShape.circle,
              size: smallIconR * 2,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: CpLinkUserLabel(roomPosition),
          ),
        ],
      ),
    );
  }

  _startAnimation(PositionChangeEvent changeEvent) {
    Log.d(
        'In cplink widget, start position animation and send event: ${RoomConstant.Event_Room_Position_Change}');

    _animationController.reset();
    _animationController.forward(from: 0.0);

    eventCenter.emit(RoomConstant.Event_Room_Position_Change, changeEvent.data);
  }

  _onAnimation() {
    Log.d(
        'In cplink widget, animating with value: ${_animationController.value}');
    if (mounted) setState(() {});
  }

  _onAnimationStatus(AnimationStatus status) {
    Log.d('In cplink widget, animation status change: $status');

    if (status == AnimationStatus.forward) {
      setState(() {
        _curChangeEvent = _changeEvents[0];
      });
    } else if (status == AnimationStatus.completed) {
      setState(() {
        positionList = _curChangeEvent?.positionList ?? [];
        _changeEvents.remove(_curChangeEvent);
        _curChangeEvent = null;
        _animatingUids.clear();
      });
      _scheduleChangeEvents();
    }
  }

  Offset getIconTopLeftOffset(int index,
      {bool forceSmall = false, List<Offset>? offsets}) {
    List<Offset> offs = offsets ?? _offsets;

    if ((index == 1 || index == 4) && !forceSmall) {
      return offs[index].translate(-bigIconR, -bigIconR);
    } else {
      return offs[index].translate(-smallIconR, -smallIconR);
    }
  }

  Offset getIconRightOffset(int index, {List<Offset>? offsets}) {
    List<Offset> offs = offsets ?? _offsets;
    if (index == 1 || index == 4) {
      return offs[index].translate(bigIconR, 0);
    } else {
      return offs[index].translate(smallIconR, 0);
    }
  }

  Offset getIconLeftOffset(int index, {List<Offset>? offsets}) {
    List<Offset> offs = offsets ?? _offsets;
    if (index == 1 || index == 4) {
      return offs[index].translate(-bigIconR, 0);
    } else {
      return offs[index].translate(-smallIconR, 0);
    }
  }

  List<Widget> _buildAnimation() {
    List<Widget> animatedWidget = <Widget>[];

    if (_curChangeEvent != null && _curChangeEvent!.data?.isNotEmpty == true) {
      for (var _ in _curChangeEvent!.data!) {
        Offset offset = OffsetTween(
                begin: getIconTopLeftOffset(_.fromIndex, forceSmall: true),
                end: getIconTopLeftOffset(_.toIndex, forceSmall: true))
            .evaluate(_animation);
        animatedWidget.add(PositionedDirectional(
            top: offset.dy,
            start: offset.dx,
            child: _buildAnimatedItem(positionList[_.fromIndex])));
        _animatingUids.add(_.uid);
      }
    }
    return animatedWidget;
  }

  Widget _buildLink() {
    List<Offset> innerOffsets = [
      Offset(r / 2, r * (1 - cos(pi / 6))), //0
      Offset(0, r), //1
      Offset(r / 2, r * (1 + cos(pi / 6))), //2
      Offset(r * 3 / 2, r * (1 - cos(pi / 6))), //3
      Offset(r * 2, r), //4
      Offset(r * 3 / 2, r * (1 + cos(pi / 6))), //5
    ];

    List<Offset> linkOffsets = [];
    for (int i = 0; i < innerOffsets.length; i++) {
      linkOffsets.add(i <= 2
          ? getIconRightOffset(i, offsets: innerOffsets)
          : getIconLeftOffset(i, offsets: innerOffsets));
    }

    return HeartLinkWidget(
      room: widget.room,
      circleSize: widget.circleSize,
      offsets: innerOffsets,
      positionList: positionList,
    );
  }

  Widget _buildStepItem(String title, bool isActive) {
    return GradientBorder(
      borderGradient: LinearGradient(
        colors: isActive
            ? [const Color(0xFFCD90FF), const Color(0xFFC177FF)]
            : [
                const Color(0xFFCD90FF).withOpacity(0.3),
                const Color(0xFFC177FF).withOpacity(0.3)
              ],
      ),
      borderRadius: 9,
      borderWidth: 1,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 8, end: 8, top: 1.5, bottom: 1),
        margin: const EdgeInsets.all(1),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            colors: isActive
                ? [const Color(0xFFC866FF), const Color(0xFFB25AFF)]
                : [
                    const Color(0xFFC866FF).withOpacity(0.3),
                    const Color(0xFFB25AFF).withOpacity(0.3)
                  ],
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
              fontSize: 10),
        ),
      ),
    );
  }

  CpLinkConfigData? get cpLinkData =>
      widget.room.config?.configExpendData as CpLinkConfigData?;

  int get stepIndex {
    return CpLinkState.values.indexOf(cpLinkData?.state ?? CpLinkState.wait);
  }

  Widget _buildStep() {
    List<String> steps = [
      K.room_cplink_state_wait,
      K.room_cplink_state_heart,
      K.room_cplink_state_hand
    ];

    List<Widget> widgets = [];
    for (int i = 0; i < steps.length; i++) {
      widgets.add(_buildStepItem(steps[i], stepIndex >= i));

      if (i < steps.length - 1) {
        widgets.add(
          Container(
            width: 12,
            height: 2,
            margin: const EdgeInsetsDirectional.only(start: 3, end: 3),
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: LinearGradient(
                colors: stepIndex >= i
                    ? [const Color(0xFFD99BFC), const Color(0xFFE1A0FD)]
                    : [
                        const Color(0xFFD99BFC).withOpacity(0.3),
                        const Color(0xFFE1A0FD).withOpacity(0.3)
                      ],
              ),
            ),
          ),
        );
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }

  String getTimerText() {
    int seconds = (widget.room.config?.counter ?? 0) - (widget.room.timestamp);

    String twoDigits(int n) => n >= 10 ? "$n" : "0$n";

    String text;
    if (seconds > 60) {
      text = '${twoDigits(seconds ~/ 60)}:${twoDigits(seconds % 60)}';
    } else if (seconds <= 0) {
      text = '';
      refresh();
    } else {
      text = '${twoDigits(seconds)} S';
    }
    return text;
  }

  Widget _buildCounter() {
    if (widget.room.config == null ||
        widget.room.config!.counter < widget.room.timestamp) {
      return const SizedBox(
        height: 16,
      );
    }

    bool isAdmin = Session.uid == widget.room.positions[0].uid;
    const Color delayColor = Color(0xFFFFD274);
    return Container(
      height: 16,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: Colors.black.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 6),
          TimerWidget(
            key: GlobalKey(),
            stop: Duration(
                seconds: widget.room.config!.counter - widget.room.timestamp),
            builder: (context) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 58),
              child: Text(
                '${K.room_count_timer}: ${getTimerText()}',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6), fontSize: 10),
              ),
            ),
          ),
          const SizedBox(width: 5),
          if (isAdmin && cpLinkData?.state == CpLinkState.hand)
            InkWell(
              onTap: () {
                _delayTimeThrottle.call(() => CpLinkModel.delay(widget.room));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    K.room_cplink_delay,
                    style: const TextStyle(
                      fontSize: 10,
                      color: delayColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(-4.0, 0.0, 0.0),
                    child: R.img(
                      'ic_next_small.svg',
                      width: 16,
                      height: 16,
                      color: delayColor,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _buildCpLinkCircle() {
    final isWait = cpLinkData?.state == CpLinkState.wait;
    return SizedBox(
      height: 290,
      // width: double.infinity,
      width: 335,
      child: CachedNetworkImage(
        imageUrl: Util.getImgUrl(
            isWait
                ? 'cplink/cplink_circle_bg.png'
                : 'cplink/cplink_linking_bg.png',
            package: ComponentManager.MANAGER_BASE_ROOM),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _lastCpData = cpLinkConfig;
    final isHand = cpLinkData?.state == CpLinkState.hand;
    bool isAdmin = Session.uid == widget.room.positions[0].uid;
    var showLinkRelation = isAdmin && isHand;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        CpLinkV2OperatePanel(
          room: widget.room,
          displayEmote: widget.displayEmote,
          stepWidget: _buildStep(),
          counterWidget: _buildCounter(),
          checkedRelationIndex: _checkedRelationIndex,
          setCheckedRelationIndex: (checkedRelationIndex) =>
              _checkedRelationIndex = checkedRelationIndex,
        ),
        isHand ? _buildHandSuccess() : _buildCpLinking(),
        if (!showLinkRelation) const SizedBox(height: 21),
      ],
    );
  }

  Widget _buildCpLinking() {
    return Stack(
      children: [
        _buildCpLinkCircle(),
        Positioned.fill(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: 2 * bigR,
                  height: 2 * bigR,
                ),
                _buildLink(),
                ...positionList.map((_) => _buildItem(_)).toList(),
                ..._buildAnimation(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHandSuccess() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          width: 335,
          height: 290,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(Util.getImgUrl(
                  'cplink/cplink_hand_bg.webp',
                  package: ComponentManager.MANAGER_BASE_ROOM)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HandSuccessWidget(
              iconRadius: bigIconR,
              room: widget.room,
              displayEmote: widget.displayEmote,
              luck: true,
            ),
            CpLinkTotalProgressWidget(
              room: widget.room,
              relationData: _relationData,
            ),
          ],
        ),
        if (cpLinkData?.state == CpLinkState.hand)
          CpLinkDiyRelationWidget(room: widget.room, data: _relationData),
      ],
    );
  }
}

class CpLinkCircleBg extends StatelessWidget {
  final double size;

  const CpLinkCircleBg({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CpLinkCircleBgPainter(),
      size: Size(size, size),
    );
  }
}

class CpLinkCircleBgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0x33FFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1);
    double radius = size.width / 2;
    canvas.drawCircle(Offset(radius, radius), radius, paint);

    double outerShadowWidth = 1;
    Paint leftPaint = Paint()
      ..color = const Color(0x665BABFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
    canvas.drawArc(
        Rect.fromLTRB(outerShadowWidth, outerShadowWidth,
            size.width - outerShadowWidth, size.height - outerShadowWidth),
        pi / 2,
        pi,
        false,
        leftPaint);

    Paint rightPaint = Paint()
      ..color = const Color(0x66FF6AC3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
    canvas.drawArc(
        Rect.fromLTRB(outerShadowWidth, outerShadowWidth,
            size.width - outerShadowWidth, size.height - outerShadowWidth),
        -pi / 2,
        pi,
        false,
        rightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
