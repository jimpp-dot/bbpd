import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/craving_activity.pb.dart';
import 'package:flutter/material.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;

class RoomWorldBossActWidget extends StatefulWidget {
  final ChatRoomData room;

  const RoomWorldBossActWidget({Key? key, required this.room})
      : super(key: key);

  @override
  State<RoomWorldBossActWidget> createState() => _RoomWorldBossActWidgetState();
}

class _RoomWorldBossActWidgetState extends State<RoomWorldBossActWidget> {
  final String _eventType = 'Action.pb.world.boss.progress';

  late final Timer _timer;

  CravingProgressData? _actInfo;
  CravingResource? _resData;

  int _remindTime = 0;

  bool _isFold = false;

  int _lastCheckState = 0;

  int get _curCheckState => _actInfo?.monsterCurrentState.toInt() ?? 0;

  @override
  void initState() {
    super.initState();
    _loadActInfo();
    widget.room.addListener(_eventType, _onEvent);
    eventCenter.addListener(EventConstant.EventReceiveH5Message, _onEvent);
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  @override
  void dispose() {
    _timer.cancel();
    widget.room.removeListener(_eventType, _onEvent);
    eventCenter.removeListener(EventConstant.EventReceiveH5Message, _onEvent);
    super.dispose();
  }

  void _loadActInfo() async {
    if (_lastCheckState != _curCheckState && _lastCheckState != 0) return;

    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/act/craving/progress',
        queryParameters: {'rid': widget.room.rid},
        pb: true,
      );
      ApiCravingProgressResponse resp =
          ApiCravingProgressResponse.fromBuffer(response.bodyBytes);
      if (resp.success) {
        _resData = resp.data.resource;
        _checkAndUpdate(resp.data.processData);
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  void _onTick(Timer timer) {
    if (_hideWidget || _isFold || _remindTime == 0) return;
    _remindTime--;
    if (_remindTime == 0) {
      _lastCheckState = _curCheckState;
      Future.delayed(
          Duration(milliseconds: Random().nextInt(1000) + 2000), _loadActInfo);
    }
    refresh();
  }

  void _onEvent(String type, dynamic data) {
    CravingProgressData? newData;
    try {
      if (type == _eventType && data is Uint8List) {
        newData = CravingProgressData.fromBuffer(data);
      } else if (data is Map) {
        newData = CravingProgressData(
          monsterId: data['monster_id'],
          monsterLevel: data['monster_level'],
          monsterCurrentHp: _toInt64(data['monster_current_hp']),
          monsterStartAt: _toInt64(data['monster_start_at']),
          monsterEndAt: _toInt64(data['monster_end_at']),
          monsterCurrentState: _toInt64(data['monster_current_state']),
          monsterUrl: data['monster_url'],
        );
      }
      if (newData != null) {
        _checkAndUpdate(newData);
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  $fixnum.Int64 _toInt64(dynamic data) =>
      $fixnum.Int64.parseInt(data.toString());

  void _checkAndUpdate(CravingProgressData newData) {
    if (_actInfo == null ||
        _actInfo!.monsterCurrentState != newData.monsterCurrentState ||
        (_actInfo!.monsterLevel < newData.monsterLevel ||
            (_actInfo!.monsterLevel == newData.monsterLevel &&
                _actInfo!.monsterCurrentHp > newData.monsterCurrentHp))) {
      eventCenter
          .emit(EventConstant.EventSendH5Message, {}); // 发送触发h5刷新消息，无需传递数据
      _actInfo = newData;
      _resetRemindTime();
      refresh();
    }
  }

  void _resetRemindTime() {
    if (_actInfo == null) return;
    if (_actInfo!.monsterCurrentState == 2) {
      _remindTime =
          _actInfo!.monsterEndAt.toInt() - DateTime.now().secondsSinceEpoch;
    } else {
      _remindTime =
          _actInfo!.monsterStartAt.toInt() - DateTime.now().secondsSinceEpoch;
    }
    if (_remindTime < 0) {
      _remindTime = 0;
    }
  }

  bool get _hideWidget =>
      _resData == null ||
      _actInfo == null ||
      _actInfo!.monsterCurrentState == 0 ||
      _actInfo!.monsterCurrentState == 4;

  void _changeShowStatus(bool isFold) {
    _isFold = isFold;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    if (_hideWidget) return const SizedBox.shrink();
    if (_isFold) return _buildExpandBar();
    return GestureDetector(
      onTap: () {
        String jumpUrl = _resData?.jumpUrl ?? '';
        if (jumpUrl.isNotEmpty) {
          SchemeUrlHelper.instance().jump(jumpUrl, type: 'web');
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 8),
        child: SizedBox(
          width: 60,
          height: 110,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              _buildBackground(),
              PositionedDirectional(top: 2, end: 0, child: _buildFoldBtn()),
              PositionedDirectional(bottom: 3, child: _buildBossInfo()),
              PositionedDirectional(bottom: 26, child: _buildBossIcon()),
              PositionedDirectional(top: 28, child: _buildTimer()),
            ],
          ),
        ),
      ),
    );
  }

  /// 折叠按钮
  Widget _buildFoldBtn() {
    return GestureDetector(
      onTap: () => _changeShowStatus(true),
      child: Container(width: 18, height: 18, color: Colors.transparent),
    );
  }

  /// 展开按钮
  Widget _buildExpandBar() {
    return GestureDetector(
      onTap: () => _changeShowStatus(false),
      child: R.img(
        Util.getRemoteImgUrl(_resData?.icExpandBar ?? ''),
        width: 60,
        height: 20,
        fit: BoxFit.fill,
      ),
    );
  }

  /// 背景
  Widget _buildBackground() {
    return R.img(
      Util.getRemoteImgUrl(_resData?.entranceBg ?? ''),
      width: 60,
      height: 110,
      fit: BoxFit.fill,
    );
  }

  /// 倒计时
  Widget _buildTimer() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        R.img(Util.getRemoteImgUrl(_timerIcon),
            height: 12, fit: BoxFit.fitHeight),
        const SizedBox(width: 4),
        NumText(
          TimeUtil.timerText(_remindTime),
          style: const TextStyle(
              color: Color(0xFFB43A32),
              fontSize: 10,
              fontWeight: FontWeight.w800),
        ),
      ],
    );
  }

  /// boss图标
  Widget _buildBossIcon() {
    return R.img(
      Util.getRemoteImgUrl(_actInfo?.monsterUrl ?? ''),
      width: 36,
      height: 36,
      fit: BoxFit.fill,
    );
  }

  /// boss血量信息
  Widget _buildBossInfo() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        R.img(Util.getRemoteImgUrl(_resData?.icBlood ?? ''),
            height: 8, fit: BoxFit.fitHeight),
        const SizedBox(width: 4),
        NumText(
          _curBlood,
          style: const TextStyle(
              color: Color(0xFFFFFFDB),
              fontSize: 8,
              fontWeight: FontWeight.w700,
              height: 1.1),
        ),
      ],
    );
  }

  String get _timerIcon =>
      (_actInfo?.monsterCurrentState == 2
          ? _resData?.icAttack
          : _resData?.icTimer) ??
      '';

  String get _curBlood {
    double hp = _actInfo?.monsterCurrentHp.toDouble() ?? 0;
    if (hp < 0) {
      return '0';
    }
    return hp > 10000
        ? '${(hp / 10000).toStringAsFixed(2)}W'
        : hp.toStringAsFixed(0);
  }
}
