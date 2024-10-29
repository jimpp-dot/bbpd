// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.webviewflutter;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.webkit.DownloadListener;

import androidx.annotation.Nullable;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.DownloadListenerFlutterApi;

/**
 * Flutter Api implementation for {@link DownloadListener}.
 *
 * <p>Passes arguments of callbacks methods from a {@link DownloadListener} to Dart.
 */
public class DownloadListenerFlutterApiImpl extends DownloadListenerFlutterApi {
  private final InstanceManager instanceManager;
  @Nullable private Context context;

  /**
   * Creates a Flutter api that sends messages to Dart.
   *
   * @param binaryMessenger handles sending messages to Dart
   * @param instanceManager maintains instances stored to communicate with Dart objects
   */
  public DownloadListenerFlutterApiImpl(
      BinaryMessenger binaryMessenger, InstanceManager instanceManager, @Nullable Context context) {
    super(binaryMessenger);
    this.instanceManager = instanceManager;
    this.context = context;
  }

  /** Passes arguments from {@link DownloadListener#onDownloadStart} to Dart. */
  public void onDownloadStart(
      DownloadListener downloadListener,
      String url,
      String userAgent,
      String contentDisposition,
      String mimetype,
      long contentLength,
      Reply<Void> callback) {
//    onDownloadStart(
//        instanceManager.getInstanceId(downloadListener),
//        url,
//        userAgent,
//        contentDisposition,
//        mimetype,
//        contentLength,
//        callback);
    downloadByBrowser(context, url);
  }

  /**
   * Communicates to Dart that the reference to a {@link DownloadListener} was removed.
   *
   * @param downloadListener the instance whose reference will be removed
   * @param callback reply callback with return value from Dart
   */
  public void dispose(DownloadListener downloadListener, Reply<Void> callback) {
    final Long instanceId = instanceManager.removeInstance(downloadListener);
    if (instanceId != null) {
      dispose(instanceId, callback);
    } else {
      callback.reply(null);
    }
  }

  private void downloadByBrowser(Context context, String url) {
    Intent intent = new Intent(Intent.ACTION_VIEW);
    intent.addCategory(Intent.CATEGORY_BROWSABLE);
    intent.setData(Uri.parse(url));
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    context.getApplicationContext().startActivity(intent);
  }
}
