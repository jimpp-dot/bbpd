package ly.plugins.shared_app_plugin.utils;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import android.webkit.WebSettings;

import java.io.File;

import androidx.core.content.FileProvider;

import static android.content.Context.TELEPHONY_SERVICE;

public final class PackageUtils {
    private static final String TAG = PackageUtils.class.getSimpleName();

    public static int getVersionCode(final Context context) {
        final PackageManager manager = context.getPackageManager();
        int versionCode = 0;

        try {
            final PackageInfo info = manager.getPackageInfo(context.getPackageName(), 0);
            versionCode = info.versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }

        return versionCode;
    }

    public static String getVersionName(final Context context) {
        final PackageManager manager = context.getPackageManager();
        String versionName = "0.0.0.0";

        try {
            final PackageInfo info = manager.getPackageInfo(context.getPackageName(), 0);
            versionName = info.versionName;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }

        return versionName;
    }

    public static void installApk(final Context context, final String filePath) {
        installApk(context, new File(filePath));
    }

    public static void installApk(final Context context, final File apkFile) {
        Intent intent = new Intent(Intent.ACTION_VIEW);
        Uri data;
        // 判断版本大于等于7.0
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            // authority即是在清单文件中配置的authorities
            String authority = context.getPackageName() + ".fileprovider";
            data = FileProvider.getUriForFile(context, authority, apkFile);
            // 给目标应用一个临时授权
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        } else {
            data = Uri.fromFile(apkFile);
        }
        intent.setDataAndType(data, "application/vnd.android.package-archive");
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(intent);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 从apk文件中读取PackageInfo
     *
     * @return
     */
    public static PackageInfo getPackageInfoFromApkFile(final Context context, final File apkFile) {
        if (apkFile.exists()) {
            return context.getPackageManager().getPackageArchiveInfo(
                    apkFile.getAbsolutePath(),
                    PackageManager.GET_CONFIGURATIONS);
        } else {
            return null;
        }
    }

    public static String getMetadata(Context context, String name) {
        try {
            ApplicationInfo appInfo = context.getPackageManager()
                    .getApplicationInfo(context.getPackageName(),
                            PackageManager.GET_META_DATA);
            if (appInfo.metaData != null) {
                String value = String.valueOf(appInfo.metaData.get(name));
                Log.i(TAG, "in getMetadata name = " + name + ", value = " + value);
                return value;
            }
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }

    private static String PHONE_DEVICE_ID = "";

    public static String getDeviceId(Context context) {
        if (Build.VERSION.SDK_INT >= 29) { // for Android Q
            return Settings.System.getString(context.getContentResolver(), Settings.Secure.ANDROID_ID);
        }

        if (!TextUtils.isEmpty(PHONE_DEVICE_ID)) {
            return PHONE_DEVICE_ID;
        }

        TelephonyManager TelephonyMgr = (TelephonyManager) context.getSystemService(TELEPHONY_SERVICE);
        try {
            PHONE_DEVICE_ID = TelephonyMgr.getDeviceId();
        } catch (SecurityException e) {
            e.printStackTrace();
        }
        return PHONE_DEVICE_ID;
    }

    public static String getOaid() {
        try {
            if (MiitHelper.isSupported()) {
                return MiitHelper.getOaid();
            }
        } catch (Throwable t) {
            t.printStackTrace();
        }
        return null;
    }

    public static boolean goToAppMarket(Context context, String packageName) {
        try {
            String mAddress = "market://details?id=" + packageName;
            Intent marketIntent = new Intent("android.intent.action.VIEW");
            marketIntent.setData(Uri.parse(mAddress));
            context.startActivity(marketIntent);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static String getUserAgent(Context context) {

        String userAgent = "";

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            try {
                userAgent = WebSettings.getDefaultUserAgent(context);
            } catch (Exception e) { // 部分手机Crash.
                userAgent = System.getProperty("http.agent");
            }
        } else {
            userAgent = System.getProperty("http.agent");
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0, length = userAgent.length(); i < length; i++) {
            char c = userAgent.charAt(i);
            // 处理中文情况 okhttp3.Headers$Builder.checkNameAndValue
            if (c <= '\u001f' || c >= '\u007f') {
                sb.append(String.format("\\u%04x", (int) c));
            } else {
                sb.append(c);
            }
        }
        userAgent = sb.toString();

        return userAgent;
    }
}
