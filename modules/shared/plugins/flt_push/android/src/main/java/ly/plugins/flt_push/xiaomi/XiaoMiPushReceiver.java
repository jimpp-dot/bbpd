package ly.plugins.flt_push.xiaomi;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

import ly.plugins.flt_push.FltPushManager;
import com.xiaomi.mipush.sdk.ErrorCode;
import com.xiaomi.mipush.sdk.MiPushClient;
import com.xiaomi.mipush.sdk.MiPushCommandMessage;
import com.xiaomi.mipush.sdk.MiPushMessage;
import com.xiaomi.mipush.sdk.PushMessageReceiver;

import java.util.List;

/**
 * Created by davidwei on 2018/06/13
 */
public final class XiaoMiPushReceiver extends PushMessageReceiver {
    private static final String TAG = XiaoMiPushReceiver.class.getSimpleName();

    /**
     * 接收服务器发送的透传消息
     */
    @Override
    public void onReceivePassThroughMessage(Context context, MiPushMessage message) {
        Log.d(TAG, "onReceivePassThroughMessage message = " + message);
    }

    /**
     * 接收服务器发来的通知栏消息（用户点击通知栏时触发）
     */
    @Override
    public void onNotificationMessageClicked(Context context, MiPushMessage message) {
        Log.d(TAG, "onNotificationMessageClicked  message = " + message);
        try {
            String content = message.getContent();
            Intent startActivityIntent = new Intent(Intent.ACTION_VIEW);
            startActivityIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            String packageName = context.getPackageName();
            startActivityIntent.setData(Uri.parse("rong://" + packageName + "/conversationlist?isFromPush=true&" + content));
            context.startActivity(startActivityIntent);
        } catch (Exception e) {
            Log.w(TAG, " error:" + e);
        }
    }

    /**
     * 接收服务器发来的通知栏消息（消息到达客户端时触发，并且可以接收应用在前台时不弹出通知的通知消息）
     */
    @Override
    public void onNotificationMessageArrived(Context context, MiPushMessage message) {
        Log.d(TAG, "onNotificationMessageArrived  message = " + message);
    }

    /**
     * 接收客户端向服务器发送命令消息后返回的响应
     */
    @Override
    public void onCommandResult(Context context, MiPushCommandMessage message) {
        Log.d(TAG, "onCommandResult message = " + message);
    }

    /**
     * 接受客户端向服务器发送注册命令消息后返回的响应
     */
    @Override
    public void onReceiveRegisterResult(Context context, MiPushCommandMessage message) {
        final String command = message.getCommand();
        final List<String> arguments = message.getCommandArguments();
        final String cmdArg1 = ((arguments != null && arguments.size() > 0) ? arguments.get(0) : null);
        if (MiPushClient.COMMAND_REGISTER.equals(command)) {
            if (message.getResultCode() == ErrorCode.SUCCESS) {
                Log.d(TAG, "onReceiveRegisterResult register ok regId = " + cmdArg1);
                FltPushManager.getInstance().onPushRegister(context, cmdArg1, FltPushManager.PUSH_FROM_XIAOMI);
            } else {
                Log.w(TAG, "onReceiveRegisterResult register error code = " + message.getResultCode());
            }
        }
    }
}
