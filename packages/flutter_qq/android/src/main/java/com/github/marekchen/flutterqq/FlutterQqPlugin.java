package com.github.marekchen.flutterqq;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import androidx.annotation.NonNull;


import com.tencent.connect.common.Constants;
import com.tencent.connect.share.QQShare;
import com.tencent.connect.share.QzonePublish;
import com.tencent.connect.share.QzoneShare;
import com.tencent.tauth.IUiListener;
import com.tencent.tauth.Tencent;
import com.tencent.tauth.UiError;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/**
 * FlutterQqPlugin
 */
public class FlutterQqPlugin implements MethodCallHandler, FlutterPlugin, ActivityAware {

    private static Tencent mTencent;
    private boolean isLogin;

    private MethodChannel channel;
    private ActivityPluginBinding activityPluginBinding;
    final private OneListener listener = new OneListener();

    private Context context;

    private static String getMetadata(Context context, String name) {
        try {
            ApplicationInfo appInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), PackageManager.GET_META_DATA);
            if (appInfo.metaData != null) {
                Log.i("FlutterQqPlugin", "in getMetadata appId = " + appInfo.metaData.get(name));
                return String.valueOf(appInfo.metaData.get(name));
            }

        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        context = binding.getApplicationContext();
        channel = new MethodChannel(binding.getBinaryMessenger(), "flutter_qq");
        channel.setMethodCallHandler(this);
    }

    private void _autoRegister(Context context) {
        String mAppId = getMetadata(context, "QQ_APPID");
        Log.i("FlutterQqPlugin", "in _autoRegister: mAppId = " + mAppId);

        mTencent = Tencent.createInstance(mAppId, context, context.getPackageName() + ".fileprovider");
        Tencent.setIsPermissionGranted(true); //已授权获取设备信息
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        context = null;
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        this.activityPluginBinding = binding;
        binding.addActivityResultListener(listener);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {
        activityPluginBinding.removeActivityResultListener(listener);
    }

    @Override
    public void onMethodCall(MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "registerQQ":
                registerQQ(call, result);
                break;
            case "isQQInstalled":
                isQQInstalled(call, result);
                break;
            case "login":
                isLogin = true;
                listener.setResult(result);
                login(call, listener);
                break;
            case "shareToQQ":
                isLogin = false;
                listener.setResult(result);
                doShareToQQ(call, listener);
                break;
            case "shareToQzone":
                isLogin = false;
                listener.setResult(result);
                doShareToQzone(call, listener);
                break;
        }
    }

    private void registerQQ(MethodCall call, Result result) {
        String mAppId = call.argument("appId");

        mTencent = Tencent.createInstance(mAppId, context, context.getPackageName() + ".fileprovider");
        Tencent.setIsPermissionGranted(true); //已授权获取设备信息
        result.success(true);
    }

    private void isQQInstalled(MethodCall call, Result result) {
        result.success(mTencent.isQQInstalled(context));
    }

    private void login(MethodCall call, final OneListener listener) {
        String scopes = call.argument("scopes");
        mTencent.login(activityPluginBinding.getActivity(), scopes == null ? "get_simple_userinfo" : scopes, listener);
    }

    private void doShareToQQ(MethodCall call, final OneListener listener) {
        final Bundle params = new Bundle();
        int shareType = call.argument("shareType");
        Log.i("FlutterQqPlugin", "arguments:" + call.arguments);
        if (shareType != QQShare.SHARE_TO_QQ_TYPE_IMAGE) {
            params.putString(QQShare.SHARE_TO_QQ_TITLE, (String) call.argument("title"));
            params.putString(QQShare.SHARE_TO_QQ_TARGET_URL, (String) call.argument("targetUrl"));
            params.putString(QQShare.SHARE_TO_QQ_SUMMARY, (String) call.argument("summary"));
        }
        if (shareType == QQShare.SHARE_TO_QQ_TYPE_IMAGE) {
            params.putString(QQShare.SHARE_TO_QQ_IMAGE_LOCAL_URL, (String) call.argument("imageLocalUrl"));
        } else {
            params.putString(QQShare.SHARE_TO_QQ_IMAGE_URL, (String) call.argument("imageUrl"));
        }
        params.putString(QQShare.SHARE_TO_QQ_APP_NAME, (String) call.argument("appName"));
        params.putInt(QQShare.SHARE_TO_QQ_KEY_TYPE, shareType);
        params.putInt(QQShare.SHARE_TO_QQ_EXT_INT, (Integer) call.argument("qzoneFlag"));
        if (shareType == QQShare.SHARE_TO_QQ_TYPE_AUDIO) {
            params.putString(QQShare.SHARE_TO_QQ_AUDIO_URL, (String) call.argument("audioUrl"));
        }
        params.putString(QQShare.SHARE_TO_QQ_ARK_INFO, (String) call.argument("ark"));
        Log.i("FlutterQqPlugin", "params:" + params);
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                mTencent.shareToQQ(activityPluginBinding.getActivity(), params, listener);
            }
        });
    }

    private void doShareToQzone(MethodCall call, final OneListener listener) {
        final Bundle params = new Bundle();
        int shareType = call.argument("shareType");
        Log.i("FlutterQqPlugin", "arguments:" + call.arguments);
        params.putInt(QzoneShare.SHARE_TO_QZONE_KEY_TYPE, shareType);
        params.putString(QzoneShare.SHARE_TO_QQ_TITLE, (String) call.argument("title"));
        params.putString(QzoneShare.SHARE_TO_QQ_SUMMARY, (String) call.argument("summary"));
        params.putString(QzoneShare.SHARE_TO_QQ_TARGET_URL, (String) call.argument("targetUrl"));

        ArrayList<String> path_arr = new ArrayList<>();
        path_arr.add((String) call.argument("imageUrl"));
        params.putStringArrayList(QzoneShare.SHARE_TO_QQ_IMAGE_URL, path_arr);  //!这里是大坑 不能用SHARE_TO_QQ_IMAGE_LOCAL_URL

        params.putString(QzonePublish.PUBLISH_TO_QZONE_VIDEO_PATH, (String) call.argument("videoPath"));
        Bundle bundle2 = new Bundle();
        bundle2.putString(QzonePublish.HULIAN_EXTRA_SCENE, (String) call.argument("scene"));
        bundle2.putString(QzonePublish.HULIAN_CALL_BACK, (String) call.argument("hulian_call_back"));
        params.putBundle(QzonePublish.PUBLISH_TO_QZONE_EXTMAP, bundle2);
        Log.i("FlutterQqPlugin", "params:" + params);
        if (shareType == QzoneShare.SHARE_TO_QZONE_TYPE_IMAGE_TEXT) {
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    mTencent.shareToQzone(activityPluginBinding.getActivity(), params, listener);
                }
            });
        } else {
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    mTencent.publishToQzone(activityPluginBinding.getActivity(), params, listener);
                }
            });
        }
    }


    private class OneListener implements IUiListener, PluginRegistry.ActivityResultListener {

        private Result result;

        void setResult(Result result) {
            this.result = result;
        }

        @Override
        public void onComplete(Object response) {
            Log.i("FlutterQqPlugin", response.toString());
            if (result == null) {
                return;
            }
            Map<String, Object> re = new HashMap<>();
            if (isLogin) {
                if (null == response) {
                    re.put("Code", 1);
                    re.put("Message", "response is empty");
                    result.success(re);
                    result = null;
                    return;
                }
                JSONObject jsonResponse = (JSONObject) response;
                if (null != jsonResponse && jsonResponse.length() == 0) {
                    re.put("Code", 1);
                    re.put("Message", "response is empty");
                    result.success(re);
                    result = null;
                    return;
                }
                Map<String, Object> resp = new HashMap<>();
                try {
                    Log.i("FlutterQqPlugin", resp.toString());
                    resp.put("openid", jsonResponse.getString(Constants.PARAM_OPEN_ID));
                    resp.put("accessToken", jsonResponse.getString(Constants.PARAM_ACCESS_TOKEN));
                    resp.put("expiresAt", jsonResponse.getLong(Constants.PARAM_EXPIRES_TIME));
                    // resp.put("appId", jsonResponse.getString(Constants.PARAM_APP_ID));
                    re.put("Code", 0);
                    re.put("Message", "ok");
                    re.put("Response", resp);
                    result.success(re);
                    result = null;
                    return;
                } catch (Exception e) {
                    re.put("Code", 1);
                    re.put("Message", e.getLocalizedMessage());
                    result.success(re);
                    result = null;
                    return;
                }
            }
            re.put("Code", 0);
            re.put("Message", response.toString());
            result.success(re);
            result = null;
        }

        @Override
        public void onError(UiError uiError) {
            Log.w("FlutterQqPlugin", "errorCode:" + uiError.errorCode + ";errorMessage:" + uiError.errorMessage);
            if (result == null) {
                return;
            }
            Map<String, Object> re = new HashMap<>();
            re.put("Code", 1);
            re.put("Message", "errorCode:" + uiError.errorCode + ";errorMessage:" + uiError.errorMessage);
            result.success(re);
            result = null;
        }

        @Override
        public void onCancel() {
            Log.w("FlutterQqPlugin", "error:cancel");
            if (result == null) {
                return;
            }
            Map<String, Object> re = new HashMap<>();
            re.put("Code", 2);
            re.put("Message", "cancel");
            result.success(re);
            result = null;
        }

        @Override
        public void onWarning(int i) {

        }

        @Override
        public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
            if (requestCode == Constants.REQUEST_LOGIN ||
                    requestCode == Constants.REQUEST_QQ_SHARE ||
                    requestCode == Constants.REQUEST_QZONE_SHARE ||
                    requestCode == Constants.REQUEST_APPBAR) {
                Tencent.onActivityResultData(requestCode, resultCode, data, this);
                return true;
            }
            return false;
        }
    }
}
