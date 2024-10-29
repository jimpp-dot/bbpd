package ly.plugins.flt_push.vivo;

import android.content.Context;
import android.util.Log;

import ly.plugins.flt_push.IPushManager;
import com.vivo.push.IPushActionListener;
import com.vivo.push.PushClient;
import com.vivo.push.PushConfig;
import com.vivo.push.listener.IPushQueryActionListener;
import com.vivo.push.util.VivoPushException;

public class VivoPushManager implements IPushManager {
  public static final String TAG = VivoPushManager.class.getSimpleName();

  private String regId;

  @Override
  public void start(final Context context) {
    // 在当前工程入口函数，建议在Application的onCreate函数中，添加以下代码
    PushConfig config = new PushConfig.Builder()
            .agreePrivacyStatement(true)
            .build();
    try {
      PushClient.getInstance(context).initialize(config);
    } catch (VivoPushException e) {
      e.printStackTrace();
    }

    // 打开push开关, 关闭为turnOffPush，详见api接入文档
    PushClient.getInstance(context).turnOnPush(new IPushActionListener() {

      @Override
      public void onStateChanged(int state) {
        if (state == 0) {
          getRegId(context);
        }
      }

    });
  }

  private void getRegId(Context context) {
    PushClient.getInstance(context).getRegId(new IPushQueryActionListener() {
      @Override
      public void onSuccess(String s) {
        regId = s;
        Log.d(TAG, "reqId query success regId = " + regId);
      }

      @Override
      public void onFail(Integer integer) {
        Log.d(TAG, "reqId query fail errorCode = " + integer);
      }
    });
  }

  @Override
  public void stop(Context context) {
    PushClient.getInstance(context).turnOffPush(new IPushActionListener() {
      @Override
      public void onStateChanged(int state) {

      }
    });
  }

  @Override
  public String getToken(Context context) {
    return regId;
  }
}
