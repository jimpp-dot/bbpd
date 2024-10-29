package ly.plugins.rtc_audio_effects

import android.util.Log
import com.rtc.effectcore.BuildConfig

object BaseEffectUtils {

  private const val DEBUG = true

  fun logD(tag: String, msg: String) {
    if (BuildConfig.DEBUG || DEBUG) {
      Log.d(tag, msg)
    }
  }

  fun logE(tag: String, msg: String, e: Throwable? = null) {
    Log.e(tag, msg, e)
  }
}