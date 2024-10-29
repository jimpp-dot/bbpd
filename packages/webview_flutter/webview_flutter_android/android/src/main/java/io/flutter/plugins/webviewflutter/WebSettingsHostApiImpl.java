// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.webviewflutter;

import android.os.Build;
import android.util.Log;
import android.webkit.WebSettings;
import android.webkit.WebView;

import androidx.annotation.NonNull;

import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi;

/**
 * Host api implementation for {@link WebSettings}.
 *
 * <p>Handles creating {@link WebSettings}s that intercommunicate with a paired Dart object.
 */
public class WebSettingsHostApiImpl implements WebSettingsHostApi {
  private final InstanceManager instanceManager;
  private final WebSettingsCreator webSettingsCreator;

  /** Handles creating {@link WebSettings} for a {@link WebSettingsHostApiImpl}. */
  public static class WebSettingsCreator {
    /**
     * Creates a {@link WebSettings}.
     *
     * @param webView the {@link WebView} which the settings affect
     * @return the created {@link WebSettings}
     */
    public WebSettings createWebSettings(WebView webView) {
      return webView.getSettings();
    }
  }

  /**
   * Creates a host API that handles creating {@link WebSettings} and invoke its methods.
   *
   * @param instanceManager maintains instances stored to communicate with Dart objects
   * @param webSettingsCreator handles creating {@link WebSettings}s
   */
  public WebSettingsHostApiImpl(
      InstanceManager instanceManager, WebSettingsCreator webSettingsCreator) {
    this.instanceManager = instanceManager;
    this.webSettingsCreator = webSettingsCreator;
  }

  @Override
  public void create(Long instanceId, Long webViewInstanceId) {
    final WebView webView = (WebView) instanceManager.getInstance(webViewInstanceId);
    instanceManager.addInstance(webSettingsCreator.createWebSettings(webView), instanceId);
  }

  @Override
  public void dispose(Long instanceId) {
    instanceManager.removeInstanceWithId(instanceId);
  }

  @Override
  public void setDomStorageEnabled(Long instanceId, Boolean flag) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setDomStorageEnabled(flag);
//    Log.d("WebSettingsHostApiImpl", "setDomStorageEnabled flag="+flag);
  }

  @Override
  public void setJavaScriptCanOpenWindowsAutomatically(Long instanceId, Boolean flag) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setJavaScriptCanOpenWindowsAutomatically(flag);
//    Log.d("WebSettingsHostApiImpl", "setJavaScriptCanOpenWindowsAutomatically flag="+flag);
  }

  @Override
  public void setSupportMultipleWindows(Long instanceId, Boolean support) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setSupportMultipleWindows(support);
//    Log.d("WebSettingsHostApiImpl", "setSupportMultipleWindows support="+support);
  }

  @Override
  public void setJavaScriptEnabled(Long instanceId, Boolean flag) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setJavaScriptEnabled(flag);
//    Log.d("WebSettingsHostApiImpl", "setJavaScriptEnabled flag="+flag);
  }

  @Override
  public void setUserAgentString(Long instanceId, String userAgentString) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setUserAgentString(userAgentString);
//    Log.d("WebSettingsHostApiImpl", "setUserAgentString userAgentString="+userAgentString);
  }

  @Override
  public void setMediaPlaybackRequiresUserGesture(Long instanceId, Boolean require) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setMediaPlaybackRequiresUserGesture(require);
//    Log.d("WebSettingsHostApiImpl", "setMediaPlaybackRequiresUserGesture require="+require);
  }

  @Override
  public void setSupportZoom(Long instanceId, Boolean support) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setSupportZoom(support);
//    Log.d("WebSettingsHostApiImpl", "setSupportZoom support="+support);
  }

  @Override
  public void setLoadWithOverviewMode(Long instanceId, Boolean overview) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setLoadWithOverviewMode(overview);
//    Log.d("WebSettingsHostApiImpl", "setLoadWithOverviewMode overview="+overview);
  }

  @Override
  public void setUseWideViewPort(Long instanceId, Boolean use) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setUseWideViewPort(use);
//    Log.d("WebSettingsHostApiImpl", "setUseWideViewPort use="+use);
  }

  @Override
  public void setDisplayZoomControls(Long instanceId, Boolean enabled) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setDisplayZoomControls(enabled);
//    Log.d("WebSettingsHostApiImpl", "setDisplayZoomControls enabled="+enabled);
  }

  @Override
  public void setBuiltInZoomControls(Long instanceId, Boolean enabled) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setBuiltInZoomControls(enabled);
//    Log.d("WebSettingsHostApiImpl", "setBuiltInZoomControls enabled="+enabled);
  }

  @Override
  public void setAllowFileAccess(Long instanceId, Boolean enabled) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setAllowFileAccess(enabled);
//    Log.d("WebSettingsHostApiImpl", "setAllowFileAccess enabled="+enabled);
  }

  @Override
  public void setAllowContentAccess(@NonNull Long instanceId, @NonNull Boolean enabled) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setAllowContentAccess(enabled);
//    Log.d("WebSettingsHostApiImpl", "setAllowContentAccess enabled="+enabled);
  }

  @Override
  public void setAllowFileAccessFromFileURLs(@NonNull Long instanceId, @NonNull Boolean enabled) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setAllowFileAccessFromFileURLs(enabled);
//    Log.d("WebSettingsHostApiImpl", "setAllowFileAccessFromFileURLs enabled="+enabled);
  }

  @Override
  public void setAllowUniversalAccessFromFileURLs(@NonNull Long instanceId, @NonNull Boolean enabled) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setAllowUniversalAccessFromFileURLs(enabled);
//    Log.d("WebSettingsHostApiImpl", "setAllowUniversalAccessFromFileURLs enabled="+enabled);
  }

  @Override
  public void setGeolocationEnabled(@NonNull Long instanceId, @NonNull Boolean enabled) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    webSettings.setGeolocationEnabled(enabled);
//    Log.d("WebSettingsHostApiImpl", "setGeolocationEnabled enabled="+enabled);
  }

  @Override
  public void setMixedContentModeAllow(@NonNull Long instanceId, @NonNull Boolean enabled) {
    final WebSettings webSettings = (WebSettings) instanceManager.getInstance(instanceId);
    if (enabled != null && enabled) {
      // 支持微信公众号文章中视频播放
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        webSettings.setMixedContentMode(WebSettings.MIXED_CONTENT_ALWAYS_ALLOW);
      }
    }
//    Log.d("WebSettingsHostApiImpl", "setMixedContentModeAllow enabled="+enabled);
  }

}
