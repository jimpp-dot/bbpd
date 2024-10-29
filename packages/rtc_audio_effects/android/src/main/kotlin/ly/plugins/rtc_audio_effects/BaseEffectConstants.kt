package ly.plugins.rtc_audio_effects

object BaseEffectConstants {
  const val TAG = "EffectCore"
}

enum class ErrorCode {
  Zero,
  UnInitialized,
  SetInitialize,
  InValidLyrics,
  AudioEffectPreset,
  AudioProfile,
  AdjustAudioMixingVolume,
  AdjustRecordingSignalVolume,
  AudioMixingPosition,
  SwitchAccompany,
  SetTolerance,
  SetNoiseLevel,
  Set3AType,
  PushAudioDataMark,
}