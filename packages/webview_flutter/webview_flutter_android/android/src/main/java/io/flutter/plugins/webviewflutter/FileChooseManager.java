package io.flutter.plugins.webviewflutter;

import android.app.Activity;
import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;

import androidx.annotation.Nullable;

import java.util.Arrays;

import io.flutter.Log;
import io.flutter.plugin.common.PluginRegistry;

public class FileChooseManager implements PluginRegistry.ActivityResultListener {

    private final static int FILECHOOSER_RESULTCODE = 42;

    private ValueCallback<Uri[]> sUploadMessages;

    public void openFileIntent(ValueCallback<Uri[]> filePathCallback) {
        try {
            sUploadMessages = filePathCallback;
            Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            WebViewFlutterPlugin.mActivity.startActivityForResult(intent, FILECHOOSER_RESULTCODE);
        } catch (Exception e) {
            e.printStackTrace();
            sUploadMessages = null;
        }
    }

    @Override
    public boolean onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        if (requestCode == FILECHOOSER_RESULTCODE) {
            Uri[] results = null;
            try {
                if (resultCode == Activity.RESULT_OK) {
                    if (data != null) {
                        String dataString = data.getDataString();
                        ClipData clipData = data.getClipData();
                        if (clipData != null) {
                            results = new Uri[clipData.getItemCount()];
                            for (int i = 0; i < clipData.getItemCount(); i++) {
                                ClipData.Item item = clipData.getItemAt(i);
                                results[i] = item.getUri();
                            }
                        }
                        if (dataString != null) {
                            results = new Uri[]{Uri.parse(dataString)};
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (sUploadMessages != null) sUploadMessages.onReceiveValue(results);
            sUploadMessages = null;
            return true;
        }
        return false;
    }
}
