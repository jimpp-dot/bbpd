package ly.plugins.vap_player

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.SurfaceTexture
import android.os.Handler
import android.os.Looper
import ly.plugins.qgame1.animplayer.AnimConfig
import ly.plugins.qgame1.animplayer.AnimView
import ly.plugins.qgame1.animplayer.inter.IAnimListener
import ly.plugins.qgame1.animplayer.inter.IFetchResource
import ly.plugins.qgame1.animplayer.mix.Resource
import ly.plugins.qgame1.animplayer.util.ALog
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.TextureRegistry.SurfaceTextureEntry
import java.io.File

class VapManager(
    surfaceEntry: SurfaceTextureEntry,
    id: Long,
    context: Context,
    filePath: String,
    flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
) {
    private lateinit var methodChannel : MethodChannel
    private var mSurfaceTextureEntry : SurfaceTextureEntry
    private var mSurfaceTexture: SurfaceTexture
    private var mTextureId: Long
    private lateinit var animView: AnimView
    private var mContext: Context
    private var mFilePath: String
    private var mFlutterPluginBinding: FlutterPlugin.FlutterPluginBinding
    private val uiHandler: Handler = Handler(Looper.getMainLooper())

    companion object {
        private const val TAG = "VapManager"
    }

    init {
        mContext = context
        mTextureId = id
        mSurfaceTexture = surfaceEntry.surfaceTexture()
        mFilePath = filePath
        mFlutterPluginBinding = flutterPluginBinding
        mSurfaceTextureEntry = surfaceEntry
    }

    internal fun initVap(textureId: Int, channelId: Int, repeatCount: Int, imgList: List<String>, textList: List<String>) {
        animView = AnimView(mSurfaceTexture, textureId)
        animView.setLoop(repeatCount)

        methodChannel = MethodChannel(mFlutterPluginBinding.binaryMessenger, "plugins/vap_view_$channelId")
        val animListener = object : IAnimListener {
            override fun onVideoStart() {
                ALog.d(VapPlayerPlugin.TAG, "onVideoStart")
                this@VapManager.onVideoStart()
            }

            override fun onVideoRender(frameIndex: Int, config: AnimConfig?) {
                ALog.d(VapPlayerPlugin.TAG, "onVideoRender")
                this@VapManager.onRenderFrame(frameIndex, config?.totalFrames ?: 0)
            }

            override fun onVideoComplete() {
                ALog.d(VapPlayerPlugin.TAG, "onVideoComplete")
                this@VapManager.onVideoComplete()
            }

            override fun onVideoDestroy() {
                ALog.d(VapPlayerPlugin.TAG, "onVideoDestroy")
            }

            override fun onFailed(errorType: Int, errorMsg: String?) {
                ALog.d(VapPlayerPlugin.TAG, "onFailed")
            }

        }
        animView.setAnimListener(animListener)
        val fetchResource = object : IFetchResource {
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
                ALog.d(VapPlayerPlugin.TAG, "fetchImage")
                val srcTag = resource.tag

                if (srcTag.contains("bbImg") && imgList.isNotEmpty()) { // 此tag是已经写入到动画配置中的tag
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
                ALog.d(VapPlayerPlugin.TAG, "fetchText")
                val srcTag = resource.tag

                if (srcTag.contains("bbText") && textList.isNotEmpty()) { // 此tag是已经写入到动画配置中的tag
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
                ALog.d(VapPlayerPlugin.TAG, "releaseResource")
                resources.forEach {
                    it.bitmap?.recycle()
                }
            }
        }
        animView.setFetchResource(fetchResource)

        /**
         * 开始播放主流程
         * ps: 主要流程都是对AnimView的操作，其它比如队列，或改变窗口大小等操作都不是必须的
         */
        play()
    }

    fun dispose() {
        methodChannel.setMethodCallHandler(null)
        animView.stopPlay()
        mSurfaceTextureEntry.release()
        mSurfaceTexture.release()
    }

    private fun play() {
        // 播放前强烈建议检查文件的md5是否有改变
        // 因为下载或文件存储过程中会出现文件损坏，导致无法播放
        Thread {
            val file = File(mFilePath)
            animView.startPlay(file)
        }.start()
    }


    fun onVideoStart() {
        uiHandler.post {
            methodChannel.invokeMethod("onVideoStart", null)
        }
    }

    fun onVideoComplete() {
        uiHandler.post {
            methodChannel.invokeMethod("onVideoComplete", null)
        }
    }

    fun onRenderFrame(frameIndex: Int, frameTotal: Int) {
        uiHandler.post {
            var params = mapOf("frameIndex" to frameIndex, "frameTotal" to frameTotal);
            methodChannel.invokeMethod("onRenderFrame", params)
        }
    }

}