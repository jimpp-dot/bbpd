package io.flutter.plugins.urllauncher;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Browser;
import android.util.Log;

import androidx.annotation.Nullable;

import java.util.List;

/**
 * Launches components for URLs.
 */
class UrlLauncher {
    private final Context applicationContext;
    @Nullable
    private Activity activity;

    /**
     * Uses the given {@code applicationContext} for launching intents.
     *
     * <p>It may be null initially, but should be set before calling {@link #launch}.
     */
    UrlLauncher(Context applicationContext, @Nullable Activity activity) {
        this.applicationContext = applicationContext;
        this.activity = activity;
    }

    void setActivity(@Nullable Activity activity) {
        this.activity = activity;
    }

    /**
     * Returns whether the given {@code url} resolves into an existing component.
     */
    boolean canLaunch(String url) {
        Intent launchIntent = new Intent(Intent.ACTION_VIEW);
        launchIntent.setData(Uri.parse(url));
        if (needAddSamsungMarket(url)) {
            launchIntent.setClassName("com.sec.android.app.samsungapps", "com.sec.android.app.samsungapps.Main");
        }
        ComponentName componentName =
                launchIntent.resolveActivity(applicationContext.getPackageManager());

        return componentName != null
                && !"{com.android.fallback/com.android.fallback.Fallback}"
                .equals(componentName.toShortString());
    }

    /**
     * Attempts to launch the given {@code url}.
     *
     * @param headersBundle    forwarded to the intent as {@code Browser.EXTRA_HEADERS}.
     * @param useWebView       when true, the URL is launched inside of {@link WebViewActivity}.
     * @param enableJavaScript Only used if {@param useWebView} is true. Enables JS in the WebView.
     * @param enableDomStorage Only used if {@param useWebView} is true. Enables DOM storage in the
     * @return {@link LaunchStatus#NO_ACTIVITY} if there's no available {@code applicationContext}.
     * {@link LaunchStatus#OK} otherwise.
     */
    LaunchStatus launch(
            String url,
            Bundle headersBundle,
            boolean useWebView,
            boolean enableJavaScript,
            boolean enableDomStorage) {
        if (activity == null) {
            return LaunchStatus.NO_ACTIVITY;
        }

        Intent launchIntent;
        if (useWebView) {
            launchIntent =
                    WebViewActivity.createIntent(
                            activity, url, enableJavaScript, enableDomStorage, headersBundle);
        } else {
            launchIntent =
                    new Intent(Intent.ACTION_VIEW)
                            .setData(Uri.parse(url))
                            .putExtra(Browser.EXTRA_HEADERS, headersBundle);

            if (needAddSamsungMarket(url)) {
                launchIntent.setClassName("com.sec.android.app.samsungapps", "com.sec.android.app.samsungapps.Main");
            }
        }

        activity.startActivity(launchIntent);
        return LaunchStatus.OK;
    }

    /**
     * Closes any activities started with {@link #launch} {@code useWebView=true}.
     */
    void closeWebView() {
        applicationContext.sendBroadcast(new Intent(WebViewActivity.ACTION_CLOSE));
    }

    /**
     * Result of a {@link #launch} call.
     */
    enum LaunchStatus {
        /**
         * The intent was well formed.
         */
        OK,
        /**
         * No activity was found to launch.
         */
        NO_ACTIVITY,
    }

    boolean needAddSamsungMarket(String url) {

        if (url == null || !url.contains("market:")) {
            Log.d("url_launcher", "needAddSamsungMarket, not market");
            return false;
        }

        boolean hasSamsungMarket = isApplicationAvailable(applicationContext, "com.sec.android.app.samsungapps");
        Log.d("url_launcher", "needAddSamsungMarket, hasSamsungMarket: " + hasSamsungMarket);

        return hasSamsungMarket;
    }

    /**
     * 判断手机是否安装某个应用
     *
     * @param context
     * @param appPackageName 应用包名
     * @return true：安装，false：未安装
     */
    public static boolean isApplicationAvailable(Context context, String appPackageName) {
        // 整改：不能获取应用安装列表
//        try {
//            PackageManager packageManager = context.getPackageManager();// 获取packagemanager
//            List<PackageInfo> pinfo = packageManager.getInstalledPackages(0);// 获取所有已安装程序的包信息
//            if (pinfo != null) {
//                for (int i = 0; i < pinfo.size(); i++) {
//                    String pn = pinfo.get(i).packageName;
//                    if (appPackageName.equals(pn)) {
//                        return true;
//                    }
//                }
//            }
//        } catch (Exception e) {
//            Log.d("url_launcher", "isApplicationAvilible error: " + e);
//        }

        return false;
    }

    boolean canLaunchAndroid(String pkg) {
        try {
            PackageInfo info = applicationContext.getPackageManager().getPackageInfo(pkg, 0);
            return info != null;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    LaunchStatus launchAndroid(String pkg) {
        if (activity == null) {
            return LaunchStatus.NO_ACTIVITY;
        }

        try {
            Intent launchIntent = applicationContext.getPackageManager().getLaunchIntentForPackage(pkg);
            activity.startActivity(launchIntent);
        } catch (Exception e) {
            return LaunchStatus.NO_ACTIVITY;
        }

        return LaunchStatus.OK;
    }
}
