package ly.plugins.rtc_audio_effects

import android.annotation.SuppressLint
import android.content.Context
import com.voice.core.RtcEffectCore
import com.voice.core.LyricsInfo
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.ArrayList
import java.nio.ByteBuffer

@SuppressLint("StaticFieldLeak")
object BaseEffectCoreImpl : BaseEffectInterface {

  private var rtcEffectCore: RtcEffectCore? = null
  private lateinit var appCtx: Context
  private lateinit var handler: BaseEffectCoreEventHandler

  override fun init(applicationContext: Context, handler: BaseEffectCoreEventHandler) {
    appCtx = applicationContext
    this.handler = handler
  }

  override fun createEffectCore(call: MethodCall, result: MethodChannel.Result) {
    // 确保单实例
    innerRelease()

    rtcEffectCore = RtcEffectCore(appCtx)
    rtcEffectCore!!.setEventHandler(handler.eventHandler)
    handler.engine = rtcEffectCore
    result.success(null)
  }

  override fun initialize(call: MethodCall, result: MethodChannel.Result) {
    val element = call.argument<Int>("element")
    if (element == null) {
      result.error("${ErrorCode.SetInitialize.ordinal}", "Setinitialize no element", null)
      return
    }
    rtcEffectCore!!.initialize(element)
    result.success(null)
  }

  private fun isCoreUnInited(result: MethodChannel.Result): Boolean {
    if (rtcEffectCore == null) {
      result.error("${ErrorCode.UnInitialized.ordinal}", "effectCore not init", null)
      return true
    }
    return false
  }

  override fun setAudioKMarkFilePath(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val path = call.argument<String>("path")
    val pos = call.argument("pos") ?: 0
    rtcEffectCore!!.setAudioKMarkFilePath(path, pos)
    result.success(null)
  }

  override fun setMidiFilePath(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val path = call.argument<String>("path")
    val position = call.argument("pos") ?: 0
    rtcEffectCore!!.setMidiFilePath(path, position)
    result.success(null)
  }

  override fun setAudioMixingFilePath(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val path = call.argument<String>("path")
    val pos = call.argument("pos") ?: 0
    rtcEffectCore!!.setAudioMixingFilePath(path, pos)
    result.success(null)
  }

  override fun setAudioOutputFilePath(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val path = call.argument<String>("path")
    rtcEffectCore!!.setAudioOutputFilePath(path)
    result.success(null)
  }

  override fun setAudioRecordFilePath(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val path = call.argument<String>("path")
    val append = call.argument<Boolean>("append") ?: false
    rtcEffectCore!!.setAudioRecordFilePath(path, append)
    result.success(null)
  }

  override fun setLyricsInfo(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    try {
      val lyricsInfos = call.argument<ArrayList<Map<String, Any?>>>("lyricsInfos")
      val lyricsList = mutableListOf<LyricsInfo>()

      lyricsInfos?.forEach {
        val info = LyricsInfo()
        info.index = it["index"] as Int
        info.beginTimeMs = it["beginTimeMs"] as Int
        info.endTimeMs = it["endTimeMs"] as Int
        lyricsList.add(info)
      }

      val array = lyricsList.toTypedArray()

      rtcEffectCore!!.setLyricsInfo(array)
      result.success(null)
    } catch (e: Exception) {
      result.error("${ErrorCode.InValidLyrics.ordinal}", "setLyricsInfo err", e.localizedMessage)
    }
  }

  override fun pushAudioDataMark(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    try {
      val sampleRate = call.argument<Int>("sampleRate")
      val channels = call.argument<Int>("channels")
      val samples = call.argument<Int>("samples")
      val data = call.argument<ByteArray>("data")
      if (sampleRate != null && samples != null && channels != null) {
        val size = samples * channels * 2
        val buffer = ByteBuffer.allocateDirect(size)
        buffer.put(data)
        rtcEffectCore!!.pushAudioDataMark(buffer, sampleRate, samples, channels)
        buffer.position(0)
        buffer.get(data)
      }
      result.success(null)
    } catch (e: Exception) {
      result.error("${ErrorCode.PushAudioDataMark.ordinal}", "PushAudioDataMark err", e.localizedMessage)
    }
  }

