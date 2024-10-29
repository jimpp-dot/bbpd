// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agora_enum_converter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// AreaCodeConverter _$AreaCodeConverterFromJson(Map<String, dynamic> json) {
//   return AreaCodeConverter(
//     _$enumDecode(_$AreaCodeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AreaCodeConverterToJson(AreaCodeConverter instance) =>
//     <String, dynamic>{
//       'e': _$AreaCodeEnumMap[instance.e],
//     };

K _$enumDecode<K, V>(
    Map<K, V> enumValues,
    Object? source, {
      K? unknownValue,
    }) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
          '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
        (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}
//
const _$AreaCodeEnumMap = {
  em.AreaCode.CN: 1,
  em.AreaCode.NA: 2,
  em.AreaCode.EU: 4,
  em.AreaCode.AS: 8,
  em.AreaCode.JP: 16,
  em.AreaCode.IN: 32,
  em.AreaCode.GLOB: -1,
};
//
// AudioCodecProfileTypeConverter _$AudioCodecProfileTypeConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioCodecProfileTypeConverter(
//     _$enumDecode(_$AudioCodecProfileTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioCodecProfileTypeConverterToJson(
//         AudioCodecProfileTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioCodecProfileTypeEnumMap[instance.e],
//     };
//
// const _$AudioCodecProfileTypeEnumMap = {
//   AudioCodecProfileType.LCAAC: 0,
//   AudioCodecProfileType.HEAAC: 1,
// };
//
AudioEqualizationBandFrequencyConverter
_$AudioEqualizationBandFrequencyConverterFromJson(
    Map<String, dynamic> json) {
  return AudioEqualizationBandFrequencyConverter(
    _$enumDecode(_$AudioEqualizationBandFrequencyEnumMap, json['e']),
  );
}

Map<String, dynamic> _$AudioEqualizationBandFrequencyConverterToJson(
    AudioEqualizationBandFrequencyConverter instance) =>
    <String, dynamic>{
      'e': _$AudioEqualizationBandFrequencyEnumMap[instance.e],
    };

const _$AudioEqualizationBandFrequencyEnumMap = {
  AudioEqualizationBandFrequency.audioEqualizationBand31: 0,
  AudioEqualizationBandFrequency.audioEqualizationBand62: 1,
  AudioEqualizationBandFrequency.audioEqualizationBand125: 2,
  AudioEqualizationBandFrequency.audioEqualizationBand250: 3,
  AudioEqualizationBandFrequency.audioEqualizationBand500: 4,
  AudioEqualizationBandFrequency.audioEqualizationBand1k: 5,
  AudioEqualizationBandFrequency.audioEqualizationBand2k: 6,
  AudioEqualizationBandFrequency.audioEqualizationBand4k: 7,
  AudioEqualizationBandFrequency.audioEqualizationBand8k: 8,
  AudioEqualizationBandFrequency.audioEqualizationBand16k: 9,
};

AudioLocalErrorConverter _$AudioLocalErrorConverterFromJson(
    Map<String, dynamic> json) {
  return AudioLocalErrorConverter(
    _$enumDecode(_$AudioLocalErrorEnumMap, json['e']),
  );
}

Map<String, dynamic> _$AudioLocalErrorConverterToJson(
    AudioLocalErrorConverter instance) =>
    <String, dynamic>{
      'e': _$AudioLocalErrorEnumMap[instance.e],
    };

const _$AudioLocalErrorEnumMap = {
  LocalAudioStreamError.localAudioStreamErrorOk: 0,
  LocalAudioStreamError.localAudioStreamErrorFailure: 1,
  LocalAudioStreamError.localAudioStreamErrorDeviceNoPermission: 2,
  LocalAudioStreamError.localAudioStreamErrorDeviceBusy: 3,
  LocalAudioStreamError.localAudioStreamErrorRecordFailure: 4,
  LocalAudioStreamError.localAudioStreamErrorEncodeFailure: 5,
  // LocalAudioStreamError.Interrupted: 8,
};

AudioLocalStateConverter _$AudioLocalStateConverterFromJson(
    Map<String, dynamic> json) {
  return AudioLocalStateConverter(
    _$enumDecode(_$AudioLocalStateEnumMap, json['e']),
  );
}

Map<String, dynamic> _$AudioLocalStateConverterToJson(
    AudioLocalStateConverter instance) =>
    <String, dynamic>{
      'e': _$AudioLocalStateEnumMap[instance.e],
    };

const _$AudioLocalStateEnumMap = {
  LocalAudioStreamState.localAudioStreamStateStopped: 0,
  LocalAudioStreamState.localAudioStreamStateRecording: 1,
  LocalAudioStreamState.localAudioStreamStateEncoding: 2,
  LocalAudioStreamState.localAudioStreamStateFailed: 3,
};

// AudioFileInfoErrorConverter _$AudioFileInfoErrorConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioFileInfoErrorConverter(
//     _$enumDecode(_$AudioFileInfoErrorEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioFileInfoErrorConverterToJson(
//         AudioFileInfoErrorConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioFileInfoErrorEnumMap[instance.e],
//     };
//
// const _$AudioFileInfoErrorEnumMap = {
//   AudioFileInfoError.Ok: 0,
//   AudioFileInfoError.Failure: 1,
// };
//
AudioMixingReasonConverter _$AudioMixingReasonConverterFromJson(
    Map<String, dynamic> json) {
  return AudioMixingReasonConverter(
    _$enumDecode(_$AudioMixingReasonEnumMap, json['e']),
  );
}

Map<String, dynamic> _$AudioMixingReasonConverterToJson(
    AudioMixingReasonConverter instance) =>
    <String, dynamic>{
      'e': _$AudioMixingReasonEnumMap[instance.e],
    };

const _$AudioMixingReasonEnumMap = {
  AudioMixingReasonType.audioMixingReasonCanNotOpen: 701,
  AudioMixingReasonType.audioMixingReasonTooFrequentCall: 702,
  AudioMixingReasonType.audioMixingReasonInterruptedEof: 703,
  AudioMixingReasonType.audioMixingReasonOneLoopCompleted: 721,
  AudioMixingReasonType.audioMixingReasonAllLoopsCompleted: 723,
  AudioMixingReasonType.audioMixingReasonStoppedByUser: 724,
  AudioMixingReasonType.audioMixingReasonOk: 0,
  // AudioMixingReason.StartedByUser: 720,
  // AudioMixingReason.OneLoopCompleted: 721,
  // AudioMixingReason.StartNewLoop: 722,
  // AudioMixingReason.AllLoopsCompleted: 723,
  // AudioMixingReason.StoppedByUser: 724,
  // AudioMixingReason.PausedByUser: 725,
  // AudioMixingReason.ResumedByUser: 726,
  // AudioMixingReason.OK: 0,
};

AudioMixingStateCodeConverter _$AudioMixingStateCodeConverterFromJson(
    Map<String, dynamic> json) {
  return AudioMixingStateCodeConverter(
    _$enumDecode(_$AudioMixingStateCodeEnumMap, json['e']),
  );
}

Map<String, dynamic> _$AudioMixingStateCodeConverterToJson(
    AudioMixingStateCodeConverter instance) =>
    <String, dynamic>{
      'e': _$AudioMixingStateCodeEnumMap[instance.e],
    };

