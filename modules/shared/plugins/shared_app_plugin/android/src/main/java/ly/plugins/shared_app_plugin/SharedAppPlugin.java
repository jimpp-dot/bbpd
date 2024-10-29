package ly.plugins.shared_app_plugin;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.provider.MediaStore;
import android.provider.Settings;
import android.util.Log;
import android.os.Environment;

import androidx.annotation.MainThread;
import androidx.annotation.NonNull;
import androidx.core.content.ContextCompat;

import com.bytedance.hume.readapk.HumeSDK;
import ly.plugins.shared_app_plugin.badge.BadgeNumberManager;
import ly.plugins.shared_app_plugin.utils.ApkUtils;
import ly.plugins.shared_app_plugin.utils.EmulatorCheckCallback;
import ly.plugins.shared_app_plugin.utils.EmulatorCheckUtil;
import ly.plugins.shared_app_plugin.utils.FileUtils;
import ly.plugins.shared_app_plugin.utils.IOUtils;
import ly.plugins.shared_app_plugin.utils.NetworkUtil;
import ly.plugins.shared_app_plugin.utils.NotificationUtil;
import ly.plugins.shared_app_plugin.utils.NotificationUtils;
import ly.plugins.shared_app_plugin.utils.PackageUtils;
import ly.plugins.shared_app_plugin.utils.SecurityCheckUtil;
import com.im.safety.NdkTools;
import com.meituan.android.walle.WalleChannelReader;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Locale;
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
 * SharedAppPlugin
 */
