// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'package:flutter/services.dart';

import 'android_webview.dart';
import 'android_webview.pigeon.dart';
import 'instance_manager.dart';

/// Converts [WebResourceRequestData] to [WebResourceRequest]
WebResourceRequest _toWebResourceRequest(WebResourceRequestData data) {
  return WebResourceRequest(
    url: data.url,
    isForMainFrame: data.isForMainFrame,
    isRedirect: data.isRedirect,
    hasGesture: data.hasGesture,
    method: data.method,
    requestHeaders: data.requestHeaders.cast<String, String>(),
  );
}

/// Converts [WebResourceErrorData] to [WebResourceError].
WebResourceError _toWebResourceError(WebResourceErrorData data) {
  return WebResourceError(
    errorCode: data.errorCode,
    description: data.description,
  );
}

/// Handles initialization of Flutter APIs for Android WebView.
class AndroidWebViewFlutterApis {
  /// Creates a [AndroidWebViewFlutterApis].
  AndroidWebViewFlutterApis({
    DownloadListenerFlutterApiImpl? downloadListenerFlutterApi,
    WebViewClientFlutterApiImpl? webViewClientFlutterApi,
    WebChromeClientFlutterApiImpl? webChromeClientFlutterApi,
    JavaScriptChannelFlutterApiImpl? javaScriptChannelFlutterApi,
  }) {
    this.downloadListenerFlutterApi =
        downloadListenerFlutterApi ?? DownloadListenerFlutterApiImpl();
    this.webViewClientFlutterApi =
        webViewClientFlutterApi ?? WebViewClientFlutterApiImpl();
    this.webChromeClientFlutterApi =
        webChromeClientFlutterApi ?? WebChromeClientFlutterApiImpl();
    this.javaScriptChannelFlutterApi =
        javaScriptChannelFlutterApi ?? JavaScriptChannelFlutterApiImpl();
  }

  static bool _haveBeenSetUp = false;

  /// Mutable instance containing all Flutter Apis for Android WebView.
  ///
  /// This should only be changed for testing purposes.
  static AndroidWebViewFlutterApis instance = AndroidWebViewFlutterApis();

  /// Flutter Api for [DownloadListener].
  late final DownloadListenerFlutterApiImpl downloadListenerFlutterApi;

  /// Flutter Api for [WebViewClient].
  late final WebViewClientFlutterApiImpl webViewClientFlutterApi;

  /// Flutter Api for [WebChromeClient].
  late final WebChromeClientFlutterApiImpl webChromeClientFlutterApi;

  /// Flutter Api for [JavaScriptChannel].
  late final JavaScriptChannelFlutterApiImpl javaScriptChannelFlutterApi;

  /// Ensures all the Flutter APIs have been setup to receive calls from native code.
  void ensureSetUp() {
    if (!_haveBeenSetUp) {
      DownloadListenerFlutterApi.setup(downloadListenerFlutterApi);
      WebViewClientFlutterApi.setup(webViewClientFlutterApi);
      WebChromeClientFlutterApi.setup(webChromeClientFlutterApi);
      JavaScriptChannelFlutterApi.setup(javaScriptChannelFlutterApi);
      _haveBeenSetUp = true;
    }
  }
}

/// Host api implementation for [WebView].
class WebViewHostApiImpl extends WebViewHostApi {
  /// Constructs a [WebViewHostApiImpl].
  WebViewHostApiImpl({
    BinaryMessenger? binaryMessenger,
    InstanceManager? instanceManager,
  }) : super(binaryMessenger: binaryMessenger) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  /// Helper method to convert instances ids to objects.
  Future<void> createFromInstance(WebView instance) async {
    final int? instanceId = instanceManager.tryAddInstance(instance);
    if (instanceId != null) {
      return create(instanceId, instance.useHybridComposition);
    }
  }

  /// Helper method to convert instances ids to objects.
  Future<void> disposeFromInstance(WebView instance) async {
    final int? instanceId = instanceManager.getInstanceId(instance);
    if (instanceId != null) {
      await dispose(instanceId);
    }
    instanceManager.removeInstance(instance);
  }

