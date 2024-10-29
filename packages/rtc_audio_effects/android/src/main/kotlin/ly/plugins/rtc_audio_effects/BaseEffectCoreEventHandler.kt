package ly.plugins.rtc_audio_effects

import android.os.Handler
import android.os.Looper
import com.voice.core.RtcEffectCore
import com.voice.core.RtcEffectEventHandler
import ly.plugins.rtc_audio_effects.BaseEffectConstants.TAG
import io.flutter.plugin.common.EventChannel.EventSink

object BaseEffectCoreEventHandler {

  var sink: EventSink? = null

  private val mUIHandler: Handler by lazy {
    Handler(Looper.getMainLooper())
  }

  var engine: RtcEffectCore? = null

  private fun guardSink(): Boolean {
    if (sink == null) {
      BaseEffectUtils.logE(TAG, "FlutterEventSink is null")
      return true
    }
    return false
  }

  val eventHandler = object : RtcEffectEventHandler {
    override fun onAudioRouteChanged(routing: Int) {
      BaseEffectUtils.logD(TAG, "eventHandler onAudioRouteChanged routing->$routing")
      if (guardSink()) {
        return
      }
      val map = mutableMapOf<String, Any>()
      map["method"] = "onAudioRouteChanged"
      map["routing"] = routing
      mUIHandler.post {
        sink!!.success(map)
      }
    }

    override fun onStateChanged(state: Int) {
      BaseEffectUtils.logD(TAG, "eventHandler onStateChanged->$state")
      if (guardSink()) {
        return
      }

      val map = mutableMapOf<String, Any>()
      map["method"] = "onStateChanged"
      map["state"] = state
      mUIHandler.post {
        sink!!.success(map)
      }
    }

    override fun onKMarkSliceScoreUpdate(beginPosMs: Int, endPosMs: Int, pitch: Float, score: Float) {

      if (guardSink()) {
        return
      }
      val map = mutableMapOf<String, Any>()
      map["method"] = "onKMarkSliceScoreUpdate"
      map["beginPosMs"] = beginPosMs
      map["endPosMs"] = endPosMs
      map["pitch"] = pitch
      map["score"] = score
      mUIHandler.post {
        sink!!.success(map)
      }
    }

    override fun onKMarkSentenceScoreUpdate(index: Int, currentScore: Float, totalScore: Float) {

      if (guardSink()) {
        return
      }
      val map = mutableMapOf<String, Any>()
      map["method"] = "onKMarkSentenceScoreUpdate"
      map["index"] = index
      map["currentScore"] = currentScore
      map["totalScore"] = totalScore
      mUIHandler.post {
        sink!!.success(map)
      }
    }

    override fun onRecordAudioFrame(sampleRate: Int, channels: Int, samples: Int, data: ByteArray?) {
      if (guardSink()) {
        return
      }
      val map = mutableMapOf<String, Any?>()
      map["method"] = "onRecordAudioFrame"
      map["sampleRate"] = sampleRate
      map["channels"] = channels
      map["samples"] = samples
      map["data"] = data
      mUIHandler.post {
        sink!!.success(map)
      }
    }

    override fun onProductProgress(progress: Float) {
      if (guardSink()) {
        return
      }
      val map = mutableMapOf<String, Any>()
      map["method"] = "onProductProgress"
      map["progress"] = progress
      mUIHandler.post {
        sink!!.success(map)
      }
    }

    override fun onAudioVolumeIndication(volume: Int, timeMs: Long){
      if (guardSink()) {
        return
      }
      val map = mutableMapOf<String, Any>()
      map["method"] = "onAudioVolumeIndication"
      map["volume"] = volume
      map["timeMs"] = timeMs
      mUIHandler.post {
        sink!!.success(map)
      }
    }
  }
}