const _$AudioMixingStateCodeEnumMap = {
  AudioMixingStateType.audioMixingStatePlaying: 710,
  AudioMixingStateType.audioMixingStatePaused: 711,
  //AudioMixingStateType.Restart: 712,
  AudioMixingStateType.audioMixingStateStopped: 713,
  AudioMixingStateType.audioMixingStateFailed: 714,
};
//
// AudioMixingDualMonoModeConverter _$AudioMixingDualMonoModeConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioMixingDualMonoModeConverter(
//     _$enumDecode(_$AudioMixingDualMonoModeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioMixingDualMonoModeConverterToJson(
//         AudioMixingDualMonoModeConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioMixingDualMonoModeEnumMap[instance.e],
//     };
//
// const _$AudioMixingDualMonoModeEnumMap = {
//   AudioMixingDualMonoMode.Auto: 0,
//   AudioMixingDualMonoMode.L: 1,
//   AudioMixingDualMonoMode.R: 2,
//   AudioMixingDualMonoMode.MIX: 3,
// };
//
// AudioOutputRoutingConverter _$AudioOutputRoutingConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioOutputRoutingConverter(
//     _$enumDecode(_$AudioOutputRoutingEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioOutputRoutingConverterToJson(
//         AudioOutputRoutingConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioOutputRoutingEnumMap[instance.e],
//     };
//
// const _$AudioOutputRoutingEnumMap = {
//   AudioOutputRouting.Default: -1,
//   AudioOutputRouting.Headset: 0,
//   AudioOutputRouting.Earpiece: 1,
//   AudioOutputRouting.HeadsetNoMic: 2,
//   AudioOutputRouting.Speakerphone: 3,
//   AudioOutputRouting.Loudspeaker: 4,
//   AudioOutputRouting.HeadsetBluetooth: 5,
// };
//
// AudioProfileConverter _$AudioProfileConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioProfileConverter(
//     _$enumDecode(_$AudioProfileEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioProfileConverterToJson(
//         AudioProfileConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioProfileEnumMap[instance.e],
//     };
//
// const _$AudioProfileEnumMap = {
//   AudioProfile.Default: 0,
//   AudioProfile.SpeechStandard: 1,
//   AudioProfile.MusicStandard: 2,
//   AudioProfile.MusicStandardStereo: 3,
//   AudioProfile.MusicHighQuality: 4,
//   AudioProfile.MusicHighQualityStereo: 5,
// };
//
// AudioRecordingQualityConverter _$AudioRecordingQualityConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioRecordingQualityConverter(
//     _$enumDecode(_$AudioRecordingQualityEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioRecordingQualityConverterToJson(
//         AudioRecordingQualityConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioRecordingQualityEnumMap[instance.e],
//     };
//
// const _$AudioRecordingQualityEnumMap = {
//   AudioRecordingQuality.Low: 0,
//   AudioRecordingQuality.Medium: 1,
//   AudioRecordingQuality.High: 2,
// };
//
// AudioRecordingPositionConverter _$AudioRecordingPositionConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioRecordingPositionConverter(
//     _$enumDecode(_$AudioRecordingPositionEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioRecordingPositionConverterToJson(
//         AudioRecordingPositionConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioRecordingPositionEnumMap[instance.e],
//     };
//
// const _$AudioRecordingPositionEnumMap = {
//   AudioRecordingPosition.PositionMixedRecordingAndPlayback: 0,
//   AudioRecordingPosition.PositionRecording: 1,
//   AudioRecordingPosition.PositionMixedPlayback: 2,
// };
//
// AudioRemoteStateConverter _$AudioRemoteStateConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioRemoteStateConverter(
//     _$enumDecode(_$AudioRemoteStateEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioRemoteStateConverterToJson(
//         AudioRemoteStateConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioRemoteStateEnumMap[instance.e],
//     };
//
// const _$AudioRemoteStateEnumMap = {
//   AudioRemoteState.Stopped: 0,
//   AudioRemoteState.Starting: 1,
//   AudioRemoteState.Decoding: 2,
//   AudioRemoteState.Frozen: 3,
//   AudioRemoteState.Failed: 4,
// };
//
// AudioRemoteStateReasonConverter _$AudioRemoteStateReasonConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioRemoteStateReasonConverter(
//     _$enumDecode(_$AudioRemoteStateReasonEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioRemoteStateReasonConverterToJson(
//         AudioRemoteStateReasonConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioRemoteStateReasonEnumMap[instance.e],
//     };
//
// const _$AudioRemoteStateReasonEnumMap = {
//   AudioRemoteStateReason.Internal: 0,
//   AudioRemoteStateReason.NetworkCongestion: 1,
//   AudioRemoteStateReason.NetworkRecovery: 2,
//   AudioRemoteStateReason.LocalMuted: 3,
//   AudioRemoteStateReason.LocalUnmuted: 4,
//   AudioRemoteStateReason.RemoteMuted: 5,
//   AudioRemoteStateReason.RemoteUnmuted: 6,
//   AudioRemoteStateReason.RemoteOffline: 7,
// };
//
// AudioReverbPresetConverter _$AudioReverbPresetConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioReverbPresetConverter(
//     _$enumDecode(_$AudioReverbPresetEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioReverbPresetConverterToJson(
//         AudioReverbPresetConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioReverbPresetEnumMap[instance.e],
//     };
//
// const _$AudioReverbPresetEnumMap = {
//   AudioReverbPreset.Off: 0,
//   AudioReverbPreset.Popular: 1,
//   AudioReverbPreset.RnB: 2,
//   AudioReverbPreset.Rock: 3,
//   AudioReverbPreset.HipHop: 4,
//   AudioReverbPreset.VocalConcert: 5,
//   AudioReverbPreset.KTV: 6,
//   AudioReverbPreset.Studio: 7,
//   AudioReverbPreset.FX_KTV: 1048577,
//   AudioReverbPreset.FX_VOCAL_CONCERT: 1048578,
//   AudioReverbPreset.FX_UNCLE: 1048579,
//   AudioReverbPreset.FX_SISTER: 1048580,
//   AudioReverbPreset.FX_STUDIO: 1048581,
//   AudioReverbPreset.FX_POPULAR: 1048582,
//   AudioReverbPreset.FX_RNB: 1048583,
//   AudioReverbPreset.FX_PHONOGRAPH: 1048584,
//   AudioReverbPreset.VIRTUAL_STEREO: 2097153,
// };
//
// AudioReverbTypeConverter _$AudioReverbTypeConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioReverbTypeConverter(
//     _$enumDecode(_$AudioReverbTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioReverbTypeConverterToJson(
//         AudioReverbTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioReverbTypeEnumMap[instance.e],
//     };
//
// const _$AudioReverbTypeEnumMap = {
//   AudioReverbType.DryLevel: 0,
//   AudioReverbType.WetLevel: 1,
//   AudioReverbType.RoomSize: 2,
//   AudioReverbType.WetDelay: 3,
//   AudioReverbType.Strength: 4,
// };
//
// AudioSampleRateTypeConverter _$AudioSampleRateTypeConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioSampleRateTypeConverter(
//     _$enumDecode(_$AudioSampleRateTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioSampleRateTypeConverterToJson(
//         AudioSampleRateTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioSampleRateTypeEnumMap[instance.e],
//     };
//
// const _$AudioSampleRateTypeEnumMap = {
//   AudioSampleRateType.Type32000: 32000,
//   AudioSampleRateType.Type44100: 44100,
//   AudioSampleRateType.Type48000: 48000,
// };
//
// AudioScenarioConverter _$AudioScenarioConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioScenarioConverter(
//     _$enumDecode(_$AudioScenarioEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioScenarioConverterToJson(
//         AudioScenarioConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioScenarioEnumMap[instance.e],
//     };
//
// const _$AudioScenarioEnumMap = {
//   AudioScenario.Default: 0,
//   AudioScenario.ChatRoomEntertainment: 1,
//   AudioScenario.Education: 2,
//   AudioScenario.GameStreaming: 3,
//   AudioScenario.ShowRoom: 4,
//   AudioScenario.ChatRoomGaming: 5,
//   AudioScenario.IOT: 6,
//   AudioScenario.MEETING: 8,
// };
//
// AudioVoiceChangerConverter _$AudioVoiceChangerConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioVoiceChangerConverter(
//     _$enumDecode(_$AudioVoiceChangerEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioVoiceChangerConverterToJson(
//         AudioVoiceChangerConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioVoiceChangerEnumMap[instance.e],
//     };
//
// const _$AudioVoiceChangerEnumMap = {
//   AudioVoiceChanger.Off: 0,
//   AudioVoiceChanger.OldMan: 1,
//   AudioVoiceChanger.BabyBoy: 2,
//   AudioVoiceChanger.BabyGirl: 3,
//   AudioVoiceChanger.ZhuBaJie: 4,
//   AudioVoiceChanger.Ethereal: 5,
//   AudioVoiceChanger.Hulk: 6,
//   AudioVoiceChanger.BEAUTY_VIGOROUS: 1048577,
//   AudioVoiceChanger.BEAUTY_DEEP: 1048578,
//   AudioVoiceChanger.BEAUTY_MELLOW: 1048579,
//   AudioVoiceChanger.BEAUTY_FALSETTO: 1048580,
//   AudioVoiceChanger.BEAUTY_FULL: 1048581,
//   AudioVoiceChanger.BEAUTY_CLEAR: 1048582,
//   AudioVoiceChanger.BEAUTY_RESOUNDING: 1048583,
//   AudioVoiceChanger.BEAUTY_RINGING: 1048584,
//   AudioVoiceChanger.BEAUTY_SPACIAL: 1048585,
//   AudioVoiceChanger.GENERAL_BEAUTY_VOICE_MALE_MAGNETIC: 2097153,
//   AudioVoiceChanger.GENERAL_BEAUTY_VOICE_FEMALE_FRESH: 2097154,
//   AudioVoiceChanger.GENERAL_BEAUTY_VOICE_FEMALE_VITALITY: 2097155,
// };
//
// CameraCaptureOutputPreferenceConverter
//     _$CameraCaptureOutputPreferenceConverterFromJson(
//         Map<String, dynamic> json) {
//   return CameraCaptureOutputPreferenceConverter(
//     _$enumDecode(_$CameraCaptureOutputPreferenceEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$CameraCaptureOutputPreferenceConverterToJson(
//         CameraCaptureOutputPreferenceConverter instance) =>
//     <String, dynamic>{
//       'e': _$CameraCaptureOutputPreferenceEnumMap[instance.e],
//     };
//
// const _$CameraCaptureOutputPreferenceEnumMap = {
//   CameraCaptureOutputPreference.Auto: 0,
//   CameraCaptureOutputPreference.Performance: 1,
//   CameraCaptureOutputPreference.Preview: 2,
//   CameraCaptureOutputPreference.Manual: 3,
// };
//
// CameraDirectionConverter _$CameraDirectionConverterFromJson(
//     Map<String, dynamic> json) {
//   return CameraDirectionConverter(
//     _$enumDecode(_$CameraDirectionEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$CameraDirectionConverterToJson(
//         CameraDirectionConverter instance) =>
//     <String, dynamic>{
//       'e': _$CameraDirectionEnumMap[instance.e],
//     };
//
// const _$CameraDirectionEnumMap = {
//   CameraDirection.Rear: 0,
//   CameraDirection.Front: 1,
// };
//
// ChannelMediaRelayErrorConverter _$ChannelMediaRelayErrorConverterFromJson(
//     Map<String, dynamic> json) {
//   return ChannelMediaRelayErrorConverter(
//     _$enumDecode(_$ChannelMediaRelayErrorEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$ChannelMediaRelayErrorConverterToJson(
//         ChannelMediaRelayErrorConverter instance) =>
//     <String, dynamic>{
//       'e': _$ChannelMediaRelayErrorEnumMap[instance.e],
//     };
//
// const _$ChannelMediaRelayErrorEnumMap = {
//   ChannelMediaRelayError.None: 0,
//   ChannelMediaRelayError.ServerErrorResponse: 1,
//   ChannelMediaRelayError.ServerNoResponse: 2,
//   ChannelMediaRelayError.NoResourceAvailable: 3,
//   ChannelMediaRelayError.FailedJoinSourceChannel: 4,
//   ChannelMediaRelayError.FailedJoinDestinationChannel: 5,
//   ChannelMediaRelayError.FailedPacketReceivedFromSource: 6,
//   ChannelMediaRelayError.FailedPacketSentToDestination: 7,
//   ChannelMediaRelayError.ServerConnectionLost: 8,
//   ChannelMediaRelayError.InternalError: 9,
//   ChannelMediaRelayError.SourceTokenExpired: 10,
//   ChannelMediaRelayError.DestinationTokenExpired: 11,
// };
//
// ChannelMediaRelayEventConverter _$ChannelMediaRelayEventConverterFromJson(
//     Map<String, dynamic> json) {
//   return ChannelMediaRelayEventConverter(
//     _$enumDecode(_$ChannelMediaRelayEventEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$ChannelMediaRelayEventConverterToJson(
//         ChannelMediaRelayEventConverter instance) =>
//     <String, dynamic>{
//       'e': _$ChannelMediaRelayEventEnumMap[instance.e],
//     };
//
// const _$ChannelMediaRelayEventEnumMap = {
//   ChannelMediaRelayEvent.Disconnect: 0,
//   ChannelMediaRelayEvent.Connected: 1,
//   ChannelMediaRelayEvent.JoinedSourceChannel: 2,
//   ChannelMediaRelayEvent.JoinedDestinationChannel: 3,
//   ChannelMediaRelayEvent.SentToDestinationChannel: 4,
//   ChannelMediaRelayEvent.ReceivedVideoPacketFromSource: 5,
//   ChannelMediaRelayEvent.ReceivedAudioPacketFromSource: 6,
//   ChannelMediaRelayEvent.UpdateDestinationChannel: 7,
//   ChannelMediaRelayEvent.UpdateDestinationChannelRefused: 8,
//   ChannelMediaRelayEvent.UpdateDestinationChannelNotChange: 9,
//   ChannelMediaRelayEvent.UpdateDestinationChannelIsNil: 10,
//   ChannelMediaRelayEvent.VideoProfileUpdate: 11,
//   ChannelMediaRelayEvent.PauseSendPacketToDestChannelSuccess: 12,
//   ChannelMediaRelayEvent.PauseSendPacketToDestChannelFailed: 13,
//   ChannelMediaRelayEvent.ResumeSendPacketToDestChannelSuccess: 14,
//   ChannelMediaRelayEvent.ResumeSendPacketToDestChannelFailed: 15,
// };
//
// ChannelMediaRelayStateConverter _$ChannelMediaRelayStateConverterFromJson(
//     Map<String, dynamic> json) {
//   return ChannelMediaRelayStateConverter(
//     _$enumDecode(_$ChannelMediaRelayStateEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$ChannelMediaRelayStateConverterToJson(
//         ChannelMediaRelayStateConverter instance) =>
//     <String, dynamic>{
//       'e': _$ChannelMediaRelayStateEnumMap[instance.e],
//     };
//
// const _$ChannelMediaRelayStateEnumMap = {
//   ChannelMediaRelayState.Idle: 0,
//   ChannelMediaRelayState.Connecting: 1,
//   ChannelMediaRelayState.Running: 2,
//   ChannelMediaRelayState.Failure: 3,
// };
//
// ChannelProfileConverter _$ChannelProfileConverterFromJson(
//     Map<String, dynamic> json) {
//   return ChannelProfileConverter(
//     _$enumDecode(_$ChannelProfileEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$ChannelProfileConverterToJson(
//         ChannelProfileConverter instance) =>
//     <String, dynamic>{
//       'e': _$ChannelProfileEnumMap[instance.e],
//     };
//
// const _$ChannelProfileEnumMap = {
//   ChannelProfile.Communication: 0,
//   ChannelProfile.LiveBroadcasting: 1,
//   ChannelProfile.Game: 2,
// };
//
// ClientRoleConverter _$ClientRoleConverterFromJson(Map<String, dynamic> json) {
//   return ClientRoleConverter(
//     _$enumDecode(_$ClientRoleEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$ClientRoleConverterToJson(
//         ClientRoleConverter instance) =>
//     <String, dynamic>{
//       'e': _$ClientRoleEnumMap[instance.e],
//     };
//
const _$ClientRoleEnumMap = {
  ClientRoleType.clientRoleBroadcaster: 1,
  ClientRoleType.clientRoleAudience: 2,
};