  override fun getKMarkResult(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return
    result.success(rtcEffectCore!!.kMarkResult)
  }

  override fun enableInEarMonitoring(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val enabled = call.argument<Boolean>("enabled") ?: false
    rtcEffectCore!!.enableInEarMonitoring(enabled)
    result.success(null)
  }

  override fun setAudioEffectPreset(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val preset = call.argument<Int>("preset") ?: -1
    if (preset >= 0) {
      rtcEffectCore!!.setAudioEffectPreset(preset)
      result.success(null)
    } else {
      result.error("${ErrorCode.AudioEffectPreset.ordinal}", "setAudioEffectPreset preset=$preset", null)
    }
  }

  override fun setAudioProfile(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val profile = call.argument<Int>("profile") ?: -1
    if (profile >= 0) {
      rtcEffectCore!!.setAudioProfile(profile)
      result.success(null)
    } else {
      result.error("${ErrorCode.AudioProfile.ordinal}", "setAudioProfile profile=$profile", null)
    }
  }

  override fun start(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    rtcEffectCore!!.start()
    result.success(null)
  }

  override fun stop(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    rtcEffectCore!!.stop()
    result.success(null)
  }

  override fun resume(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    rtcEffectCore!!.resume()
    result.success(null)
  }

  override fun pause(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    rtcEffectCore!!.pause()
    result.success(null)
  }

  override fun release(call: MethodCall, result: MethodChannel.Result) {
    innerRelease()
    result.success(null)
  }

  private fun innerRelease() {
    if (rtcEffectCore != null) {
      rtcEffectCore!!.setEventHandler(null)
      handler.engine = null
      rtcEffectCore!!.release()
      rtcEffectCore = null
    }
  }

  override fun adjustAudioMixingVolume(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val volume = call.argument<Int>("volume") ?: -1
    if (volume >= 0) {
      rtcEffectCore!!.adjustAudioMixingVolume(volume)
      result.success(null)
    } else {
      result.error("${ErrorCode.AdjustAudioMixingVolume.ordinal}", "adjustAudioMixingVolume volume=$volume", null)
    }
  }

  override fun adjustRecordingSignalVolume(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val volume = call.argument<Int>("volume") ?: -1
    if (volume >= 0) {
      rtcEffectCore!!.adjustRecordingSignalVolume(volume)
      result.success(null)
    } else {
      result.error(
        "${ErrorCode.AdjustRecordingSignalVolume.ordinal}",
        "adjustRecordingSignalVolume volume=$volume",
        null
      )
    }
  }

  override fun setLocalVoicePitch(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val pitch = call.argument<Double>("pitch") ?: 1.0
    rtcEffectCore!!.setLocalVoicePitch(pitch)
    result.success(null)
  }

  override fun setAudioMixingPitch(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val pitch = call.argument<Int>("pitch") ?: 1
    rtcEffectCore!!.setAudioMixingPitch(pitch)
    result.success(null)
  }

  override fun setAudioMixingPosition(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val pos = call.argument<Int>("pos") ?: -1
    if (pos < 0) {
      result.error("${ErrorCode.AudioMixingPosition.ordinal}", "setAudioMixingPosition pos<0", null)
    } else {
      rtcEffectCore!!.setAudioMixingPosition(pos)
      result.success(null)
    }
  }

  override fun getAudioMixingDuration(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val duration = rtcEffectCore!!.audioMixingDuration
    result.success(duration)
  }

  override fun getAudioMixingCurrentPosition(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val current = rtcEffectCore!!.audioMixingCurrentPosition
    result.success(current)
  }

  override fun getAudioRouteType(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val current = rtcEffectCore!!.audioRouteType
    result.success(current)
  }

  override fun setOriginalFilePath(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return
    val filename = call.argument<String>("path")
    val pos = call.argument<Int>("pos") ?: 0

    rtcEffectCore!!.setOriginalFilePath(filename, pos)
    result.success(null)
  }

  override fun switchAccompany(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return
    val soundId = call.argument<Int>("soundId")
    if (soundId == null) {
      result.error("${ErrorCode.SwitchAccompany.ordinal}", "switchAccompany soundId isNull", null)
      return
    }
    rtcEffectCore!!.switchAccompany(soundId)
    result.success(null)
  }

