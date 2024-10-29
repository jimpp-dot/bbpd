import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

ZegoScenario channelProfile(ChannelProfile scenario) {
  switch (scenario) {
    case ChannelProfile.Communication:
      return ZegoScenario.Default;
    case ChannelProfile.LiveBroadcasting:
      return ZegoScenario.HighQualityChatroom;
    case ChannelProfile.Game:
      // 这个位置没有对应的
      return ZegoScenario.HighQualityChatroom;
    case ChannelProfile.General:
      return ZegoScenario.HighQualityChatroom;
  }
  return ZegoScenario.HighQualityChatroom;
}

AudioOutputRouting audioOutputRouting(ZegoAudioRoute route) {
  switch (route) {
    case ZegoAudioRoute.Speaker:
      return AudioOutputRouting.Speakerphone;
    case ZegoAudioRoute.Headphone:
      return AudioOutputRouting.Headset;
    case ZegoAudioRoute.Bluetooth:
      return AudioOutputRouting.HeadsetBluetooth;
    case ZegoAudioRoute.Receiver: // 听筒
      return AudioOutputRouting.Earpiece;
    case ZegoAudioRoute.ExternalUSB:
      return AudioOutputRouting.ExternalUSB;
    case ZegoAudioRoute.AirPlay:
      return AudioOutputRouting.AirPlay;
  }
  return AudioOutputRouting.Default;
}

ConnectionStateType connectionStateType(ZegoRoomState state) {
  switch (state) {
    case ZegoRoomState.Disconnected:
      return ConnectionStateType.Disconnected;
    case ZegoRoomState.Connecting:
      return ConnectionStateType.Connecting;
    case ZegoRoomState.Connected:
      return ConnectionStateType.Connected;
  }
}

ConnectionChangedReason convertConnectionReason(int errorCode) {
  if (errorCode == 1002033) {
    return ConnectionChangedReason.InvalidToken;
  }
  return ConnectionChangedReason.UnKnown;
}

AudioMixingStateCode audioMixingState(ZegoMediaPlayerState state) {
  switch (state) {
    case ZegoMediaPlayerState.NoPlay:
      return AudioMixingStateCode.Stopped;
    case ZegoMediaPlayerState.Playing:
      return AudioMixingStateCode.Playing;
    case ZegoMediaPlayerState.Pausing:
      return AudioMixingStateCode.Paused;
    case ZegoMediaPlayerState.PlayEnded:
      return AudioMixingStateCode.PlayEnded;
  }
}

AudioMixingReason getMixingReason(int code) {
  switch (code) {
    case 1008003:
    case 1008005:
    case 1008006:
    case 1008007:
    case 1008008:
      return AudioMixingReason.CanNotOpen;
  }
  return AudioMixingReason.UnKnown;
}

ZegoReverbPreset reverbPreset(AudioEffectPreset preset) {
  switch (preset) {
    case AudioEffectPreset.AudioEffectOff:
      return ZegoReverbPreset.None;
    case AudioEffectPreset.RoomAcousticsKTV:
      return ZegoReverbPreset.KTV;
    case AudioEffectPreset.RoomAcousticsVocalConcert:
      return ZegoReverbPreset.VocalConcert;
    case AudioEffectPreset.RoomAcousticsStudio:
      return ZegoReverbPreset.RecordingStudio;
    case AudioEffectPreset.RoomAcousticsPhonograph:
      return ZegoReverbPreset.GramoPhone;
    case AudioEffectPreset.RoomAcousticsVirtualStereo:
      break;
    case AudioEffectPreset.RoomAcousticsSpacial:
      break;
    case AudioEffectPreset.RoomAcousticsEthereal:
      break;
    case AudioEffectPreset.RoomAcoustics3DVoice:
      break;
    case AudioEffectPreset.VoiceChangerEffectUncle:
      break;
    case AudioEffectPreset.VoiceChangerEffectOldMan:
      break;
    case AudioEffectPreset.VoiceChangerEffectBoy:
      break;
    case AudioEffectPreset.VoiceChangerEffectSister:
      break;
    case AudioEffectPreset.VoiceChangerEffectGirl:
      break;
    case AudioEffectPreset.VoiceChangerEffectPigKing:
      break;
    case AudioEffectPreset.VoiceChangerEffectHulk:
      break;
    case AudioEffectPreset.StyleTransformationRnB:
      return ZegoReverbPreset.Rock;
    case AudioEffectPreset.StyleTransformationPopular:
      return ZegoReverbPreset.Popular;
    case AudioEffectPreset.PitchCorrection:
      break;
    case AudioEffectPreset.Basement:
      return ZegoReverbPreset.Basement;
    case AudioEffectPreset.VocalConcert:
      return ZegoReverbPreset.VocalConcert;
    case AudioEffectPreset.ConcertHall:
      return ZegoReverbPreset.ConcertHall;
  }
  return ZegoReverbPreset.None;
}