ConnectionChangedReasonConverter _$ConnectionChangedReasonConverterFromJson(
    Map<String, dynamic> json) {
  return ConnectionChangedReasonConverter(
    _$enumDecode(_$ConnectionChangedReasonEnumMap, json['e']),
  );
}

Map<String, dynamic> _$ConnectionChangedReasonConverterToJson(
    ConnectionChangedReasonConverter instance) =>
    <String, dynamic>{
      'e': _$ConnectionChangedReasonEnumMap[instance.e],
    };

const _$ConnectionChangedReasonEnumMap = {
  ConnectionChangedReasonType.connectionChangedConnecting: 0,
  ConnectionChangedReasonType.connectionChangedJoinSuccess: 1,
  ConnectionChangedReasonType.connectionChangedInterrupted: 2,
  ConnectionChangedReasonType.connectionChangedBannedByServer: 3,
  ConnectionChangedReasonType.connectionChangedJoinFailed: 4,
  ConnectionChangedReasonType.connectionChangedLeaveChannel: 5,
  ConnectionChangedReasonType.connectionChangedInvalidAppId: 6,
  ConnectionChangedReasonType.connectionChangedInvalidChannelName: 7,
  ConnectionChangedReasonType.connectionChangedInvalidToken: 8,
  ConnectionChangedReasonType.connectionChangedTokenExpired: 9,
  ConnectionChangedReasonType.connectionChangedRejectedByServer: 10,
  ConnectionChangedReasonType.connectionChangedSettingProxyServer: 11,
  ConnectionChangedReasonType.connectionChangedRenewToken: 12,
  ConnectionChangedReasonType.connectionChangedClientIpAddressChanged: 13,
  ConnectionChangedReasonType.connectionChangedKeepAliveTimeout: 14,
  ConnectionChangedReasonType.connectionChangedRejoinSuccess: 15,
  ConnectionChangedReasonType.connectionChangedLost: 16,
  ConnectionChangedReasonType.connectionChangedEchoTest: 17,
  ConnectionChangedReasonType.connectionChangedClientIpAddressChangedByUser: 18,
  ConnectionChangedReasonType.connectionChangedSameUidLogin: 19,
  ConnectionChangedReasonType.connectionChangedTooManyBroadcasters: 20,
};
//
// ConnectionStateTypeConverter _$ConnectionStateTypeConverterFromJson(
//     Map<String, dynamic> json) {
//   return ConnectionStateTypeConverter(
//     _$enumDecode(_$ConnectionStateTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$ConnectionStateTypeConverterToJson(
//         ConnectionStateTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$ConnectionStateTypeEnumMap[instance.e],
//     };
//
// const _$ConnectionStateTypeEnumMap = {
//   ConnectionStateType.Disconnected: 1,
//   ConnectionStateType.Connecting: 2,
//   ConnectionStateType.Connected: 3,
//   ConnectionStateType.Reconnecting: 4,
//   ConnectionStateType.Failed: 5,
// };
//
// DegradationPreferenceConverter _$DegradationPreferenceConverterFromJson(
//     Map<String, dynamic> json) {
//   return DegradationPreferenceConverter(
//     _$enumDecode(_$DegradationPreferenceEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$DegradationPreferenceConverterToJson(
//         DegradationPreferenceConverter instance) =>
//     <String, dynamic>{
//       'e': _$DegradationPreferenceEnumMap[instance.e],
//     };
//
// const _$DegradationPreferenceEnumMap = {
//   DegradationPreference.MaintainQuality: 0,
//   DegradationPreference.MaintainFramerate: 1,
//   DegradationPreference.MaintainBalanced: 2,
// };
//
// EncryptionModeConverter _$EncryptionModeConverterFromJson(
//     Map<String, dynamic> json) {
//   return EncryptionModeConverter(
//     _$enumDecode(_$EncryptionModeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$EncryptionModeConverterToJson(
//         EncryptionModeConverter instance) =>
//     <String, dynamic>{
//       'e': _$EncryptionModeEnumMap[instance.e],
//     };
//
// const _$EncryptionModeEnumMap = {
//   EncryptionMode.None: 0,
//   EncryptionMode.AES128XTS: 1,
//   EncryptionMode.AES128ECB: 2,
//   EncryptionMode.AES256XTS: 3,
//   EncryptionMode.SM4128ECB: 4,
//   EncryptionMode.AES128GCM: 5,
//   EncryptionMode.AES256GCM: 6,
//   EncryptionMode.AES128GCM2: 7,
//   EncryptionMode.AES256GCM2: 8,
// };
//
// ErrorCodeConverter _$ErrorCodeConverterFromJson(Map<String, dynamic> json) {
//   return ErrorCodeConverter(
//     _$enumDecode(_$ErrorCodeEnumMap, json['e']),
//   );
// }

