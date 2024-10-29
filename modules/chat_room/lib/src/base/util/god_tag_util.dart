import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/foundation.dart';

class GodTagUtil {
  static final Map<int, String> _tagMap = {};
  static Map<int, String> _positionGodTagIcons = {};

  static Future<void> updateGodTags(List<RoomPosition> positions,
      {VoidCallback? callback}) async {
    Map<int, String> cache = {};
    for (RoomPosition position in positions) {
      if (position.uid > 0 && position.godTag > 0) {
        if (_tagMap.containsKey(position.godTag)) {
          // 已经缓存过tag,直接使用缓存
          cache[position.uid] = _tagMap[position.godTag]!;
          continue;
        }
        Map<String, dynamic> configMap =
            await TagConfigDb.queryConfigById(position.godTag);
        if (configMap.isNotEmpty) {
          String tagIcon = configMap[TagConfigDb.columnIcon] ?? '';
          _tagMap[position.godTag] = tagIcon;
          cache[position.uid] = tagIcon;
        }
      }
    }
    _positionGodTagIcons = cache;
    callback?.call();
  }

  static String getGodTagByUid(int? uid) =>
      Util.getRemoteImgUrl(_positionGodTagIcons[uid ?? 0] ?? '');
}
