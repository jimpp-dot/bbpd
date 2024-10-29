package ly.plugins.rtc_audio_effects

import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

interface BaseEffectInterface {

  fun init(applicationContext: Context, handler: BaseEffectCoreEventHandler)

  // 需要与Release成对存在
  fun createEffectCore(call: MethodCall, result: MethodChannel.Result)

  fun initialize(call: MethodCall, result: MethodChannel.Result)

  // 原唱 人的干声
  fun setAudioKMarkFilePath(call: MethodCall, result: MethodChannel.Result)

  fun setMidiFilePath(call: MethodCall, result: MethodChannel.Result)

  // 伴奏
  fun setAudioMixingFilePath(call: MethodCall, result: MethodChannel.Result)

  fun setAudioOutputFilePath(call: MethodCall, result: MethodChannel.Result)

  fun setOriginalFilePath(call: MethodCall, result: MethodChannel.Result)

  fun setAudioRecordFilePath(call: MethodCall, result: MethodChannel.Result)

  fun setLyricsInfo(call: MethodCall, result: MethodChannel.Result)

  fun pushAudioDataMark(call: MethodCall, result: MethodChannel.Result)

  fun getKMarkResult(call: MethodCall, result: MethodChannel.Result)

  fun enableInEarMonitoring(call: MethodCall, result: MethodChannel.Result)

  fun setAudioEffectPreset(call: MethodCall, result: MethodChannel.Result)

  fun setAudioProfile(call: MethodCall, result: MethodChannel.Result)

  fun start(call: MethodCall, result: MethodChannel.Result)

  fun stop(call: MethodCall, result: MethodChannel.Result)

  fun resume(call: MethodCall, result: MethodChannel.Result)

  fun pause(call: MethodCall, result: MethodChannel.Result)

  fun release(call: MethodCall, result: MethodChannel.Result)

  fun adjustAudioMixingVolume(call: MethodCall, result: MethodChannel.Result)

  fun adjustRecordingSignalVolume(call: MethodCall, result: MethodChannel.Result)

  /// 设置本地语音音调。
  ///
  /// 该方法改变本地说话人声音的音调。
  ///
  /// 参数
  /// pitch	语音频率。可以在 [0.5, 2.0] 范围内设置。取值越小，则音调越低。默认值为 1.0，表示不需要修改音调。
  fun setLocalVoicePitch(call: MethodCall, result: MethodChannel.Result)

  /// 调整本地播放的音乐文件的音调。
  /// 按半音音阶调整本地播放的音乐文件的音调，默认值为 0，即不调整音调。取值范围为 [-12,12]，每相邻两个值的音高距离相差半音。取值的绝对值越大，音调升高或降低得越多。
  fun setAudioMixingPitch(call: MethodCall, result: MethodChannel.Result)

  /// 0就是重新开始，录制文件也会同步
  fun setAudioMixingPosition(call: MethodCall, result: MethodChannel.Result)

  fun getAudioMixingDuration(call: MethodCall, result: MethodChannel.Result)

  fun getAudioMixingCurrentPosition(call: MethodCall, result: MethodChannel.Result)

  fun switchAccompany(call: MethodCall, result: MethodChannel.Result)

  fun setTolerance(call: MethodCall, result: MethodChannel.Result)

  fun setNoiseLevel(call: MethodCall, result: MethodChannel.Result)

  fun getAudioRouteType(call: MethodCall, result: MethodChannel.Result)

  /// 设置播放音量
  fun adjustPlaybackSignalVolume(call: MethodCall, result: MethodChannel.Result)

  /// 设置耳返音量
  fun setInEarMonitoringVolume(call: MethodCall, result: MethodChannel.Result)

  /// 回声消除
  fun set3AType(call: MethodCall, result: MethodChannel.Result)

  fun getAudioDelay(call: MethodCall, result: MethodChannel.Result)

  fun setIndicationInterval(call: MethodCall, result: MethodChannel.Result)

  fun getRecordDuration(call: MethodCall, result: MethodChannel.Result)

  fun setParameters(call: MethodCall, result: MethodChannel.Result)

  fun getParameters(call: MethodCall, result: MethodChannel.Result)

  fun setAudioFileDecode(call: MethodCall, result: MethodChannel.Result)

  fun setTunerMode(call: MethodCall, result: MethodChannel.Result)

}