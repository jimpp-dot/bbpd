package ly.plugins.flt_push.vivo;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

import ly.plugins.flt_push.FltPushManager;
import com.vivo.push.model.UPSNotificationMessage;
import com.vivo.push.sdk.OpenClientPushMessageReceiver;

public class VivoPushReceiver extends OpenClientPushMessageReceiver {
  public static final String TAG = VivoPushReceiver.class.getSimpleName();

  /***
   * 当通知被点击时回调此方法
   * @param context 应用上下文
   * @param msg 通知详情，详细信息见API接入文档
   */
  @Override
  public void onNotificationMessageClicked(Context context, UPSNotificationMessage msg) {
    Log.d(TAG, "onNotificationMessageClicked msg = " + msg);
    try {
      String pushParams = msg.getSkipContent();
      Intent intentActivity = new Intent(Intent.ACTION_VIEW);
      intentActivity.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      String packageName = context.getPackageName();
      intentActivity.setData(Uri.parse("rong://" + packageName + "/conversationlist?isFromPush=true&" + pushParams));
      context.startActivity(intentActivity);
    } catch (Exception e) {
      Log.w(TAG, " error:" + e);
    }
  }


  /***
   * 当首次turnOnPush成功或regId发生改变时，回调此方法
   * 如需获取regId，请使用PushClient.getInstance(context).getRegId()
   * @param context 应用上下文
   * @param regId 注册id
   */
  @Override
  public void onReceiveRegId(Context context, String regId) {
    Log.d(TAG, "onReceiveRegId regId = " + regId);
    FltPushManager.getInstance().onPushRegister(context, regId, FltPushManager.PUSH_FROM_VIVO);
  }

}