// 音调相关常量
const double AgoraDefaultVoicePitch = 1.0;
const double AgoraMinVoicePitch = 0.5;
const double AgoraMaxVoicePitch = 2.0;
const double ZegoDefaultVoiceChangeValue = 0.0;
const double ZegoMinVoiceChangeValue = -8.0;
const double ZegoMaxVoiceChangeValue = 8.0;

// agora 0.5 ~ 1 ~ 2
// zego  -8 ~ 0 ~ 8
double convertToZegoVoiceChangerParam(double pitch) {
  if (pitch < AgoraMinVoicePitch) {
    pitch = AgoraMinVoicePitch;
  } else if (pitch > AgoraMaxVoicePitch) {
    pitch = AgoraMaxVoicePitch;
  }

  double deltaPitch = pitch - AgoraDefaultVoicePitch;

  if (deltaPitch > 0) {
    return ((ZegoMaxVoiceChangeValue - ZegoDefaultVoiceChangeValue) * (deltaPitch / (AgoraMaxVoicePitch - AgoraDefaultVoicePitch)));
  } else {
    return ((ZegoMinVoiceChangeValue - ZegoDefaultVoiceChangeValue) * (deltaPitch / (AgoraMinVoicePitch - AgoraDefaultVoicePitch)));
  }
}

/// agora [-12,12]
/// zego [-8,8]
double convertAudioMixingPitch(int pitch) {
  return pitch * (8 / 12);
}

RecordState convertRecordState(ZegoDataRecordState state) {
  switch (state) {
    case ZegoDataRecordState.NoRecord:
      return RecordState.NoRecord;
    case ZegoDataRecordState.Recording:
      return RecordState.Recording;
    case ZegoDataRecordState.Success:
      return RecordState.Success;
  }
  return RecordState.NoRecord;
}

RecordConfig convertRecordConfig(ZegoDataRecordConfig config) {
  RecordConfig retVal = RecordConfig();
  retVal.resultPath = config.filePath;
  return retVal;
}

class ZegoAudioDataCallbackBitMask {
  /// 此属性控制 SDK 是否回调 [onCapturedAudioData] 方法
  static const ZEGO_AUDIO_DATA_CALLBACK_BIT_MASK_CAPTURED = 1 << 0;

  /// 此属性控制 SDK 是否回调 [onPlaybackAudioData] 方法
  static const ZEGO_AUDIO_DATA_CALLBACK_BIT_MASK_PLAYBACK = 1 << 1;

  /// 此属性控制 SDK 是否回调 [onMixedAudioData] 方法
  static const ZEGO_AUDIO_DATA_CALLBACK_BIT_MASK_MIXED = 1 << 2;

  /// 此属性控制 SDK 是否回调 [onPlayerAudioData] 方法
  static const ZEGO_AUDIO_DATA_CALLBACK_BIT_MASK_PLAYER = 1 << 3;
}

Map<int, ZegoAudioSampleRate> _sampleRateMap = {
  8000: ZegoAudioSampleRate.SampleRate8K,
  16000: ZegoAudioSampleRate.SampleRate16K,
  22050: ZegoAudioSampleRate.SampleRate22K,
  24000: ZegoAudioSampleRate.SampleRate24K,
  32000: ZegoAudioSampleRate.SampleRate32K,
  44100: ZegoAudioSampleRate.SampleRate44K,
  48000: ZegoAudioSampleRate.SampleRate48K,
};

ZegoAudioSampleRate convertZegoAudioSampleRate(int sampleRate) {
  return _sampleRateMap[sampleRate] ?? ZegoAudioSampleRate.Unknown;
}

