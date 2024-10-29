import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:bbpd/main.dart';

///主app(主模块)中暴露给其它子模块的能力
class MainManager extends IMainManager {
  /// TODO: Check memory leaks. Interesting to integrate.
  // @override
  // void watch(Object obj) {
  //   if (!kReleaseMode) {
  //     ExpandoUtil.instance.watch(obj);
  //   }
  // }

  // @override
  // void checkLeak() {
  //   if (!kReleaseMode) {
  //     ExpandoUtil.instance.checkLeak();
  //   }
  // }

  @override
  void restart() {
    initTracker();
  }

  @override
  void openImageAndPop(BuildContext context, int uid, PageRefer refer) {
    int index =
        appNavigatorObserver.getIndex((name) => name.startsWith('/image'));

    if (index > -1) {
      Navigator.of(context).popUntil((route) {
        if (route.settings.name != null) {
          return route.settings.name?.startsWith('/image') ?? false;
        } else {
          return false;
        }
      });
    } else {
      Navigator.of(context).pop();
//      showImage(context, uid);
      IPersonalDataManager personalDataManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      personalDataManager.openImageScreen(context, uid, refer: refer);
    }
  }

  @override
  int appNavigatorObserverGetIndex(String path) {
    int index = appNavigatorObserver.getIndex((String name) {
      if (name.startsWith(path)) {
        return true;
      }
      return false;
    });
    return index;
  }

  String getFriendsListTypeFriendStr() {
    return FriendsListType.Friend;
  }

  String getFriendsListTypeFollowStr() {
    return FriendsListType.Follow;
  }

  @override
  void openBannerScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const BannerScreen(),
      settings: const RouteSettings(name: '/banner'),
    ));
  }

  Widget getSoundButton(
      {String? audioUrl, int duration = 0, Widget? tagWidget}) {
    return SoundButton(
      audioUrl: audioUrl,
      duration: duration,
      tagWidget: tagWidget,
    );
  }

  @override
  void audioPlayStop() {
    AudioPlay.instance().stop();
  }

  @override
  void openMessageScreen(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
    eventCenter.emit('HomePage.JumpToMessagePage');
  }

  @override
  void showDeveloperOptionScreen(BuildContext context) {
    DeveloperOptionScreen.show(context);
  }

  @override
  void openProfileScreen(BuildContext context) {
    //此app空实现即可，后续有需要再优化
  }

  void showGameUserList(BuildContext context, int cid, String name) {
    //皮队友逻辑，不需要实现
  }

  /// 事件统计(主要是推广的统计，appsflyer 或者 branch，如果没有接入，就空实现)
  @override
  void trackEvent(String eventName, {Map<String, dynamic>? eventValue}) {}
}
