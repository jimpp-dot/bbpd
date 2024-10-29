// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_converter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaCodeConverter _$AreaCodeConverterFromJson(Map<String, dynamic> json) {
  return AreaCodeConverter(
    _$enumDecode(_$AreaCodeEnumMap, json['e']),
  );
}

Map<String, dynamic> _$AreaCodeConverterToJson(AreaCodeConverter instance) =>
    <String, dynamic>{
      'e': _$AreaCodeEnumMap[instance.e],
    };

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

const _$AreaCodeEnumMap = {
  AreaCode.CN: 1,
  AreaCode.NA: 2,
  AreaCode.EU: 4,
  AreaCode.AS: 8,
  AreaCode.JP: 16,
  AreaCode.IN: 32,
  AreaCode.GLOB: -1,
};

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
  AudioMixingReason.CanNotOpen: 701,
  AudioMixingReason.TooFrequentCall: 702,
  AudioMixingReason.InterruptedEOF: 703,
  AudioMixingReason.StartedByUser: 720,
  AudioMixingReason.OneLoopCompleted: 721,
  AudioMixingReason.StartNewLoop: 722,
  AudioMixingReason.AllLoopsCompleted: 723,
  AudioMixingReason.StoppedByUser: 724,
  AudioMixingReason.PausedByUser: 725,
  AudioMixingReason.ResumedByUser: 726,
  AudioMixingReason.OK: 0,
  AudioMixingReason.UnKnown: -1,
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
  AudioMixingStateCode.UnKnown: -1,
  AudioMixingStateCode.Playing: 710,
  AudioMixingStateCode.Paused: 711,
  AudioMixingStateCode.Stopped: -2,
  AudioMixingStateCode.PlayEnded: 713,
  AudioMixingStateCode.Failed: 714,
};

AudioOutputRoutingConverter _$AudioOutputRoutingConverterFromJson(
    Map<String, dynamic> json) {
  return AudioOutputRoutingConverter(
    _$enumDecode(_$AudioOutputRoutingEnumMap, json['e']),
  );
}

Map<String, dynamic> _$AudioOutputRoutingConverterToJson(
        AudioOutputRoutingConverter instance) =>
    <String, dynamic>{
      'e': _$AudioOutputRoutingEnumMap[instance.e],
    };

const _$AudioOutputRoutingEnumMap = {
  AudioOutputRouting.UnKnown: -2,
  AudioOutputRouting.Default: -1,
  AudioOutputRouting.Headset: 0,
  AudioOutputRouting.Earpiece: 1,
  AudioOutputRouting.HeadsetNoMic: 2,
  AudioOutputRouting.Speakerphone: 3,
  AudioOutputRouting.Loudspeaker: 4,
  AudioOutputRouting.HeadsetBluetooth: 5,
  AudioOutputRouting.AirPlay: -3,
  AudioOutputRouting.ExternalUSB: -4,
};

AudioProfileConverter _$AudioProfileConverterFromJson(
    Map<String, dynamic> json) {
  return AudioProfileConverter(
    _$enumDecode(_$AudioProfileEnumMap, json['e']),
  );
}

Map<String, dynamic> _$AudioProfileConverterToJson(
        AudioProfileConverter instance) =>
    <String, dynamic>{
      'e': _$AudioProfileEnumMap[instance.e],
    };

const _$AudioProfileEnumMap = {
  AudioProfile.Default: 0,
  AudioProfile.SpeechStandard: 1,
  AudioProfile.MusicStandard: 2,
  AudioProfile.MusicStandardStereo: 3,
  AudioProfile.MusicHighQuality: 4,
  AudioProfile.MusicHighQualityStereo: 5,
};

AudioScenarioConverter _$AudioScenarioConverterFromJson(
    Map<String, dynamic> json) {
  return AudioScenarioConverter(
    _$enumDecode(_$AudioScenarioEnumMap, json['e']),
  );
}

