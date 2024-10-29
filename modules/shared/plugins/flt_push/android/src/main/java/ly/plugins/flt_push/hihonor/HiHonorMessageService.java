package ly.plugins.flt_push.hihonor;

import android.text.TextUtils;
import android.util.Log;

import com.hihonor.push.sdk.HonorMessageService;
import com.hihonor.push.sdk.HonorPushDataMsg;
import ly.plugins.flt_push.FltPushManager;

public class HiHonorMessageService extends HonorMessageService {

    private static final String TAG = "HiHonorMessageService";

    // Token发生变化时，会以onNewToken方法返回
    @Override
    public void onNewToken(String token) {
        // 获取token
        Log.i(TAG, "have received refresh token " + token);

        // 判断token是否为空
        if (!TextUtils.isEmpty(token)) {
            FltPushManager.getInstance().onPushRegister(this, token, FltPushManager.PUSH_FROM_HONOR);
        }
    }

    @Override
    public void onMessageReceived(HonorPushDataMsg msg) {
        Log.i(TAG, "have received msg " + msg);
    }
}
