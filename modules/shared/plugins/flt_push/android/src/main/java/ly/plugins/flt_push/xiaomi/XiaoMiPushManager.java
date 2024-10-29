package ly.plugins.flt_push.xiaomi;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;

import ly.plugins.flt_push.IPushManager;
import ly.plugins.flt_push.utils.PushUtil;
import com.xiaomi.channel.commonutils.logger.LoggerInterface;
import com.xiaomi.mipush.sdk.Logger;
import com.xiaomi.mipush.sdk.MiPushClient;

import java.util.List;

public final class XiaoMiPushManager implements IPushManager {
    private static final String TAG = XiaoMiPushManager.class.getSimpleName();

    private static boolean isEnable = false;

    /**
     * 开启小米PUSH
     */
    @Override
    public void start(Context context) {
        Log.d(TAG, "start");
        isEnable = true;
        // 通过调用MiPushClient.registerPush来初始化小米推送服务
        // 注册成功后，您可以在自定义的onCommandResult和onReceiveRegisterResult中收到注册结果
        // 其中的regId即是当前设备上当前app的唯一标示
        // 您可以将regId上传到自己的服务器，方便向其发消息
        // 为了提高push的注册率，你可以在Application的onCreate中初始化push
        // 你也可以根据需要，在其他地方初始化push
        String miAppId = PushUtil.getMetadata(context, "XIMAOMI_PUSH_APP_ID");
        String miAppKey = PushUtil.getMetadata(context, "XIMAOMI_PUSH_APP_KEY");
        if (miAppId == null || miAppKey == null || !PushUtil.isMainProcess(context)) return;
        // 初始化小米推送服务
        MiPushClient.registerPush(context, miAppId, miAppKey);
        // 打开Log
        Logger.setLogger(context, new LoggerInterface() {
            @Override
            public void setTag(String tag) {
                Log.d(TAG, "setTag=" + tag);
            }

            @Override
            public void log(String content, Throwable t) {
                Log.d(TAG, content, t);
            }

            @Override
            public void log(String content) {
                Log.d(TAG, content);
            }
        });
    }

    /**
     * 关闭小米PUSH
     */
    @Override
    public void stop(final Context context) {
        Log.d(TAG, "stop");
        try {
            MiPushClient.unregisterPush(context);
            isEnable = false;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getToken(Context context) {
        return MiPushClient.getRegId(context);
    }

    public static void setPushParams(Context context, String userAccount, String alias, String topic) {
        if (!isEnable) {
            return;
        }
        Log.d(TAG, "setPushParams : alias = " + alias);
        try {
            XiaoMiPushManager.setUserAccount(context, userAccount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            XiaoMiPushManager.setAlias(context, alias);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            XiaoMiPushManager.setTopic(context, topic);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void setTopic(final Context context, final String currentTopic) {
        final List<String> allTopics = MiPushClient.getAllTopic(context);
        if (allTopics != null) {
            for (String old : allTopics) {
                if (old != null && !TextUtils.equals(currentTopic, old)) {
                    MiPushClient.unsubscribe(context, old, null);
                }
            }
        }
        if (!TextUtils.isEmpty(currentTopic)) {
            MiPushClient.subscribe(context, currentTopic, null);
        }
    }

    private static void setAlias(Context context, String currentAlias) {
        final List<String> oldAlias = MiPushClient.getAllAlias(context);
        if (oldAlias != null) {
            for (String old : oldAlias) {
                if (!TextUtils.equals(currentAlias, old)) {
                    MiPushClient.unsetAlias(context, old, null);
                }
            }
        }
        if (TextUtils.isEmpty(currentAlias)) {
            MiPushClient.setAlias(context, currentAlias, null);
        }
    }

    private static void setUserAccount(Context context, String currentUserAccount) {
        final List<String> oldUserAccounts = MiPushClient.getAllUserAccount(context);
        if (oldUserAccounts != null) {
            for (String old : oldUserAccounts) {
                if (old != null && !TextUtils.equals(currentUserAccount, old)) {
                    MiPushClient.unsetUserAccount(context, old, null);
                }
            }
        }
        if (!TextUtils.isEmpty(currentUserAccount)) {
            MiPushClient.setUserAccount(context, currentUserAccount, null);
        }
    }

}
