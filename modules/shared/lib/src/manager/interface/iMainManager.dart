import 'package:shared/util/page_refer.dart';
import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class IMainManager extends IResourceLoader {
  void restart();

  ///openImageAndPop
  void openImageAndPop(BuildContext context, int uid, PageRefer refer);

  ///获取path对应的appNavigatorObserver的index
  int appNavigatorObserverGetIndex(String path);

  ///打开
  void openBannerScreen(BuildContext context);

  ///停止首页在播放的
  void audioPlayStop();

  /// 打开消息页
  void openMessageScreen(BuildContext context);

  /// 事件统计(主要是推广的统计，appsflyer 或者 branch，如果没有接入，空实现)
  void trackEvent(String eventName, {Map<String, dynamic>? eventValue});

  void showDeveloperOptionScreen(BuildContext context);

  /// 打开Profile页
  void openProfileScreen(BuildContext context);
}