Map<String, dynamic> _$ErrorCodeConverterToJson(ErrorCodeConverter instance) =>
    <String, dynamic>{
      'e': _$ErrorCodeEnumMap[instance.e],
    };

/// todo 没写完...
const _$ErrorCodeEnumMap = {
  ErrorCodeType.errOk: 0,
  ErrorCodeType.errFailed: 1,
  ErrorCodeType.errInvalidArgument: 2,
  ErrorCodeType.errNotReady: 3,
  ErrorCodeType.errNotSupported: 4,
  ErrorCodeType.errRefused: 5,
  ErrorCodeType.errBufferTooSmall: 6,
  ErrorCodeType.errNotInitialized: 7,
  ErrorCodeType.errNoPermission: 9,
  ErrorCodeType.errTimedout: 10,
  ErrorCodeType.errCanceled: 11,
  ErrorCodeType.errTooOften: 12,
  ErrorCodeType.errBindSocket: 13,
  ErrorCodeType.errNetDown: 14,
  // ErrorCodeType.errNetNobufs: 15,
  ErrorCodeType.errJoinChannelRejected: 17,
  ErrorCodeType.errLeaveChannelRejected: 18,
  ErrorCodeType.errAlreadyInUse: 19,
  ErrorCodeType.errAborted: 20,
  ErrorCodeType.errInitNetEngine: 21,
  ErrorCodeType.errResourceLimited: 22,
  ErrorCodeType.errInvalidAppId: 101,
  ErrorCodeType.errInvalidChannelName: 102,
  ErrorCodeType.errNoServerResources: 103,
  ErrorCodeType.errTokenExpired: 109,
  ErrorCodeType.errInvalidToken: 110,
  ErrorCodeType.errConnectionInterrupted: 111,
  ErrorCodeType.errConnectionLost: 112,
  ErrorCodeType.errNotInChannel: 113,
  ErrorCodeType.errSizeTooLarge: 114,
  ErrorCodeType.errBitrateLimit: 115,
  ErrorCodeType.errTooManyDataStreams: 116,
  ErrorCodeType.errDecryptionFailed: 120,
  ErrorCodeType.errClientIsBannedByServer: 123,
  // ErrorCodeType.errWatermarkParam: 124,
  // ErrorCodeType.errWatermarkPath: 125,
  // ErrorCodeType.errWatermarkPng: 126,
  // ErrorCodeType.errWatermarkrInfo: 127,
  // ErrorCodeType.errWatermarkArgb: 128,
  // ErrorCodeType.errWatermarkRead: 129,
  ErrorCodeType.errEncryptedStreamNotAllowedPublish: 130,
  ErrorCodeType.errLicenseCredentialInvalid: 131,
  ErrorCodeType.errInvalidUserAccount: 134,
  // ErrorCodeType.PublishStreamCDNError: 151,
  // ErrorCodeType.PublishStreamNumReachLimit: 152,
  // ErrorCodeType.PublishStreamNotAuthorized: 153,
  // ErrorCodeType.PublishStreamInternalServerError: 154,
  // ErrorCodeType.PublishStreamNotFound: 155,
  // ErrorCodeType.PublishStreamFormatNotSuppported: 156,
  ErrorCodeType.errCertRaw: 157,
  ErrorCodeType.errCertJsonPart: 158,
  ErrorCodeType.errCertJsonInval: 158,
  ErrorCodeType.errCertJsonNomem: 160,
  ErrorCodeType.errCertCustom: 161,
  ErrorCodeType.errCertCredential: 162,
  ErrorCodeType.errCertSign: 163,
  ErrorCodeType.errCertFail: 164,
  ErrorCodeType.errCertBuf: 165,
  ErrorCodeType.errCertNull: 166,
  ErrorCodeType.errCertDuedate: 167,
  ErrorCodeType.errCertRequest: 168,
  ErrorCodeType.errPcmsendFormat: 200,
  ErrorCodeType.errPcmsendBufferoverflow: 201,
  // ErrorCodeType.errLogoutOther: 400,
  // ErrorCodeType.errLogoutUser: 401,
  // ErrorCodeType.errLogoutNet: 402,
  // ErrorCodeType.errLogoutKicked: 403,
  // ErrorCodeType.errLogoutPacket: 404,
  // ErrorCodeType.errLogoutTokenExpired: 405,
  // ErrorCodeType.errLogoutOldversion: 406,
  // ErrorCodeType.errLogoutTokenWrong: 407,
  // ErrorCodeType.errLogoutAlreadyLogout: 408,
  // ErrorCodeType.errLoginOther: 420,
  // ErrorCodeType.errLoginNet: 421,
  // ErrorCodeType.errLoginFailed: 422,
  // ErrorCodeType.errLoginCanceled: 423,
  // ErrorCodeType.errLoginTokenExpired: 424,
  // ErrorCodeType.errLoginOldVersion: 425,
  // ErrorCodeType.errLoginTokenWrong: 426,
  // ErrorCodeType.errLoginTokenKicked: 427,
  // ErrorCodeType.errLoginAlreadyLogin: 428,
  // ErrorCodeType.errJoinChannelOther: 440, // 两个440，声网给的就这样
  // ErrorCodeType.errSendMessageOther: 440,
  // ErrorCodeType.errQueryUsernumOther: 450,
  // ErrorCodeType.errQueryUsernumTimeout: 451,
  // ErrorCodeType.errQueryUsernumByuser: 452,
  // ErrorCodeType.errLeaveChannelOther: 460,
  // ErrorCodeType.errLeaveChannelKicked: 461,
  // ErrorCodeType.errLeaveChannelByuser: 462,
  // ErrorCodeType.errLeaveChannelLogout: 463,
  // ErrorCodeType.errLeaveChannelDisconnected: 464,
  // ErrorCodeType.errInviteOther: 470,
  // ErrorCodeType.errInviteReinvite: 471,
  // ErrorCodeType.errInviteNet: 472,
  // ErrorCodeType.errInvitePeerOffline: 473,
  // ErrorCodeType.errInviteTimeout: 474,
  // ErrorCodeType.errInviteCantRecv: 475,
  // ErrorCodeType.errLoadMediaEngine: 1001,
  // ErrorCodeType.errStartCall: 1002,
  // ErrorCodeType.errStartCamera: 1003,
  // ErrorCodeType.errStartVideoRender: 1004,
};

