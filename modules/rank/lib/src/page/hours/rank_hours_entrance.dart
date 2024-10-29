import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/banban_rank_common.pb.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/page/hours/rank_hours_dialog.dart';

enum ContentType {
  shine,
  hours,
  timer,
  hidden,
}

const _switchSeconds = 3;

/// 荣耀小时榜入口
class RankHoursEntrance extends StatefulWidget {
  final int rid;
  final Map<String, dynamic> data;
  final ValueNotifier<int> tickNotifier;

  const RankHoursEntrance(
      {super.key,
      required this.rid,
      required this.data,
      required this.tickNotifier});

  @override
  State<RankHoursEntrance> createState() => _RankHoursEntranceState();
}

class _RankHoursEntranceState extends State<RankHoursEntrance> {
  RoomHourStarRankTop? _shineData;
  ContentType _contentType = ContentType.hidden;
  String? countdownStr;

  int _switchCountdown = 0;
  int _refreshShineDataDuration = 0;

  @override
  void initState() {
    super.initState();
    widget.tickNotifier.addListener(_onTick);
    _updateType();
  }

  @override
  void dispose() {
    widget.tickNotifier.removeListener(_onTick);
    super.dispose();
  }

  void _updateType() {
    ContentType typeA, typeB = ContentType.hidden;
    DateTime now = DateTime.now();
    if (now.isAfter(widget.data['countStart']) &&
        now.isBefore(widget.data['countEnd'])) {
      // 倒计时阶段
      countdownStr = TimeUtil.timerText(
          (widget.data['countEnd'] as DateTime).difference(now).inSeconds);

      typeA = ContentType.timer;
      typeB = ContentType.shine;
    } else {
      // 非倒计时阶段
      typeA = ContentType.shine;
      typeB = ContentType.hours;
    }

    if (_switchCountdown < 1) {
      _contentType = _contentType == typeB ? typeA : typeB;
      _switchCountdown = _switchSeconds;
    } else {
      _switchCountdown--;
    }
  }

  void _onTick() {
    // 在非活动时间内，hide
    DateTime now = DateTime.now();
    if (now.isBefore(widget.data['showAt']) ||
        now.isAfter(widget.data['hideAt'])) {
      _contentType = ContentType.hidden;
      return;
    }

    _updateType();

    _refreshShineDataDuration--;
    if (_refreshShineDataDuration <= 0) {
      //每小时刷新一次高光之星的数据
      _refreshShineDataDuration = 3600;
      if (_contentType != ContentType.hidden) {
        _refreshShineAvatars();
      }
    }

    refresh();
  }

  @override
  Widget build(BuildContext context) {
    String? icon = _iconAssets;
    return GestureDetector(
      onTap: () {
        Tracker.instance.track(TrackEvent.rank_hours_click,
            properties: {'rid': widget.rid});
        _refreshShineAvatars();
        RankHoursDialog.show(context, widget.rid);
      },
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            if (icon != null)
              R.img(icon, fit: BoxFit.fill, width: 60, height: 60),
            if (_contentType == ContentType.shine && _shineData != null)
              _shineWidget(),
            if (_contentType == ContentType.timer)
              PositionedDirectional(bottom: 0, child: _timerWidget()),
          ],
        ),
      ),
    );
  }

  String? get _iconAssets {
    switch (_contentType) {
      case ContentType.shine:
        return Assets.rank$rank_hours_entrance_shine_webp;
      case ContentType.hours:
        return Assets.rank$rank_hours_entrance_hour_webp;
      case ContentType.timer:
        return Assets.rank$rank_hours_entrance_countdown_webp;
      case ContentType.hidden:
        return null;
    }
  }

  /// 刷新高光之星的头像
  Future _refreshShineAvatars() async {
    ResGloryHourEntranceRefresh? res;
    try {
      XhrResponse response = await Xhr.postPb(
        "${System.domain}go/yy/rank/gloryHourRefresh",
        {'rid': widget.rid.toString()},
        throwOnError: true,
      );
      res = ResGloryHourEntranceRefresh.fromBuffer(response.bodyBytes);
      if (res.success) {
        _shineData = res.data.top;
      }
    } catch (e) {
      Log.d(e.toString());
    }
  }

  Widget _timerWidget() {
    return Container(
      width: 60,
      height: 27,
      alignment: AlignmentDirectional.center,
      child: NumText(
        countdownStr!,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget _shineWidget() {
    return SizedBox(
      width: 48,
      height: 42,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: const Color(0xFFF7B01C)),
              child: CommonAvatar(
                path: _shineData!.leftIcon,
                size: 24,
                shape: BoxShape.circle,
                suffix: '!head100',
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: const Color(0xFFF7B01C)),
              child: CommonAvatar(
                path: _shineData!.rightIcon,
                size: 24,
                shape: BoxShape.circle,
                suffix: '!head100',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
