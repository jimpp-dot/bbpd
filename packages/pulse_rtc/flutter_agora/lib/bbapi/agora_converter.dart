import 'package:agora_rtc_engine/agora_rtc_engine.dart' as a;
import 'package:commonrtc_api/commonrtc_api.dart';
import '../src/agora_enum_converter.dart' as e;

a.ChannelMediaRelayConfiguration convertChannelMediaRelay(ChannelMediaRelayConfiguration config) {
  return a.ChannelMediaRelayConfiguration(
    srcInfo: a.ChannelMediaInfo(channelName: config.srcInfo.channelName, uid: config.srcInfo.uid, token: config.srcInfo.token),
    destInfos: config.destInfos.map((e) => a.ChannelMediaInfo(channelName: e.channelName, uid: e.uid, token: e.token)).toList(),
    destCount: config.destInfos.length,
  );
}

a.AudioProfileType audioProfile(AudioProfile profile) {
  switch (profile) {
    case AudioProfile.MusicHighQualityStereo:
      return a.AudioProfileType.audioProfileMusicHighQualityStereo;
    case AudioProfile.MusicHighQuality:
      return a.AudioProfileType.audioProfileMusicHighQuality;
    case AudioProfile.MusicStandardStereo:
      return a.AudioProfileType.audioProfileMusicStandardStereo;
    case AudioProfile.MusicStandard:
      return a.AudioProfileType.audioProfileMusicStandard;
    case AudioProfile.SpeechStandard:
      return a.AudioProfileType.audioProfileSpeechStandard;
    case AudioProfile.Default:
      return a.AudioProfileType.audioProfileDefault;
  }
  return a.AudioProfileType.audioProfileMusicHighQualityStereo;
}

a.AudioScenarioType audioScenario(AudioScenario scenario) {
  // 声网6.0.0版本已去掉1 2 4 6 有问题咨询声网
  switch (scenario) {
    case AudioScenario.ChatRoomGaming:
      return a.AudioScenarioType.audioScenarioChatroom;
    case AudioScenario.GameStreaming:
      return a.AudioScenarioType.audioScenarioGameStreaming;
    case AudioScenario.Default:
      return a.AudioScenarioType.audioScenarioDefault;
    case AudioScenario.MEETING:
      return a.AudioScenarioType.audioScenarioMeeting;
  }
  return a.AudioScenarioType.audioScenarioDefault;
}

a.ChannelProfileType channelProfile(ChannelProfile profile) {
  switch (profile) {
    case ChannelProfile.Communication:
      return a.ChannelProfileType.channelProfileCommunication;
    case ChannelProfile.LiveBroadcasting:
      return a.ChannelProfileType.channelProfileLiveBroadcasting;
    case ChannelProfile.Game:
      break;
    case ChannelProfile.General:
      break;
  }
  return a.ChannelProfileType.channelProfileLiveBroadcasting;
}

a.ClientRoleType clientRole(ClientRole role) {
  switch (role) {
    case ClientRole.Audience:
      return a.ClientRoleType.clientRoleAudience;
    case ClientRole.Broadcaster:
      return a.ClientRoleType.clientRoleBroadcaster;
  }
  rtcLog('clientRole Unimplemented $role');
  return a.ClientRoleType.clientRoleAudience;
}

a.ChannelMediaOptions convertChannelMediaOptions(ChannelMediaOptions options) {
  a.ChannelMediaOptions agoraOp = a.ChannelMediaOptions(
      autoSubscribeAudio: options.autoSubscribeAudio,
      autoSubscribeVideo: options.autoSubscribeVideo,
      publishMicrophoneTrack: options.publishLocalAudio,
      publishCameraTrack: options.publishLocalVideo);
  return agoraOp;
}

/// 将[0,255]范围的音量转化为[0,100]范围
int ratioVolume(int volume) {
  return volume * 100 ~/ 255;
}

List<AudioVolumeInfo> audioVolumeInfoList(List<a.AudioVolumeInfo> volumeInfos) {
  if (volumeInfos == null || volumeInfos.isEmpty) {
    return <AudioVolumeInfo>[];
  }
  return volumeInfos.map((e) => audioVolumeInfo(e)).toList();
}

AudioVolumeInfo audioVolumeInfo(a.AudioVolumeInfo volumeInfo) {
  return AudioVolumeInfo(volumeInfo.uid!, ratioVolume(volumeInfo.volume!), volumeInfo.vad!);
}

a.OrientationMode videoOutputOrientationMode(VideoOutputOrientationMode mode) {
  switch (mode) {
    case VideoOutputOrientationMode.Adaptative:
      return a.OrientationMode.orientationModeAdaptive;
    case VideoOutputOrientationMode.FixedLandscape:
      return a.OrientationMode.orientationModeFixedLandscape;
    case VideoOutputOrientationMode.FixedPortrait:
      return a.OrientationMode.orientationModeFixedPortrait;
  }
  return a.OrientationMode.orientationModeAdaptive;
}

