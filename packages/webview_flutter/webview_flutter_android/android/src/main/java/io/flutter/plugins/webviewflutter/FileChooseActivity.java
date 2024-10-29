package io.flutter.plugins.webviewflutter;

import android.app.Activity;
import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.WindowManager;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;

import androidx.annotation.Nullable;

import java.io.File;

public class FileChooseActivity extends Activity {
  private static ValueCallback<Uri[]> sUploadMessages;
  private static WebChromeClient.FileChooserParams sFileChooserParams;
  private Object Utils;
  private File outputFile;
  private Uri mOutputFileUri;
  private Uri image;

  public static void setFilePathCallback(ValueCallback<Uri[]> filePathCallback){
    sUploadMessages = filePathCallback;
  }

  public static void setFileChooserParams(WebChromeClient.FileChooserParams fileChooserParams){
    sFileChooserParams = fileChooserParams;
  }

  @Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);

    openFileIntent();
  }

  private void openFileIntent() {
    Intent intent;
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.KITKAT) {
      intent = new Intent(Intent.ACTION_GET_CONTENT);
    } else {
      intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
      intent.addCategory(Intent.CATEGORY_OPENABLE);
    }
    intent.setType("*/*");
    try {
      startActivityForResult(intent, 42);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  @Override
  protected void onActivityResult(int requestCode, int resultCode, Intent intent) {
    super.onActivityResult(requestCode, resultCode, intent);
    Uri[] results = null;
    try {
      if (resultCode != RESULT_OK) {
        results = null;
      } else {
        if (intent != null) {
          String dataString = intent.getDataString();
          ClipData clipData = intent.getClipData();
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
        } else {
          results = new Uri[]{mOutputFileUri};
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    if (sUploadMessages != null) sUploadMessages.onReceiveValue(results);
    sUploadMessages = null;
    finish();
  }
}
