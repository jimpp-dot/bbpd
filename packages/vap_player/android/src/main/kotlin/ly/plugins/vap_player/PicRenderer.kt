package ly.plugins.vap_player

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.opengl.GLES20
import ly.plugins.vap_player.opengl.GLESUtils
import java.nio.FloatBuffer

/**
 * Copyright (C), 2019-2020, 腾讯科技（上海）有限公司
 * FileName: CustomRenderer
 * Author: kaelma
 * Date: 2020/8/6 8:45 PM
 * Description: one simplest gl render
 */
class PicRenderer(imagePath: String) : ExternalGLThread.Renderer {
    private val VERTEX_SHADER = "uniform mat4 uMVPMatrix;" +
            "attribute vec4 aPosition;" +
            "attribute vec2 aTexCoord;" +
            "varying vec2 vTexCoord;" +
            "void main() {" +
            "  gl_Position = uMVPMatrix * aPosition;" +
            "  vTexCoord = aTexCoord;" +
            "}"
    private val FRAGMENT_SHADER = "precision mediump float;" +
            "uniform sampler2D uTextureUnit;" +
            "varying vec2 vTexCoord;" +
            "void main() {" +
            "  gl_FragColor = texture2D(uTextureUnit, vTexCoord);" +
            "}"
    private val COORDS_PER_VERTEX = 2
    private val COORDS_PER_TEXTURE = 2
    private val VERTEX = floatArrayOf(1f, 1f, -1f, 1f, 1f, -1f, -1f, -1f)
    private val TEXTURE = floatArrayOf(1f, 0f, 0f, 0f, 1f, 1f, 0f, 1f)
    private var mVertexBuffer: FloatBuffer? = null
    private var mTextureBuffer: FloatBuffer? = null
    private var mMvpMatrix = FloatArray(16)
    private var mProgram = 0
    private var mMvpMatrixHandle = 0
    private var mPositionHandle = 0
    private var mTexCoordHandle = 0
    private var mBitmapWidth = 0
    private var mBitmapHeight = 0
    private var mImagePath: String? = null

    init {
        mImagePath = imagePath
        mVertexBuffer = GLESUtils.createFloatBuffer(VERTEX)
        mTextureBuffer = GLESUtils.createFloatBuffer(TEXTURE)
    }

    override fun onCreate() {
        GLES20.glClearColor(1.0f, 1.0f, 1.0f, 0.0f)

        val vertexShader = GLESUtils.createVertexShader(VERTEX_SHADER)
        val fragmentShader = GLESUtils.createFragmentShader(FRAGMENT_SHADER)
        mProgram = GLESUtils.createProgram(vertexShader, fragmentShader)
        mPositionHandle = GLES20.glGetAttribLocation(mProgram, "aPosition")
        mMvpMatrixHandle = GLES20.glGetUniformLocation(mProgram, "uMVPMatrix")
        mTexCoordHandle = GLES20.glGetAttribLocation(mProgram, "aTexCoord")
        val texUnitHandle = GLES20.glGetAttribLocation(mProgram, "uTextureUnit")

        // 加载图片并且保存在 OpenGL 纹理系统中

        // 加载图片并且保存在 OpenGL 纹理系统中
        val bitmap = BitmapFactory.decodeFile(mImagePath)
//        var bitmap = Bitmap.createBitmap(50000, 10000, Bitmap.Config.ARGB_8888);
        mBitmapWidth = bitmap.width
        mBitmapHeight = bitmap.height
        val imageTexture = GLESUtils.createImageTexture(bitmap)
        // 激活纹理
        // 激活纹理
        GLES20.glActiveTexture(GLES20.GL_TEXTURE0)
        // 绑定纹理
        // 绑定纹理
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, imageTexture)
        // 把选定的纹理单元传给片段着色器
        // 把选定的纹理单元传给片段着色器
        GLES20.glUniform1i(texUnitHandle, 0)


        GLES20.glViewport(0, 0, 200, 200)
        // Image CenterInside
        // Image CenterInside
        mMvpMatrix = GLESUtils.changeMvpMatrixInside(
            200f, 200f, mBitmapWidth.toFloat(),
            mBitmapHeight.toFloat()
        )
    }

    override fun onDraw(): Boolean {

        GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT)

        GLES20.glUseProgram(mProgram)
        GLES20.glUniformMatrix4fv(mMvpMatrixHandle, 1, false, mMvpMatrix, 0)
        // 传入顶点坐标
        // 传入顶点坐标
        GLES20.glEnableVertexAttribArray(mPositionHandle)
        GLES20.glVertexAttribPointer(
            mPositionHandle,
            COORDS_PER_VERTEX,
            GLES20.GL_FLOAT,
            false,
            0,
            mVertexBuffer
        )
        // 传入纹理坐标
        // 传入纹理坐标
        GLES20.glEnableVertexAttribArray(mTexCoordHandle)
        GLES20.glVertexAttribPointer(
            mTexCoordHandle,
            COORDS_PER_TEXTURE,
            GLES20.GL_FLOAT,
            false,
            0,
            mTextureBuffer
        )
        GLES20.glDrawArrays(
            GLES20.GL_TRIANGLE_STRIP,
            0,
            VERTEX.size / COORDS_PER_VERTEX
        )
        GLES20.glDisableVertexAttribArray(mPositionHandle)
        GLES20.glDisableVertexAttribArray(mTexCoordHandle)
        GLES20.glUseProgram(0)

        return true
    }

    override fun onDispose() {

    }
}