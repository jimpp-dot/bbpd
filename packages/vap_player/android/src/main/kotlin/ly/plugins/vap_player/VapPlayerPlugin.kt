package ly.plugins.vap_player

import android.content.Context
import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.view.TextureRegistry

/** ExternalPlugin */
class VapPlayerPlugin: FlutterPlugin, MethodCallHandler {
  companion object {
    const val TAG: String = "VapPlayerPlugin"
  }

  private lateinit var methodChannel : MethodChannel
//  private lateinit var eventChannel: EventChannel
//  private var eventSink: EventChannel.EventSink? = null
//  private val uiHandler: Handler = Handler(Looper.getMainLooper())
  private lateinit var textureRegistry: TextureRegistry
  private lateinit var context: Context
  private lateinit var mFlutterPluginBinding: FlutterPluginBinding

  private val vapMap = mutableMapOf<Long, VapManager>()

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    mFlutterPluginBinding = flutterPluginBinding
    methodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "ly.plugins.vap_player")
    methodChannel.setMethodCallHandler(this)
    textureRegistry = flutterPluginBinding.textureRegistry
    context = flutterPluginBinding.applicationContext
//    eventChannel = EventChannel(
//      flutterPluginBinding.binaryMessenger, "flutter_vap_view_event_channel"
//    )
//    eventChannel.setStreamHandler(object : EventChannel.StreamHandler{
//      override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
//        eventSink = events
//      }
//
//      override fun onCancel(p0: Any?) {
//        eventSink = null
//      }
//    })
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    methodChannel.setMethodCallHandler(null)
  }

//  fun sendEventToStream(data: String) {
//    uiHandler.post {
//      eventSink?.success(data)
//    }
//  }


  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "create" -> {
        val channelId: Int = call.argument<Int>("channelId")!!
        val filePath: String = call.argument<String>("filePath")!!
        val imgList = mutableListOf<String>()
        val imgs = call.argument<List<String>>("imgList")
        if (imgs != null && imgs.isNotEmpty()) {
          imgList.addAll(imgs)
        }
        val textList = mutableListOf<String>()
        var texts = call.argument<List<String>>("textList")
        if (texts != null && texts.isNotEmpty()) {
          textList.addAll(texts)
        }
        var repeatCount: Int? = call.argument<Int>("repeatCount")
        if (repeatCount == null) {
          repeatCount = 0
        }

        val surfaceEntry = textureRegistry.createSurfaceTexture()

        // 第四种：绘制VAP视频
//        FileUtils.copyAssetsToFileDir(context)
        val textureId = surfaceEntry.id()
        var vapManager = VapManager(surfaceEntry, textureId, context, filePath, mFlutterPluginBinding)

        vapManager.initVap(textureId.toInt(), channelId, repeatCount, imgList, textList)
        vapMap[textureId] = vapManager

        result.success(surfaceEntry.id())
      }
      "dispose" -> {
        val textureId: Long = call.argument<Long>("textureId")!!
        val vapManager = vapMap[textureId]
        vapManager?.dispose()
        vapMap.remove(textureId)
        result.success(null)
      }
      else -> result.notImplemented()
    }
  }

}