// InjectStreamStatusConverter _$InjectStreamStatusConverterFromJson(
//     Map<String, dynamic> json) {
//   return InjectStreamStatusConverter(
//     _$enumDecode(_$InjectStreamStatusEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$InjectStreamStatusConverterToJson(
//         InjectStreamStatusConverter instance) =>
//     <String, dynamic>{
//       'e': _$InjectStreamStatusEnumMap[instance.e],
//     };
//
// const _$InjectStreamStatusEnumMap = {
//   InjectStreamStatus.StartSuccess: 0,
//   InjectStreamStatus.StartAlreadyExists: 1,
//   InjectStreamStatus.StartUnauthorized: 2,
//   InjectStreamStatus.StartTimedout: 3,
//   InjectStreamStatus.StartFailed: 4,
//   InjectStreamStatus.StopSuccess: 5,
//   InjectStreamStatus.StopNotFound: 6,
//   InjectStreamStatus.StopUnauthorized: 7,
//   InjectStreamStatus.StopTimedout: 8,
//   InjectStreamStatus.StopFailed: 9,
//   InjectStreamStatus.Broken: 10,
// };
//
// LastmileProbeResultStateConverter _$LastmileProbeResultStateConverterFromJson(
//     Map<String, dynamic> json) {
//   return LastmileProbeResultStateConverter(
//     _$enumDecode(_$LastmileProbeResultStateEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$LastmileProbeResultStateConverterToJson(
//         LastmileProbeResultStateConverter instance) =>
//     <String, dynamic>{
//       'e': _$LastmileProbeResultStateEnumMap[instance.e],
//     };
//
// const _$LastmileProbeResultStateEnumMap = {
//   LastmileProbeResultState.Complete: 1,
//   LastmileProbeResultState.IncompleteNoBwe: 2,
//   LastmileProbeResultState.Unavailable: 3,
// };
//
// LighteningContrastLevelConverter _$LighteningContrastLevelConverterFromJson(
//     Map<String, dynamic> json) {
//   return LighteningContrastLevelConverter(
//     _$enumDecode(_$LighteningContrastLevelEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$LighteningContrastLevelConverterToJson(
//         LighteningContrastLevelConverter instance) =>
//     <String, dynamic>{
//       'e': _$LighteningContrastLevelEnumMap[instance.e],
//     };
//
// const _$LighteningContrastLevelEnumMap = {
//   LighteningContrastLevel.Low: 0,
//   LighteningContrastLevel.Normal: 1,
//   LighteningContrastLevel.High: 2,
// };
//
// LocalVideoStreamErrorConverter _$LocalVideoStreamErrorConverterFromJson(
//     Map<String, dynamic> json) {
//   return LocalVideoStreamErrorConverter(
//     _$enumDecode(_$LocalVideoStreamErrorEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$LocalVideoStreamErrorConverterToJson(
//         LocalVideoStreamErrorConverter instance) =>
//     <String, dynamic>{
//       'e': _$LocalVideoStreamErrorEnumMap[instance.e],
//     };
//
// const _$LocalVideoStreamErrorEnumMap = {
//   LocalVideoStreamError.OK: 0,
//   LocalVideoStreamError.Failure: 1,
//   LocalVideoStreamError.DeviceNoPermission: 2,
//   LocalVideoStreamError.DeviceBusy: 3,
//   LocalVideoStreamError.CaptureFailure: 4,
//   LocalVideoStreamError.EncodeFailure: 5,
//   LocalVideoStreamError.CaptureInBackground: 6,
//   LocalVideoStreamError.CaptureMultipleForegroundApps: 7,
//   LocalVideoStreamError.DeviceNotFound: 8,
// };
//
// LocalVideoStreamStateConverter _$LocalVideoStreamStateConverterFromJson(
//     Map<String, dynamic> json) {
//   return LocalVideoStreamStateConverter(
//     _$enumDecode(_$LocalVideoStreamStateEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$LocalVideoStreamStateConverterToJson(
//         LocalVideoStreamStateConverter instance) =>
//     <String, dynamic>{
//       'e': _$LocalVideoStreamStateEnumMap[instance.e],
//     };
//
// const _$LocalVideoStreamStateEnumMap = {
//   LocalVideoStreamState.Stopped: 0,
//   LocalVideoStreamState.Capturing: 1,
//   LocalVideoStreamState.Encoding: 2,
//   LocalVideoStreamState.Failed: 3,
// };
//
// LogFilterConverter _$LogFilterConverterFromJson(Map<String, dynamic> json) {
//   return LogFilterConverter(
//     _$enumDecode(_$LogFilterEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$LogFilterConverterToJson(LogFilterConverter instance) =>
//     <String, dynamic>{
//       'e': _$LogFilterEnumMap[instance.e],
//     };
//
// const _$LogFilterEnumMap = {
//   LogFilter.Off: 0,
//   LogFilter.Debug: 2063,
//   LogFilter.Info: 15,
//   LogFilter.Warning: 14,
//   LogFilter.Error: 12,
//   LogFilter.Critical: 8,
// };
//
// NetworkQualityConverter _$NetworkQualityConverterFromJson(
//     Map<String, dynamic> json) {
//   return NetworkQualityConverter(
//     _$enumDecode(_$NetworkQualityEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$NetworkQualityConverterToJson(
//         NetworkQualityConverter instance) =>
//     <String, dynamic>{
//       'e': _$NetworkQualityEnumMap[instance.e],
//     };
//
// const _$NetworkQualityEnumMap = {
//   NetworkQuality.Unknown: 0,
//   NetworkQuality.Excellent: 1,
//   NetworkQuality.Good: 2,
//   NetworkQuality.Poor: 3,
//   NetworkQuality.Bad: 4,
//   NetworkQuality.VBad: 5,
//   NetworkQuality.Down: 6,
//   NetworkQuality.Unsupported: 7,
//   NetworkQuality.Detecting: 8,
// };
//
// NetworkTypeConverter _$NetworkTypeConverterFromJson(Map<String, dynamic> json) {
//   return NetworkTypeConverter(
//     _$enumDecode(_$NetworkTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$NetworkTypeConverterToJson(
//         NetworkTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$NetworkTypeEnumMap[instance.e],
//     };
//
// const _$NetworkTypeEnumMap = {
//   NetworkType.Unknown: -1,
//   NetworkType.Disconnected: 0,
//   NetworkType.LAN: 1,
//   NetworkType.WIFI: 2,
//   NetworkType.Mobile2G: 3,
//   NetworkType.Mobile3G: 4,
//   NetworkType.Mobile4G: 5,
//   NetworkType.Mobile5G: 6,
// };
//
// RtmpStreamingErrorCodeConverter _$RtmpStreamingErrorCodeConverterFromJson(
//     Map<String, dynamic> json) {
//   return RtmpStreamingErrorCodeConverter(
//     _$enumDecode(_$RtmpStreamingErrorCodeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$RtmpStreamingErrorCodeConverterToJson(
//         RtmpStreamingErrorCodeConverter instance) =>
//     <String, dynamic>{
//       'e': _$RtmpStreamingErrorCodeEnumMap[instance.e],
//     };
//
// const _$RtmpStreamingErrorCodeEnumMap = {
//   RtmpStreamingErrorCode.OK: 0,
//   RtmpStreamingErrorCode.InvalidParameters: 1,
//   RtmpStreamingErrorCode.EncryptedStreamNotAllowed: 2,
//   RtmpStreamingErrorCode.ConnectionTimeout: 3,
//   RtmpStreamingErrorCode.InternalServerError: 4,
//   RtmpStreamingErrorCode.RtmpServerError: 5,
//   RtmpStreamingErrorCode.TooOften: 6,
//   RtmpStreamingErrorCode.ReachLimit: 7,
//   RtmpStreamingErrorCode.NotAuthorized: 8,
//   RtmpStreamingErrorCode.StreamNotFound: 9,
//   RtmpStreamingErrorCode.FormatNotSupported: 10,
//   RtmpStreamingErrorCode.UnPublishOK: 100,
// };
//
// RtmpStreamingStateConverter _$RtmpStreamingStateConverterFromJson(
//     Map<String, dynamic> json) {
//   return RtmpStreamingStateConverter(
//     _$enumDecode(_$RtmpStreamingStateEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$RtmpStreamingStateConverterToJson(
//         RtmpStreamingStateConverter instance) =>
//     <String, dynamic>{
//       'e': _$RtmpStreamingStateEnumMap[instance.e],
//     };
//
// const _$RtmpStreamingStateEnumMap = {
//   RtmpStreamingState.Idle: 0,
//   RtmpStreamingState.Connecting: 1,
//   RtmpStreamingState.Running: 2,
//   RtmpStreamingState.Recovering: 3,
//   RtmpStreamingState.Failure: 4,
// };
//
// StreamFallbackOptionsConverter _$StreamFallbackOptionsConverterFromJson(
//     Map<String, dynamic> json) {
//   return StreamFallbackOptionsConverter(
//     _$enumDecode(_$StreamFallbackOptionsEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$StreamFallbackOptionsConverterToJson(
//         StreamFallbackOptionsConverter instance) =>
//     <String, dynamic>{
//       'e': _$StreamFallbackOptionsEnumMap[instance.e],
//     };
//
// const _$StreamFallbackOptionsEnumMap = {
//   StreamFallbackOptions.Disabled: 0,
//   StreamFallbackOptions.VideoStreamLow: 1,
//   StreamFallbackOptions.AudioOnly: 2,
// };

UserOfflineReasonConverter _$UserOfflineReasonConverterFromJson(
    Map<String, dynamic> json) {
  return UserOfflineReasonConverter(
    _$enumDecode(_$UserOfflineReasonEnumMap, json['e']),
  );
}

Map<String, dynamic> _$UserOfflineReasonConverterToJson(
    UserOfflineReasonConverter instance) =>
    <String, dynamic>{
      'e': _$UserOfflineReasonEnumMap[instance.e],
    };

const _$UserOfflineReasonEnumMap = {
  UserOfflineReasonType.userOfflineQuit: 0,
  UserOfflineReasonType.userOfflineDropped: 1,
  UserOfflineReasonType.userOfflineBecomeAudience: 2,
};

