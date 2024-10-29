package ly.plugins.flt_push.huawei;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;

import com.huawei.hms.aaid.HmsInstanceId;
import com.huawei.hms.common.ApiException;
import ly.plugins.flt_push.FltPushManager;
import ly.plugins.flt_push.IPushManager;
import ly.plugins.flt_push.utils.PushUtil;


/**
 * Created by davidwei on 2018/06/14
 */
public final class HuaWeiPushManager implements IPushManager {
    public static final String TAG = HuaWeiPushManager.class.getSimpleName();

    private static String mToken = "";

    public void start(Context context) {
        Log.d(TAG, "start");
        try {
            getTokenAsync(context);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void stop(Context context) {
        Log.d(TAG, "stop");
    }

    @Override
    public String getToken(Context context) {
        return mToken;
    }

    private void getTokenAsync(final Context context) {
        // 创建一个新线程
        new Thread() {
            @Override
            public void run() {
                try {
                    String appId = PushUtil.getMetadata(context, "HUAWEI_APP_ID");
                    Log.i(TAG, "appId: " + appId);

                    // 输入token标识"HCM"
                    String tokenScope = "HCM";
                    String token = HmsInstanceId.getInstance(context).getToken(appId, tokenScope);
                    Log.i(TAG, "get token: " + token);

                    // 判断token是否为空
                    if (!TextUtils.isEmpty(token)) {
                        sendRegTokenToServer(context, token);
                    }
                } catch (ApiException e) {
                    Log.e(TAG, "get token failed, " + e);
                }
            }
        }.start();
    }

    private void sendRegTokenToServer(Context context, String token) {
        Log.i(TAG, "sending token to server. token:" + token);
        mToken = token;
        FltPushManager.getInstance().onPushRegister(context, token, FltPushManager.PUSH_FROM_HUAWEI);
    }


}