  override fun setTolerance(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return
    val tolerance = call.argument<Double>("tolerance")
    if (tolerance == null) {
      result.error("${ErrorCode.SetTolerance.ordinal}", "SetTolerance tolerance isNull", null)
      return
    }
    rtcEffectCore!!.setTolerance(tolerance.toFloat())
    result.success(null)
  }

  override fun setNoiseLevel(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return
    val level = call.argument<Int>("level")
    if (level == null) {
      result.error("${ErrorCode.SetNoiseLevel.ordinal}", "SetNoiseLevel level isNull", null)
      return
    }
    rtcEffectCore!!.setNoiseLevel(level)
    result.success(null)
  }

  override fun setInEarMonitoringVolume(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val volume = call.argument<Int>("volume") ?: -1
    if (volume >= 0) {

      rtcEffectCore!!.setInEarMonitoringVolume(volume)
      result.success(null)
    } else {
      result.error("${ErrorCode.AdjustAudioMixingVolume.ordinal}", "setInEarMonitoringVolume volume=$volume", null)
    }
  }

  override fun adjustPlaybackSignalVolume(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val volume = call.argument<Int>("volume") ?: -1
    if (volume >= 0) {
      rtcEffectCore!!.adjustPlaybackSignalVolume(volume)
      result.success(null)
    } else {
      result.error("${ErrorCode.AdjustAudioMixingVolume.ordinal}", "adjustPlaybackSignalVolume volume=$volume", null)
    }
  }

  override fun set3AType(call: MethodCall, result: MethodChannel.Result) {
    if (isCoreUnInited(result)) return

    val type = call.argument<Int>("type") ?: 3
    if (type >= 0) {
      rtcEffectCore!!.set3AType(type)
      result.success(null)
    } else {
      result.error("${ErrorCode.Set3AType.ordinal}", "set3AType type=$type", null)
    }
  }

  override fun getAudioDelay(call: MethodCall, result: MethodChannel.Result){
    if (isCoreUnInited(result)) return
    val delay = rtcEffectCore!!.getAudioDelay()
    result.success(delay)
  }

  override fun setIndicationInterval(call: MethodCall, result: MethodChannel.Result){
    if (isCoreUnInited(result)) return
    val interval = call.argument<Int>("interval") ?: 1000
    if (interval >= 0) {
      rtcEffectCore!!.setIndicationInterval(interval)
    }
    result.success(null)
  }

  override fun getRecordDuration(call: MethodCall, result: MethodChannel.Result){
    if (isCoreUnInited(result)) return
    val duration = rtcEffectCore!!.getRecordDuration()
    result.success(duration)
  }

  override fun setParameters(call: MethodCall, result: MethodChannel.Result){
    if (isCoreUnInited(result)) return
    val parameters = call.argument<String>("parameters")
    if (parameters != null) {
      rtcEffectCore!!.setParameters(parameters)
    }
    result.success(null)
  }

  override fun getParameters(call: MethodCall,result: MethodChannel.Result){
    if (isCoreUnInited(result)) return
    val key = call.argument<String>("key")
    if (key != null) {
      var ret = rtcEffectCore!!.getParameters(key)
      result.success(ret)
    }
    else{
      result.success(null)
    }
  }

  override fun setAudioFileDecode(call: MethodCall, result: MethodChannel.Result){
    if (isCoreUnInited(result)) return
    val inFile = call.argument<String>("inFile")
    val outFile = call.argument<String>("outFile")
    var sampleRate = call.argument<Int>("sampleRate") ?: 44100
    var channels = call.argument<Int>("channels") ?: 2
    if (inFile != null && outFile != null) {
      var ret = rtcEffectCore!!.setAudioFileDecode(inFile, outFile, sampleRate, channels)
      result.success(ret)
    }
    else{
      result.success(null)
    }
  }

  override fun setTunerMode(call: MethodCall, result: MethodChannel.Result){
    if (isCoreUnInited(result)) return
    val mode = call.argument<Int>("mode") ?: -1
    if (mode >= 0) {
      rtcEffectCore!!.setTunerMode(mode)
    }
    result.success(null)
  }

}