// UserPriorityConverter _$UserPriorityConverterFromJson(
//     Map<String, dynamic> json) {
//   return UserPriorityConverter(
//     _$enumDecode(_$UserPriorityEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$UserPriorityConverterToJson(
//         UserPriorityConverter instance) =>
//     <String, dynamic>{
//       'e': _$UserPriorityEnumMap[instance.e],
//     };
//
// const _$UserPriorityEnumMap = {
//   UserPriority.High: 50,
//   UserPriority.Normal: 100,
// };
//
// VideoCodecProfileTypeConverter _$VideoCodecProfileTypeConverterFromJson(
//     Map<String, dynamic> json) {
//   return VideoCodecProfileTypeConverter(
//     _$enumDecode(_$VideoCodecProfileTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VideoCodecProfileTypeConverterToJson(
//         VideoCodecProfileTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$VideoCodecProfileTypeEnumMap[instance.e],
//     };
//
// const _$VideoCodecProfileTypeEnumMap = {
//   VideoCodecProfileType.BaseLine: 66,
//   VideoCodecProfileType.Main: 77,
//   VideoCodecProfileType.High: 100,
// };
//
// VideoFrameRateConverter _$VideoFrameRateConverterFromJson(
//     Map<String, dynamic> json) {
//   return VideoFrameRateConverter(
//     _$enumDecode(_$VideoFrameRateEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VideoFrameRateConverterToJson(
//         VideoFrameRateConverter instance) =>
//     <String, dynamic>{
//       'e': _$VideoFrameRateEnumMap[instance.e],
//     };
//
// const _$VideoFrameRateEnumMap = {
//   VideoFrameRate.Min: -1,
//   VideoFrameRate.Fps1: 1,
//   VideoFrameRate.Fps7: 7,
//   VideoFrameRate.Fps10: 10,
//   VideoFrameRate.Fps15: 15,
//   VideoFrameRate.Fps24: 24,
//   VideoFrameRate.Fps30: 30,
//   VideoFrameRate.Fps60: 60,
// };
//
// BitRateConverter _$BitRateConverterFromJson(Map<String, dynamic> json) {
//   return BitRateConverter(
//     _$enumDecode(_$BitRateEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$BitRateConverterToJson(BitRateConverter instance) =>
//     <String, dynamic>{
//       'e': _$BitRateEnumMap[instance.e],
//     };
//
// const _$BitRateEnumMap = {
//   BitRate.Standard: 0,
//   BitRate.Compatible: -1,
// };
//
// VideoMirrorModeConverter _$VideoMirrorModeConverterFromJson(
//     Map<String, dynamic> json) {
//   return VideoMirrorModeConverter(
//     _$enumDecode(_$VideoMirrorModeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VideoMirrorModeConverterToJson(
//         VideoMirrorModeConverter instance) =>
//     <String, dynamic>{
//       'e': _$VideoMirrorModeEnumMap[instance.e],
//     };
//
// const _$VideoMirrorModeEnumMap = {
//   VideoMirrorMode.Auto: 0,
//   VideoMirrorMode.Enabled: 1,
//   VideoMirrorMode.Disabled: 2,
// };
//
// VideoOutputOrientationModeConverter
//     _$VideoOutputOrientationModeConverterFromJson(Map<String, dynamic> json) {
//   return VideoOutputOrientationModeConverter(
//     _$enumDecode(_$VideoOutputOrientationModeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VideoOutputOrientationModeConverterToJson(
//         VideoOutputOrientationModeConverter instance) =>
//     <String, dynamic>{
//       'e': _$VideoOutputOrientationModeEnumMap[instance.e],
//     };
//
// const _$VideoOutputOrientationModeEnumMap = {
//   VideoOutputOrientationMode.Adaptative: 0,
//   VideoOutputOrientationMode.FixedLandscape: 1,
//   VideoOutputOrientationMode.FixedPortrait: 2,
// };
//
// VideoQualityAdaptIndicationConverter
//     _$VideoQualityAdaptIndicationConverterFromJson(Map<String, dynamic> json) {
//   return VideoQualityAdaptIndicationConverter(
//     _$enumDecode(_$VideoQualityAdaptIndicationEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VideoQualityAdaptIndicationConverterToJson(
//         VideoQualityAdaptIndicationConverter instance) =>
//     <String, dynamic>{
//       'e': _$VideoQualityAdaptIndicationEnumMap[instance.e],
//     };
//
// const _$VideoQualityAdaptIndicationEnumMap = {
//   VideoQualityAdaptIndication.AdaptNone: 0,
//   VideoQualityAdaptIndication.AdaptUpBandwidth: 1,
//   VideoQualityAdaptIndication.AdaptDownBandwidth: 2,
// };
//
// VideoRemoteStateConverter _$VideoRemoteStateConverterFromJson(
//     Map<String, dynamic> json) {
//   return VideoRemoteStateConverter(
//     _$enumDecode(_$VideoRemoteStateEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VideoRemoteStateConverterToJson(
//         VideoRemoteStateConverter instance) =>
//     <String, dynamic>{
//       'e': _$VideoRemoteStateEnumMap[instance.e],
//     };
//
// const _$VideoRemoteStateEnumMap = {
//   VideoRemoteState.Stopped: 0,
//   VideoRemoteState.Starting: 1,
//   VideoRemoteState.Decoding: 2,
//   VideoRemoteState.Frozen: 3,
//   VideoRemoteState.Failed: 4,
// };
//
// VideoRemoteStateReasonConverter _$VideoRemoteStateReasonConverterFromJson(
//     Map<String, dynamic> json) {
//   return VideoRemoteStateReasonConverter(
//     _$enumDecode(_$VideoRemoteStateReasonEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VideoRemoteStateReasonConverterToJson(
//         VideoRemoteStateReasonConverter instance) =>
//     <String, dynamic>{
//       'e': _$VideoRemoteStateReasonEnumMap[instance.e],
//     };
//
// const _$VideoRemoteStateReasonEnumMap = {
//   VideoRemoteStateReason.Internal: 0,
//   VideoRemoteStateReason.NetworkCongestion: 1,
//   VideoRemoteStateReason.NetworkRecovery: 2,
//   VideoRemoteStateReason.LocalMuted: 3,
//   VideoRemoteStateReason.LocalUnmuted: 4,
//   VideoRemoteStateReason.RemoteMuted: 5,
//   VideoRemoteStateReason.RemoteUnmuted: 6,
//   VideoRemoteStateReason.RemoteOffline: 7,
//   VideoRemoteStateReason.AudioFallback: 8,
//   VideoRemoteStateReason.AudioFallbackRecovery: 9,
// };
//
// VideoRenderModeConverter _$VideoRenderModeConverterFromJson(
//     Map<String, dynamic> json) {
//   return VideoRenderModeConverter(
//     _$enumDecode(_$VideoRenderModeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VideoRenderModeConverterToJson(
//         VideoRenderModeConverter instance) =>
//     <String, dynamic>{
//       'e': _$VideoRenderModeEnumMap[instance.e],
//     };
//
// const _$VideoRenderModeEnumMap = {
//   VideoRenderMode.Hidden: 1,
//   VideoRenderMode.Fit: 2,
//   VideoRenderMode.Adaptive: 3,
//   VideoRenderMode.FILL: 4,
// };
//
// VideoStreamTypeConverter _$VideoStreamTypeConverterFromJson(
//     Map<String, dynamic> json) {
//   return VideoStreamTypeConverter(
//     _$enumDecode(_$VideoStreamTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VideoStreamTypeConverterToJson(
//         VideoStreamTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$VideoStreamTypeEnumMap[instance.e],
//     };
//
// const _$VideoStreamTypeEnumMap = {
//   VideoStreamType.High: 0,
//   VideoStreamType.Low: 1,
// };

WarningCodeConverter _$WarningCodeConverterFromJson(Map<String, dynamic> json) {
  return WarningCodeConverter(
    _$enumDecode(_$WarningCodeEnumMap, json['e']),
  );
}

Map<String, dynamic> _$WarningCodeConverterToJson(
    WarningCodeConverter instance) =>
    <String, dynamic>{
      'e': _$WarningCodeEnumMap[instance.e],
    };

