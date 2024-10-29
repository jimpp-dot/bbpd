import 'dart:async';
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class MicHeartBeatReporter with WidgetsBindingObserver {
  final ChatRoomData room;

  bool _isMic = false;
  bool _mute = true;
  static int? _lastOnMicTime;
  AppLifecycleState? _appState;

  /// 麦上心跳上报
  Timer? _onMicHeartBeatTimer;

  MicHeartBeatReporter(this.room);

  Future<void> init() async {
    Log.d('MicHeartBeatReporter.init');

    _initData();
    _initMicHeartBeatTimer();
    _initListener();

    _report('enter_room');
  }

  void dispose() {
    Log.d('MicHeartBeatReporter.dispose');

    _report('exit_room', params: roomParams);

    _lastOnMicTime = 0;
    cancelMicHeartBeatTimer();
    _removeListener();
  }

  void _initData() {
    _isMic = room.isMic;
    _mute = room.mute;
    _appState = AppLifecycleState.resumed;
  }

  void _initMicHeartBeatTimer() {
    cancelMicHeartBeatTimer();

    _onMicHeartBeatTimer = Timer.periodic(const Duration(seconds: 10), _onMicHeartBeat);
  }

  void _initListener() {
    _removeListener();

    room.addListener(RoomConstant.Event_Refresh, _onRoomRefresh);
    WidgetsBinding.instance.addObserver(this);
  }

  void _removeListener() {
    WidgetsBinding.instance.removeObserver(this);
    room.removeListener(RoomConstant.Event_Refresh, _onRoomRefresh);
  }

  void cancelMicHeartBeatTimer() {
    _onMicHeartBeatTimer?.cancel();
    _onMicHeartBeatTimer = null;
  }

  void _onRoomRefresh(String name, dynamic data) {
    isMic = room.isMic;
    mute = room.mute;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _onAppStateChanged(state);
  }

  void _onAppStateChanged(AppLifecycleState state) {
    Log.d('MicHeartBeatReporter._onAppStateChanged, state: $state');
    _appState = state;
    if (state == AppLifecycleState.inactive) {
      _report('switch_backend');
    } else if (state == AppLifecycleState.resumed) {
      _report('switch_front');
    }
  }

  set mute(bool mute) {
    if (_mute != mute) {
      _report(mute ? 'close_mic' : 'open_mic', params: roomParams);
      _mute = mute;
    }
  }

  set isMic(bool mic) {
    if (_isMic != mic) {
      _report(mic ? 'onmic' : 'offmic', params: roomParams);
      _isMic = mic;
      if (mic) {
        _lastOnMicTime = room.timestamp;
      } else {
        _lastOnMicTime = 0;
      }
    }
  }

  void _onMicHeartBeat(Timer timer) {
    // Log.d('MicHeartBeatReporter._onAppStateChanged, isMic: ${_isMic}');

    _report('normal');
  }

  Map<String, String> get roomParams => {
    'rid': '${room.realRid}',
    'position_id': '${room.positionForCurrentUser?.position ?? -1}',
    'dateline': '${room.timestamp}',
    'position_role': describeEnum(room.purview),
    'owner_uid': '${room.createor?.uid}',
    'room_property': describeEnum(room.config?.property),
    'room_type': '${room.config?.type}',
    'room_types': describeEnum(room.config?.types),
    'game_type': describeEnum(room.config?.game),
    'room_factory_type': room.config?.originalRFT ?? '',
    'position_num': '${room.positions.length ?? 0}',
    'is_open_reception': '${(room.config?.reception ?? false) ? 1 : 0}',
    'is_open_payer': '${(room.config?.paier ?? 0)}',
    'onmic_time': '${_lastOnMicTime ?? 0}',
    'refer': room.refer ?? '',
    'mic_state': room.mute ? 'close' : 'open',
  };

  Future<void> _report(String type, {Map<String, String>? params}) async {
    params ??= roomParams;

    int rid = Util.parseInt(params['rid']);

    if (rid <= 0) return;

    String v = '${params['rid']}${params['position_id']}${params['dateline']}yrWsnO8CMf3gaatp';
    Digest digest = sha1.convert(utf8.encode(v));
    v = digest.toString();

    await Xhr.getJson(
      '${System.dataDomain}nginx/behavior',
      params: {
        'event_name': 'onmic_heartbeat',
        'event_time': '${DateTime.now().millisecondsSinceEpoch}',
        'account_id': '${Session.uid}',
        'type': type,
        'zone_offset': '${DateTime.now().timeZoneOffset.inHours}',
        'system_language': Translations.getLan(),
        'os_version': DeviceInfo.systemVersion,
        'mac': DeviceInfo.mac,
        'did': DeviceInfo.did,
        'app_version': Constant.versionName,
        'channel': DeviceInfo.channel,
        'app_id': BaseConfig.instance.trackerAppId,
        'p_state': _appState == AppLifecycleState.resumed ? 'front' : 'backend',
        'v': v,
        ...params,
      },
    );
  }
}
