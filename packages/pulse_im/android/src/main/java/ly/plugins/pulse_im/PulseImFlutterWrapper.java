package ly.plugins.pulse_im;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.util.Log;

//import com.xiaomi.mipush.sdk.MiPushClient;

import java.util.List;
import java.util.Map;

public class PulseImFlutterWrapper {
    public static final String TAG = PulseImFlutterWrapper.class.getSimpleName();

    private static Activity mActivity = null;
    private static MethodChannel mChannel = null;
    private Handler mMainHandler = null;

    private PulseImFlutterWrapper() {
        mMainHandler = new Handler(Looper.getMainLooper());
    }

    private static class SingleHolder {
        static PulseImFlutterWrapper instance = new PulseImFlutterWrapper();
    }

    public static PulseImFlutterWrapper getInstance() {
        return SingleHolder.instance;
    }

    public void saveActivity(Activity activity) {
        mActivity = activity;
    }

    public void saveChannel(MethodChannel channel) {
        mChannel = channel;
    }

    //Map map = new HashMap();
    //map.put("key","android");
    //RCIMFlutterWrapper.getInstance().sendDataToFlutter(method, map);
    // 可通过该接口向Flutter传递数据
    public void sendDataToFlutter(final String method, final Map map) {
        mMainHandler.post(new Runnable() {
            @Override
            public void run() {
                mChannel.invokeMethod(method, map);
            }
        });
    }

    public void onFlutterMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        }else if (call.method.equals("miPushInit")) {
            miPushInit(call, result);
        } else {
            result.notImplemented();
        }
    }

    private void miPushInit(MethodCall call, Result result) {
        String appId = call.argument("appId");
        String appKey = call.argument("appKey");
        // 注册push服务，注册成功后会向DemoMessageReceiver发送广播
        // 可以从DemoMessageReceiver的onCommandResult方法中MiPushCommandMessage对象参数中获取注册信息
        if (shouldInit()) {
            Log.v(TAG, "begin to register... " + appId + "," + appKey);
            //MiPushClient.registerPush(mActivity, appId, appKey);
            Log.v(TAG, "end to register...");
            result.success("success");
        }
    }

    private boolean shouldInit() {
        ActivityManager am = ((ActivityManager) mActivity.getSystemService(Context.ACTIVITY_SERVICE));
        List<ActivityManager.RunningAppProcessInfo> processInfos = am.getRunningAppProcesses();
        String mainProcessName = mActivity.getPackageName();
        Log.v(TAG, mainProcessName);

        int myPid = Process.myPid();
        for (ActivityManager.RunningAppProcessInfo info : processInfos) {
            if (info.pid == myPid && mainProcessName.equals(info.processName)) {
                return true;
            }
        }
        return false;
    }
}