Map<String, dynamic> _$AudioScenarioConverterToJson(
        AudioScenarioConverter instance) =>
    <String, dynamic>{
      'e': _$AudioScenarioEnumMap[instance.e],
    };

const _$AudioScenarioEnumMap = {
  AudioScenario.Default: 0,
  AudioScenario.ChatRoomEntertainment: 1,
  AudioScenario.Education: 2,
  AudioScenario.GameStreaming: 3,
  AudioScenario.ShowRoom: 4,
  AudioScenario.ChatRoomGaming: 5,
  AudioScenario.IOT: 6,
  AudioScenario.MEETING: 8,
};

ChannelProfileConverter _$ChannelProfileConverterFromJson(
    Map<String, dynamic> json) {
  return ChannelProfileConverter(
    _$enumDecode(_$ChannelProfileEnumMap, json['e']),
  );
}

Map<String, dynamic> _$ChannelProfileConverterToJson(
        ChannelProfileConverter instance) =>
    <String, dynamic>{
      'e': _$ChannelProfileEnumMap[instance.e],
    };

const _$ChannelProfileEnumMap = {
  ChannelProfile.Communication: 0,
  ChannelProfile.LiveBroadcasting: 1,
  ChannelProfile.Game: 2,
  ChannelProfile.General: -1,
};

ClientRoleConverter _$ClientRoleConverterFromJson(Map<String, dynamic> json) {
  return ClientRoleConverter(
    _$enumDecode(_$ClientRoleEnumMap, json['e']),
  );
}

Map<String, dynamic> _$ClientRoleConverterToJson(
        ClientRoleConverter instance) =>
    <String, dynamic>{
      'e': _$ClientRoleEnumMap[instance.e],
    };

const _$ClientRoleEnumMap = {
  ClientRole.Broadcaster: 1,
  ClientRole.Audience: 2,
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
  ConnectionChangedReason.UnKnown: -1,
  ConnectionChangedReason.Connecting: 0,
  ConnectionChangedReason.JoinSuccess: 1,
  ConnectionChangedReason.Interrupted: 2,
  ConnectionChangedReason.BannedByServer: 3,
  ConnectionChangedReason.JoinFailed: 4,
  ConnectionChangedReason.LeaveChannel: 5,
  ConnectionChangedReason.InvalidAppId: 6,
  ConnectionChangedReason.InvalidChannelName: 7,
  ConnectionChangedReason.InvalidToken: 8,
  ConnectionChangedReason.TokenExpired: 9,
  ConnectionChangedReason.RejectedByServer: 10,
  ConnectionChangedReason.SettingProxyServer: 11,
  ConnectionChangedReason.RenewToken: 12,
  ConnectionChangedReason.ClientIpAddressChanged: 13,
  ConnectionChangedReason.KeepAliveTimeout: 14,
  ConnectionChangedReason.ProxyServerInterrupted: 15,
};

ConnectionStateTypeConverter _$ConnectionStateTypeConverterFromJson(
    Map<String, dynamic> json) {
  return ConnectionStateTypeConverter(
    _$enumDecode(_$ConnectionStateTypeEnumMap, json['e']),
  );
}

Map<String, dynamic> _$ConnectionStateTypeConverterToJson(
        ConnectionStateTypeConverter instance) =>
    <String, dynamic>{
      'e': _$ConnectionStateTypeEnumMap[instance.e],
    };

const _$ConnectionStateTypeEnumMap = {
  ConnectionStateType.Disconnected: 1,
  ConnectionStateType.Connecting: 2,
  ConnectionStateType.Connected: 3,
  ConnectionStateType.Reconnecting: 4,
  ConnectionStateType.Failed: 5,
};

ErrorCodeConverter _$ErrorCodeConverterFromJson(Map<String, dynamic> json) {
  return ErrorCodeConverter(
    _$enumDecode(_$ErrorCodeEnumMap, json['e']),
  );
}

