package ly.plugins.flt_push.oppo;

import android.content.Context;
import android.util.Log;

import com.heytap.msp.push.HeytapPushManager;
import com.heytap.msp.push.callback.ICallBackResultService;
import ly.plugins.flt_push.FltPushManager;
import ly.plugins.flt_push.IPushManager;
import ly.plugins.flt_push.utils.PushUtil;

public class OppoPushManager implements IPushManager {
    @Override
    public void start(final Context context) {
        String oppoAppKey = PushUtil.getMetadata(context, "OPPO_PUSH_APP_KEY");
        String oppoAppSecret = PushUtil.getMetadata(context, "OPPO_PUSH_APP_SECRET");
        if (!HeytapPushManager.isSupportPush(context)) {
            return;
        }
        HeytapPushManager.init(context, true);
        HeytapPushManager.register(context, oppoAppKey, oppoAppSecret, new ICallBackResultService() {
            @Override
            public void onRegister(int code, String regId) {
                if (code == 0) {
                    FltPushManager.getInstance().onPushRegister(context, regId, FltPushManager.PUSH_FROM_OPPO);
                }
            }

            @Override
            public void onUnRegister(int i) {

            }

            @Override
            public void onSetPushTime(int i, String s) {

            }

            @Override
            public void onGetPushStatus(int i, int i1) {

            }

            @Override
            public void onGetNotificationStatus(int i, int i1) {

            }

            @Override
            public void onError(int i, String s) {

            }
        });
    }

    @Override
    public void stop(Context context) {
    }

    @Override
    public String getToken(Context context) {
        return HeytapPushManager.getRegisterID();
    }
}
