import 'dart:typed_data';

import 'base_effect_impl.dart';
import 'base_effect_model.dart';

mixin BaseEffectApi {
  static BaseEffectApi inst = BaseEffectImpl.inst;

  createEffectCore();

  initialize(int element);

  /// 原唱 人的干声，实时生成midi文件，加载比较耗时，如果存在midi文件请调用
  /// [setMidiFilePath] 速度更快
  setAudioKMarkFilePath(String path, int pos);

  /// 设置MIDI文件，用于打分
  setMidiFilePath(String path, int pos);

  /// 伴奏
  setAudioMixingFilePath(String path, int pos);

  setAudioOutputFilePath(String path);

  setAudioRecordFilePath(String path, {bool append = false});

  setOriginalFilePath(String path, {int pos});

  setLyricsInfo(List<LyricsInfo> lyricsInfos);

  /// 耳返
  enableInEarMonitoring(bool enabled);

  //  混响
  // typedef NS_ENUM(NSInteger, AudioEffectPreset) {
  //    AudioEffectOff = 0x00000000,  关闭       ok
  //    RoomAcousticsKTV = 0x02010100, KTV      ok
  //    RoomAcousticsVocalConcert = 0x02010200, 演唱会  ok
  //    RoomAcousticsStudio = 0x02010300,  录音棚    ok
  //    RoomAcousticsPhonograph = 0x02010400, 留声机   ok
  //    RoomAcousticsVirtualStereo = 0x02010500, 虚拟立体声
  //    RoomAcousticsSpacial = 0x02010600, 空旷      ok
  //    RoomAcousticsEthereal = 0x02010700, 空灵     ok
  //    RoomAcoustics3DVoice = 0x02010800, 3D人声
  //    VoiceChangerEffectUncle = 0x02020100, 大叔
  //    VoiceChangerEffectOldMan = 0x02020200, 老年男性
  //    VoiceChangerEffectBoy = 0x02020300, 男孩
  //    VoiceChangerEffectSister = 0x02020400, 少女
  //    VoiceChangerEffectGirl = 0x02020500,女孩
  //    VoiceChangerEffectPigKing = 0x02020600, 猪八戒
  //    VoiceChangerEffectHulk = 0x02020700,绿巨人。
  //    StyleTransformationRnB = 0x02030100, R&B
  //    StyleTransformationPopular = 0x02030200, 流行
  //    PitchCorrection = 0x02040100  电音
  // };
  setAudioEffectPreset(int preset);

  setAudioProfile(int profile);

  setAudioMixingPosition(int pos);

  start();

  stop();

  resume();

  pause();

  release();

  /// 伴奏音量 0-100
  adjustAudioMixingVolume(int volume);

  /// 人声音量 0-100
  adjustRecordingSignalVolume(int volume);

  /// 设置本地语音音调。
  ///
  /// 该方法改变本地说话人声音的音调。
  ///
  /// 参数
  /// pitch	语音频率。可以在 [0.5, 2.0] 范围内设置。取值越小，则音调越低。默认值为 1.0，表示不需要修改音调。
  setLocalVoicePitch(double pitch);

  /// 调整本地播放的音乐文件的音调。
  /// 本地人声和播放的音乐文件混音时，调用该方法可以仅调节音乐文件的音调。
  /// 按半音音阶调整本地播放的音乐文件的音调，默认值为 0，即不调整音调。取值范围为 [-12,12]，每相邻两个值的音高距离相差半音。取值的绝对值越大，音调升高或降低得越多。
  setAudioMixingPitch(int pitch);

  /// 获取当前设备
  /// 常量定义查看 [BaseEffectConstants.audioRouteDefault]
  static void Function(int routing)? onAudioRouteChanged;

  /// 监听录制的状态
  static void Function(int state)? onStateChanged;

  /// 实时的声音数据回调，以及当前的得分
  static void Function(
          int beginPosMs, int endPosMs, double pitch, double score)?
      onKMarkSliceScoreUpdate;

  /// 每一句歌词的打分回调，需要之前调用过setLyricsInfo设置过歌词信息
  static void Function(int index, double currentScore, double totalScore)?
      onKMarkSentenceScoreUpdate;

  /// 最终合成mp3文件时候的进度
  static void Function(double progress)? onProductProgress;

  static void Function(
      {int sampleRate,
      int channels,
      int samples,
      Uint8List data})? onRecordAudioFrame;

  //录制音量，时间进度
  static void Function(int volume, int timeMs)? onAudioVolumeIndication;

  pushAudioDataMark(
      {required Uint8List data,
      required int sampleRate,
      required int channels,
      required int samples});

  Future<int> getKMarkResult();

  /// 获取当前混音
  Future<int> getAudioEffectPreset();

  /// 获取时长
  Future<int> getAudioMixingDuration();

  /// 获取当前时间
  Future<int> getAudioMixingCurrentPosition();

  /// 切换纯伴奏和带人声伴奏
  ///
  /// [BaseEffectConstants.mixingAudioSound]
  /// [BaseEffectConstants.originalAudioSound]
  switchAccompany(int soundId);

  /// KMark tolerance. The value ranges between 0.0f and 1.0f.
  setTolerance(double tolerance);

  /// param : see [AudioEffectNoiseLevel]
  setNoiseLevel(int level);

  /// 获取当前播放设备 常量定义查看 [BaseEffectConstants.audioRouteDefault]
  Future<int> getAudioRouteType();

  /// 设置耳返音量 0 - 1000
  setInEarMonitoringVolume(int volume);

  /// 设置播放音量 0 - 100
  adjustPlaybackSignalVolume(int volume);

  /// 添加回声消除
  set3AType(int type);

  Future<int> getAudioDelay();

  setIndicationInterval(int interval);

  Future<int> getRecordDuration();

  setParameters(String parameters);

  Future<String> getParameters(String key);

  Future<int> setAudioFileDecode(
      String inFile, String outFile, int sampleRate, int channels);

  setTunerMode(int mode);
}