const _$WarningCodeEnumMap = {
  WarnCodeType.warnInvalidView: 8,
  WarnCodeType.warnInitVideo: 16,
  WarnCodeType.warnPending: 20,
  WarnCodeType.warnNoAvailableChannel: 103,
  WarnCodeType.warnLookupChannelTimeout: 104,
  WarnCodeType.warnLookupChannelRejected: 105,
  WarnCodeType.warnOpenChannelTimeout: 106,
  WarnCodeType.warnOpenChannelRejected: 107,
  WarnCodeType.warnSwitchLiveVideoTimeout: 111,
  WarnCodeType.warnSetClientRoleTimeout: 118,
  // WarnCodeType.warnSetClientRoleNotAuthorized: 119,
  WarnCodeType.warnOpenChannelInvalidTicket: 121,
  WarnCodeType.warnOpenChannelTryNextVos: 122,
  WarnCodeType.warnAudioMixingOpenError: 701,
  WarnCodeType.warnAdmRuntimePlayoutWarning: 1014,
  WarnCodeType.warnAdmRuntimeRecordingWarning: 1016,
  WarnCodeType.warnAdmRecordAudioSilence: 1019,
  WarnCodeType.warnAdmPlayoutMalfunction: 1020,
  WarnCodeType.warnAdmRecordMalfunction: 1021,
  // WarnCodeType.warnAdmInterruption: 1025,
  // WarnCodeType.warnAdmIosCategoryNotPlayandrecord: 1029,
  WarnCodeType.warnAdmRecordAudioLowlevel: 1031,
  WarnCodeType.warnAdmPlayoutAudioLowlevel: 1032,
  // WarnCodeType.warnAdmRecordIsOccupied: 1033,
  WarnCodeType.warnAdmWindowsNoDataReadyEvent: 1040,
  // WarnCodeType.warnAdmInconsistentDevices: 1042,
  WarnCodeType.warnApmHowling: 1051,
  WarnCodeType.warnAdmGlitchState: 1052,
  WarnCodeType.warnAdmImproperSettings: 1053,
  WarnCodeType.warnAdmWinCoreNoRecordingDevice: 1322,
  WarnCodeType.warnAdmWinCoreNoPlayoutDevice: 1323,
  WarnCodeType.warnAdmWinCoreImproperCaptureRelease: 1324,
};

const _$WarningCodeEnumMap2 = {
  em.WarningCode.InvalidView: 8,
  em.WarningCode.InitVideo: 16,
  em.WarningCode.Pending: 20,
  em.WarningCode.NoAvailableChannel: 103,
  em.WarningCode.LookupChannelTimeout: 104,
  em.WarningCode.LookupChannelRejected: 105,
  em.WarningCode.OpenChannelTimeout: 106,
  em.WarningCode.OpenChannelRejected: 107,
  em.WarningCode.SwitchLiveVideoTimeout: 111,
  em.WarningCode.SetClientRoleTimeout: 118,
  em.WarningCode.SetClientRoleNotAuthorized: 119,
  em.WarningCode.OpenChannelInvalidTicket: 121,
  em.WarningCode.OpenChannelTryNextVos: 122,
  em.WarningCode.AudioMixingOpenError: 701,
  em.WarningCode.AdmRuntimePlayoutWarning: 1014,
  em.WarningCode.AdmRuntimeRecordingWarning: 1016,
  em.WarningCode.AdmRecordAudioSilence: 1019,
  em.WarningCode.AdmPlaybackMalfunction: 1020,
  em.WarningCode.AdmRecordMalfunction: 1021,
  em.WarningCode.AdmInterruption: 1025,
  em.WarningCode.AdmCategoryNotPlayAndRecord: 1029,
  em.WarningCode.AdmRecordAudioLowlevel: 1031,
  em.WarningCode.AdmPlayoutAudioLowlevel: 1032,
  em.WarningCode.AdmRecordIsOccupied: 1033,
  em.WarningCode.AdmNoDataReadyCallback: 1040,
  em.WarningCode.AdmInconsistentDevices: 1042,
  em.WarningCode.ApmHowling: 1051,
  em.WarningCode.AdmGlitchState: 1052,
  em.WarningCode.ApmResidualEcho: 1053,
  em.WarningCode.SuperResolutionStreamOverLimitation: 1610,
  em.WarningCode.SuperResolutionUserCountOverLimitation: 1611,
  em.WarningCode.SuperResolutionDeviceNotSupported: 1612,
};

// AudioChannelConverter _$AudioChannelConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudioChannelConverter(
//     _$enumDecode(_$AudioChannelEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioChannelConverterToJson(
//         AudioChannelConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioChannelEnumMap[instance.e],
//     };
//
// const _$AudioChannelEnumMap = {
//   AudioChannel.Channel0: 0,
//   AudioChannel.Channel1: 1,
//   AudioChannel.Channel2: 2,
//   AudioChannel.Channel3: 3,
//   AudioChannel.Channel4: 4,
//   AudioChannel.Channel5: 5,
// };
//
// VideoCodecTypeConverter _$VideoCodecTypeConverterFromJson(
//     Map<String, dynamic> json) {
//   return VideoCodecTypeConverter(
//     _$enumDecode(_$VideoCodecTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VideoCodecTypeConverterToJson(
//         VideoCodecTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$VideoCodecTypeEnumMap[instance.e],
//     };
//
// const _$VideoCodecTypeEnumMap = {
//   VideoCodecType.VP8: 1,
//   VideoCodecType.H264: 2,
//   VideoCodecType.EVP: 3,
//   VideoCodecType.E264: 4,
// };
//
// StreamPublishStateConverter _$StreamPublishStateConverterFromJson(
//     Map<String, dynamic> json) {
//   return StreamPublishStateConverter(
//     _$enumDecode(_$StreamPublishStateEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$StreamPublishStateConverterToJson(
//         StreamPublishStateConverter instance) =>
//     <String, dynamic>{
//       'e': _$StreamPublishStateEnumMap[instance.e],
//     };
//
// const _$StreamPublishStateEnumMap = {
//   StreamPublishState.Idle: 0,
//   StreamPublishState.NoPublished: 1,
//   StreamPublishState.Publishing: 2,
//   StreamPublishState.Published: 3,
// };
//
// StreamSubscribeStateConverter _$StreamSubscribeStateConverterFromJson(
//     Map<String, dynamic> json) {
//   return StreamSubscribeStateConverter(
//     _$enumDecode(_$StreamSubscribeStateEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$StreamSubscribeStateConverterToJson(
//         StreamSubscribeStateConverter instance) =>
//     <String, dynamic>{
//       'e': _$StreamSubscribeStateEnumMap[instance.e],
//     };
//
// const _$StreamSubscribeStateEnumMap = {
//   StreamSubscribeState.Idle: 0,
//   StreamSubscribeState.NoSubscribed: 1,
//   StreamSubscribeState.Subscribing: 2,
//   StreamSubscribeState.Subscribed: 3,
// };
//
// RtmpStreamingEventConverter _$RtmpStreamingEventConverterFromJson(
//     Map<String, dynamic> json) {
//   return RtmpStreamingEventConverter(
//     _$enumDecode(_$RtmpStreamingEventEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$RtmpStreamingEventConverterToJson(
//         RtmpStreamingEventConverter instance) =>
//     <String, dynamic>{
//       'e': _$RtmpStreamingEventEnumMap[instance.e],
//     };
//
// const _$RtmpStreamingEventEnumMap = {
//   RtmpStreamingEvent.FailedLoadImage: 1,
//   RtmpStreamingEvent.UrlAlreadyInUse: 2,
// };
//
// AudioSessionOperationRestrictionConverter
//     _$AudioSessionOperationRestrictionConverterFromJson(
//         Map<String, dynamic> json) {
//   return AudioSessionOperationRestrictionConverter(
//     _$enumDecode(_$AudioSessionOperationRestrictionEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudioSessionOperationRestrictionConverterToJson(
//         AudioSessionOperationRestrictionConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudioSessionOperationRestrictionEnumMap[instance.e],
//     };
//
// const _$AudioSessionOperationRestrictionEnumMap = {
//   AudioSessionOperationRestriction.None: 0,
//   AudioSessionOperationRestriction.SetCategory: 1,
//   AudioSessionOperationRestriction.ConfigureSession: 2,
//   AudioSessionOperationRestriction.DeactivateSession: 4,
//   AudioSessionOperationRestriction.All: 128,
// };
//
AudioEffectPresetConverter _$AudioEffectPresetConverterFromJson(
    Map<String, dynamic> json) {
  return AudioEffectPresetConverter(
    _$enumDecode(_$AudioEffectPresetEnumMap, json['e']),
  );
}

Map<String, dynamic> _$AudioEffectPresetConverterToJson(
    AudioEffectPresetConverter instance) =>
    <String, dynamic>{
      'e': _$AudioEffectPresetEnumMap[instance.e],
    };

