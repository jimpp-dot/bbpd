import 'dart:math';

import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/protobuf/generated/gift_red_packet.pb.dart';
import 'package:flutter/material.dart';

import 'gift_red_envelope_repo.dart';
import 'gift_red_envelope_result.dart';

enum GREStatus {
  none,
  startCountdown,
  endCountdown,
  hasGrab,
}

typedef OnStatusChanged = void Function(int id, String action);

class GREGrabItem extends StatefulWidget {
  final int rid;
  final RobRedPacket itemData;
  final ChangeNotifier timer;
  final OnStatusChanged onStatusChanged;

  const GREGrabItem({
    super.key,
    required this.rid,
    required this.itemData,
    required this.timer,
    required this.onStatusChanged,
  });

  @override
  State<GREGrabItem> createState() => _GREGrabItemState();
}

class _GREGrabItemState extends State<GREGrabItem> {
  final RepeatCallChecker _checker = RepeatCallChecker();

  /// 开启倒计时
  late int _startCountdown;

  /// 结束倒计时
  late int _endCountdown;

  GREStatus _curStatus = GREStatus.none;

  GREStatus _getStatus() {
    if (widget.itemData.state == 1) return GREStatus.hasGrab;
    if (_startCountdown >= 0) return GREStatus.startCountdown;
    if (_endCountdown >= 0) return GREStatus.endCountdown;
    return GREStatus.none;
  }

  @override
  void initState() {
    super.initState();
    _init();
    widget.timer.addListener(_onTick);
  }

  @override
  void dispose() {
    widget.timer.removeListener(_onTick);
    super.dispose();
  }

  void _init() {
    int nowTime = DateTime.now().secondsSinceEpoch;
    _startCountdown = widget.itemData.startTime - nowTime;
    _endCountdown = widget.itemData.endTime - nowTime;
    if (_endCountdown <= 0) {
      _endCountdown = 0;
    }
    _curStatus = _getStatus();
  }

  void _onTick() {
    _startCountdown--;
    _endCountdown--;
    if (_endCountdown <= 0) {
      _endCountdown = 0;
      widget.onStatusChanged.call(widget.itemData.id, 'delete');
    }
    _curStatus = _getStatus();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _doAction,
      child: Container(
        width: 103.dp,
        height: 135.dp,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(RoomAssets
                .chat_room$gift_red_envelope_ic_gift_red_envelope_cover_webp),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            _buildName(),
            _buildAction(),
            if (_curStatus == GREStatus.endCountdown) _buildEndTimer(),
            const Spacer(),
            _buildOwner(),
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return Container(
      height: 25.dp,
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDivider(),
          Text(
            widget.itemData.name,
            style: const TextStyle(
                color: Colors.white54,
                fontSize: 8,
                fontWeight: FontWeight.w600),
          ),
          _buildDivider(isReverse: true),
        ],
      ),
    );
  }

  Widget _buildDivider({bool isReverse = false}) {
    var colors = isReverse
        ? [Colors.white54, Colors.white10]
        : [Colors.white10, Colors.white54];
    return Container(
      width: 16.dp,
      height: 0.5,
      margin: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
        ),
      ),
    );
  }

  Widget _buildAction() {
    Widget? child;
    switch (_curStatus) {
      case GREStatus.startCountdown:
        child = ColorfulTextWidget(
          gradient: const LinearGradient(
              colors: [Color(0xFFE63063), Color(0xFFB32565)]),
          child: NumText(
            _startCountdown.msStr,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        );
        break;
      case GREStatus.none:
      case GREStatus.endCountdown:
        child = R.img(
          RoomAssets.chat_room$gift_red_envelope_ic_gift_red_envelope_grab_webp,
          width: 12.dp,
          height: 12.dp,
        );
        break;
      case GREStatus.hasGrab:
        child = R.img(
          RoomAssets
              .chat_room$gift_red_envelope_ic_gift_red_envelope_has_grab_webp,
          width: 24.dp,
          height: 12.dp,
        );
        break;
    }
    return Container(
      width: 40.dp,
      height: 40.dp,
      alignment: AlignmentDirectional.center,
      child: child,
    );
  }

  Widget _buildEndTimer() {
    return Container(
      width: 80.dp,
      height: 24.dp,
      alignment: AlignmentDirectional.center,
      child: Text(
        K.room_gift_red_envelope_remaind_time([_endCountdown.msStr]),
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildOwner() {
    return Container(
      width: 88.dp,
      height: 28.dp,
      padding: EdgeInsetsDirectional.only(bottom: 12.dp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonAvatar(
            path: widget.itemData.user.icon,
            size: 16,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              Util.getEllipsisStr(widget.itemData.user.name),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Future _doAction() async {
    final int redId = widget.itemData.id;
    if (_curStatus == GREStatus.hasGrab) {
      if (_checker.isInvalidCall(key: 'show')) {
        return;
      }
      GiftRedEnvelopeResultDialog.show(context, redId);
    } else if (_curStatus == GREStatus.endCountdown) {
      if (_checker.isInvalidCall(key: 'grab')) {
        Fluttertoast.showCenter(msg: K.room_gift_red_envelope_grab_tip);
        return;
      }
      await Future.delayed(Duration(milliseconds: Random().nextInt(500)));
      NormalNull resp =
          await GiftRedEnvelopeRepo.grabGiftRedEnvelope(widget.rid, redId);
      if (resp.success) {
        widget.onStatusChanged.call(widget.itemData.id, 'refresh');
        GiftRedEnvelopeResultDialog.show(context, redId);
      } else {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    }
  }
}
