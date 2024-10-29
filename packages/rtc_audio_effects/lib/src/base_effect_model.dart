class LyricsInfo {
  int index;
  int beginTimeMs;
  int endTimeMs;

  LyricsInfo({
    required this.index,
    required this.beginTimeMs,
    required this.endTimeMs,
  });

  Map<String, dynamic> toJson() {
    return {
      "index": index,
      "beginTimeMs": beginTimeMs,
      "endTimeMs": endTimeMs,
    };
  }

  factory LyricsInfo.fromJson(Map<String, dynamic> json) {
    return LyricsInfo(
      index: int.parse(json["index"]),
      beginTimeMs: int.parse(json["beginTimeMs"]),
      endTimeMs: int.parse(json["endTimeMs"]),
    );
  }
}

class BaseEffectConstants {
  static const int audioProfileEefault = 0;
  static const int audioProfileSpeechStandard = 1;
  static const int audioProfileMusicStandard = 2;
  static const int audioProfileMusicStandardStereo = 3;
  static const int audioProfileMusicHighQuality = 4;
  static const int audioProfileMusicHighQualityStereo = 5;

  static const int stateAudioEffectFailed = -1;
  static const int stateAudioEffectOk = 0;
  static const int stateAudioEffectPlaying = 1;

  /// 伴奏结束时回调，此时录音结束生成目标文件,主动调用Stop函数会有此回调
  static const int stateAudioEffectFinish = 2;

  static const int mixingAudioSound = 1;
  static const int originalAudioSound = 2;

  static const int audioEffectCoreAudition = 0;
  static const int audioEffectCoreRecord = 1;
  static const int audioEffectCoreEdit = 2;
  static const int audioEffectCoreProduct = 3;
  static const int audioEffectCoreRecordSingle = 4;
  static const int audioEffectCoreMark = 5;
  static const int audioEffectCoreAudioDecoding = 6;
  static const int audioEffectCoreAudioEncoding = 7;

  /// 设备路由常量
  static const int audioRouteDefault = -1;
  static const int audioRouteHeadset = 0;
  static const int audioRouteEarpiece = 1;
  static const int audioRouteHeadsetnomic = 2;
  static const int audioRouteSpeakerphone = 3;
  static const int audioRouteLoudspeaker = 4;
  static const int audioRouteHeadsetbluetooth = 5;

  /// 回音消除
  static const int VOICE_3A_DISABLE = 0;
  static const int VOICE_3A_AUTO = 1;
  static const int VOICE_3A_HARDWARE = 2;
  static const int VOICE_3A_SOFTWARE = 3;

  /// 调音单元处理模式
  static const int audioEffectTunerStream = 0;
  static const int audioEffectTunerFile = 1;
}

class AudioEffectNoiseLevel {
  static const int audioEffectk0db = -1;
  static const int audioEffectk6dB = 0;
  static const int audioEffectk12dB = 1;
  static const int audioEffectk18dB = 2;
  static const int audioEffectk21dB = 3;
}
