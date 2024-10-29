package ly.plugins.flutter_vap_texture

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.View
import com.tencent.qgame.animplayer.AnimConfig
import com.tencent.qgame.animplayer.AnimView
import com.tencent.qgame.animplayer.inter.IAnimListener
import com.tencent.qgame.animplayer.inter.IFetchResource
import com.tencent.qgame.animplayer.mix.Resource
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.platform.PlatformView
import java.io.File

class FlutterVapView internal constructor(context: Context, id: Int, messenger: BinaryMessenger): PlatformView, MethodCallHandler {
    private val TAG: String = "FlutterVapView";
    // 动画View
    private var animView: AnimView

    private val methodChannel: MethodChannel

    private val imgList = mutableListOf<String>()
    private val textList = mutableListOf<String>()

    private val uiHandler by lazy {
        Handler(Looper.getMainLooper())
    }

    private var mWidth: Float = 0.0f;
    private var mHeight: Float = 0.0f;

    private var disposed: Boolean = false

    init {
        animView = AnimView(context = context);
        animView.enableAutoTxtColorFill(false);
        animView.setAnimListener(object: IAnimListener {
            private fun dp2px(context: Context, dp: Float): Float {
                val scale = context.resources.displayMetrics.density
                return dp * scale + 0.5f
            }

            override fun onVideoConfigReady(config: AnimConfig): Boolean {
                Log.d(TAG, "onVideoConfigReady");
                uiHandler.post {
//                    val w = dp2px(context,200f).toInt()
//                    val lp = animView.layoutParams
//                    lp.width = w
//                    lp.height = (w * config.height *1f / config.width).toInt()
//                    animView.layoutParams = lp

//                    val lp = animView.layoutParams
//                    lp.width = dp2px(context, mWidth).toInt()
//                    lp.height = dp2px(context, mHeight).toInt()
//                    animView.layoutParams = lp
                }
                return true
            }

            override fun onFailed(errorType: Int, errorMsg: String?) {
            }

            override fun onVideoComplete() {
                Log.d(TAG, "onVideoComplete");
                uiHandler.post {
                    onComplete()
                }
                
                Log.d(TAG, "onVideoComplete end");
            }

            override fun onVideoDestroy() {
            }

            override fun onVideoRender(frameIndex: Int, config: AnimConfig?) {
//                Log.d(TAG, "onVideoRender frameIndex = " + frameIndex + ", config = " + config);
                uiHandler.post {
                    onRenderFrame(frameIndex, config?.totalFrames ?: 0)
                }
            }

            override fun onVideoStart() {
                Log.d(TAG, "onVideoStart begin");
                Log.d(TAG, "onVideoStart end");
            }
        })

        animView.setFetchResource(object : IFetchResource {
            /**
             * 获取图片资源
             * 无论图片是否获取成功都必须回调 result 否则会无限等待资源
             */
            override fun fetchImage(resource: Resource, result: (Bitmap?) -> Unit) {
                /**
                 * srcTag是素材中的一个标记，在制作素材时定义
                 * tag命名规则:[bbImg0]/[bbImg1]/[bbImg2]/[bbImg3]/[bbImg4]
                 * 解析时由业务读取tag决定需要播放的内容是什么
                 * 比如：一个素材里需要显示多个头像，则需要定义多个不同的tag，表示不同位置，需要显示不同的头像，文字类似
                 */
                val srcTag = resource.tag

                if (srcTag.contains("bbImg") && imgList.size > 0) { // 此tag是已经写入到动画配置中的tag
                    val indexString = srcTag.filter { it.isDigit() }
                    if (indexString.isNotEmpty()) {
                        try {
                            val index = indexString.toInt()
                            if (index < imgList.size) {
                                val options = BitmapFactory.Options()
                                options.inScaled = false
                                result(BitmapFactory.decodeFile(imgList[index], options))
                                return
                            }
                        } catch (e: NumberFormatException) {
                        }
                    }
                    result(null)
                } else {
                    result(null)
                }
            }

            /**
             * 获取文字资源
             * tag命名规则:[bbText0]/[bbText1]/[bbText2]/[bbText3]/[bbText4]
             */
            override fun fetchText(resource: Resource, result: (String?) -> Unit) {
                val srcTag = resource.tag

                if (srcTag.contains("bbText") && textList.size > 0) { // 此tag是已经写入到动画配置中的tag
                    val indexString = srcTag.filter { it.isDigit() }
                    if (indexString.isNotEmpty()) {
                        try {
                            val index = indexString.toInt()
                            if (index < textList.size) {
                                result(textList[index])
                                return
                            }
                        } catch (e: NumberFormatException) {
                        }
                    }
                    result(null)
                } else {
                    result(null)
                }
            }

            /**
             * 播放完毕后的资源回收
             */
            override fun releaseResource(resources: List<Resource>) {
                resources.forEach {
                    it.bitmap?.recycle()
                }
            }
        })

        methodChannel = MethodChannel(messenger, "ly.plugins.vap_view.$id")
        methodChannel.setMethodCallHandler(this)
    }

    override fun getView(): View {
        return animView;
    }

    override fun dispose() {
        if (disposed) return
        disposed = true
        methodChannel.setMethodCallHandler(null)
        animView.stopPlay()
        Log.d(TAG, "Disposed view vap")
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when(call.method) {
            "startPlay" -> {
                val filePath = call.argument<String>("filePath")
//                mWidth = call.argument<Float>("width")!!
//                mHeight = call.argument<Float>("height")!!
                val repeatCount = call.argument<Int>("repeatCount")!!
                val imgs = call.argument<List<String>>("imgList")

                if (imgs != null && imgs.isNotEmpty()) {
                    imgList.addAll(imgs)
                }
                val texts = call.argument<List<String>>("textList")
                if (texts != null && texts.isNotEmpty()) {
                    textList.addAll(texts)
                }
                val animFile = File(filePath)
                animView.setLoop(repeatCount)
                animView.startPlay(animFile)
                result.success(null)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    fun onComplete() {
        methodChannel.invokeMethod("onComplete", null)
    }

    fun onRenderFrame(frameIndex: Int, frameTotal: Int) {
        var params = mapOf("frameIndex" to frameIndex, "frameTotal" to frameTotal);
        methodChannel.invokeMethod("onRenderFrame", params)
    }
}