a.VideoEncoderConfiguration videoEncoderConfiguration(VideoEncoderConfiguration config) {
  a.VideoDimensions? ms;
  if(config.dimensions != null) {
    ms = a.VideoDimensions(width: config.dimensions!.width, height: config.dimensions!.height);
  }

  a.VideoEncoderConfiguration aConfig = a.VideoEncoderConfiguration(orientationMode:videoOutputOrientationMode(config.orientationMode!), dimensions: ms );
  // if (config.orientationMode != null) {
  //   aConfig.orientationMode = videoOutputOrientationMode(config.orientationMode!);
  // }
  // if (config.dimensions != null) {
  //   aConfig.dimensions = a.VideoDimensions(width: config.dimensions!.width, height: config.dimensions!.height);
  // }
  return aConfig;
}

ConnectionStateType convertConnectStateType(a.ConnectionStateType stateType) {
  switch (stateType) {
    case a.ConnectionStateType.connectionStateDisconnected:
      return ConnectionStateType.Disconnected;
    case a.ConnectionStateType.connectionStateConnecting:
      return ConnectionStateType.Connecting;
    case a.ConnectionStateType.connectionStateConnected:
      return ConnectionStateType.Connected;
    case a.ConnectionStateType.connectionStateReconnecting:
      return ConnectionStateType.Reconnecting;
    case a.ConnectionStateType.connectionStateFailed:
      return ConnectionStateType.Failed;
  }
}

ConnectionChangedReason convertConnectionChangeReason(a.ConnectionChangedReasonType reason) {
  int v = e.ConnectionChangedReasonConverter(reason).value();
  return ConnectionChangedReasonConverter.fromValue(v).e;
}

ErrorCode convertErrorCode(a.ErrorCodeType code) {
  int v = e.ErrorCodeConverter(code).value();
  return ErrorCodeConverter.fromValue(v).e;
}

AudioMixingStateCode convertAudioMixingStateCode(a.AudioMixingStateType code, a.AudioMixingReasonType reason) {
  AudioMixingStateCode? retVal;
  if (code == a.AudioMixingStateType.audioMixingStateStopped) {
    if (reason == a.AudioMixingReasonType.audioMixingReasonAllLoopsCompleted) {
      retVal = AudioMixingStateCode.PlayEnded;
    } else if (reason == a.AudioMixingReasonType.audioMixingReasonStoppedByUser) {
      retVal = AudioMixingStateCode.Stopped;
    }
  }
  if (retVal != null) {
    return retVal;
  }
  int v = e.AudioMixingStateCodeConverter(code).value();
  return AudioMixingStateCodeConverter.fromValue(v).e;
}

AudioMixingReason convertAudioMixingReason(a.AudioMixingReasonType code) {
  int v = e.AudioMixingReasonConverter(code).value();
  return AudioMixingReasonConverter.fromValue(v).e;
}

UserOfflineReason convertUserOfflineReason(a.UserOfflineReasonType reason) {
  int v = e.UserOfflineReasonConverter(reason).value();
  return UserOfflineReasonConverter.fromValue(v).e;
}

WarningCode convertWarningCode(a.WarnCodeType code) {
  int v = e.WarningCodeConverter(code).value();
  return WarningCodeConverter.fromValue(v).e;
}

AudioLocalError convertAudioLocalError(a.LocalAudioStreamError error) {
  int v = e.AudioLocalErrorConverter(error).value();
  return AudioLocalErrorConverter.fromValue(v).e;
}

AudioLocalState convertAudioLocalState(a.LocalAudioStreamState state) {
  int v = e.AudioLocalStateConverter(state).value();
  return AudioLocalStateConverter.fromValue(v).e;
}

AudioOutputRouting convertAudioOutputRouting(int routing) {
  return AudioOutputRoutingConverter.fromValue(routing).e;
}

a.AudioEffectPreset convertAudioEffectPreset(AudioEffectPreset preset) {
  int v = AudioEffectPresetConverter(preset).value();
  return e.AudioEffectPresetConverter.fromValue(v).e;
}

a.VideoStreamType convertVideoStreamType(VideoStreamType type) {
  switch (type) {
    case VideoStreamType.High:
      return a.VideoStreamType.videoStreamHigh;
    case VideoStreamType.Low:
      return a.VideoStreamType.videoStreamLow;
  }
}

PreloadStatusCode convertPreloadStatusCode(a.PreloadStatusCode code) {
  int v = e.PreloadStatusCodeConverter(code).value();
  return PreloadStatusCodeConverter.fromValue(v).e;
}