int getSampleRate(ZegoAudioSampleRate sampleRate) {
  for (var entry in _sampleRateMap.entries) {
    if (entry.value == sampleRate) {
      return entry.key;
    }
  }
  return 0;
}

ZegoAudioChannel convertZegoAudioChannel(int channel) {
  if (channel == 2) {
    return ZegoAudioChannel.Stereo;
  } else {
    return ZegoAudioChannel.Mono;
  }
}

int getAudioChannels(ZegoAudioChannel channel) {
  if (channel == ZegoAudioChannel.Stereo) {
    return 2;
  } else {
    return 1;
  }
}

ZegoReverbAdvancedParam convertReverbAdvancedParam(ReverbAdvancedParam param) {
  return ZegoReverbAdvancedParam(param.roomSize, param.reverberance, param.damping, param.wetOnly, param.wetGain, param.dryGain,
      param.toneLow, param.toneHigh, param.preDelay, param.stereoWidth);
}

ZegoReverbEchoParam convertReverbEchoParam(ReverbEchoParam param) {
  return ZegoReverbEchoParam(param.inGain, param.outGain, param.numDelays, param.delay, param.decay);
}

ZegoElectronicEffectsMode convertElectronicEffectsMode(ElectronicEffectsMode mode) {
  switch (mode) {
    case ElectronicEffectsMode.Major:
      return ZegoElectronicEffectsMode.Major;
    case ElectronicEffectsMode.Minor:
      return ZegoElectronicEffectsMode.Minor;
    case ElectronicEffectsMode.HarmonicMinor:
      return ZegoElectronicEffectsMode.HarmonicMinor;
  }
}

StreamQualityLevel convertStreamQualityLevel(ZegoStreamQualityLevel qualityLevel) {
  switch (qualityLevel) {
    case ZegoStreamQualityLevel.Excellent:
      return StreamQualityLevel.Excellent;
    case ZegoStreamQualityLevel.Good:
      return StreamQualityLevel.Good;
    case ZegoStreamQualityLevel.Medium:
      return StreamQualityLevel.Medium;
    case ZegoStreamQualityLevel.Bad:
      return StreamQualityLevel.Bad;
    case ZegoStreamQualityLevel.Die:
      return StreamQualityLevel.Die;
    case ZegoStreamQualityLevel.Unknown:
      return StreamQualityLevel.Unknown;
  }
}

ZegoCopyrightedMusicVendorID convertVendorID(int vendorID) {
  switch (vendorID) {
    case 1:
      return ZegoCopyrightedMusicVendorID.ZegoCopyrightedMusicVendor1;
    case 2:
      return ZegoCopyrightedMusicVendorID.ZegoCopyrightedMusicVendor2;
    case 3:
      return ZegoCopyrightedMusicVendorID.ZegoCopyrightedMusicVendor3;
    default:
      return ZegoCopyrightedMusicVendorID.ZegoCopyrightedMusicVendorDefault;
  }
}

/// 获取包含人声的歌曲资源
ZegoCopyrightedMusicResourceType convertZegoCopyrightedMusicResourceType(int resourceType) {
  switch (resourceType) {
    case 0:
      return ZegoCopyrightedMusicResourceType.ZegoCopyrightedMusicResourceSong;
    case 1:
      return ZegoCopyrightedMusicResourceType.ZegoCopyrightedMusicResourceAccompaniment;
    case 2:
      return ZegoCopyrightedMusicResourceType.ZegoCopyrightedMusicResourceAccompanimentClip;
    case 3:
      return ZegoCopyrightedMusicResourceType.ZegoCopyrightedMusicResourceAccompanimentSegment;
    default:
      return ZegoCopyrightedMusicResourceType.ZegoCopyrightedMusicResourceSong;
  }
}


/// 获取包含人声的歌曲资源
ZegoMediaPlayerAudioTrackMode convertAudioTrackMode(int trackMode) {
  switch (trackMode) {
    case 0:
      return ZegoMediaPlayerAudioTrackMode.Normal;
    case 1:
      return ZegoMediaPlayerAudioTrackMode.Multiple;
    default:
      return ZegoMediaPlayerAudioTrackMode.Normal;
  }
}