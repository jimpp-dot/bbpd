# tracker

数据埋点SDK.

## Getting Started

1. 在main.dart中初始化

```dart
// 埋点SDK初始化
await Tracker.enableTrackLog(Constant.isDevMode);
await Tracker.init(appId: 'debug-appid', serverUrl: System.dataDomain);
...
Tracker.instance.enableAutoTrack();
```

2. 在boot.dart中加入登录登出的上报

```dart
void _onLogout(String type, dynamic value) {
  Tracker.instance.logout();
  ...
}

void _onLogin(String type, dynamic data) {
  Tracker.instance.login(Session.uid.toString());
  ...
}
```

