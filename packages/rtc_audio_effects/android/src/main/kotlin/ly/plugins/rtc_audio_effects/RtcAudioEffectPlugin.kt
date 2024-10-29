package ly.plugins.rtc_audio_effects

import androidx.annotation.NonNull
import ly.plugins.rtc_audio_effects.BaseEffectConstants.TAG

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.lang.reflect.InvocationTargetException
import java.lang.reflect.Method

class RtcAudioEffectPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, EventChannel.StreamHandler {

  private lateinit var channel: MethodChannel

  private lateinit var eventChannel: EventChannel

  private val methodHashMap = HashMap<String, Method>()

  private val effectCore: BaseEffectInterface = BaseEffectCoreImpl

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    effectCore.init(flutterPluginBinding.applicationContext, BaseEffectCoreEventHandler)
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ly.plugins.audio_effect_core")
    channel.setMethodCallHandler(this)

    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "ly.plugins.audio_effect_event_handler")
    eventChannel.setStreamHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    if ("getAudioMixingCurrentPosition" != call.method && "pushAudioDataMark" != call.method) {
      BaseEffectUtils.logD(TAG, "[DartCall] [${call.method}] args->${call.arguments}")
    }
    try {
      var method = methodHashMap[call.method]
      if (method == null) {
        method = effectCore::class.java.getDeclaredMethod(
          call.method,
          MethodCall::class.java,
          MethodChannel.Result::class.java
        )
        methodHashMap[call.method] = method
      }
      method!!.invoke(effectCore, call, result)

    } catch (e: NoSuchMethodException) {
      BaseEffectUtils.logE(TAG, "[DartCall] [NoSuchMethodException] [${call.method}] $ ${e.message}", e)
      result.notImplemented()
    } catch (e: IllegalAccessException) {
      BaseEffectUtils.logE(TAG, "[DartCall] [IllegalAccessException] [${call.method}] $ ${e.message}", e)
      result.notImplemented()
    } catch (e: InvocationTargetException) {
      BaseEffectUtils.logE(TAG, "[DartCall] [InvocationTargetException] [${call.method}] $ ${e.message}", e)
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    eventChannel.setStreamHandler(null)
  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    BaseEffectUtils.logD(TAG, "RtcAudioEffectPlugin#onListen")
    BaseEffectCoreEventHandler.sink = events
  }

  override fun onCancel(arguments: Any?) {
    BaseEffectUtils.logD(TAG, "RtcAudioEffectPlugin#onCancel")
    BaseEffectCoreEventHandler.sink = null
  }
}
