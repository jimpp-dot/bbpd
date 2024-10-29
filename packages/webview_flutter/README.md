# webview_flutter

 Webview插件，基于原版webview_flutter-v3.0.4修改，与原版的差异diff请参考[patch](webview_flutter_3.0.4_1.0.4.patch)

## 使用说明
1. 依赖引用
   [版本更新日志](CHANGELOG.md)
   ```
   webview_flutter:
    git:
      url: git@github.com:olaola-chat/cli-webview_flutter.git
      path: webview_flutter
      ref: 1.0.4
   ```

2. 代码示例
   ```
      WebView(
        initialUrl: 'https://flutter.dev',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        onWebConsoleMessageCallback: (String tag,String message) {
          print('onConsoleMessage: $tag:$message');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
   ```

## 补充说明
1. 默认开启setting ---android ---ios
```
webView.settings.setAllowContentAccess(true);
webView.settings.setAllowFileAccessFromFileURLs(true);
webView.settings.setAllowUniversalAccessFromFileURLs(true);
webView.settings.setGeolocationEnabled(true);
webView.settings.setMixedContentModeAllow(true);

webView.setVerticalScrollbarPosition(2); //默认进度条右边
```
2. 支持圆角 ---android ---ios
```
WebView(
    cornerRadius: 16
)
```

3. 下载默认使用系统支持
```
  private void downloadByBrowser(Context context, String url) {
    Intent intent = new Intent(Intent.ACTION_VIEW);
    intent.addCategory(Intent.CATEGORY_BROWSABLE);
    intent.setData(Uri.parse(url));
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    context.getApplicationContext().startActivity(intent);
  }
```

4. 支持网页视频切换全屏
```
onShowCustomView
onHideCustomView
```

5. 支持文件选择使用默认
```
 onShowFileChooser
```

6. 默认支持打开微信小程序
```
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
```

7. 页面加载后增加injectBridge注入逻辑(如私聊定位) --android --ios
```
  private void injectBridge(WebView view) {
    view.loadUrl("javascript:(" +
            "window.originalPostMessage = window.postMessage," +
            "window.postMessage = function(data) {" +
            BRIDGE_NAME + ".postMessage(JSON.stringify(data));" +
            "}" +
            ")");
  }
```

8. 支持SSL异常弹窗

```
    /// dart使用
    WebView(
      alertSslError: true,
    )
    /// 安卓实现
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
```

9. 设置get url的header --android --ios

10. 手势冲突 --ios

11. onReceivedHttpError 页面错误回调(充值失败弹框) --android --ios

12. 网页中打开第三方用法(站内页面调整/站外跳转)
参照dart代码navigationDelegate回调处理逻辑

13. 输出Console日志  --android
```
      onWebConsoleMessageCallback: (String tag,String message) {
          print('onConsoleMessage: $tag:$message');
        },
```
14. 支持对laya游戏Common资源的处理
iOS端在请求本地资源时，需要对文件夹授权，common资源不在游戏本体目录下，导致加载common资源时异常，对此场景增加了支持，约定游戏目录在room_game下
```
- (NSURL *)getReadAccessUrl:(NSURL *) fileUrl {
    NSURL *baseUrl = [fileUrl URLByDeletingLastPathComponent];
     if ([[baseUrl path] containsString:@"room_game"]) {
        NSString *basePath = [[baseUrl path] componentsSeparatedByString:@"room_game"][0];
        baseUrl = [NSURL URLWithString: [NSString stringWithFormat:@"file://%@room_game/", basePath]];
     }
    return baseUrl;
}

[_webView loadFileURL:url allowingReadAccessToURL:[self getReadAccessUrl:url]];
```

## 2.x版本切换
1.webView中设置
- 圆角：
```
-      androidCornerRadius: 18,
+      cornerRadius: 18.0,
```

- webSetting设置的(默认值为JavascriptMode.unrestricted)，可以直接移除
```
-                  webSettings:
-                      WebSettings(javascriptMode: JavascriptMode.unrestricted),
```

- webSetting设置有header的，直接把hearder放置导外面，如，
```
-                webSettings: WebSettings(
-                  headers: _getHeaders(),
-                ),
+                headers: _getHeaders(),
```

- 有_webViewController的dispose，直接移除
```
-    _webViewController?.dispose();
+    // _webViewController?.dispose();
```

- 有_webViewController的evaluateJavascript，直接替换
```
-    String title = await _webViewController.evaluateJavascript(script);
+    String title = await _webViewController.runJavascriptReturningResult(script);
```

- webView的onHttpErrorCallback移除(应该都没有业务)
```
-    onHttpErrorCallback: _onHttpErrorCallback,
```

- WebSettings里有设置hasNavigationDelegate为true的，保证WebView里面有navigationDelegate即可，如果无补充如下，
```
-    webSettings: WebSettings(javascriptMode: JavascriptMode.unrestricted, hasNavigationDelegate: true),
+    navigationDelegate: (NavigationRequest request) {
+      return NavigationDecision.navigate;
+    },
```