public class SharedAppPlugin implements FlutterPlugin, ActivityAware, MethodCallHandler, PluginRegistry.RequestPermissionsResultListener {
//    private static final int REQUEST_READ_PHONE_STATE = 99998;
    private static final String TAG = SharedAppPlugin.class.getSimpleName();
    private Result mGetDeviceIdResult;
    private MethodChannel channel;
    private static ActivityPluginBinding activityPluginBinding;
    private Activity activity;
    private Context applicationContext;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(binding.getBinaryMessenger(), "ly.plugins.shared_app_plugin");
        channel.setMethodCallHandler(this);
        this.applicationContext = binding.getApplicationContext();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;
        this.applicationContext = null;
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activityPluginBinding = binding;
        activity = binding.getActivity();
        binding.addRequestPermissionsResultListener(this);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    }

    @Override
    public void onDetachedFromActivity() {
        activity = null;
        if (activityPluginBinding != null) {
            activityPluginBinding.removeRequestPermissionsResultListener(this);
            activityPluginBinding = null;
        }
    }

    @Override
    public void onMethodCall(MethodCall call, final Result result) {
        switch (call.method) {
            case "android_view_url":
                viewUrl(call.arguments().toString());
                result.success(null);
                break;
            case "getExternalFilesDir":
                String type = call.arguments().toString();
                File dirFile = FileUtils.getExternalFilesDir(activity, type);
                String dirPath = dirFile.getAbsolutePath();
                result.success(dirPath);
                break;
            case "installApk":
                String apkPath = call.arguments.toString();
                PackageUtils.installApk(activity, apkPath);
                result.success(null);
                break;
            case "getMacAddress":
                String mac = Settings.Secure.getString(activity.getContentResolver(), Settings.Secure.ANDROID_ID);
                if (mac == null) {
                    mac = "";
                }
                result.success(mac);
                break;
            case "getWalleChannel":
                String channel = WalleChannelReader.getChannel(activity.getApplicationContext());
                if (channel == null) {
                    channel = "";
                }
                result.success(channel);
                break;
            case "getFileMD5":
                String filePath = call.arguments.toString();
                try {
                    File file = new File(filePath);
                    if (file.exists()) {
                        String fileMD5 = FileUtils.getFileMD5(file);
                        result.success(fileMD5);
                    }
                } catch (Exception e) {
                    result.error("error", e.getMessage(), null);
                }
                break;
            case "getWifiIpAddress":
                String ip = NetworkUtil.getWifiIpAddress(activity.getApplicationContext());
                result.success(ip);
                break;
            case "getMetadata":
                String metaName = call.arguments.toString();
                String metadata = PackageUtils.getMetadata(activity.getApplicationContext(), metaName);
                result.success(metadata);
                break;
            case "getDeviceId":
                if (Build.VERSION.SDK_INT >= 29) { // for Android Q
                    result.success(Settings.System.getString(activity.getApplicationContext().getContentResolver(), Settings.Secure.ANDROID_ID));
                    return;
                }
//                int permissionCheck = ContextCompat.checkSelfPermission(activity, Manifest.permission.READ_PHONE_STATE);
//                if (permissionCheck != PackageManager.PERMISSION_GRANTED) {
                    // 权限申请统一在dart代码处理，有一些统一的弹窗业务逻辑
                    // 无电话权限，返回AndroidID
                    result.success(Settings.System.getString(activity.getApplicationContext().getContentResolver(), Settings.Secure.ANDROID_ID));
//                } else {
//                    String id = PackageUtils.getDeviceId(activity.getApplicationContext());
//                    result.success(id);
//                }
                break;
            case "getOaid":
                result.success(PackageUtils.getOaid());
                break;
            case "getBuildConfig":
                HashMap<String, Object> map = new HashMap<>();
                try {
                    Class<?> clazz = Class.forName("com.ly.bbpd.android.BuildConfig");
                    Field debug = clazz.getField("DEBUG");
                    map.put("DEBUG", debug.get(null));
                    Field applicationId = clazz.getField("APPLICATION_ID");
                    map.put("APPLICATION_ID", applicationId.get(null));
                    Field buildType = clazz.getField("BUILD_TYPE");
                    map.put("BUILD_TYPE", buildType.get(null));
                    Field flavor = clazz.getField("FLAVOR");
                    map.put("FLAVOR", flavor.get(null));
                    Field versionCode = clazz.getField("VERSION_CODE");
                    map.put("VERSION_CODE", versionCode.get(null));
                    Field versionName = clazz.getField("VERSION_NAME");
                    map.put("VERSION_NAME", versionName.get(null));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                result.success(map);
                break;
            case "backToHome":
                activity.moveTaskToBack(true);
                result.success(null);
                break;
            case "finishActivity":
                activity.finish();
                break;
            case "showOngoingNotification":
                String iconCacheFilePath = call.argument(NotificationJobService.ICON_CACHE_FILE_PATH);
                String ownerName = call.argument(NotificationJobService.OWNER_NAME);
                startJobService(iconCacheFilePath, ownerName);
                result.success(null);
                break;
            case "cancelOngoingNotification":
                stopJobService();
                result.success(null);
                break;

            case "createAndroidNotificationChannels":
                NotificationUtils.createNotificationChannels(activity);
                result.success(null);
                break;
            case "getPlatformVersion":
                result.success("Android " + Build.VERSION.RELEASE);
                break;
            case "exitApplication":
//        //杀死别的包，不能杀死自己
//        ActivityManager am = (ActivityManager) this.activity.getSystemService(Context.ACTIVITY_SERVICE);
//        am.killBackgroundProcesses(this.activity.getPackageName());

                //杀死自己的进程
                Process.killProcess(Process.myPid());
                break;
            case "getEmulatorInfo":
                EmulatorCheckCallback callback = new EmulatorCheckCallback() {
                    @Override
                    public void findEmulator(String emulatorInfo) {

                    }

                    @Override
                    public void findEmulator(String emulatorInfo, Map<String, Object> properties) {
                        result.success(properties);
                    }
                };
                EmulatorCheckUtil.getSingleInstance().readSysProperty(activity, callback);
                break;
            case "isRooted":
                boolean isRooted = SecurityCheckUtil.getSingleInstance().isRoot();
                result.success(isRooted);
                break;
            case "hFunc":
                String text = call.argument("text");
                String resultStr1 = NdkTools.hFunc(text);
                result.success(resultStr1);
                break;
            case "decrypt":
                String text_decrypt = call.argument("text");
                String resultDecrypt = NdkTools.decrypt(text_decrypt);
                result.success(resultDecrypt);
                break;
            case "setBadgeNumber":
                int number = call.argument("number");
                BadgeNumberManager.from(activity).setBadgeNumber(number);
                break;
            case "areNotificationEnabled":
                result.success(NotificationUtil.areNotificationsEnabled(activity));
                break;
            case "openNotificationSettings":
                NotificationUtil.toSetting(activity);
                result.success(null);
                break;
            case "getApplicationStartFrom":
                result.success(getStartFrom());
                break;
            case "is64bitCPU":
                boolean is64bit = ApkUtils.is64bitCPU();
                result.success(is64bit);
                break;
            case "getTTChannel":
                // 获取头条分包渠道
                String ttChannel = HumeSDK.getChannel(activity.getApplicationContext());
                Log.d("SharedAppPlugin", "default plugin ttChannel: " + ttChannel);
                result.success(ttChannel);
                break;
            case "getUserAgent":
                String userAgent = PackageUtils.getUserAgent(activity);
                result.success(userAgent);
                break;
            case "getLocale":
                Locale locale = Locale.getDefault();
                Map<String, String> re = new HashMap<>();
                if (locale == null) {
                    re.put("languageCode", "zh");
                    re.put("countryCode", "CN");
                } else {
                    re.put("languageCode", locale.getLanguage());
                    re.put("countryCode", locale.getCountry());
                }
                result.success(re);
                break;
            case "getSystemTotalMemorySize":
                double totalMemory = getSystemTotalMemorySize();
                result.success(totalMemory);
                break;
            case "copyFileToDownload":
                String srcFilePath = call.argument("srcFilePath");
                String destRelativePath = call.argument("destRelativePath");
                String displayName = call.argument("displayName");
                result.success(copyFileToDownload(srcFilePath, destRelativePath, displayName));
				break;
            default:
                result.notImplemented();
                break;
        }
    }

    // 复制沙盒私有文件到Download公共目录下
    // srcFilePath          是要复制的文件私有目录路径
    // destRelativePath     复制后文件相对于Download的相对路径
    // displayName          复制后文件要显示的文件名称带后缀（如xxx.txt）
    private boolean copyFileToDownload(String srcFilePath, String destRelativePath, String displayName) {
        Log.i("SharedAppPlugin", "copyFileToDownload => srcFilePath: " + srcFilePath + ", destRelativePath: " + destRelativePath + ", displayName: " + displayName);
        File srcFile = new File(srcFilePath);
        if (!srcFile.exists()) {
            Log.e("SharedAppPlugin", "copyFileToDownload => srcFile is not exists");
            return false;
        }
        if (displayName == null || displayName.isEmpty()) {
            displayName = srcFile.getName();
        }
        Log.i("SharedAppPlugin", "copyFileToDownload => displayName: " + displayName);
        String destFileParentPath = Environment.DIRECTORY_DOWNLOADS;
        if (destRelativePath != null && !destRelativePath.isEmpty()) {
            destFileParentPath += (File.separator + destRelativePath);
        }
        Log.i("SharedAppPlugin", "copyFileToDownload => destFileParentPath: " + destFileParentPath);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContentValues values = new ContentValues();
            values.put(MediaStore.Downloads.DISPLAY_NAME, displayName);
            values.put(MediaStore.Downloads.TITLE, displayName);
            values.put(MediaStore.Downloads.MIME_TYPE, "*/*");
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, destFileParentPath);
            ContentResolver contentResolver = activity.getContentResolver();
            Uri uri = contentResolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
            if (uri != null) {
                InputStream in = null;
                OutputStream out = null;
                try {
                    in = new FileInputStream(srcFile);
                    out = contentResolver.openOutputStream(uri);
                    if (out != null) {
                        return IOUtils.copyStream(in, out);
                    }
                } catch (IOException e) {
                } finally {
                    IOUtils.closeStream(in, out);
                }
            }
            return false;
        } else {
            destFileParentPath = Environment.getExternalStorageDirectory() + File.separator + destFileParentPath;
            File destFileParent = new File(destFileParentPath);
            if (!destFileParent.exists()) {
                destFileParent.mkdirs();
            }
            File destFile = new File(destFileParent, displayName);
            FileUtils.deleteOnExits(destFile);
            return FileUtils.copyFile(srcFile, destFile);
        }
    }

    /**
     * 获取安卓系统内存大小
     * 返回的单位是：G
     * 如果返回-1，则代表失败
     */
    private double getSystemTotalMemorySize() {
        if (activity != null) {
            try {
                //获得ActivityManager服务的对象
                ActivityManager mActivityManager = (ActivityManager)activity.getSystemService(Context.ACTIVITY_SERVICE);
                //获得MemoryInfo对象
                ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo() ;
                //获得系统可用内存，保存在MemoryInfo对象上
                mActivityManager.getMemoryInfo(memoryInfo) ;
                double memSize = memoryInfo.totalMem * 1.0 / (1000 * 1000 * 1000);
                Log.i("SharedAppPlugin", "getSystemTotalMemorySize  totalMem：" + memSize);
                return memSize;
            } catch (Exception e) {
                Log.e("SharedAppPlugin", "getSystemTotalMemorySize  Exception：" + e.toString());
                return -1;
            }
        } else {
            Log.e("SharedAppPlugin", "getSystemTotalMemorySize  activity is null!!!");
            return -1;
        }
    }

    private void startJobService(final String iconCacheFilePath, final String ownerName) {
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                if (applicationContext == null) {
                    return;
                }
                try{
                    Intent intent = new Intent(applicationContext, NotificationJobService.class);
                    intent.putExtra(NotificationJobService.ICON_CACHE_FILE_PATH, iconCacheFilePath);
                    intent.putExtra(NotificationJobService.OWNER_NAME, ownerName);
                    ContextCompat.startForegroundService(applicationContext, intent);
                } catch (Exception e) {
                    Log.e("SharedAppPlugin", "startForegroundService error: " + e.toString());
                }

            }
        });
    }

    private void stopJobService() {
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                if (applicationContext == null) {
                    return;
                }
                try {
                    Intent intent = new Intent(applicationContext, NotificationJobService.class);
                    applicationContext.stopService(intent);
                } catch (Exception e) {
                    Log.e("SharedAppPlugin", "stopService error: " + e.toString());
                }
            }
        });
    }

    private void viewUrl(String url) {
        final Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(url));
        activity.startActivity(intent);
    }

    private String getStartFrom() {
        try {
            Class activityClass = activity.getClass();
            Field refererField = activityClass.getDeclaredField("mStartFrom");
            refererField.setAccessible(true);
            String startFrom = (String) refererField.get(activity);
            return startFrom;
        } catch (Throwable e) {
            Log.e(TAG, e.toString());
            return "";
        }
    }


    @Override
    public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
//        switch (requestCode) {
//            case REQUEST_READ_PHONE_STATE:
//                if (mGetDeviceIdResult != null) {
//                    //不管有没有得到授权，都取一个结果返回，默认为空字符串
//                    String id = PackageUtils.getDeviceId(activity.getApplicationContext());
//                    mGetDeviceIdResult.success(id);
//                    mGetDeviceIdResult = null;
//                }
//                return true;
//            default:
//                break;
//        }

        return false;
    }


}
