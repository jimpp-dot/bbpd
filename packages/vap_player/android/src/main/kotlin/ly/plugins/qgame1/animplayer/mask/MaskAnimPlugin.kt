/*
 * Tencent is pleased to support the open source community by making vap available.
 *
 * Copyright (C) 2020 THL A29 Limited, a Tencent company.  All rights reserved.
 *
 * Licensed under the MIT License (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 *
 * http://opensource.org/licenses/MIT
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is
 * distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing permissions and
 * limitations under the License.
 */
package ly.plugins.qgame1.animplayer.mask

import ly.plugins.qgame1.animplayer.AnimConfig
import ly.plugins.qgame1.animplayer.AnimPlayer
import ly.plugins.qgame1.animplayer.Constant
import ly.plugins.qgame1.animplayer.plugin.IAnimPlugin
import ly.plugins.qgame1.animplayer.util.ALog

class MaskAnimPlugin(val player: AnimPlayer): IAnimPlugin {

    companion object {
        private const val TAG = "${Constant.TAG}.MaskAnimPlugin"
    }

    private var maskRender: MaskRender? = null
    private var animConfig : AnimConfig ?= null


    override fun onConfigCreate(config: AnimConfig): Int {
        return Constant.OK
    }

    override fun onRenderCreate() {
        ALog.i(TAG, "mask render init")
        maskRender = if(player.supportMaskBoolean) MaskRender(this) else return
        maskRender?.initMaskShader(player.maskEdgeBlurBoolean)
    }

    override fun onRendering(frameIndex: Int) {
        animConfig = if(player.supportMaskBoolean && player.configManager.config is AnimConfig) player.configManager.config else return
        animConfig?.let {config ->
            maskRender?.renderFrame(config)
        }
    }


    override fun onRelease() {
        destroy()
    }

    override fun onDestroy() {
        destroy()
    }


    private fun destroy() {
        // 强制结束等待
        animConfig?.maskConfig?.release()
    }
    
}