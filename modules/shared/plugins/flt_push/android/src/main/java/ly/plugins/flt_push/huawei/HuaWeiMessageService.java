package ly.plugins.flt_push.huawei;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;

import com.huawei.hms.push.HmsMessageService;
import com.huawei.hms.push.RemoteMessage;
import ly.plugins.flt_push.FltPushManager;

public class HuaWeiMessageService extends HmsMessageService{

    private static final String TAG = "HuaWeiMessageService";

    @Override
    public void onNewToken(String token, Bundle bundle) {
        // 获取token
        Log.i(TAG, "have received refresh token " + token);

        // 判断token是否为空
        if (!TextUtils.isEmpty(token)) {
            FltPushManager.getInstance().onPushRegister(this, token, FltPushManager.PUSH_FROM_HUAWEI);
        }
    }

}



