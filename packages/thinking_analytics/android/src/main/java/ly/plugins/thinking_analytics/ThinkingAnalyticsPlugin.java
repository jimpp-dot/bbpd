package ly.plugins.thinking_analytics;

import android.content.Context;
import android.text.TextUtils;

import androidx.annotation.NonNull;

import android.content.SharedPreferences;

import org.json.JSONObject;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import cn.thinkingdata.android.TDConfig;
import cn.thinkingdata.android.ThinkingAnalyticsSDK;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.common.StandardMethodCodec;

/**
 * ThinkingAnalyticsPlugin
 */
public class ThinkingAnalyticsPlugin implements FlutterPlugin, MethodCallHandler {
    private Context applicationContext;
    private MethodChannel methodChannel;
    private ThinkingAnalyticsSDK bizSDK;
    private ThinkingAnalyticsSDK monitorSDK;
    private ThinkingAnalyticsSDK taSDK;


    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.
    public static void registerWith(Registrar registrar) {
        final ThinkingAnalyticsPlugin instance = new ThinkingAnalyticsPlugin();
        instance.onAttachedToEngine(registrar.context(), registrar.messenger());
    }

    private void onAttachedToEngine(Context applicationContext, BinaryMessenger messenger) {
        this.applicationContext = applicationContext;
        methodChannel = new MethodChannel(messenger, "ly.plugins.thinking_analytics", StandardMethodCodec.INSTANCE, messenger.makeBackgroundTaskQueue());
        methodChannel.setMethodCallHandler(this);
    }

    public static JSONObject thinkingSDKInitAndTrack(Context var0, String appId, String serverUrl, String eventName) {
        ThinkingAnalyticsSDK thinkingAnalyticsSDK = ThinkingAnalyticsSDK.sharedInstance(var0, appId, serverUrl);
        thinkingAnalyticsSDK.track(eventName);
        return thinkingAnalyticsSDK.getSuperProperties();
    }

    public static JSONObject thinkingSDKInitAndTrack(Context var0, String appId, String serverUrl) {
        ThinkingAnalyticsSDK thinkingAnalyticsSDK = ThinkingAnalyticsSDK.sharedInstance(var0, appId, serverUrl);
        return thinkingAnalyticsSDK.getSuperProperties();
    }

    public static JSONObject thinkingSDKInitAndTrack(Context var0, String appId, String serverUrl, String eventName, Map properties) {
        ThinkingAnalyticsSDK thinkingAnalyticsSDK = ThinkingAnalyticsSDK.sharedInstance(var0, appId, serverUrl);
        thinkingAnalyticsSDK.track(eventName, new JSONObject(properties));
        return thinkingAnalyticsSDK.getSuperProperties();
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        onAttachedToEngine(binding.getApplicationContext(), binding.getBinaryMessenger());
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        applicationContext = null;
        methodChannel.setMethodCallHandler(null);
        methodChannel = null;
    }

    public final static int TYPE_BIZ = 0;
    public final static int TYPE_MONITOR = 1;
    private final static String TYPE_KEY = "trackerType";

