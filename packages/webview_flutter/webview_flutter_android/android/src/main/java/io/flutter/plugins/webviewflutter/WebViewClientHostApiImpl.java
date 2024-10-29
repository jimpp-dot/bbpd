// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.webviewflutter;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Build;
import android.util.Log;
import android.view.KeyEvent;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.webkit.WebResourceErrorCompat;
import androidx.webkit.WebViewClientCompat;

/**
 * Host api implementation for {@link WebViewClient}.
 *
 * <p>Handles creating {@link WebViewClient}s that intercommunicate with a paired Dart object.
 */
public class WebViewClientHostApiImpl implements GeneratedAndroidWebView.WebViewClientHostApi {
  private final InstanceManager instanceManager;
  private final WebViewClientCreator webViewClientCreator;
  private final WebViewClientFlutterApiImpl flutterApi;

  /**
   * An interface implemented by a class that extends {@link WebViewClient} and {@link Releasable}.
   */
  public interface ReleasableWebViewClient extends Releasable {}

  /** Implementation of {@link WebViewClient} that passes arguments of callback methods to Dart. */
  @RequiresApi(Build.VERSION_CODES.N)
  public static class WebViewClientImpl extends WebViewClient implements ReleasableWebViewClient {
    @Nullable private WebViewClientFlutterApiImpl flutterApi;
    private final boolean shouldOverrideUrlLoading;
    private final boolean alertSslError;

    /**
     * Creates a {@link WebViewClient} that passes arguments of callbacks methods to Dart.
     *
     * @param flutterApi handles sending messages to Dart
     * @param shouldOverrideUrlLoading whether loading a url should be overridden
     */
    public WebViewClientImpl(
        @NonNull WebViewClientFlutterApiImpl flutterApi, boolean shouldOverrideUrlLoading, boolean alertSslError) {
      this.shouldOverrideUrlLoading = shouldOverrideUrlLoading;
      this.alertSslError = alertSslError;
      this.flutterApi = flutterApi;
    }

    @Override
    public void onPageStarted(WebView view, String url, Bitmap favicon) {
      if (flutterApi != null) {
        flutterApi.onPageStarted(this, view, url, reply -> {});
      }
    }

    @Override
    public void onPageFinished(WebView view, String url) {
      if (flutterApi != null) {
        flutterApi.onPageFinished(this, view, url, reply -> {});
      }
    }

    @Override
    public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
      if (flutterApi != null) {
        flutterApi.onReceivedRequestError(this, view, request, error, reply -> {});
      }
    }

    @Override
    public void onReceivedError(
        WebView view, int errorCode, String description, String failingUrl) {
      if (flutterApi != null) {
        flutterApi.onReceivedError(
            this, view, (long) errorCode, description, failingUrl, reply -> {});
      }
    }

