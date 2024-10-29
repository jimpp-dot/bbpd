// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

import 'enums.dart';

part 'enum_converter.g.dart';

abstract class EnumConverter<E, T> {
  late E e;

  EnumConverter(this.e);

  EnumConverter.fromValue(Map<E, T> map, T t, {E? unknownValue}) {
    e = _$enumDecode(map, t, unknownValue: unknownValue);
  }

  T toValue(Map<E, T> map) {
    return map[e]!;
  }
}

@JsonSerializable()
class AreaCodeConverter extends EnumConverter<AreaCode, int> {
  AreaCodeConverter(AreaCode e) : super(e);

  AreaCodeConverter.fromValue(int value)
      : super.fromValue(_$AreaCodeEnumMap, value);

  int value() {
    return super.toValue(_$AreaCodeEnumMap);
  }
}

@JsonSerializable()
class AudioMixingReasonConverter extends EnumConverter<AudioMixingReason, int> {
  AudioMixingReasonConverter(AudioMixingReason e) : super(e);

  AudioMixingReasonConverter.fromValue(int value)
      : super.fromValue(_$AudioMixingReasonEnumMap, value, unknownValue: AudioMixingReason.UnKnown);

  int value() {
    return super.toValue(_$AudioMixingReasonEnumMap);
  }
}

@JsonSerializable()
class AudioMixingStateCodeConverter extends EnumConverter<AudioMixingStateCode, int> {
  AudioMixingStateCodeConverter(AudioMixingStateCode e) : super(e);

  AudioMixingStateCodeConverter.fromValue(int value)
      : super.fromValue(_$AudioMixingStateCodeEnumMap, value, unknownValue: AudioMixingStateCode.UnKnown);

  int value() {
    return super.toValue(_$AudioMixingStateCodeEnumMap);
  }
}

@JsonSerializable()
class AudioOutputRoutingConverter extends EnumConverter<AudioOutputRouting, int> {
  AudioOutputRoutingConverter(AudioOutputRouting e) : super(e);

  AudioOutputRoutingConverter.fromValue(int value)
      : super.fromValue(_$AudioOutputRoutingEnumMap, value, unknownValue: AudioOutputRouting.UnKnown);

  int value() {
    return super.toValue(_$AudioOutputRoutingEnumMap);
  }
}

@JsonSerializable()
class AudioProfileConverter extends EnumConverter<AudioProfile, int> {
  AudioProfileConverter(AudioProfile e) : super(e);

  AudioProfileConverter.fromValue(int value)
      : super.fromValue(
          _$AudioProfileEnumMap,
          value,
        );

  int value() {
    return super.toValue(_$AudioProfileEnumMap);
  }
}

@JsonSerializable()
class AudioScenarioConverter extends EnumConverter<AudioScenario, int> {
  AudioScenarioConverter(AudioScenario e) : super(e);

  AudioScenarioConverter.fromValue(int value) : super.fromValue(_$AudioScenarioEnumMap, value);

  int value() {
    return super.toValue(_$AudioScenarioEnumMap);
  }
}

@JsonSerializable()
class ChannelProfileConverter extends EnumConverter<ChannelProfile, int> {
  ChannelProfileConverter(ChannelProfile e) : super(e);

  ChannelProfileConverter.fromValue(int value)
      : super.fromValue(_$ChannelProfileEnumMap, value);

  int value() {
    return super.toValue(_$ChannelProfileEnumMap);
  }
}

@JsonSerializable()
class ClientRoleConverter extends EnumConverter<ClientRole, int> {
  ClientRoleConverter(ClientRole e) : super(e);

  ClientRoleConverter.fromValue(int value)
      : super.fromValue(_$ClientRoleEnumMap, value);

  int value() {
    return super.toValue(_$ClientRoleEnumMap);
  }
}

@JsonSerializable()
class ConnectionChangedReasonConverter
    extends EnumConverter<ConnectionChangedReason, int> {
  ConnectionChangedReasonConverter(ConnectionChangedReason e) : super(e);

  ConnectionChangedReasonConverter.fromValue(int value)
      : super.fromValue(_$ConnectionChangedReasonEnumMap, value,
            unknownValue: ConnectionChangedReason.UnKnown);

  int value() {
    return super.toValue(_$ConnectionChangedReasonEnumMap);
  }
}