    private void chooseSdk(int type) {
        if (type == TYPE_MONITOR) { //
            taSDK = monitorSDK;
        } else {
            taSDK = bizSDK;
        }
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "version":
                result.success(TDConfig.VERSION);
                break;
            case "init": {
                // 初始化
                String appId = call.argument("appId");
                String serverUrl = call.argument("serverUrl");
                String monitorAppId = call.argument("monitorAppId");
                String monitorServerUrl = call.argument("monitorServerUrl");
                int debug = call.argument("debug");
                if (debug == 1) {
                    ThinkingAnalyticsSDK.enableTrackLog(true);
                }
                if (appId == null || serverUrl == null) {
                    result.success(false);
                } else {
                    SharedPreferences sharedPref = applicationContext.getSharedPreferences("tracker", Context.MODE_PRIVATE);
                    SharedPreferences.Editor editor = sharedPref.edit();
                    editor.putString(TrackerReceiver.TRACKER_APPID_KEY, appId);
                    editor.putString(TrackerReceiver.TRACKER_SER_URL_KEY, serverUrl);
                    editor.apply();

                    bizSDK = ThinkingAnalyticsSDK.sharedInstance(applicationContext, appId, serverUrl);
                    if (monitorAppId != null && !monitorAppId.isEmpty()) {
                        monitorSDK = ThinkingAnalyticsSDK.sharedInstance(applicationContext, monitorAppId, monitorServerUrl);
                    }
                    chooseSdk(TYPE_BIZ);
                    result.success(true);
                }
                break;
            }
            case "initMonitor": {
                // 初始化
                String monitorAppId = call.argument("monitorAppId");
                String monitorServerUrl = call.argument("monitorServerUrl");
                int debug = call.argument("debug");
                if (debug == 1) {
                    ThinkingAnalyticsSDK.enableTrackLog(true);
                }
                if (monitorAppId == null || monitorServerUrl == null) {
                    result.success(false);
                } else {
                    monitorSDK = ThinkingAnalyticsSDK.sharedInstance(applicationContext, monitorAppId, monitorServerUrl);
                    result.success(true);
                }
                break;
            }
            case "track":
                // 上报一条事件数据
                if (!(call.arguments instanceof Map) || !call.hasArgument("eventName")) {
                    result.success(false);
                } else {
                    String eventName = call.argument("eventName");
                    Map<String, Object> properties = call.argument("properties");
                    String time = call.argument("time");
                    String tZone = call.argument("timeZone");
                    int type = call.argument(TYPE_KEY);
                    chooseSdk(type);

                    JSONObject properObj = null;
                    Date date = null;
                    TimeZone timeZone = null;
                    if (properties != null) {
                        properObj = new JSONObject(properties);
                    }
                    if (!TextUtils.isEmpty(time)) {
                        try {
                            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
                            date = format.parse(time);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                    }
                    if (!TextUtils.isEmpty(tZone)) {
                        timeZone = TimeZone.getTimeZone(tZone);
                    }

                    // 数数sdk规定timeZone为空，就不会上报时区
                    if (date == null) {
                        taSDK.track(eventName, properObj);
                    } else {
                        if (timeZone == null) {
                            timeZone = TimeZone.getDefault();
                        }
                        taSDK.track(eventName, properObj, date, timeZone);
                    }

                    result.success(true);
                }
                break;
            case "timeEvent":
                // 开始记录某个事件的时长，直到用户上传该事件为止
                if (!(call.arguments instanceof Map) || !call.hasArgument("name")) {
                    result.success(false);
                } else {
                    String name = call.argument("name");
                    int type = call.argument(TYPE_KEY);
                    chooseSdk(type);
                    taSDK.timeEvent(name);
                    result.success(true);
                }
                break;
            case "setSuperProperties":
                // 设置公共事件属性
                if (call.arguments instanceof Map) {
                    Map data = (Map) call.arguments;
                    Map<String, Object> properties = call.argument("properties");
                    int type = (int) data.get(TYPE_KEY);
                    chooseSdk(type);
                    taSDK.setSuperProperties(new JSONObject(properties));
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            case "getSuperProperties":
                // 返回所有已设置的事件公共属性
            {
                int type = (int) ((Map) call.arguments).get(TYPE_KEY);
                chooseSdk(type);
                JSONObject json = taSDK.getSuperProperties();
                Map<String, Object> map = new HashMap<>();
                Iterator<String> it = json.keys();
                while (it.hasNext()) {
                    String key = it.next();
                    map.put(key, json.opt(key));
                }
                result.success(map);
                break;
            }
            case "unsetSuperProperty":
                // 删除已设置的事件公共属性
                if (call.arguments instanceof Map) {
                    Map data = (Map) call.arguments;
                    String propertyName = (String) data.get("propertyName");
                    int type = (int) data.get(TYPE_KEY);
                    chooseSdk(type);
                    taSDK.unsetSuperProperty(propertyName);
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            case "clearSuperProperties":
                // 清空所有已设置的事件公共属性
            {
                int type = (int) ((Map) call.arguments).get(TYPE_KEY);
                chooseSdk(type);
                taSDK.clearSuperProperties();
                result.success(null);
                break;
            }
            case "setDynamicSuperPropertiesTracker":
                // 设置动态公共事件属性，即公共属性可以上报时获取当时的值
                if (call.arguments instanceof Map) {
                    Map data = (Map) call.arguments;
                    Map<String, Object> properties = call.argument("properties");
                    int type = (int) data.get(TYPE_KEY);
                    chooseSdk(type);
                    final JSONObject json = new JSONObject(properties);

                    taSDK.setDynamicSuperPropertiesTracker(new ThinkingAnalyticsSDK.DynamicSuperPropertiesTracker() {
                        @Override
                        public JSONObject getDynamicSuperProperties() {
                            return json;
                        }
                    });
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            case "identify":
                // 设置访客ID（可选）
                if (call.arguments instanceof String) {
                    if (bizSDK != null) bizSDK.identify((String) call.arguments);
                    if (monitorSDK != null) monitorSDK.identify((String) call.arguments);
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            case "getDistinctId":
                // 获取访客ID
                result.success(taSDK.getDistinctId());
                break;
            case "login":
                // 设置账号ID
                if (call.arguments instanceof String) {
                    String uid = (String) call.arguments;

                    if (bizSDK != null) bizSDK.login((String) call.arguments);
                    if (monitorSDK != null) monitorSDK.login((String) call.arguments);

                    SharedPreferences sharedPref = applicationContext.getSharedPreferences("tracker", Context.MODE_PRIVATE);
                    SharedPreferences.Editor editor = sharedPref.edit();
                    editor.putString(TrackerReceiver.TRACKER_UID_KEY, uid);
                    editor.apply();

                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            case "logout":
                // 清除账号ID
                if (bizSDK != null) bizSDK.logout();
                if (monitorSDK != null) monitorSDK.logout();
                SharedPreferences sharedPref = applicationContext.getSharedPreferences("tracker", Context.MODE_PRIVATE);
                SharedPreferences.Editor editor = sharedPref.edit();
                editor.remove(TrackerReceiver.TRACKER_UID_KEY);
                editor.apply();
                result.success(null);
                break;
            case "user_set":
                // 设置一般的用户属性
                if (call.arguments instanceof Map) {
                    if (bizSDK != null) bizSDK.user_set(new JSONObject((Map) call.arguments));
                    if (monitorSDK != null) monitorSDK.user_set(new JSONObject((Map) call.arguments));
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            case "user_setOnce":
                // 用户属性只要设置一次，当该属性之前已经有值的时候，将会忽略这条信息
                if (call.arguments instanceof Map) {
                    if (bizSDK != null) bizSDK.user_setOnce(new JSONObject((Map) call.arguments));
                    if (monitorSDK != null) monitorSDK.user_setOnce(new JSONObject((Map) call.arguments));
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            case "user_add":
                // 上传数值型的属性
                if (call.arguments instanceof Map) {
                    if (bizSDK != null) bizSDK.user_add(new JSONObject((Map) call.arguments));
                    if (monitorSDK != null) monitorSDK.user_add(new JSONObject((Map) call.arguments));
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            case "user_unset":
                // 清空用户的某个用户属性值
                if (call.arguments instanceof String) {
                    if (bizSDK != null)bizSDK.user_unset((String) call.arguments);
                    if (monitorSDK != null)monitorSDK.user_unset((String) call.arguments);
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
//            case "setNetworkType":
//                // 设置在哪些网络环境下可以上报数据
//                if (call.arguments instanceof Map) {
//                    Map data = (Map) call.arguments;
//                    int type = (int) data.remove(TYPE_KEY);
//                    chooseSdk(type);
//
//                    bizSDK.setNetworkType((Integer) data.get("networkType"));
//                    result.success(true);
//                } else {
//                    result.success(false);
//                }
//                break;
            case "enableTrackLog":
                // 是否打印Log，默认关闭
                if (call.arguments instanceof Boolean) {
                    ThinkingAnalyticsSDK.enableTrackLog((Boolean) call.arguments);
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            case "enableTracking":
                // 是否暂停上报
                if (call.arguments instanceof Map) {
                    Map data = (Map) call.arguments;
                    int type = (int) data.get(TYPE_KEY);
                    Boolean flag = call.argument("enable");
                    chooseSdk(type);
                    taSDK.enableTracking(flag);
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            case "enableAutoTrack":
                // 打开自动采集
                List<ThinkingAnalyticsSDK.AutoTrackEventType> eventTypeList = new ArrayList<>();
                eventTypeList.add(ThinkingAnalyticsSDK.AutoTrackEventType.APP_INSTALL);
                eventTypeList.add(ThinkingAnalyticsSDK.AutoTrackEventType.APP_START);
                eventTypeList.add(ThinkingAnalyticsSDK.AutoTrackEventType.APP_END);
                bizSDK.enableAutoTrack(eventTypeList);
                result.success(null);
                break;
            case "flush":
                // 立即上传数据给数数
                if (call.arguments instanceof Integer) {
                    int type = (int) call.arguments;
                    chooseSdk(type);
                    taSDK.flush();
                    result.success(true);
                } else {
                    result.success(false);
                }
                break;
            default:
                result.notImplemented();
                break;
        }
    }
}