    @Override
    public void onReceivedHttpError(WebView view, WebResourceRequest request, WebResourceResponse errorResponse) {
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        if (flutterApi != null) {
          flutterApi.onReceivedHttpError(
                  this,
                  view,
                  (long) errorResponse.getStatusCode(),
                  errorResponse.getReasonPhrase(),
                  request.getUrl().toString(),
                  reply -> {}
          );
        }
      }

    }

    @Override
    public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
      if (alertSslError) {
        showSslError(view.getContext(), handler);
      } else {
        super.onReceivedSslError(view, handler, error);
      }
    }

    @Override
    public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
      if (request != null) {
        try {
          String url = request.getUrl().toString();
          if (url.startsWith("weixin://dl/business")) {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            view.getContext().startActivity(intent);
            return true;
          }
        } catch (Exception e) { //防止crash (如果手机上没有安装处理某个scheme开头的url的APP, 会导致crash
          return true;//没有安装该app时，返回true，表示拦截自定义链接，但不跳转，避免弹出上面的错误页面
        }
      }
      if (flutterApi != null) {
        flutterApi.requestLoading(this, view, request, reply -> {});
      }
      return shouldOverrideUrlLoading;
    }

    @Override
    public boolean shouldOverrideUrlLoading(WebView view, String url) {
      if (url != null) {
        try {
          if (url.startsWith("weixin://dl/business")) {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            view.getContext().startActivity(intent);
            return true;
          }
        } catch (Exception e) { //防止crash (如果手机上没有安装处理某个scheme开头的url的APP, 会导致crash
          return true;//没有安装该app时，返回true，表示拦截自定义链接，但不跳转，避免弹出上面的错误页面
        }
      }
      if (flutterApi != null) {
        flutterApi.urlLoading(this, view, url, reply -> {});
      }
      return shouldOverrideUrlLoading;
    }

    @Override
    public void onUnhandledKeyEvent(WebView view, KeyEvent event) {
      // Deliberately empty. Occasionally the webview will mark events as having failed to be
      // handled even though they were handled. We don't want to propagate those as they're not
      // truly lost.
    }

    public void release() {
      if (flutterApi != null) {
        flutterApi.dispose(this, reply -> {});
      }
      flutterApi = null;
    }

    private void showSslError(Context context, SslErrorHandler handler) {
      AlertDialog.Builder builder = new AlertDialog.Builder(context);
      builder.setTitle("SSL Certificate Error")
              .setMessage("Do you want to continue anyway?")
              .setPositiveButton("continue", new DialogInterface.OnClickListener (){
                @Override
                public void onClick(DialogInterface dialog, int which) {
                  handler.proceed();
                }
              })
              .setNegativeButton("cancel", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                  handler.cancel();
                }
              });
      builder.create().show();
    }
  }

  /**
   * Implementation of {@link WebViewClientCompat} that passes arguments of callback methods to
   * Dart.
   */
  public static class WebViewClientCompatImpl extends WebViewClientCompat
      implements ReleasableWebViewClient {
    private @Nullable WebViewClientFlutterApiImpl flutterApi;
    private final boolean shouldOverrideUrlLoading;

    public WebViewClientCompatImpl(
        @NonNull WebViewClientFlutterApiImpl flutterApi, boolean shouldOverrideUrlLoading) {
      this.shouldOverrideUrlLoading = shouldOverrideUrlLoading;
      this.flutterApi = flutterApi;
    }

    @Override
    public void onPageStarted(WebView view, String url, Bitmap favicon) {
      if (flutterApi != null) {
        flutterApi.onPageStarted(this, view, url, reply -> {});
      }
    }

    @Override
    public void onPageFinished(WebView view, String url) {
      if (flutterApi != null) {
        flutterApi.onPageFinished(this, view, url, reply -> {});
      }
    }

    // This method is only called when the WebViewFeature.RECEIVE_WEB_RESOURCE_ERROR feature is
    // enabled. The deprecated method is called when a device doesn't support this.
    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    @SuppressLint("RequiresFeature")
    @Override
    public void onReceivedError(
        @NonNull WebView view,
        @NonNull WebResourceRequest request,
        @NonNull WebResourceErrorCompat error) {
      if (flutterApi != null) {
        flutterApi.onReceivedRequestError(this, view, request, error, reply -> {});
      }
    }

    @Override
    public void onReceivedError(
        WebView view, int errorCode, String description, String failingUrl) {
      if (flutterApi != null) {
        flutterApi.onReceivedError(
            this, view, (long) errorCode, description, failingUrl, reply -> {});
      }
    }

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    @Override
    public boolean shouldOverrideUrlLoading(
        @NonNull WebView view, @NonNull WebResourceRequest request) {
      if (request != null) {
        try {
          String url = request.getUrl().toString();
          if (url.startsWith("weixin://dl/business")) {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            view.getContext().startActivity(intent);
            return true;
          }
        } catch (Exception e) { //防止crash (如果手机上没有安装处理某个scheme开头的url的APP, 会导致crash
          return true;//没有安装该app时，返回true，表示拦截自定义链接，但不跳转，避免弹出上面的错误页面
        }
      }
      if (flutterApi != null) {
        flutterApi.requestLoading(this, view, request, reply -> {});
      }
      return shouldOverrideUrlLoading;
    }

    @Override
    public boolean shouldOverrideUrlLoading(WebView view, String url) {
      if (url != null) {
        try {
          if (url.startsWith("weixin://dl/business")) {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            view.getContext().startActivity(intent);
            return true;
          }
        } catch (Exception e) { //防止crash (如果手机上没有安装处理某个scheme开头的url的APP, 会导致crash
          return true;//没有安装该app时，返回true，表示拦截自定义链接，但不跳转，避免弹出上面的错误页面
        }
      }
      if (flutterApi != null) {
        flutterApi.urlLoading(this, view, url, reply -> {});
      }
      return shouldOverrideUrlLoading;
    }

    @Override
    public void onUnhandledKeyEvent(WebView view, KeyEvent event) {
      // Deliberately empty. Occasionally the webview will mark events as having failed to be
      // handled even though they were handled. We don't want to propagate those as they're not
      // truly lost.
    }

    public void release() {
      if (flutterApi != null) {
        flutterApi.dispose(this, reply -> {});
      }
      flutterApi = null;
    }
  }

  /** Handles creating {@link WebViewClient}s for a {@link WebViewClientHostApiImpl}. */
  public static class WebViewClientCreator {
    /**
     * Creates a {@link WebViewClient}.
     *
     * @param flutterApi handles sending messages to Dart
     * @return the created {@link WebViewClient}
     */
    public WebViewClient createWebViewClient(
        WebViewClientFlutterApiImpl flutterApi, boolean shouldOverrideUrlLoading, boolean alertSslError) {
      // WebViewClientCompat is used to get
      // shouldOverrideUrlLoading(WebView view, WebResourceRequest request)
      // invoked by the webview on older Android devices, without it pages that use iframes will
      // be broken when a navigationDelegate is set on Android version earlier than N.
      //
      // However, this if statement attempts to avoid using WebViewClientCompat on versions >= N due
      // to bug https://bugs.chromium.org/p/chromium/issues/detail?id=925887. Also, see
      // https://github.com/flutter/flutter/issues/29446.
      if (android.os.Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
        return new WebViewClientImpl(flutterApi, shouldOverrideUrlLoading, alertSslError);
      } else {
        return new WebViewClientCompatImpl(flutterApi, shouldOverrideUrlLoading);
      }
    }
  }

  /**
   * Creates a host API that handles creating {@link WebViewClient}s.
   *
   * @param instanceManager maintains instances stored to communicate with Dart objects
   * @param webViewClientCreator handles creating {@link WebViewClient}s
   * @param flutterApi handles sending messages to Dart
   */
  public WebViewClientHostApiImpl(
      InstanceManager instanceManager,
      WebViewClientCreator webViewClientCreator,
      WebViewClientFlutterApiImpl flutterApi) {
    this.instanceManager = instanceManager;
    this.webViewClientCreator = webViewClientCreator;
    this.flutterApi = flutterApi;
  }

  @Override
  public void create(Long instanceId, Boolean shouldOverrideUrlLoading, Boolean alertSslError) {
    final WebViewClient webViewClient =
        webViewClientCreator.createWebViewClient(flutterApi, shouldOverrideUrlLoading, alertSslError);
    instanceManager.addInstance(webViewClient, instanceId);
  }
}
