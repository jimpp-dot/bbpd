import 'dart:ffi';

import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart' as agora;

import 'agora_converter.dart';

class AgoraRtcChannel implements RtcMultiChannel {

  /// The ID of RtcChannel
  late final String channelId;

  agora.RtcConnection? channel;

  int volume = 20;

  agora.RtcEngineEx? engineEx;

  AgoraRtcChannel._(this.channelId);

  static Future<AgoraRtcChannel> create(String channelId, agora.RtcEngineEx newEngineEx, int optionalUid) async {
    agora.RtcConnection channel = agora.RtcConnection(channelId: channelId, localUid: optionalUid);
    var agoraChannel = AgoraRtcChannel._(channelId)
      ..channel = channel
      ..engineEx = newEngineEx;
    return agoraChannel;
  }

  static Future<void> destroyAll() async { }

  @override
  Future<void> joinChannel(String token, String optionalInfo, int optionalUid,
      ChannelMediaOptions options) async {
    if (channel == null || engineEx == null) {
      rtcLog('AgoraRtcChannel, joinChannel error,  channel == $channel engineEx == $engineEx');
      return;
    }

    await engineEx!.joinChannelEx(token: token, connection: channel!, options: convertChannelMediaOptions(options));

    await engineEx!.enableAudioVolumeIndicationEx(interval: 600, smooth: 3, reportVad: true, connection: channel!);
  }

  Future<void> setClientRole(ClientRole role) async {
    return await engineEx!.setClientRole(role: clientRole(role));
  }

  Future<void> muteAllRemoteAudioStreams(bool muted) async {
    engineEx!.muteAllRemoteAudioStreamsEx(mute: muted, connection: channel!);

    // 多余的调用
    agora.ChannelMediaOptions? options = agora.ChannelMediaOptions(autoSubscribeAudio: !muted);
    await engineEx!.updateChannelMediaOptionsEx(options: options, connection: channel!);
  }

  Future<void> muteRemoteAudioStream(int uid, bool muted) async {
    return engineEx?.muteRemoteAudioStreamEx(uid: uid, mute:muted, connection: channel!);
  }

  Future<void> leaveChannel() async {
    if (channel != null) {
      await engineEx!.leaveChannelEx(connection: channel!);
    }
  }

  Future<void> destroy() async {
    if (channel == null) return;
    channel = null;
  }

  void destroyWithoutRemove() {
    if (channel == null) return;
    channel = null;
  }

  Future<void> adjustPlaybackSignalVolume(int volume) async {
    this.volume = volume;
    if (channel == null) return;
    rtcLog(
        'AgoraChannel adjustPlaybackSignalVolume channel->$channelId,volume=$volume');
    await engineEx!.adjustPlaybackSignalVolume(volume);
  }

  int getPlaybackSignalVolume() => volume;

}
