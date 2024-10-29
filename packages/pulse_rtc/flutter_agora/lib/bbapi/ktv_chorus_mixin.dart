import 'dart:convert';
import 'dart:typed_data';

import 'package:agora/agora.dart';
import 'package:agora/bbapi/agora_channel.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart' as agora;

/// 声网合唱相关逻辑，[AgoraEngine] with KtvChorusMixin，实现合唱相关功能
///
/// 声网合唱的方案主要是通过子频道实现，参与合唱的人加入子频道
/// 领唱 在主频道中推BGM和人声的合流，在子频道中推人声流
/// 合唱 在主频道中mute领唱的流，在子频道中以主播身份（但不发流，降低延迟）收领唱的人声流，
/// 观众 在主频道中收所有的流，不加入子频道
mixin KtvChorusMixin on RtcEngineInterface {
  AgoraRtcChannel? subChannel;
  KtvClientRole? ktvRole;
  RTCRoomMode? _rtcRoomMode;
  int localPlayerPosition = 0;
  int localPlayerDuration = 0;
  int dataStreamId = 0;

  MediaPlayerState localPlayerState = MediaPlayerState.playerStateNoneInternal;

  PlayerRecvSEICallback? _playerRecvSEICallback;

  String? get mainChannelName;

  agora.RtcEngineEx? get engineEx;

  String? get subChannelName => '${mainChannelName}_ex';

  String? get subChannelToken => bridge.rtcEngine.useDelegate?.subChannelToken?.call();

  int? get uid => bridge.rtcEngine.useDelegate?.uidFuc?.call();

  bool get isChorusSinger => ktvRole == KtvClientRole.LeadSinger || ktvRole == KtvClientRole.Chorus;

  bool get isKtvChorusMode => _rtcRoomMode == RTCRoomMode.ChatRoom_KTV_Chorus;

  int get audioPlayOutDelay;

  agora.MediaPlayer? get mediaPlayer;

  PlayerRecvSEICallback? get SEICallback => _playerRecvSEICallback;

  Future<void> setPushDirectAudioEnable(bool enable);

  @override
  Future<void> setKtvRole(KtvClientRole role) async {
    // 子频道Id或token为空，返回
    if (uid == 0
        || (subChannelName?.isEmpty??true)
        || (subChannelToken?.isEmpty??true)) return;

    rtcLog('SetKtvRole, role: $role, lastRole: $ktvRole');
    if (ktvRole == role) return;

    // 只有领唱推人声流到子频道
    setPushDirectAudioEnable(role == KtvClientRole.LeadSinger);

    // 退出旧的频道
    try {
      subChannel?.leaveChannel();
    } on Exception catch (e) {}
    subChannel == null;

    // 参与合唱的人需要加入子频道
    if (role == KtvClientRole.LeadSinger || role == KtvClientRole.Chorus) {
      rtcLog('KtvRole is chorus, join exchannel, channelId: $subChannelName, channelToken: $subChannelToken');
      try {
        subChannel = (await createRtcChannel(subChannelName??'')) as AgoraRtcChannel;

        // 子频道中，只有领唱需要发声
        agora.ChannelMediaOptions mediaOptions = agora.ChannelMediaOptions(
            autoSubscribeAudio: role == KtvClientRole.Chorus, // 只有伴唱才订阅人声
            autoSubscribeVideo: false,
            publishMicrophoneTrack: false,
            clientRoleType: agora.ClientRoleType.clientRoleBroadcaster, // 合唱在子频道不发声，设置为broadcaster降低延迟
            enableAudioRecordingOrPlayout: role == KtvClientRole.Chorus, // 只有伴唱才打开ADM（Audio Device Manager），播放子频道声音
            publishCustomAudioTrack: role == KtvClientRole.LeadSinger
        );
        await engineEx?.joinChannelEx(token: subChannelToken??'', connection: subChannel!.channel!, options: mediaOptions);
        await engineEx?.enableAudioVolumeIndicationEx(interval: 600, smooth: 3, reportVad: true, connection: subChannel!.channel!);
      } on Exception catch (e) {rtcLog('Catch exception: $e');}

    } else {
      try {
        engineEx?.stopAudioMixing();
      } on Exception catch (e) {rtcLog('Catch exception: $e');}
    }

    ktvRole = role;
    rtcLog('SetKtvRole finish...');
  }

  int get localTime => DateTime.now().millisecondsSinceEpoch;

  void setKtvParameters() {
    // 设置K歌属性
    engineEx?.setParameters("{\"rtc.enable_nasa2\":false}"); // 关闭nasa2，为了支持合唱低延迟
    engineEx?.setParameters("{\"rtc.ntp_delay_drop_threshold\":1000}"); // ntp timeout 时间1s
    engineEx?.setParameters("{\"rtc.video.enable_sync_render_ntp\": true}"); // 开启观众端ntp对齐
    engineEx?.setParameters("{\"rtc.net.maxS2LDelay\": 800}"); // 观众端最大delay延迟
    engineEx?.setParameters("{\"che.audio.max_mixed_participants\":8}"); // 最大支持8人合唱
    engineEx?.setParameters("{\"che.audio.neteq.prebuffer\":true}"); // 加速观众端NTP对齐时间
    engineEx?.setParameters("{\"che.audio.neteq.prebuffer_max_delay\":600}");
    engineEx?.setParameters("{\"rtc.video.enable_sync_render_ntp_broadcast\":true}"); //主播启用多端同步，静态设置
    engineEx?.setParameters("{\"rtc.net.maxS2LDelayBroadcast\":400}"); //主播的端到端延迟，静态设置
  }

  void resetKtvParameters() {
    engineEx?.setParameters("{\"rtc.video.enable_sync_render_ntp\": false}"); // 关闭观众端ntp对齐
    engineEx?.setParameters("{\"rtc.video.enable_sync_render_ntp_broadcast\":false}"); // 关闭主播端ntp对齐
    engineEx?.setParameters("{\"che.audio.max_mixed_participants\":3}"); // 最大支持3人混音
    engineEx?.setParameters("{\"che.audio.neteq.prebuffer\":false}");
  }

  Future<int> getNtpTime() async {
    var localNtpTime = await engineEx?.getNtpWallTimeInMs();
    if ((localNtpTime??0) != 0) {
      return localNtpTime!;
    } else {
      return DateTime.now().millisecondsSinceEpoch + 2208988800 * 1000;
    }
  }

  Future<void> parseLrcTime(int streamId, Map dict) async {
    if(ktvRole != KtvClientRole.Chorus) return;

    int position = dict["time"] as int;
    int duration = dict["duration"] as int;
    int remoteNtp = dict["ntp"] as int;
    MediaPlayerState state = MediaPlayerState.values.firstWhere((_) => _.value() == (dict["playerState"] as int));
    if(localPlayerState != state) {
      await _syncToCoSingerPlayerState(state);
    }

    if(await mediaPlayer?.getState() == MediaPlayerState.playerStatePlaying) {
      int localNtpTime = await getNtpTime();
      int localPosition = localTime - localPlayerPosition;
      int expectPosition = position + localNtpTime - remoteNtp + audioPlayOutDelay;
      int threshold = expectPosition - localPosition;
      if(threshold.abs() > 80) {
        rtcLog('mediaPlayer.seek, localNtpTime:$localNtpTime, localPosition:$localPosition, expectPosition: $expectPosition, threshold: $threshold, dict:$dict');
        await mediaPlayer?.seek(expectPosition);
      }
      _sendSEIInfo(streamId, expectPosition, localNtpTime, duration, state);
    }
  }

  void _sendSEIInfo(int streamId, int process, int ntpTime, int duration, MediaPlayerState playerState) {
    int state = playerState.index;

    PlayerSEIInfo info = PlayerSEIInfo(process, duration, state, ntpTime);
    Uint8List? seiData = info.toUint8List();

    if (seiData != null) _playerRecvSEICallback?.call('$streamId', seiData);
  }

  Future<void> onPositionChanged(int positionMs, int timestamp) async {
    localPlayerPosition = localTime - positionMs;
    rtcLog('onPositionChanged, localPlayerPosition: $localPlayerPosition, ktvRole: $ktvRole, positionMs: $positionMs, audioPlayOutDelay:$audioPlayOutDelay');
    if(ktvRole == KtvClientRole.LeadSinger && positionMs > audioPlayOutDelay) {
      Map<String, dynamic> dict = {
        "cmd": "setLrcTime",
        "duration": localPlayerDuration,
        "time": positionMs - audioPlayOutDelay,
        "ntp": timestamp,
        "playerState": localPlayerState.value()
      };
      var data = utf8.encode(jsonEncode(dict)) as Uint8List;
      await sendSEI(data, data.length);
    }
  }

  @override
  playerRecvSEICallback(PlayerRecvSEICallback callback) {
    _playerRecvSEICallback = callback;
  }

  _syncToCoSingerPlayerState(MediaPlayerState remoteState) async {
    if(ktvRole != KtvClientRole.Chorus) return;

    switch(remoteState) {
      case MediaPlayerState.playerStatePaused:
        await mediaPlayer?.pause();
        break;
      case MediaPlayerState.playerStateStopped:
        await mediaPlayer?.stop();
        break;
      case MediaPlayerState.playerStatePlaying:
        await mediaPlayer?.resume();
        break;
      default:break;
    }
  }

  @override
  Future<void> setRoomMode(RTCRoomMode mode) async {
    _rtcRoomMode = mode;
    if (isKtvChorusMode) {
      setKtvParameters();
    } else {
      resetKtvParameters();
    }
  }
}