Map<String, dynamic> _$ErrorCodeConverterToJson(ErrorCodeConverter instance) =>
    <String, dynamic>{
      'e': _$ErrorCodeEnumMap[instance.e],
    };

const _$ErrorCodeEnumMap = {
  ErrorCode.UnKnown: -1,
  ErrorCode.NoError: 0,
  ErrorCode.Failed: 1,
  ErrorCode.InvalidArgument: 2,
  ErrorCode.NotReady: 3,
  ErrorCode.NotSupported: 4,
  ErrorCode.Refused: 5,
  ErrorCode.BufferTooSmall: 6,
  ErrorCode.NotInitialized: 7,
  ErrorCode.NoPermission: 9,
  ErrorCode.TimedOut: 10,
  ErrorCode.Canceled: 11,
  ErrorCode.TooOften: 12,
  ErrorCode.BindSocket: 13,
  ErrorCode.NetDown: 14,
  ErrorCode.NoBufs: 15,
  ErrorCode.JoinChannelRejected: 17,
  ErrorCode.LeaveChannelRejected: 18,
  ErrorCode.AlreadyInUse: 19,
  ErrorCode.Abort: 20,
  ErrorCode.InitNetEngine: 21,
  ErrorCode.ResourceLimited: 22,
  ErrorCode.InvalidAppId: 101,
  ErrorCode.InvalidChannelId: 102,
  ErrorCode.NoServerResources: 103,
  ErrorCode.TokenExpired: 109,
  ErrorCode.InvalidToken: 110,
  ErrorCode.ConnectionInterrupted: 111,
  ErrorCode.ConnectionLost: 112,
  ErrorCode.NotInChannel: 113,
  ErrorCode.SizeTooLarge: 114,
  ErrorCode.BitrateLimit: 115,
  ErrorCode.TooManyDataStreams: 116,
  ErrorCode.DecryptionFailed: 120,
  ErrorCode.ClientIsBannedByServer: 123,
  ErrorCode.WatermarkParam: 124,
  ErrorCode.WatermarkPath: 125,
  ErrorCode.WatermarkPng: 126,
  ErrorCode.WatermarkInfo: 127,
  ErrorCode.WatermarkAGRB: 128,
  ErrorCode.WatermarkRead: 129,
  ErrorCode.EncryptedStreamNotAllowedPublish: 130,
  ErrorCode.InvalidUserAccount: 134,
  ErrorCode.PublishStreamCDNError: 151,
  ErrorCode.PublishStreamNumReachLimit: 152,
  ErrorCode.PublishStreamNotAuthorized: 153,
  ErrorCode.PublishStreamInternalServerError: 154,
  ErrorCode.PublishStreamNotFound: 155,
  ErrorCode.PublishStreamFormatNotSuppported: 156,
  ErrorCode.LoadMediaEngine: 1001,
  ErrorCode.StartCall: 1002,
  ErrorCode.StartCamera: 1003,
  ErrorCode.StartVideoRender: 1004,
  ErrorCode.AdmGeneralError: 1005,
  ErrorCode.AdmJavaResource: 1006,
  ErrorCode.AdmSampleRate: 1007,
  ErrorCode.AdmInitPlayout: 1008,
  ErrorCode.AdmStartPlayout: 1009,
  ErrorCode.AdmStopPlayout: 1010,
  ErrorCode.AdmInitRecording: 1011,
  ErrorCode.AdmStartRecording: 1012,
  ErrorCode.AdmStopRecording: 1013,
  ErrorCode.AdmRuntimePlayoutError: 1015,
  ErrorCode.AdmRuntimeRecordingError: 1017,
  ErrorCode.AdmRecordAudioFailed: 1018,
  ErrorCode.AdmPlayAbnormalFrequency: 1020,
  ErrorCode.AdmRecordAbnormalFrequency: 1021,
  ErrorCode.AdmInitLoopback: 1022,
  ErrorCode.AdmStartLoopback: 1023,
  ErrorCode.AdmNoPermission: 1027,
  ErrorCode.AudioBtScoFailed: 1030,
  ErrorCode.AdmNoRecordingDevice: 1359,
  ErrorCode.AdmNoPlayoutDevice: 1360,
  ErrorCode.VdmCameraNotAuthorized: 1501,
  ErrorCode.VcmUnknownError: 1600,
  ErrorCode.VcmEncoderInitError: 1601,
  ErrorCode.VcmEncoderEncodeError: 1602,
  ErrorCode.VcmEncoderSetError: 1603,
};

