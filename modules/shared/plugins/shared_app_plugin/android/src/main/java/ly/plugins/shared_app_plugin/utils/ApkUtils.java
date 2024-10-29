package ly.plugins.shared_app_plugin.utils;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;

import java.io.File;
import java.io.IOException;

import androidx.core.content.FileProvider;

public class ApkUtils {

    public static void installAPk(Context context, File apkFile) {
        Intent installAPKIntent = getApkInStallIntent(context, apkFile);
        try {
            context.startActivity(installAPKIntent);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static Intent getApkInStallIntent(Context context, File apkFile) {
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

        if (Build.VERSION.SDK_INT > Build.VERSION_CODES.M) {
            Uri uri = FileProvider.getUriForFile(context, context.getPackageName() + ".provider", apkFile);
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            intent.setDataAndType(uri, "application/vnd.android.package-archive");
        } else {
            Uri uri = getApkUri(apkFile);
            intent.setDataAndType(uri, "application/vnd.android.package-archive");
        }
        return intent;
    }


    private static Uri getApkUri(File apkFile) {
        //如果没有设置 SDCard 写权限，或者没有 SDCard,apk 文件保存在内存中，需要授予权限才能安装
        try {
            String[] command = {"chmod", "777", apkFile.toString()};
            ProcessBuilder builder = new ProcessBuilder(command);
            builder.start();
        } catch (IOException ignored) {
        }
        Uri uri = Uri.fromFile(apkFile);
        return uri;
    }

    public static boolean is64bitCPU() {
        String CPU_ABI = null;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            String[] CPU_ABIS = Build.SUPPORTED_ABIS;
            if (CPU_ABIS.length > 0) {
                CPU_ABI = CPU_ABIS[0];
            }
        } else {
            CPU_ABI = Build.CPU_ABI;
        }

        if (CPU_ABI != null && CPU_ABI.contains("arm64")) {
            return true;
        }

        return false;
    }
}
