package ly.plugins.flt_push.utils;

import android.os.Build;
import android.text.TextUtils;
import android.util.Log;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class OSUtil {

    private static final String TAG = "OSUtil";

    public static final String ROM_EMUI = "EMUI";
    public static final String ROM_MIUI = "MIUI";
    public static final String ROM_OPPO = "OPPO";
    public static final String ROM_VIVO = "VIVO";

    private static final String KEY_VERSION_MIUI = "ro.miui.ui.version.name";
    private static final String KEY_VERSION_EMUI = "ro.build.version.emui";
    private static final String KEY_VERSION_OPPO = "ro.build.version.opporom";
    private static final String KEY_VERSION_VIVO = "ro.vivo.os.version";

    private static String sysName;

    // 华为设备检测
    public static boolean isHwDevice() {
        final String MANUFACTURER = Build.MANUFACTURER;
        if (MANUFACTURER != null) {
            return MANUFACTURER.contains("HUAWEI")
                    || MANUFACTURER.contains("huawei");
        }
        return false;
    }

    // 小米设备检测
    public static boolean isXmDevice() {
        final String MANUFACTURER = Build.MANUFACTURER;
        if (MANUFACTURER != null) {
            if (MANUFACTURER.contains("Xiaomi")) {
                return true;
            }
            return MANUFACTURER.equalsIgnoreCase("Xiaomi");
        }
        return false;
    }

    // 小米设备检测
    public static boolean isMiui() {
        return !TextUtils.isEmpty(getSystemProperty("ro.miui.ui.version.name"));
    }

    // vivo
    public static boolean isVivo() {
        return check(ROM_VIVO);
    }

    // vivo设备检测
    public static boolean isVivoDevice() {
        return Build.MANUFACTURER.equalsIgnoreCase("vivo");
    }

    public static boolean isOriginOS() {
        return !TextUtils.isEmpty(getSystemProperty("ro.vivo.os.version"));
    }

    // oppo
    public static boolean isOppo() {
        return check(ROM_OPPO);
    }

    // OPPO设备检测
    public static boolean isOppoDevice() {
        return Build.MANUFACTURER.equalsIgnoreCase("OPPO");
    }

    // OnePlus设备检测
    public static boolean isOnePlusDevice() {
        return Build.MANUFACTURER.equalsIgnoreCase("OnePlus");
    }

    // Realme设备检测
    public static boolean isRealmeDevice() {
        return Build.MANUFACTURER.equalsIgnoreCase("Realme");
    }

    public static boolean check(String rom) {
        if (sysName != null) {
            return TextUtils.equals(sysName, rom);
        }

        if (!TextUtils.isEmpty(getSystemProperty(KEY_VERSION_MIUI))) {
            sysName = ROM_MIUI;
        } else if (!TextUtils.isEmpty(getSystemProperty(KEY_VERSION_EMUI))) {
            sysName = ROM_EMUI;
        } else if (!TextUtils.isEmpty(getSystemProperty(KEY_VERSION_OPPO))) {
            sysName = ROM_OPPO;
        } else if (!TextUtils.isEmpty(getSystemProperty(KEY_VERSION_VIVO))) {
            sysName = ROM_VIVO;
        }
        Log.d(TAG, "=======>sysName=" + sysName);
        return TextUtils.equals(sysName, rom);
    }

    private static String getSystemProperty(String propName) {
        String line;
        BufferedReader input = null;
        try {
            Process p = Runtime.getRuntime().exec("getprop " + propName);
            input = new BufferedReader(new InputStreamReader(p.getInputStream()), 1024);
            line = input.readLine();
            input.close();
        } catch (IOException ex) {
            Log.e(TAG, "Unable to read prop " + propName, ex);
            return null;
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    Log.i(TAG, "Exception while closing InputStream", e);
                }
            }
        }
        return line;
    }

}