InjectStreamStatusConverter _$InjectStreamStatusConverterFromJson(
    Map<String, dynamic> json) {
  return InjectStreamStatusConverter(
    _$enumDecode(_$InjectStreamStatusEnumMap, json['e']),
  );
}

Map<String, dynamic> _$InjectStreamStatusConverterToJson(
        InjectStreamStatusConverter instance) =>
    <String, dynamic>{
      'e': _$InjectStreamStatusEnumMap[instance.e],
    };

const _$InjectStreamStatusEnumMap = {
  InjectStreamStatus.StartSuccess: 0,
  InjectStreamStatus.StartAlreadyExists: 1,
  InjectStreamStatus.StartUnauthorized: 2,
  InjectStreamStatus.StartTimedout: 3,
  InjectStreamStatus.StartFailed: 4,
  InjectStreamStatus.StopSuccess: 5,
  InjectStreamStatus.StopNotFound: 6,
  InjectStreamStatus.StopUnauthorized: 7,
  InjectStreamStatus.StopTimedout: 8,
  InjectStreamStatus.StopFailed: 9,
  InjectStreamStatus.Broken: 10,
};

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
  UserOfflineReason.UnKnown: -1,
  UserOfflineReason.Quit: 0,
  UserOfflineReason.Dropped: 1,
  UserOfflineReason.BecomeAudience: 2,
};

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
  WarningCode.UnKnown: -1,
  WarningCode.InvalidView: 8,
  WarningCode.InitVideo: 16,
  WarningCode.Pending: 20,
  WarningCode.NoAvailableChannel: 103,
  WarningCode.LookupChannelTimeout: 104,
  WarningCode.LookupChannelRejected: 105,
  WarningCode.OpenChannelTimeout: 106,
  WarningCode.OpenChannelRejected: 107,
  WarningCode.SwitchLiveVideoTimeout: 111,
  WarningCode.SetClientRoleTimeout: 118,
  WarningCode.SetClientRoleNotAuthorized: 119,
  WarningCode.OpenChannelInvalidTicket: 121,
  WarningCode.OpenChannelTryNextVos: 122,
  WarningCode.AudioMixingOpenError: 701,
  WarningCode.AdmRuntimePlayoutWarning: 1014,
  WarningCode.AdmRuntimeRecordingWarning: 1016,
  WarningCode.AdmRecordAudioSilence: 1019,
  WarningCode.AdmPlaybackMalfunction: 1020,
  WarningCode.AdmRecordMalfunction: 1021,
  WarningCode.AdmInterruption: 1025,
  WarningCode.AdmCategoryNotPlayAndRecord: 1029,
  WarningCode.AdmRecordAudioLowlevel: 1031,
  WarningCode.AdmPlayoutAudioLowlevel: 1032,
  WarningCode.AdmRecordIsOccupied: 1033,
  WarningCode.AdmNoDataReadyCallback: 1040,
  WarningCode.AdmInconsistentDevices: 1042,
  WarningCode.ApmHowling: 1051,
  WarningCode.AdmGlitchState: 1052,
  WarningCode.ApmResidualEcho: 1053,
  WarningCode.SuperResolutionStreamOverLimitation: 1610,
  WarningCode.SuperResolutionUserCountOverLimitation: 1611,
  WarningCode.SuperResolutionDeviceNotSupported: 1612,
  WarningCode.PublisherError: -2,
};

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
  AudioEffectPreset.AudioEffectOff: 0,
  AudioEffectPreset.RoomAcousticsKTV: 33620224,
  AudioEffectPreset.RoomAcousticsVocalConcert: 33620480,
  AudioEffectPreset.RoomAcousticsStudio: 33620736,
  AudioEffectPreset.RoomAcousticsPhonograph: 33620992,
  AudioEffectPreset.RoomAcousticsVirtualStereo: 33621248,
  AudioEffectPreset.RoomAcousticsSpacial: 33621504,
  AudioEffectPreset.RoomAcousticsEthereal: 33621760,
  AudioEffectPreset.RoomAcoustics3DVoice: 33622016,
  AudioEffectPreset.VoiceChangerEffectUncle: 33685760,
  AudioEffectPreset.VoiceChangerEffectOldMan: 33686016,
  AudioEffectPreset.VoiceChangerEffectBoy: 33686272,
  AudioEffectPreset.VoiceChangerEffectSister: 33686528,
  AudioEffectPreset.VoiceChangerEffectGirl: 33686784,
  AudioEffectPreset.VoiceChangerEffectPigKing: 33687040,
  AudioEffectPreset.VoiceChangerEffectHulk: 33687296,
  AudioEffectPreset.StyleTransformationRnB: 33751296,
  AudioEffectPreset.StyleTransformationPopular: 33751552,
  AudioEffectPreset.PitchCorrection: 33816832,
  AudioEffectPreset.Basement: 84148480,
  AudioEffectPreset.VocalConcert: 84148736,
  AudioEffectPreset.ConcertHall: 84148992,
};