@JsonSerializable()
class ConnectionStateTypeConverter
    extends EnumConverter<ConnectionStateType, int> {
  ConnectionStateTypeConverter(ConnectionStateType e) : super(e);

  ConnectionStateTypeConverter.fromValue(int value)
      : super.fromValue(_$ConnectionStateTypeEnumMap, value);

  int value() {
    return super.toValue(_$ConnectionStateTypeEnumMap);
  }
}

@JsonSerializable()
class ErrorCodeConverter extends EnumConverter<ErrorCode, int> {
  ErrorCodeConverter(ErrorCode e) : super(e);

  ErrorCodeConverter.fromValue(int value)
      : super.fromValue(_$ErrorCodeEnumMap, value,
            unknownValue: ErrorCode.UnKnown);

  int value() {
    return super.toValue(_$ErrorCodeEnumMap);
  }
}

@JsonSerializable()
class InjectStreamStatusConverter
    extends EnumConverter<InjectStreamStatus, int> {
  InjectStreamStatusConverter(InjectStreamStatus e) : super(e);

  InjectStreamStatusConverter.fromValue(int value)
      : super.fromValue(_$InjectStreamStatusEnumMap, value);

  int value() {
    return super.toValue(_$InjectStreamStatusEnumMap);
  }
}

@JsonSerializable()
class UserOfflineReasonConverter extends EnumConverter<UserOfflineReason, int> {
  UserOfflineReasonConverter(UserOfflineReason e) : super(e);

  UserOfflineReasonConverter.fromValue(int value)
      : super.fromValue(_$UserOfflineReasonEnumMap, value,
            unknownValue: UserOfflineReason.UnKnown);

  int value() {
    return super.toValue(_$UserOfflineReasonEnumMap);
  }
}

@JsonSerializable()
class WarningCodeConverter extends EnumConverter<WarningCode, int> {
  WarningCodeConverter(WarningCode e) : super(e);

  WarningCodeConverter.fromValue(int value)
      : super.fromValue(_$WarningCodeEnumMap, value,
            unknownValue: WarningCode.UnKnown);

  int value() {
    return super.toValue(_$WarningCodeEnumMap);
  }
}

@JsonSerializable()
class AudioEffectPresetConverter extends EnumConverter<AudioEffectPreset, int> {
  AudioEffectPresetConverter(AudioEffectPreset e) : super(e);

  AudioEffectPresetConverter.fromValue(int value)
      : super.fromValue(_$AudioEffectPresetEnumMap, value);

  int value() {
    return super.toValue(_$AudioEffectPresetEnumMap);
  }
}

@JsonSerializable()
class VoiceBeautifierPresetConverter
    extends EnumConverter<VoiceBeautifierPreset, int> {
  VoiceBeautifierPresetConverter(VoiceBeautifierPreset e) : super(e);

  VoiceBeautifierPresetConverter.fromValue(int value)
      : super.fromValue(_$VoiceBeautifierPresetEnumMap, value);

  int value() {
    return super.toValue(_$VoiceBeautifierPresetEnumMap);
  }
}

@JsonSerializable()
class AudioLocalErrorConverter extends EnumConverter<AudioLocalError, int> {
  AudioLocalErrorConverter(AudioLocalError e) : super(e);

  AudioLocalErrorConverter.fromValue(int value)
      : super.fromValue(_$AudioLocalErrorEnumMap, value,
            unknownValue: AudioLocalError.UnKnown);

  int value() {
    return super.toValue(_$AudioLocalErrorEnumMap);
  }
}

@JsonSerializable()
class AudioLocalStateConverter extends EnumConverter<AudioLocalState, int> {
  AudioLocalStateConverter(AudioLocalState e) : super(e);

  AudioLocalStateConverter.fromValue(int value)
      : super.fromValue(_$AudioLocalStateEnumMap, value,
            unknownValue: AudioLocalState.UnKnown);

  int value() {
    return super.toValue(_$AudioLocalStateEnumMap);
  }
}

@JsonSerializable()
class PreloadStatusCodeConverter extends EnumConverter<PreloadStatusCode, int> {
  PreloadStatusCodeConverter(PreloadStatusCode e) : super(e);

  PreloadStatusCodeConverter.fromValue(int value)
      : super.fromValue(_$PreloadStatusCodeEnumMap, value,
      unknownValue: PreloadStatusCode.kPreloadStatusFailed);

  int value() {
    return super.toValue(_$PreloadStatusCodeEnumMap);
  }
}
