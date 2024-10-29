import 'dart:async';
import 'package:shared/shared.dart';
import 'package:sqflite/sqflite.dart';

class UserImageCacheHelper {
  static UserImageCacheHelper? _instance;
  static UserImageCacheHelper instance() {
    return _instance ??= UserImageCacheHelper();
  }

  bool showLocalFrame = false;

  Map<int, UserImageCacheItem> userImageCache = {};

  ///表插入
  Future insert(int uid, String icon, String frame) async {
    int num = 0;
    try {
      num = await LocalStorage.db?.insert(
              'user_image',
              {
                'uid': uid,
                'time': DateTime.now().millisecondsSinceEpoch,
                'icon': icon,
                'frame': frame,
              },
              conflictAlgorithm: ConflictAlgorithm.replace) ??
          0;
    } catch (e) {
      Fluttertoast.showToast(msg: 'insert 失败', gravity: ToastGravity.CENTER);
    }
    if (showLocalFrame) {
      userImageCache[uid] = UserImageCacheItem(
        uid: uid,
        icon: icon,
        frame: frame,
      );
    }
    Log.d('UserImageCacheHelper num=$num');
  }

  //查询
  Future query() async {
    try {
      String sql = "select * from user_image order by time desc limit 1000 ";
      Log.d('UserImageCacheHelper query sql=$sql');
      List<Map<String, dynamic>> res =
          await LocalStorage.db?.rawQuery(sql) ?? [];

      if (res.isNotEmpty) {
        for (var item in res) {
          userImageCache[item['uid']] = UserImageCacheItem(
            uid: item['uid'],
            icon: item['icon'],
            frame: item['frame'],
          );
        }

        Log.d('UserImageCacheHelper num=${res.length}');
      }
    } catch (e) {
      Log.d(e);
    }
  }

  UserImageCacheItem? getItem(int uid) {
    return userImageCache[uid];
  }

  String getItemFrame(int uid) {
    UserImageCacheItem? item = getItem(uid);
    if (item != null) {
      return fullFramePath(item.frame);
    }
    return '';
  }

  String fullFramePath(String frame) {
    if (frame.isEmpty) {
      return '';
    }
    if (frame.endsWith('.png')) {
      return Util.getRemoteImgUrl(frame);
    }

    if (!frame.endsWith('.webp')) {
      return '${System.imageDomain}static/effect/$frame.png';
    } else {
      return '${System.imageDomain}static/effect/$frame';
    }
  }
}

class UserImageCacheItem {
  int uid;
  String icon;
  String frame;

  UserImageCacheItem({
    required this.uid,
    required this.icon,
    required this.frame,
  });
}
