package ly.plugins.flt_push;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import android.util.Log;

import ly.plugins.flt_push.huawei.HuaWeiPushManager;
import ly.plugins.flt_push.hihonor.HiHonorPushManager;
import ly.plugins.flt_push.oppo.OppoPushManager;
import ly.plugins.flt_push.utils.OSUtil;
import ly.plugins.flt_push.vivo.VivoPushManager;
import ly.plugins.flt_push.xiaomi.XiaoMiPushManager;
import com.hihonor.push.sdk.HonorPushClient;

public class FltPushManager {
    private static final String TAG = FltPushManager.class.getSimpleName();

    private static FltPushManager instance;
    private IPushCallback mCallback;

    public static final String PUSH_FROM_HUAWEI = "huawei";
    public static final String PUSH_FROM_HONOR = "honor";
    public static final String PUSH_FROM_XIAOMI = "xiaomi";
    public static final String PUSH_FROM_OPPO = "oppo";
    public static final String PUSH_FROM_VIVO = "vivo";

    private IPushManager mPushManager;
    private String mToken;
    private String mVendor;

    public static FltPushManager getInstance() {
        if (instance == null) {
            instance = new FltPushManager();
        }
        return instance;
    }

    /**
     * 初始化以及注册最外层的回调
     */
    public void init(Activity activity, IPushCallback callback) {
        mCallback = callback;
        if (HonorPushClient.getInstance().checkSupportHonorPush(activity.getApplicationContext())) { // 荣耀渠道
            mVendor = PUSH_FROM_HONOR;
            mPushManager = new HiHonorPushManager();
        } else if (OSUtil.isHwDevice()) {
            mVendor = PUSH_FROM_HUAWEI;
            mPushManager = new HuaWeiPushManager();
        } else if (OSUtil.isXmDevice() || OSUtil.isMiui()) {
            mVendor = PUSH_FROM_XIAOMI;
            mPushManager = new XiaoMiPushManager();
        } else if (OSUtil.isOppo() || OSUtil.isOppoDevice() || OSUtil.isOnePlusDevice() || OSUtil.isRealmeDevice()) {
            mVendor = PUSH_FROM_OPPO;
            mPushManager = new OppoPushManager();
        } else if (OSUtil.isVivo() || OSUtil.isVivoDevice() || OSUtil.isOriginOS()) {
            mVendor = PUSH_FROM_VIVO;
            mPushManager = new VivoPushManager();
        }

        start(activity);
    }

    public String getVendor() {
        return mVendor;
    }

    /**
     * 进行连接push通道的操作
     */
    void start(Activity activity) {
        if (mPushManager == null) {
            return;
        }
        mPushManager.start(activity);
    }

    /**
     * 获取到push token时的回调
     */
    public void onPushRegister(Context context, String token, String from) {
        Log.d(TAG, "onPushRegister : token = " + token + " , from = " + from);
        if (TextUtils.isEmpty(token)) {
            mToken = mPushManager.getToken(context);
        } else {
            mToken = token;
        }

        if (mCallback != null) {
            mCallback.onPushRegistered(mToken, from);
        }
    }

    public String getToken(Context context) {
        if (TextUtils.isEmpty(mToken)) {
            if (mPushManager != null) {
                mToken = mPushManager.getToken(context);
            }
        }
        return mToken;
    }

}