VoiceBeautifierPresetConverter _$VoiceBeautifierPresetConverterFromJson(
    Map<String, dynamic> json) {
  return VoiceBeautifierPresetConverter(
    _$enumDecode(_$VoiceBeautifierPresetEnumMap, json['e']),
  );
}

Map<String, dynamic> _$VoiceBeautifierPresetConverterToJson(
        VoiceBeautifierPresetConverter instance) =>
    <String, dynamic>{
      'e': _$VoiceBeautifierPresetEnumMap[instance.e],
    };

const _$VoiceBeautifierPresetEnumMap = {
  VoiceBeautifierPreset.VoiceBeautifierOff: 0,
  VoiceBeautifierPreset.ChatBeautifierMagnetic: 16843008,
  VoiceBeautifierPreset.ChatBeautifierFresh: 16843264,
  VoiceBeautifierPreset.ChatBeautifierVitality: 16843520,
  VoiceBeautifierPreset.TimbreTransformationVigorous: 16974080,
  VoiceBeautifierPreset.TimbreTransformationDeep: 16974336,
  VoiceBeautifierPreset.TimbreTransformationMellow: 16974592,
  VoiceBeautifierPreset.TimbreTransformationFalsetto: 16974848,
  VoiceBeautifierPreset.TimbreTransformationFull: 16975104,
  VoiceBeautifierPreset.TimbreTransformationClear: 16975360,
  VoiceBeautifierPreset.TimbreTransformationResounding: 16975616,
  VoiceBeautifierPreset.TimbreTransformationRinging: 16975872,
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
  AudioLocalError.UnKnown: -1,
  AudioLocalError.Ok: 0,
  AudioLocalError.Failure: 1,
  AudioLocalError.DeviceNoPermission: 2,
  AudioLocalError.DeviceBusy: 3,
  AudioLocalError.RecordFailure: 4,
  AudioLocalError.EncodeFailure: 5,
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
  AudioLocalState.UnKnown: -1,
  AudioLocalState.Stopped: 0,
  AudioLocalState.Recording: 1,
  AudioLocalState.Encoding: 2,
  AudioLocalState.Failed: 3,
};

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