const _$AudioEffectPresetEnumMap = {
  AudioEffectPreset.audioEffectOff: 0,
  AudioEffectPreset.roomAcousticsKtv: 33620224,
  AudioEffectPreset.roomAcousticsVocalConcert: 33620480,
  AudioEffectPreset.roomAcousticsStudio: 33620736,
  AudioEffectPreset.roomAcousticsPhonograph: 33620992,
  AudioEffectPreset.roomAcousticsVirtualStereo: 33621248,
  AudioEffectPreset.roomAcousticsSpacial: 33621504,
  AudioEffectPreset.roomAcousticsEthereal: 33621760,
  AudioEffectPreset.roomAcoustics3dVoice: 33622016,
  AudioEffectPreset.voiceChangerEffectUncle: 33685760,
  AudioEffectPreset.voiceChangerEffectOldman: 33686016,
  AudioEffectPreset.voiceChangerEffectBoy: 33686272,
  AudioEffectPreset.voiceChangerEffectSister: 33686528,
  AudioEffectPreset.voiceChangerEffectGirl: 33686784,
  AudioEffectPreset.voiceChangerEffectPigking: 33687040,
  AudioEffectPreset.voiceChangerEffectHulk: 33687296,
  AudioEffectPreset.styleTransformationRnb: 33751296,
  AudioEffectPreset.styleTransformationPopular: 33751552,
  AudioEffectPreset.pitchCorrection: 33816832,
};
//
// VoiceBeautifierPresetConverter _$VoiceBeautifierPresetConverterFromJson(
//     Map<String, dynamic> json) {
//   return VoiceBeautifierPresetConverter(
//     _$enumDecode(_$VoiceBeautifierPresetEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VoiceBeautifierPresetConverterToJson(
//         VoiceBeautifierPresetConverter instance) =>
//     <String, dynamic>{
//       'e': _$VoiceBeautifierPresetEnumMap[instance.e],
//     };
//
// const _$VoiceBeautifierPresetEnumMap = {
//   VoiceBeautifierPreset.VoiceBeautifierOff: 0,
//   VoiceBeautifierPreset.ChatBeautifierMagnetic: 16843008,
//   VoiceBeautifierPreset.ChatBeautifierFresh: 16843264,
//   VoiceBeautifierPreset.ChatBeautifierVitality: 16843520,
//   VoiceBeautifierPreset.SingingBeautifier: 16908544,
//   VoiceBeautifierPreset.TimbreTransformationVigorous: 16974080,
//   VoiceBeautifierPreset.TimbreTransformationDeep: 16974336,
//   VoiceBeautifierPreset.TimbreTransformationMellow: 16974592,
//   VoiceBeautifierPreset.TimbreTransformationFalsetto: 16974848,
//   VoiceBeautifierPreset.TimbreTransformationFull: 16975104,
//   VoiceBeautifierPreset.TimbreTransformationClear: 16975360,
//   VoiceBeautifierPreset.TimbreTransformationResounding: 16975616,
//   VoiceBeautifierPreset.TimbreTransformationRinging: 16975872,
// };
//
// AudienceLatencyLevelTypeConverter _$AudienceLatencyLevelTypeConverterFromJson(
//     Map<String, dynamic> json) {
//   return AudienceLatencyLevelTypeConverter(
//     _$enumDecode(_$AudienceLatencyLevelTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$AudienceLatencyLevelTypeConverterToJson(
//         AudienceLatencyLevelTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$AudienceLatencyLevelTypeEnumMap[instance.e],
//     };
//
// const _$AudienceLatencyLevelTypeEnumMap = {
//   AudienceLatencyLevelType.LowLatency: 1,
//   AudienceLatencyLevelType.UltraLowLatency: 2,
// };
//
// LogLevelConverter _$LogLevelConverterFromJson(Map<String, dynamic> json) {
//   return LogLevelConverter(
//     _$enumDecode(_$LogLevelEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$LogLevelConverterToJson(LogLevelConverter instance) =>
//     <String, dynamic>{
//       'e': _$LogLevelEnumMap[instance.e],
//     };
//
// const _$LogLevelEnumMap = {
//   LogLevel.None: 0,
//   LogLevel.Info: 1,
//   LogLevel.Warn: 2,
//   LogLevel.Error: 4,
//   LogLevel.Fatal: 8,
// };
//
// CaptureBrightnessLevelTypeConverter
//     _$CaptureBrightnessLevelTypeConverterFromJson(Map<String, dynamic> json) {
//   return CaptureBrightnessLevelTypeConverter(
//     _$enumDecode(_$CaptureBrightnessLevelTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$CaptureBrightnessLevelTypeConverterToJson(
//         CaptureBrightnessLevelTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$CaptureBrightnessLevelTypeEnumMap[instance.e],
//     };
//
// const _$CaptureBrightnessLevelTypeEnumMap = {
//   CaptureBrightnessLevelType.Invalid: -1,
//   CaptureBrightnessLevelType.Normal: 0,
//   CaptureBrightnessLevelType.Bright: 1,
//   CaptureBrightnessLevelType.Dark: 2,
// };
//
// SuperResolutionStateReasonConverter
//     _$SuperResolutionStateReasonConverterFromJson(Map<String, dynamic> json) {
//   return SuperResolutionStateReasonConverter(
//     _$enumDecode(_$SuperResolutionStateReasonEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$SuperResolutionStateReasonConverterToJson(
//         SuperResolutionStateReasonConverter instance) =>
//     <String, dynamic>{
//       'e': _$SuperResolutionStateReasonEnumMap[instance.e],
//     };
//
// const _$SuperResolutionStateReasonEnumMap = {
//   SuperResolutionStateReason.Success: 0,
//   SuperResolutionStateReason.StreamOverLimitation: 1,
//   SuperResolutionStateReason.UserCountOverLimitation: 2,
//   SuperResolutionStateReason.DeviceNotSupported: 3,
// };
//
// UploadErrorReasonConverter _$UploadErrorReasonConverterFromJson(
//     Map<String, dynamic> json) {
//   return UploadErrorReasonConverter(
//     _$enumDecode(_$UploadErrorReasonEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$UploadErrorReasonConverterToJson(
//         UploadErrorReasonConverter instance) =>
//     <String, dynamic>{
//       'e': _$UploadErrorReasonEnumMap[instance.e],
//     };
//
// const _$UploadErrorReasonEnumMap = {
//   UploadErrorReason.Success: 0,
//   UploadErrorReason.NetError: 1,
//   UploadErrorReason.ServerError: 2,
// };
//
// CloudProxyTypeConverter _$CloudProxyTypeConverterFromJson(
//     Map<String, dynamic> json) {
//   return CloudProxyTypeConverter(
//     _$enumDecode(_$CloudProxyTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$CloudProxyTypeConverterToJson(
//         CloudProxyTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$CloudProxyTypeEnumMap[instance.e],
//     };
//
// const _$CloudProxyTypeEnumMap = {
//   CloudProxyType.None: 0,
//   CloudProxyType.UDP: 1,
//   CloudProxyType.TCP: 2,
// };
//
// ExperienceQualityTypeConverter _$ExperienceQualityTypeConverterFromJson(
//     Map<String, dynamic> json) {
//   return ExperienceQualityTypeConverter(
//     _$enumDecode(_$ExperienceQualityTypeEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$ExperienceQualityTypeConverterToJson(
//         ExperienceQualityTypeConverter instance) =>
//     <String, dynamic>{
//       'e': _$ExperienceQualityTypeEnumMap[instance.e],
//     };
//
// const _$ExperienceQualityTypeEnumMap = {
//   ExperienceQualityType.Good: 0,
//   ExperienceQualityType.Bad: 1,
// };
//
// ExperiencePoorReasonConverter _$ExperiencePoorReasonConverterFromJson(
//     Map<String, dynamic> json) {
//   return ExperiencePoorReasonConverter(
//     _$enumDecode(_$ExperiencePoorReasonEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$ExperiencePoorReasonConverterToJson(
//         ExperiencePoorReasonConverter instance) =>
//     <String, dynamic>{
//       'e': _$ExperiencePoorReasonEnumMap[instance.e],
//     };
//
// const _$ExperiencePoorReasonEnumMap = {
//   ExperiencePoorReason.None: 0,
//   ExperiencePoorReason.RemoteNetworkQualityPoor: 1,
//   ExperiencePoorReason.LocalNetworkQualityPoor: 2,
//   ExperiencePoorReason.WirelessSignalPoor: 4,
//   ExperiencePoorReason.WifiBluetoothCoexist: 8,
// };
//
// VoiceConversionPresetConverter _$VoiceConversionPresetConverterFromJson(
//     Map<String, dynamic> json) {
//   return VoiceConversionPresetConverter(
//     _$enumDecode(_$VoiceConversionPresetEnumMap, json['e']),
//   );
// }
//
// Map<String, dynamic> _$VoiceConversionPresetConverterToJson(
//         VoiceConversionPresetConverter instance) =>
//     <String, dynamic>{
//       'e': _$VoiceConversionPresetEnumMap[instance.e],
//     };
//
// const _$VoiceConversionPresetEnumMap = {
//   VoiceConversionPreset.Off: 0,
//   VoiceConversionPreset.Neutral: 50397440,
//   VoiceConversionPreset.Sweet: 50397696,
//   VoiceConversionPreset.Solid: 50397952,
//   VoiceConversionPreset.Bass: 50398208,
// };

PreloadStatusCodeConverter _$PreloadStatusCodeConverterFromJson(
    Map<String, dynamic> json) {
  return PreloadStatusCodeConverter(
    _$enumDecode(_$PreloadStatusCodeEnumMap, json['e']),
  );
}

Map<String, dynamic> _$PreloadStatusCodeConverterToJson(
    PreloadStatusCodeConverter instance) =>
    <String, dynamic>{
      'e': _$PreloadStatusCodeEnumMap[instance.e],
    };

const _$PreloadStatusCodeEnumMap = {
  PreloadStatusCode.kPreloadStatusCompleted: 0,
  PreloadStatusCode.kPreloadStatusFailed: 1,
  PreloadStatusCode.kPreloadStatusPreloading: 2,
};
