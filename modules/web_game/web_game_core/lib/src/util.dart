import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum GameState {
  initial,
  downloading,
  loading,
  successful,
  failed,
}

class ProgressInfo {
  final GameState state;
  double? progress;

  ProgressInfo({this.state = GameState.initial, this.progress});
}

/// 调试开关，true: 直连开发机url
bool isGameOnlineDev = false;

// const String android_use_virtual_display = 'room_game_use_virtual_display';

void initAndroidWebViewPlatform() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    // bool useVirtualDisplay = Config.getBool(android_use_virtual_display, false);
    // if (useVirtualDisplay) {
    //   WebView.platform = AndroidWebView();
    // } else {
    WebView.platform = SurfaceAndroidWebView();
    // }
  }
}

// void switchAndroidWebViewPlatform() {
//   if (defaultTargetPlatform == TargetPlatform.android) {
//     if (WebView.platform is SurfaceAndroidWebView) {
//       Config.setBool(android_use_virtual_display, true);
//     } else if (WebView.platform is AndroidWebView) {
//       Config.setBool(android_use_virtual_display, false);
//     }
//   }
// }
