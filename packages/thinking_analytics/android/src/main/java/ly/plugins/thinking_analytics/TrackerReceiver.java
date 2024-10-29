package ly.plugins.thinking_analytics;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;

import org.json.JSONObject;

import java.io.Serializable;
import java.util.HashMap;

import android.content.SharedPreferences;

import java.util.Objects;

import cn.thinkingdata.android.ThinkingAnalyticsSDK;

/**
 * 用作接收广播打点
 * 目前用于离线push，点位上报
 */
public class TrackerReceiver extends BroadcastReceiver {

    public static final String ACTION = "im_base.tracker.intent.RECEIVE_EVENT";
    public static final String TAG = "TrackerReceiver";
    public static final String TRACKER_APPID_KEY = "tracker.appid";
    public static final String TRACKER_UID_KEY = "tracker.uid";
    public static final String TRACKER_SER_URL_KEY = "tracker.server_url";

    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        Log.d(TAG, "TrackerReceiver action = " + (action == null ? "" : action));
        if (Objects.equals(action, ACTION)) {
            try {
                String appId = getValueByKey(context, TRACKER_APPID_KEY);
                String serverUrl = getValueByKey(context, TRACKER_SER_URL_KEY);
                String uid = getValueByKey(context, TRACKER_UID_KEY);

                if (TextUtils.isEmpty(appId) || TextUtils.isEmpty(serverUrl)) {
                    appId = getResStr(context, "ta_app_id");
                    serverUrl = getResStr(context, "ta_server_url");
                }

                if (TextUtils.isEmpty(appId) || TextUtils.isEmpty(serverUrl)) {
                    return;
                }
                String eventName = intent.getStringExtra("eventName");
                Serializable prop = intent.getSerializableExtra("properties");
                HashMap<String, Object> proMap = null;
                if (prop instanceof HashMap) {
                    proMap = (HashMap<String, Object>) prop;
                }
                if (!TextUtils.isEmpty(eventName)) {
                    Log.d(TAG, "eventName = " + eventName);
                    ThinkingAnalyticsSDK taSDK = ThinkingAnalyticsSDK.sharedInstance(context, appId, serverUrl);
                    if (proMap != null && !proMap.isEmpty()) {
                        Log.d(TAG, "proMap = " + proMap.toString());
                        taSDK.track(eventName, new JSONObject(proMap));
                    } else {
                        taSDK.track(eventName);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            Log.e(TAG, "the intent action is not match, return directly.");
        }
    }

    private String getValueByKey(Context context, String name) {
        SharedPreferences sharedPref = context.getSharedPreferences("tracker", Context.MODE_PRIVATE);
        return sharedPref.getString(name, "");
    }

    private String getResStr(Context context, String name) {
        int identifier =
                context.getResources()
                        .getIdentifier(name, "string", context.getPackageName());
        if (identifier != 0) {
            return context.getString(identifier);
        } else return "";
    }
}
