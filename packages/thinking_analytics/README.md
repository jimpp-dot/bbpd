# tracker

数数-数据埋点SDK.

## Getting Started

APP集成
在 bbcore 的 yaml 文件中如下引用：

  thinking_analytics:
    git:
      url: git@github.com:olaola-chat/cli-tracker.git 
      ref: xxx

1. 在main.dart中初始化

```dart
// 埋点SDK初始化
await ThinkingAnalytics.enableTrackLog(Constant.isDevMode);
await ThinkingAnalytics.init(appId: 'debug-appid', serverUrl: System.dataDomain);
...
ThinkingAnalytics.enableAutoTrack();
```

2. 在boot.dart中加入登录登出的上报

```dart
void _onLogout(String type, dynamic value) {
  ThinkingAnalytics.logout();
  ...
}

void _onLogin(String type, dynamic data) {
  ThinkingAnalytics.login(Session.uid.toString());
  ...
}
```

3. 事件上报

```dart
// 上报一条事件数据
ThinkingAnalytics.track('example_event');
// 开始记录某个事件的时长，直到用户上传该事件为止
ThinkingAnalytics.timeEvent(event.name);
// 设置公共事件属性
ThinkingAnalytics.setSuperProperties(properties);
// 设置用户属性
ThinkingAnalytics.user_set(properties);
// 立即上传数据
ThinkingAnalytics.flush();
```

