package com.starify.rtc.effectcore.example

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.widget.Toast
import androidx.core.app.ActivityCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    applyPermissions(PERMISSION_LIST)
  }

  private val PERMISSION_LIST = arrayOf(
    Manifest.permission.RECORD_AUDIO,
    Manifest.permission.MODIFY_AUDIO_SETTINGS,
    Manifest.permission.WRITE_EXTERNAL_STORAGE,
    Manifest.permission.READ_EXTERNAL_STORAGE,
    Manifest.permission.CAMERA,
    Manifest.permission.ACCESS_COARSE_LOCATION,
    Manifest.permission.ACCESS_FINE_LOCATION
  )

  //权限申请标记
  private val APPLY_PERMISSIONS = 154
  private fun applyPermissions(permissions: Array<String>?): Boolean {
    //1.筛选未申请的权限：
    val unApplyList = ArrayList<String>()
    var i = 0
    while (permissions != null && i < permissions.size) {

      //筛选未拥有&&满足API要求的权限
      if (ActivityCompat.checkSelfPermission(this, permissions[i]) != PackageManager.PERMISSION_GRANTED) { //未拥有的权限
        if (permissions[i] == Manifest.permission.READ_EXTERNAL_STORAGE && getSDKVersionNumber() < 16) { //读取文件权限要求16以上
        } else if (permissions[i] == Manifest.permission.BODY_SENSORS && getSDKVersionNumber() < 20) { //获取体征数据要求20以上
        } else if (permissions[i] == Manifest.permission.READ_CALL_LOG && getSDKVersionNumber() < 16) { //读取手机通讯录要求16以上
        } else if (permissions[i] == Manifest.permission.WRITE_CALL_LOG && getSDKVersionNumber() < 16) { //写入手机通讯录要求16以上
        } else if (permissions[i] == Manifest.permission.ADD_VOICEMAIL && getSDKVersionNumber() < 14) { //添加语音信箱要求14以上
        } else {
          unApplyList.add(permissions[i])
        }
      }
      i++
    }
    //2.如果所有权限都拥有了，返回true，否则申请所有未申请的权限
    return if (unApplyList.size == 0) {
      true
    } else {
      if (getSDKVersionNumber() < 23) {
        Toast.makeText(this, "权限不足，请到设置页面给予应用相应的权限！", Toast.LENGTH_SHORT).show()
        false
      } else {
        val unApplyArray = arrayOfNulls<String>(unApplyList.size)
        for (i in unApplyArray.indices) {
          unApplyArray[i] = unApplyList[i]
        }
        ActivityCompat.requestPermissions(this, unApplyArray, APPLY_PERMISSIONS)
        false
      }
    }
  }

  private fun getSDKVersionNumber(): Int {
    val sdkVersion: Int = try {
      Integer.valueOf(Build.VERSION.SDK)
    } catch (e: NumberFormatException) {
      0
    }
    return sdkVersion
  }
}
