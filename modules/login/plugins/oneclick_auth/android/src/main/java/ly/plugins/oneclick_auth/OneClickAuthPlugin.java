package ly.plugins.oneclick_auth;


import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.content.res.AppCompatResources;

import com.google.gson.Gson;
import com.mobile.auth.gatewayauth.AuthRegisterXmlConfig;
import com.mobile.auth.gatewayauth.AuthUIConfig;
import com.mobile.auth.gatewayauth.AuthUIControlClickListener;
import com.mobile.auth.gatewayauth.PhoneNumberAuthHelper;
import com.mobile.auth.gatewayauth.PreLoginResultListener;
import com.mobile.auth.gatewayauth.ResultCode;
import com.mobile.auth.gatewayauth.TokenResultListener;
import com.mobile.auth.gatewayauth.model.TokenRet;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * OneClickAuthPlugin
 */
public class OneClickAuthPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    private static final String TAG = "OneClickAuthPlugin";

    private MethodChannel channel;
    private Activity activity;
    private Context context;

    private PhoneNumberAuthHelper authHelper;
    private TokenResultListener tokenResultListener;
    private Boolean hasLoginCheck = false;
    private List<Map<String, String>> localLicenses = new ArrayList<>();

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        this.channel = new MethodChannel(binding.getBinaryMessenger(), "ly.plugins.oneclick_auth");
        channel.setMethodCallHandler(this);
        context = binding.getApplicationContext();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        this.channel.setMethodCallHandler(null);
        this.channel = null;
        this.context = null;
    }

    @Override
    public void onMethodCall(MethodCall call, @NonNull Result result) {
        Log.d(TAG, "onMethodCall: " + call.method);
        switch (call.method) {
            case "init":
                init(call, result);
                break;
            case "checkEnvAvailable":
                checkEnvAvailable(result);
                break;
            case "getLoginToken":
                getLoginToken(call);
                break;
            case "getAuthToken":
                getAuthToken();
                break;
            case "preLogin":
                preLogin(call, result);
                break;
            case "setDebugMode":
                setDebugMode(call, result);
                break;
            case "quitPage":
                quitPage();
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void init(final MethodCall call, Result result) {
        if (activity == null) return;
        // 1. init get token callback listener
        if (tokenResultListener == null) {
            tokenResultListener = new TokenResultListener() {
                @Override
                public void onTokenSuccess(final String ret) {
                    try {
                        Log.d(TAG, "onTokenSuccess: " + ret);
                        final TokenRet tokenRet = TokenRet.fromJson(ret);

                        if (ResultCode.CODE_START_AUTHPAGE_SUCCESS.equals(tokenRet.getCode())) {
                            // 唤起授权页成功
                        } else {
                            runOnUiThread(new Runnable() {
                                @Override
                                public void run() {
                                    if (channel == null) {
                                        return;
                                    }
                                    Map<String, Object> map = new HashMap<>();
                                    map.put("code", tokenRet.getCode());
                                    map.put("msg", tokenRet.getMsg());
                                    map.put("token", tokenRet.getToken());
                                    channel.invokeMethod("onReceiveAuthPageEvent", map);
                                }
                            });
                            quitPage();
                        }

                    } catch (Exception e) {
                        Log.e(TAG, "onTokenSuccess: ", e);
                    }
                }

                @Override
                public void onTokenFailed(final String ret) {
                    Log.e(TAG, "onTokenFailed: " + ret);
                    TokenRet tokenRet = null;
                    try {
                        tokenRet = TokenRet.fromJson(ret);
                        final TokenRet finalTokenRet = tokenRet;
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                if (channel == null) {
                                    return;
                                }
                                Map<String, Object> map = new HashMap<>();
                                map.put("code", finalTokenRet.getCode());
                                map.put("msg", finalTokenRet.getMsg());
                                map.put("token", finalTokenRet.getToken());
                                channel.invokeMethod("onReceiveAuthPageEvent", map);
                            }
                        });

                        quitPage();
                    } catch (Exception e) {
                        Log.e(TAG, "onTokenFailed: ", e);
                    }
                }
            };
        }
        // 2. init helper with listener
        if (authHelper == null) {
            authHelper = PhoneNumberAuthHelper.getInstance(context, tokenResultListener);
            authHelper.checkEnvAvailable(PhoneNumberAuthHelper.SERVICE_TYPE_LOGIN);
            authHelper.setUIClickListener(new AuthUIControlClickListener() {
                @Override
                public void onClick(String code, Context context, String jsonString) {
                    JSONObject jsonObj = null;
                    try {
                        if (!TextUtils.isEmpty(jsonString)) {
                            jsonObj = new JSONObject(jsonString);
                        }
                    } catch (JSONException e) {
                        jsonObj = new JSONObject();
                    }
                    switch (code) {
                        case ResultCode.CODE_ERROR_USER_SWITCH:
                            Log.e(TAG, "点击了授权页默认切换其他登录方式");
                            break;
                        case ResultCode.CODE_ERROR_USER_CHECKBOX:
                            hasLoginCheck = jsonObj.optBoolean("isChecked");
                            Log.e(TAG, "checkbox状态变为" + jsonObj.optBoolean("isChecked"));
                            break;
                        default:
                            break;
                    }

                }
            });
        }
        // 3. set key
        if (call.arguments != null) {
            authHelper.setAuthSDKInfo((String) call.arguments);
            result.success(null);
        } else {
            result.error("init failed", "key required.", null);
        }
    }

    private void checkEnvAvailable(Result result) {
        if (authHelper != null) {
            result.success(authHelper.checkEnvAvailable());
        } else {
            result.success(false);
        }
    }

    private void setDebugMode(MethodCall call, Result result) {
        Object arg = call.arguments;
        if (arg instanceof Boolean) {
            boolean debuggable = (boolean) arg;
            authHelper.getReporter().setLoggerEnable(debuggable);
            result.success(null);
        } else {
            result.error("invalid argument", null, null);
        }
    }

    private void quitPage() {
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                authHelper.quitLoginPage();
            }
        });
    }

    /**
     * 预取号码信息，建议登录页面onCreate（）方法调用，加速授权页打开速度。
     * 强烈不建议APP初始化后就调用。
     * 此方法是异步，不建议调用后立即调用getLoginToken方法
     * 不建议和getLoginToken方法串行调用
     * 并且建议判断用户是否登录，若已登录，则不调用此接口
     */
    private void preLogin(MethodCall call, final Result result) {
        int cacheMinutes = 5;
        Object args = call.arguments;
        if (args instanceof Integer) {
            int arg = (int) args;
            if (arg > 0 && arg < 5) {
                cacheMinutes = arg;
            }
        }
        authHelper.accelerateLoginPage(cacheMinutes, new PreLoginResultListener() {
            /**
             * @param vendor 返回预取成功运营商。移动：CMCC 联通：CUCC 电信：CTCC
             */
            @Override
            public void onTokenSuccess(final String vendor) {
                Log.d(TAG, "preLogin onTokenSuccess: " + vendor);
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        result.success(vendor);
                    }
                });
            }

            /**
             * @param vendor 返回预取失败运营商
             * @param ret 返回失败原因
             */
            @Override
            public void onTokenFailed(final String vendor, final String ret) {
                Log.d(TAG, "preLogin onTokenFailed: " + vendor + "\n" + ret);
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        result.error(vendor, ret, null);
                    }
                });
            }
        });
    }

    /**
     * 唤起一键登录授权页面，在用户授权后获取一键登录的Token
     * 超时时间 单位ms
     */
    private void getLoginToken(MethodCall call) {
        customUI(call);
        authHelper.getLoginToken(activity, 3000);
    }

    /**
     * 获取号码认证token
     */
    private void getAuthToken() {
        authHelper.getVerifyToken(5000);
    }

    private void customUI(MethodCall call) {
        Map uiConfig = (Map) call.arguments;
        @Nullable Number privacyColor = valueForKey(uiConfig, "privacyColor");
        @Nullable Number privacyAgreeColor = valueForKey(uiConfig, "privacyAgreeColor");
        @Nullable boolean showChangeBtn = parseBool(valueForKey(uiConfig, "showChangeBtn"));
        @Nullable boolean showWXLogin = parseBool(valueForKey(uiConfig, "showWXLogin"));
        @Nullable boolean showQQLogin = parseBool(valueForKey(uiConfig, "showQQLogin"));
        @Nullable boolean showAppleLogin = parseBool(valueForKey(uiConfig, "prishowAppleLoginvacyState"));
        @Nullable boolean showDouyinLogin = parseBool(valueForKey(uiConfig, "showDouyinLogin"));
        @Nullable boolean privacyState = parseBool(valueForKey(uiConfig, "privacyState"));
        @Nullable String privacyOneName = valueForKey(uiConfig, "privacyOneName");
        @Nullable String privacyOneUrl = valueForKey(uiConfig, "privacyOneUrl");
        @Nullable String privacyTwoName = valueForKey(uiConfig, "privacyTwoName");
        @Nullable String privacyTwoUrl = valueForKey(uiConfig, "privacyTwoUrl");
        hasLoginCheck = privacyState;

        localLicenses.clear();
        Map<String, String> license1 = new HashMap<>();
        license1.put("telecom", "localOne");
        license1.put("protocolName", privacyOneName);
        license1.put("protocolUrl", privacyOneUrl);
        localLicenses.add(license1);
        Map<String, String> license2 = new HashMap<>();
        license2.put("telecom", "localTwo");
        license2.put("protocolName", privacyTwoName);
        license2.put("protocolUrl", privacyTwoUrl);
        localLicenses.add(license2);

        String btnText = "本机号码安全登录";
        if (call.hasArgument("btnText")) {
            btnText = call.argument("btnText");
        }
        String switchText = "其他号码登录";
        if (call.hasArgument("switchText")) {
            switchText = call.argument("switchText");
        }

        int screenHeightDp = AppUtils.px2dp(context, AppUtils.getPhoneHeightPixels(context));
        int screenWidthDp = AppUtils.px2dp(context, AppUtils.getPhoneWidthPixels(context));
        int dialogWidth = (int) (screenWidthDp - 80);
        int dialogHeight = (int) (screenHeightDp * 0.65f) - 50;

        AuthUIConfig.Builder builder = new AuthUIConfig.Builder()
                // 状态栏
                .setStatusBarColor(Color.TRANSPARENT)
                .setStatusBarHidden(false)
                .setLightColor(true)// 状态栏字体为黑色
                .setStatusBarUIFlag(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN)
                .setWebNavColor(Color.WHITE)
                .setWebNavTextColor(Color.BLACK)
                // 导航栏
                .setNavHidden(true)
                // logo
                .setLogoHidden(true)
                // slogan
                .setSloganHidden(true)
                // 掩码栏
                .setNumberSize(26)
                .setNumberColor(context.getResources().getColor(R.color.color_title))
                .setNumFieldOffsetY(300)
                // 登录按钮
                .setLogBtnText(btnText)
                .setLogBtnTextSizeDp(16)
                .setLogBtnTextColor(Color.WHITE)
                .setLogBtnOffsetY(360)
                .setLogBtnHeight(52)
                .setLogBtnWidth(290)
                .setLogBtnBackgroundPath("login_btn")
                // 切换登录方式
                .setSwitchAccHidden(!showChangeBtn)
                .setSwitchAccText(switchText)
                .setSwitchAccTextColor(context.getResources().getColor(R.color.color_content))
                .setSwitchAccTextSize(13)
                .setSwitchOffsetY(430)
                // 协议
                .setCheckboxHidden(false)
                .setCheckedImgPath("ic_check_box_selected")
                .setUncheckedImgPath("ic_check_box_un_selected")
                .setPrivacyBefore(context.getResources().getString(R.string.privacy_before))
                .setVendorPrivacyPrefix("《")
                .setVendorPrivacySuffix("》")
                .setLogBtnToastHidden(false)
                /// 隐私协议二次弹窗配置
                /*.setPrivacyAlertIsNeedAutoLogin(true)
                .setPrivacyAlertMaskIsNeedShow(true)
                .setPrivacyAlertAlignment(Gravity.CENTER)
                .setPrivacyAlertBackgroundColor(Color.WHITE)
                .setPrivacyAlertMaskAlpha(0.4f)
                .setPrivacyAlertWidth(dialogWidth)
                .setPrivacyAlertHeight(230)
                .setPrivacyAlertCornerRadiusArray(new int[]{16, 16, 16, 16})
                .setPrivacyAlertTitleTextSize(18)
                .setPrivacyAlertTitleColor(context.getResources().getColor(R.color.color_title))
                .setPrivacyAlertTitleOffsetY(24)
                .setPrivacyAlertContentTextSize(15)
                .setPrivacyAlertContentColor(context.getResources().getColor(R.color.color_content))
                .setPrivacyAlertContentBaseColor(context.getResources().getColor(R.color.color_content))
                .setPrivacyAlertContentHorizontalMargin(20)
                .setPrivacyAlertContentAlignment(Gravity.CENTER)
                .setPrivacyAlertContentVerticalMargin(12)
                .setPrivacyAlertBtnTextColor(Color.WHITE)
                .setPrivacyAlertBtnBackgroundImgDrawable(AppCompatResources.getDrawable(context, R.drawable.shape_positive_btn_bg))
                .setPrivacyAlertBtnTextSize(15)
                .setPrivacyAlertBtnWidth(dialogWidth)
                .setPrivacyAlertBtnHeigth(48)
                .setPrivacyAlertBtnVerticalMargin(20)
                .setPrivacyAlertBtnHorizontalMargin(40)
                .setPrivacyAlertCloseBtnShow(false)
                .setPrivacyAlertOneColor(context.getResources().getColor(R.color.color_purple))
                .setPrivacyAlertTwoColor(context.getResources().getColor(R.color.color_purple))
                .setPrivacyAlertOperatorColor(context.getResources().getColor(R.color.color_purple))*/
                .setPageBackgroundPath("login_bg");

        // 隐私条款
        builder.setAppPrivacyOne("《" + privacyOneName + "》", privacyOneUrl);
        builder.setAppPrivacyTwo("《" + privacyTwoName + "》", privacyTwoUrl);
        builder.setPrivacyConectTexts(new String[]{",", "和"});
        if (null != privacyColor && null != privacyAgreeColor) {
            builder.setAppPrivacyColor(privacyColor.intValue(), privacyAgreeColor.intValue());
        }

        // 设置授权页面不跟随系统的深色模式
        authHelper.setAuthPageUseDayLight(false);
        authHelper.expandAuthPageCheckedScope(true);
        authHelper.setAuthUIConfig(builder.create());

        // 自定义控件区
        authHelper.removeAuthRegisterXmlConfig();
        authHelper.addAuthRegisterXmlConfig(new AuthRegisterXmlConfig.Builder()
                .setLayout(R.layout.other_login_type_layout, new PnsViewDelegate(
                        getShowFlag(showWXLogin, showQQLogin, showAppleLogin, showDouyinLogin),
                        new PnsViewDelegate.Callback() {
                            @Override
                            public void callback(int loginCode, String loginMessage) {
                                if (!hasLoginCheck && context != null) {
                                    Toast.makeText(context, "请同意服务条款", Toast.LENGTH_SHORT).show();
                                    return;
                                }
                                quitPage();
                                if (channel == null) {
                                    return;
                                }
                                Map<String, Object> map = new HashMap<>();
                                map.put("code", loginCode);
                                map.put("msg", loginMessage);
                                channel.invokeMethod("onReceiveAuthPageEvent", map);
                            }
                        }))
                .build());
    }

    private int getShowFlag(boolean showWechat, boolean showQQ, boolean showApple, boolean showDouyin) {
        int flag = 0;
        if (showWechat) flag |= 0x0001;
        if (showQQ) flag |= 0x0002;
        if (showApple) flag |= 0x0004;
        if (showDouyin) flag |= 0x0008;
        return flag;
    }

    private void runOnUiThread(Runnable runnable) {
        if (activity != null) {
            activity.runOnUiThread(runnable);
        }
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivity() {
        this.activity = null;
    }

    private <T> T valueForKey(Map para, String key) {
        if (para != null && para.containsKey(key)) {
            return (T) para.get(key);
        } else {
            return null;
        }
    }

    private boolean parseBool(Object value) {
        if (value == null) {
            return false;
        }

        if (value instanceof Boolean) {
            return (boolean) value;
        }
        return false;
    }

    /**
     * @param loginCode 1000 - 手机号登陆；111 - 微信；222 - QQ；333 - Apple；444 - 小米；555 - 抖音
     */
    private void showLicenseDialog(int loginCode, String loginMessage) {
        List<Map<String, String>> licenses = new ArrayList<>();
        Gson gson = new Gson();
        Map<String, String> license3 = new HashMap<>();

        String mVendorKey = authHelper.getCurrentCarrierName();
        if ("CMCC".equals(mVendorKey)) {
            license3.put("protocolName", "中国移动认证服务条款");
            license3.put("protocolUrl", "https://wap.cmpassport.com/resources/html/contract.html");
        }

        if ("CUCC".equals(mVendorKey)) {
            license3.put("protocolName", "联通统一认证服务条款");
            license3.put("protocolUrl", "https://opencloud.wostore.cn/authz/resource/html/disclaimer.html?fromsdk=true");
        }

        if ("CTCC".equals(mVendorKey)) {
            license3.put("protocolName", "天翼账号认证服务条款");
            license3.put("protocolUrl", "https://e.189.cn/sdk/agreement/detail.do?hidetop=true");
        }

        licenses.add(license3);
        licenses.addAll(localLicenses);

        String licenseJson = gson.toJson(licenses);
        // 设置回调
        LicenseCallbackManager.getInstance().setLicenseCallback(new LicenseCallbackManager.LicenseCallback() {
            @Override
            public void agreeToLogin(int code, String message) {
                // 设置同意服务协议
                authHelper.setProtocolChecked(true);
                // 执行登陆
                try {
                    if (channel == null) {
                        return;
                    }
                    Map<String, Object> map = new HashMap<>();
                    map.put("code", code);
                    map.put("msg", message);
                    channel.invokeMethod("onReceiveAuthPageEvent", map);
                    quitPage();
                } catch (Exception e) {
                    e.printStackTrace();
                    Toast.makeText(context, "登录失败，请尝试其他登录方式", Toast.LENGTH_SHORT).show();
                }
            }
        });
        Intent intent = new Intent(context, LicenseDialog.class);
        intent.putExtra("license_json", licenseJson);
        intent.putExtra("login_code", loginCode);
        intent.putExtra("login_message", loginMessage);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }


}
