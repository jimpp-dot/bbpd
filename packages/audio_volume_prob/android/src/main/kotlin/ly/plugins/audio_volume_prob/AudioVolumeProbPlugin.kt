package ly.plugins.audio_volume_prob

import android.app.Activity
import androidx.annotation.NonNull
import com.konovalov.vad.VadConfig
import com.konovalov.vad.VadConfig.FrameSize
import com.konovalov.vad.VadConfig.SampleRate

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.util.HashMap

/** AudioVolumeProbPlugin */
class AudioVolumeProbPlugin: FlutterPlugin, MethodCallHandler, VoiceRecorder.Listener, ActivityAware, EventChannel.StreamHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var eventSink: EventChannel.EventSink? = null
  public var mActivity: Activity? = null;
  private var recorder: VoiceRecorder? = null

  private val DEFAULT_SAMPLE_RATE = SampleRate.SAMPLE_RATE_16K
  private val DEFAULT_FRAME_SIZE = FrameSize.FRAME_SIZE_160
  private val DEFAULT_MODE = VadConfig.Mode.VERY_AGGRESSIVE
  private val DEFAULT_SILENCE_DURATION = 500
  private val DEFAULT_VOICE_DURATION = 100

  companion object {
    var instance: AudioVolumeProbPlugin? = null

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "ly.plugins.audio_volume_prob")
      val instance = AudioVolumeProbPlugin()
      channel.setMethodCallHandler(instance)
      instance.mActivity = registrar.activity();

      val _eventChannel = EventChannel(registrar.messenger(), "ly.plugins.audio_volume_prob.event_channel")
      _eventChannel.setStreamHandler(instance)

      var config = VadConfig.newBuilder()
              .setSampleRate(instance.DEFAULT_SAMPLE_RATE)
              .setFrameSize(instance.DEFAULT_FRAME_SIZE)
              .setMode(instance.DEFAULT_MODE)
              .setSilenceDurationMillis(instance.DEFAULT_SILENCE_DURATION)
              .setVoiceDurationMillis(instance.DEFAULT_VOICE_DURATION)
              .build()
      instance.recorder = VoiceRecorder(instance, config)
    }
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "vad")
    channel.setMethodCallHandler(this)

    val _eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "vad_event_channel")
    _eventChannel.setStreamHandler(this)

    var config = VadConfig.newBuilder()
            .setSampleRate(DEFAULT_SAMPLE_RATE)
            .setFrameSize(DEFAULT_FRAME_SIZE)
            .setMode(DEFAULT_MODE)
            .setSilenceDurationMillis(DEFAULT_SILENCE_DURATION)
            .setVoiceDurationMillis(DEFAULT_VOICE_DURATION)
            .build()
    recorder = VoiceRecorder(this, config)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "start") {
      recorder?.start();
      result.success(null);
    } else if (call.method == "stop") {
      recorder?.stop();
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onSpeechDetected() {
    sendToDartListener(1)
  }

  override fun onNoiseDetected() {
    sendToDartListener(0)
  }

  override fun onVadFailed() {
    sendToDartListener(-1);
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    mActivity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
    mActivity = null;
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    mActivity = binding.activity;
  }

  override fun onDetachedFromActivity() {
    mActivity = null;
  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    eventSink = events;
  }

  override fun onCancel(arguments: Any?) {
    eventSink = null;
  }

  private fun sendToDartListener(vad: Int) {
    sendMessageToClient(vad)
  }

  private fun sendMessageToClient(vad: Int) {
    val activity = mActivity ?: return
    activity.runOnUiThread {
      val args = HashMap<String, Any>()
      args["vad"] = vad
      if (this@AudioVolumeProbPlugin.eventSink != null) {
        try {
          this@AudioVolumeProbPlugin.eventSink!!.success(args)
        } catch (e: java.lang.Exception) {
          e.printStackTrace()
        }
      }
    }
  }
}