  /// Helper method to convert the instances ids to objects.
  Future<void> loadDataFromInstance(
    WebView instance,
    String data,
    String? mimeType,
    String? encoding,
  ) {
    return loadData(
      instanceManager.getInstanceId(instance)!,
      data,
      mimeType,
      encoding,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> loadDataWithBaseUrlFromInstance(
    WebView instance,
    String? baseUrl,
    String data,
    String? mimeType,
    String? encoding,
    String? historyUrl,
  ) {
    return loadDataWithBaseUrl(
      instanceManager.getInstanceId(instance)!,
      baseUrl,
      data,
      mimeType,
      encoding,
      historyUrl,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> loadUrlFromInstance(
    WebView instance,
    String url,
    Map<String, String> headers,
  ) {
    return loadUrl(instanceManager.getInstanceId(instance)!, url, headers);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> postUrlFromInstance(
    WebView instance,
    String url,
    Uint8List data,
  ) {
    return postUrl(instanceManager.getInstanceId(instance)!, url, data);
  }

  /// Helper method to convert instances ids to objects.
  Future<String?> getUrlFromInstance(WebView instance) {
    return getUrl(instanceManager.getInstanceId(instance)!);
  }

  /// Helper method to convert instances ids to objects.
  Future<bool> canGoBackFromInstance(WebView instance) {
    return canGoBack(instanceManager.getInstanceId(instance)!);
  }

  /// Helper method to convert instances ids to objects.
  Future<bool> canGoForwardFromInstance(WebView instance) {
    return canGoForward(instanceManager.getInstanceId(instance)!);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> goBackFromInstance(WebView instance) {
    return goBack(instanceManager.getInstanceId(instance)!);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> goForwardFromInstance(WebView instance) {
    return goForward(instanceManager.getInstanceId(instance)!);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> reloadFromInstance(WebView instance) {
    return reload(instanceManager.getInstanceId(instance)!);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> clearCacheFromInstance(WebView instance, bool includeDiskFiles) {
    return clearCache(
      instanceManager.getInstanceId(instance)!,
      includeDiskFiles,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<String?> evaluateJavascriptFromInstance(
    WebView instance,
    String javascriptString,
  ) {
    return evaluateJavascript(
      instanceManager.getInstanceId(instance)!,
      javascriptString,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<String?> getTitleFromInstance(WebView instance) {
    return getTitle(instanceManager.getInstanceId(instance)!);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> scrollToFromInstance(WebView instance, int x, int y) {
    return scrollTo(instanceManager.getInstanceId(instance)!, x, y);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> scrollByFromInstance(WebView instance, int x, int y) {
    return scrollBy(instanceManager.getInstanceId(instance)!, x, y);
  }

  /// Helper method to convert instances ids to objects.
  Future<int> getScrollXFromInstance(WebView instance) {
    return getScrollX(instanceManager.getInstanceId(instance)!);
  }

  /// Helper method to convert instances ids to objects.
  Future<int> getScrollYFromInstance(WebView instance) {
    return getScrollY(instanceManager.getInstanceId(instance)!);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setWebViewClientFromInstance(
    WebView instance,
    WebViewClient webViewClient,
  ) {
    return setWebViewClient(
      instanceManager.getInstanceId(instance)!,
      instanceManager.getInstanceId(webViewClient)!,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> addJavaScriptChannelFromInstance(
    WebView instance,
    JavaScriptChannel javaScriptChannel,
  ) {
    return addJavaScriptChannel(
      instanceManager.getInstanceId(instance)!,
      instanceManager.getInstanceId(javaScriptChannel)!,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> removeJavaScriptChannelFromInstance(
    WebView instance,
    JavaScriptChannel javaScriptChannel,
  ) {
    return removeJavaScriptChannel(
      instanceManager.getInstanceId(instance)!,
      instanceManager.getInstanceId(javaScriptChannel)!,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setDownloadListenerFromInstance(
    WebView instance,
    DownloadListener? listener,
  ) {
    return setDownloadListener(
      instanceManager.getInstanceId(instance)!,
      listener != null ? instanceManager.getInstanceId(listener) : null,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setWebChromeClientFromInstance(
    WebView instance,
    WebChromeClient? client,
  ) {
    return setWebChromeClient(
      instanceManager.getInstanceId(instance)!,
      client != null ? instanceManager.getInstanceId(client) : null,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setBackgroundColorFromInstance(WebView instance, int color) {
    return setBackgroundColor(instanceManager.getInstanceId(instance)!, color);
  }

  //
  Future<void> setCornerRadiusFromInstance(WebView instance, double radius) {
    return setCornerRadius(instanceManager.getInstanceId(instance)!, radius);
  }

  //
  Future<void> setVerticalScrollbarPositionFromInstance(WebView instance, int position) {
    return setVerticalScrollbarPosition(instanceManager.getInstanceId(instance)!, position);
  }
}

/// Host api implementation for [WebSettings].
class WebSettingsHostApiImpl extends WebSettingsHostApi {
  /// Constructs a [WebSettingsHostApiImpl].
  WebSettingsHostApiImpl({
    BinaryMessenger? binaryMessenger,
    InstanceManager? instanceManager,
  }) : super(binaryMessenger: binaryMessenger) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  /// Helper method to convert instances ids to objects.
  Future<void> createFromInstance(WebSettings instance, WebView webView) async {
    final int? instanceId = instanceManager.tryAddInstance(instance);
    if (instanceId != null) {
      return create(
        instanceId,
        instanceManager.getInstanceId(webView)!,
      );
    }
  }

  /// Helper method to convert instances ids to objects.
  Future<void> disposeFromInstance(WebSettings instance) async {
    final int? instanceId = instanceManager.removeInstance(instance);
    if (instanceId != null) {
      return dispose(instanceId);
    }
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setDomStorageEnabledFromInstance(
    WebSettings instance,
    bool flag,
  ) {
    return setDomStorageEnabled(instanceManager.getInstanceId(instance)!, flag);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setJavaScriptCanOpenWindowsAutomaticallyFromInstance(
    WebSettings instance,
    bool flag,
  ) {
    return setJavaScriptCanOpenWindowsAutomatically(
      instanceManager.getInstanceId(instance)!,
      flag,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setSupportMultipleWindowsFromInstance(
    WebSettings instance,
    bool support,
  ) {
    return setSupportMultipleWindows(
        instanceManager.getInstanceId(instance)!, support);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setJavaScriptEnabledFromInstance(
    WebSettings instance,
    bool flag,
  ) {
    return setJavaScriptEnabled(
      instanceManager.getInstanceId(instance)!,
      flag,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setUserAgentStringFromInstance(
    WebSettings instance,
    String? userAgentString,
  ) {
    return setUserAgentString(
      instanceManager.getInstanceId(instance)!,
      userAgentString,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setMediaPlaybackRequiresUserGestureFromInstance(
    WebSettings instance,
    bool require,
  ) {
    return setMediaPlaybackRequiresUserGesture(
      instanceManager.getInstanceId(instance)!,
      require,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setSupportZoomFromInstance(
    WebSettings instance,
    bool support,
  ) {
    return setSupportZoom(instanceManager.getInstanceId(instance)!, support);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setLoadWithOverviewModeFromInstance(
    WebSettings instance,
    bool overview,
  ) {
    return setLoadWithOverviewMode(
      instanceManager.getInstanceId(instance)!,
      overview,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setUseWideViewPortFromInstance(
    WebSettings instance,
    bool use,
  ) {
    return setUseWideViewPort(instanceManager.getInstanceId(instance)!, use);
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setDisplayZoomControlsFromInstance(
    WebSettings instance,
    bool enabled,
  ) {
    return setDisplayZoomControls(
      instanceManager.getInstanceId(instance)!,
      enabled,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setBuiltInZoomControlsFromInstance(
    WebSettings instance,
    bool enabled,
  ) {
    return setBuiltInZoomControls(
      instanceManager.getInstanceId(instance)!,
      enabled,
    );
  }

  /// Helper method to convert instances ids to objects.
  Future<void> setAllowFileAccessFromInstance(
    WebSettings instance,
    bool enabled,
  ) {
    return setAllowFileAccess(
      instanceManager.getInstanceId(instance)!,
      enabled,
    );
  }

  ///
  Future<void> setAllowContentAccessFromInstance(
      WebSettings instance,
      bool enabled,
      ) {
    return setAllowContentAccess(
      instanceManager.getInstanceId(instance)!,
      enabled,
    );
  }

  ///
  Future<void> setAllowFileAccessFromFileURLsFromInstance(
      WebSettings instance,
      bool enabled,
      ) {
    return setAllowFileAccessFromFileURLs(
      instanceManager.getInstanceId(instance)!,
      enabled,
    );
  }

  ///
  Future<void> setAllowUniversalAccessFromFileURLsFromInstance(
      WebSettings instance,
      bool enabled,
      ) {
    return setAllowUniversalAccessFromFileURLs(
      instanceManager.getInstanceId(instance)!,
      enabled,
    );
  }

  ///
  Future<void> setGeolocationEnabledFromInstance(
      WebSettings instance,
      bool enabled,
      ) {
    return setGeolocationEnabled(
      instanceManager.getInstanceId(instance)!,
      enabled,
    );
  }

  ///
  Future<void> setMixedContentModeAllowFromInstance(
      WebSettings instance,
      bool enabled,
      ) {
    return setMixedContentModeAllow(
      instanceManager.getInstanceId(instance)!,
      enabled,
    );
  }
}

/// Host api implementation for [JavaScriptChannel].
class JavaScriptChannelHostApiImpl extends JavaScriptChannelHostApi {
  /// Constructs a [JavaScriptChannelHostApiImpl].
  JavaScriptChannelHostApiImpl({
    BinaryMessenger? binaryMessenger,
    InstanceManager? instanceManager,
  }) : super(binaryMessenger: binaryMessenger) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  /// Helper method to convert instances ids to objects.
  Future<void> createFromInstance(JavaScriptChannel instance) async {
    final int? instanceId = instanceManager.tryAddInstance(instance);
    if (instanceId != null) {
      return create(instanceId, instance.channelName);
    }
  }
}

/// Flutter api implementation for [JavaScriptChannel].
class JavaScriptChannelFlutterApiImpl extends JavaScriptChannelFlutterApi {
  /// Constructs a [JavaScriptChannelFlutterApiImpl].
  JavaScriptChannelFlutterApiImpl({InstanceManager? instanceManager}) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  @override
  void dispose(int instanceId) {
    instanceManager.removeInstance(instanceId);
  }

  @override
  void postMessage(int instanceId, String message) {
    final JavaScriptChannel? instance =
        instanceManager.getInstance(instanceId) as JavaScriptChannel?;
    assert(
      instance != null,
      'InstanceManager does not contain an JavaScriptChannel with instanceId: $instanceId',
    );
    instance!.postMessage(message);
  }
}

/// Host api implementation for [WebViewClient].
class WebViewClientHostApiImpl extends WebViewClientHostApi {
  /// Constructs a [WebViewClientHostApiImpl].
  WebViewClientHostApiImpl({
    BinaryMessenger? binaryMessenger,
    InstanceManager? instanceManager,
  }) : super(binaryMessenger: binaryMessenger) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  /// Helper method to convert instances ids to objects.
  Future<void> createFromInstance(WebViewClient instance) async {
    final int? instanceId = instanceManager.tryAddInstance(instance);
    if (instanceId != null) {
      return create(instanceId, instance.shouldOverrideUrlLoading, instance.alertSslError);
    }
  }
}

/// Flutter api implementation for [WebViewClient].
class WebViewClientFlutterApiImpl extends WebViewClientFlutterApi {
  /// Constructs a [WebViewClientFlutterApiImpl].
  WebViewClientFlutterApiImpl({InstanceManager? instanceManager}) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  @override
  void dispose(int instanceId) {
    instanceManager.removeInstance(instanceId);
  }

  @override
  void onPageFinished(int instanceId, int webViewInstanceId, String url) {
    final WebViewClient? instance =
        instanceManager.getInstance(instanceId) as WebViewClient?;
    final WebView? webViewInstance =
        instanceManager.getInstance(webViewInstanceId) as WebView?;
    assert(
      instance != null,
      'InstanceManager does not contain an WebViewClient with instanceId: $instanceId',
    );
    assert(
      webViewInstance != null,
      'InstanceManager does not contain an WebView with instanceId: $webViewInstanceId',
    );
    instance!.onPageFinished(webViewInstance!, url);
  }

  @override
  void onPageStarted(int instanceId, int webViewInstanceId, String url) {
    final WebViewClient? instance =
        instanceManager.getInstance(instanceId) as WebViewClient?;
    final WebView? webViewInstance =
        instanceManager.getInstance(webViewInstanceId) as WebView?;
    assert(
      instance != null,
      'InstanceManager does not contain an WebViewClient with instanceId: $instanceId',
    );
    assert(
      webViewInstance != null,
      'InstanceManager does not contain an WebView with instanceId: $webViewInstanceId',
    );
    instance!.onPageStarted(webViewInstance!, url);
  }

  @override
  void onReceivedError(
    int instanceId,
    int webViewInstanceId,
    int errorCode,
    String description,
    String failingUrl,
  ) {
    final WebViewClient? instance =
        instanceManager.getInstance(instanceId) as WebViewClient?;
    final WebView? webViewInstance =
        instanceManager.getInstance(webViewInstanceId) as WebView?;
    assert(
      instance != null,
      'InstanceManager does not contain an WebViewClient with instanceId: $instanceId',
    );
    assert(
      webViewInstance != null,
      'InstanceManager does not contain an WebView with instanceId: $webViewInstanceId',
    );
    // ignore: deprecated_member_use_from_same_package
    instance!.onReceivedError(
      webViewInstance!,
      errorCode,
      description,
      failingUrl,
    );
  }

  @override
  void onReceivedHttpError(int instanceId, int webViewInstanceId, int errorCode, String description, String failingUrl) {
    // print("onReceivedHttpError 111");
    final WebViewClient? instance =
    instanceManager.getInstance(instanceId) as WebViewClient?;
    final WebView? webViewInstance =
    instanceManager.getInstance(webViewInstanceId) as WebView?;
    assert(
    instance != null,
    'InstanceManager does not contain an WebViewClient with instanceId: $instanceId',
    );
    assert(
    webViewInstance != null,
    'InstanceManager does not contain an WebView with instanceId: $webViewInstanceId',
    );
    instance!.onReceivedHttpError(
      webViewInstance!,
      errorCode,
      description,
      failingUrl,
    );
  }

  @override
  void onReceivedRequestError(
    int instanceId,
    int webViewInstanceId,
    WebResourceRequestData request,
    WebResourceErrorData error,
  ) {
    final WebViewClient? instance =
        instanceManager.getInstance(instanceId) as WebViewClient?;
    final WebView? webViewInstance =
        instanceManager.getInstance(webViewInstanceId) as WebView?;
    assert(
      instance != null,
      'InstanceManager does not contain an WebViewClient with instanceId: $instanceId',
    );
    assert(
      webViewInstance != null,
      'InstanceManager does not contain an WebView with instanceId: $webViewInstanceId',
    );
    instance!.onReceivedRequestError(
      webViewInstance!,
      _toWebResourceRequest(request),
      _toWebResourceError(error),
    );
  }

  @override
  void requestLoading(
    int instanceId,
    int webViewInstanceId,
    WebResourceRequestData request,
  ) {
    final WebViewClient? instance =
        instanceManager.getInstance(instanceId) as WebViewClient?;
    final WebView? webViewInstance =
        instanceManager.getInstance(webViewInstanceId) as WebView?;
    assert(
      instance != null,
      'InstanceManager does not contain an WebViewClient with instanceId: $instanceId',
    );
    assert(
      webViewInstance != null,
      'InstanceManager does not contain an WebView with instanceId: $webViewInstanceId',
    );
    instance!.requestLoading(webViewInstance!, _toWebResourceRequest(request));
  }

  @override
  void urlLoading(
    int instanceId,
    int webViewInstanceId,
    String url,
  ) {
    final WebViewClient? instance =
        instanceManager.getInstance(instanceId) as WebViewClient?;
    final WebView? webViewInstance =
        instanceManager.getInstance(webViewInstanceId) as WebView?;
    assert(
      instance != null,
      'InstanceManager does not contain an WebViewClient with instanceId: $instanceId',
    );
    assert(
      webViewInstance != null,
      'InstanceManager does not contain an WebView with instanceId: $webViewInstanceId',
    );
    instance!.urlLoading(webViewInstance!, url);
  }

  @override
  void onConsoleMessage(int instanceId, String tag, String message) {
    final WebChromeClient? instance = instanceManager
        .getInstance(instanceId) as WebChromeClient?;
    instance?.onConsoleMessage(tag, message);
  }
}

/// Host api implementation for [DownloadListener].
class DownloadListenerHostApiImpl extends DownloadListenerHostApi {
  /// Constructs a [DownloadListenerHostApiImpl].
  DownloadListenerHostApiImpl({
    BinaryMessenger? binaryMessenger,
    InstanceManager? instanceManager,
  }) : super(binaryMessenger: binaryMessenger) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  /// Helper method to convert instances ids to objects.
  Future<void> createFromInstance(DownloadListener instance) async {
    final int? instanceId = instanceManager.tryAddInstance(instance);
    if (instanceId != null) {
      return create(instanceId);
    }
  }
}

/// Flutter api implementation for [DownloadListener].
class DownloadListenerFlutterApiImpl extends DownloadListenerFlutterApi {
  /// Constructs a [DownloadListenerFlutterApiImpl].
  DownloadListenerFlutterApiImpl({InstanceManager? instanceManager}) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  @override
  void dispose(int instanceId) {
    instanceManager.removeInstance(instanceId);
  }

  @override
  void onDownloadStart(
    int instanceId,
    String url,
    String userAgent,
    String contentDisposition,
    String mimetype,
    int contentLength,
  ) {
    final DownloadListener? instance =
        instanceManager.getInstance(instanceId) as DownloadListener?;
    assert(
      instance != null,
      'InstanceManager does not contain an DownloadListener with instanceId: $instanceId',
    );
    instance!.onDownloadStart(
      url,
      userAgent,
      contentDisposition,
      mimetype,
      contentLength,
    );
  }
}

/// Host api implementation for [DownloadListener].
class WebChromeClientHostApiImpl extends WebChromeClientHostApi {
  /// Constructs a [WebChromeClientHostApiImpl].
  WebChromeClientHostApiImpl({
    BinaryMessenger? binaryMessenger,
    InstanceManager? instanceManager,
  }) : super(binaryMessenger: binaryMessenger) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  /// Helper method to convert instances ids to objects.
  Future<void> createFromInstance(
    WebChromeClient instance,
    WebViewClient webViewClient,
    bool? enable
  ) async {
    final int? instanceId = instanceManager.tryAddInstance(instance);
    if (instanceId != null) {
      return create(instanceId, instanceManager.getInstanceId(webViewClient)!, enable!);
    }
  }
}

/// Flutter api implementation for [DownloadListener].
class WebChromeClientFlutterApiImpl extends WebChromeClientFlutterApi {
  /// Constructs a [DownloadListenerFlutterApiImpl].
  WebChromeClientFlutterApiImpl({InstanceManager? instanceManager}) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  @override
  void dispose(int instanceId) {
    instanceManager.removeInstance(instanceId);
  }

  @override
  void onProgressChanged(int instanceId, int webViewInstanceId, int progress) {
    final WebChromeClient? instance =
        instanceManager.getInstance(instanceId) as WebChromeClient?;
    final WebView? webViewInstance =
        instanceManager.getInstance(webViewInstanceId) as WebView?;
    assert(
      instance != null,
      'InstanceManager does not contain an WebChromeClient with instanceId: $instanceId',
    );
    assert(
      webViewInstance != null,
      'InstanceManager does not contain an WebView with instanceId: $webViewInstanceId',
    );
    instance!.onProgressChanged(webViewInstance!, progress);
  }

  @override
  void onConsoleMessage(int instanceId, String tag, String message) {
    final WebChromeClient? instance = instanceManager
        .getInstance(instanceId) as WebChromeClient?;
    instance?.onConsoleMessage(tag, message);
  }
}

/// Host api implementation for [WebStorage].
class WebStorageHostApiImpl extends WebStorageHostApi {
  /// Constructs a [WebStorageHostApiImpl].
  WebStorageHostApiImpl({
    BinaryMessenger? binaryMessenger,
    InstanceManager? instanceManager,
  }) : super(binaryMessenger: binaryMessenger) {
    this.instanceManager = instanceManager ?? InstanceManager.instance;
  }

  /// Maintains instances stored to communicate with java objects.
  late final InstanceManager instanceManager;

  /// Helper method to convert instances ids to objects.
  Future<void> createFromInstance(WebStorage instance) async {
    final int? instanceId = instanceManager.tryAddInstance(instance);
    if (instanceId != null) {
      return create(instanceId);
    }
  }

  /// Helper method to convert instances ids to objects.
  Future<void> deleteAllDataFromInstance(WebStorage instance) {
    return deleteAllData(instanceManager.getInstanceId(instance)!);
  }
}
