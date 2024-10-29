package ly.plugins.flt_push;

import android.content.Context;

/**
 * Created by yorkeehuang on 2017/12/20.
 */

public interface IPushCallback {
    void onPushRegistered(String token, String vendor);
    void onReceivePushMessage(Context context, String msg, String from, boolean playSound);
    void onClickNotification(final String msg, final String from);
}
