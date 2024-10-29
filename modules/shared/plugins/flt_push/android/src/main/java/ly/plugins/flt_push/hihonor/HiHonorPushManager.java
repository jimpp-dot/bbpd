package ly.plugins.flt_push.hihonor;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;

import com.hihonor.push.sdk.HonorPushCallback;
import com.hihonor.push.sdk.HonorPushClient;
import ly.plugins.flt_push.FltPushManager;
import ly.plugins.flt_push.IPushManager;

public final class HiHonorPushManager implements IPushManager {
    public static final String TAG = HiHonorPushManager.class.getSimpleName();

    private static String mToken = "";

    public void start(Context context) {
        Log.d(TAG, "start");
        boolean isSupport = HonorPushClient.getInstance().checkSupportHonorPush(context);
        if (isSupport) {
            HonorPushClient.getInstance().init(context, true);
            // 获取PushToken
            HonorPushClient.getInstance().getPushToken(new HonorPushCallback<String>() {
                @Override
                public void onSuccess(String pushToken) {
                    if (!TextUtils.isEmpty(pushToken)) {
                        sendRegTokenToServer(context, pushToken);
                    }
                }

                @Override
                public void onFailure(int errorCode, String errorString) {
                }
            });
        }
    }

    public void stop(Context context) {
        Log.d(TAG, "stop");
        //注销PushToken
        HonorPushClient.getInstance().deletePushToken(new HonorPushCallback<Void>() {
            @Override
            public void onSuccess(Void aVoid) {
            }

            @Override
            public void onFailure(int errorCode, String errorString) {
            }
        });
    }

    @Override
    public String getToken(Context context) {
        return mToken;
    }

    private void sendRegTokenToServer(Context context, String token) {
        Log.i(TAG, "sending token to server. token:" + token);
        mToken = token;
        FltPushManager.getInstance().onPushRegister(context, token, FltPushManager.PUSH_FROM_HONOR);
    }
}
