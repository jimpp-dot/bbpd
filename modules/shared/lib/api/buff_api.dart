// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:shared/shared.dart';

class BuffApi {
  /// [scene] 1:标识房间面板请求的,
  ///
  static Future<ResHomeProfile> getHomeProfileData(
    int uid,
    int rid, {
    int scene = 0,
    bool isSuper = false,
    bool? onMic,
    String? searchContent,
  }) async {
    String url = '${System.domain}go/yy/profile/home';
    try {
      XhrResponse response = await Xhr.get(
        url,
        queryParameters: {
          'uid': '$uid',
          'rid': '$rid',
          'ver': '6',
          'scene': '$scene',
          if (isSuper) 'is_super': '1',
          if (onMic != null) 'in_mic': (onMic ? 1 : 0),
          if (searchContent != null) 'search_content': searchContent,
        },
        pb: true,
        throwOnError: true,
      );
      return ResHomeProfile.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHomeProfile(msg: e.toString(), success: false);
    }
  }

  static Future<ResHomeSyncProfile> getHomeProfileSyncData(int uid, int rid) async {
    String url = '${System.domain}go/yy/profile/homesync';
    try {
      XhrResponse response = await Xhr.get(url, queryParameters: {'uid': '$uid', 'rid': '$rid'}, pb: true);
      return ResHomeSyncProfile.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHomeSyncProfile(msg: e.toString(), success: false);
    }
  }
}
