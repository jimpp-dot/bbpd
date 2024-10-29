import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

class VindicateUtil {
  /// 表白活动组件的整体高度
  static double widgetHeight = 604;

  /// 礼物url拼接
  static String gitUrl(int giftId) {
    return 'static/gift_big/$giftId.png';
  }

  static final List<GlobalKey> _roomPositionKeyList = [];

  static GlobalKey getRoomPositionKey({int index = 0}) {
    if (index < _roomPositionKeyList.length) {
      return _roomPositionKeyList[index];
    }

    final newKey = GlobalKey();
    _roomPositionKeyList.add(newKey);

    return newKey;
  }

  static const String VINDICATE_ANIM_DIR = "vindicate_anim";

  static File getMultiframeFile(String fileName) {
    String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
    File file = File(join(baseDir, fileName));
    return file;
  }

  static Future<File?> cacheWebpAnim(String url) async {
    Log.d('VindicateUtil 要下载的资源名称：${url.split('/').last}');
    String baseDir = join(Constant.documentsDirectory.path, VINDICATE_ANIM_DIR);
    await Directory(baseDir).create(recursive: true);
    File file = getMultiframeFile(url.split('/').last);

    if (file.existsSync()) {
      Log.d('VindicateUtil 该资源已下载');
      return file;
    }

    return await _downloadAnim(url, file);
  }

  static Future<File?> _downloadAnim(String url, File file) async {
    try {
      await DownloadManager.download(url, file.path);
      return file;
    } catch (e) {
      Log.d('_downloadAnim, DownloadManager.download error: $e');
      return null;
    }
  }

  /* 埋点统计*/

  /// 表白玩法页面打开
  ///
  /// 事件名：gift_play_show
  ///
  /// 触发：1、玩法页面打开时上报 2、tab切换时上报
  ///
  /// [tabIndex] 当前表白玩法展示的页面
  static Future trackGiftPlayShow({required int tabIndex}) async {
    String tabName = '';
    if (tabIndex == 0) {
      tabName = K.room_vindicate_tell_you;
    } else {
      tabName = K.room_vindicate_square;
    }

    final properties = {
      'uid': Session.uid,
      'gift_play_name': K.room_more_menu_title_vindicate,
      'gift_play_name_tab': tabName,
    };

    // Log.d('表白玩法页面切换：$tabName , data = $_properties');

    Tracker.instance.track(
      const TrackEvent('gift_play_show'),
      properties: properties,
    );
  }
}
