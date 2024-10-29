// ignore_for_file: constant_identifier_names

import 'package:chat_room/a.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/shared.dart';

class EmoteUtil {
  EmoteUtil._();

  static get emoteMicPrefix => '${System.imageDomain}static/emote_mid/effect/';

  /// 静态预览图
  static String emoteImgUrl(String key) {
    return '${System.imageDomain}static/emote_mid/static/$key.webp';
  }

  /// 公屏表情动效图
  static String _emoteEffectUrl(String key, int format, int resize) {
    return '$emoteMicPrefix$key${_format(format)}${_resize(resize)}';
  }

  /// 麦上表情动效图 resize
  static String emoteMicEffectUrl(String key, int format) {
    return _emoteEffectUrl(key, format, 200);
  }

  /// 公屏表情动效图 resize
  static String emoteEffectUrl(String key, int format) {
    return _emoteEffectUrl(key, format, 60);
  }

  static String _format(int? format) {
    switch (format) {
      case EmoteImgFormat.GIF:
        return '.gif';
      case EmoteImgFormat.WEBP:
        return '.webp';
      case EmoteImgFormat.RIVE:
        return '.riv';
      default:
        return '.webp';
    }
  }

  static String _resize(int resize) {
    return '?version=$ImageVersion&x-oss-process=image/resize,m_fixed,w_$resize,h_$resize';
  }

  static String getEmoteName(GiftItem item) => item.name;
}

class GiftItem {
  final String name;
  final String key;
  final int duration; // 没啥用
  final bool onlyInMic;
  final int format;

  GiftItem({
    required this.name,
    required this.key,
    this.duration = 2000,
    this.onlyInMic = false,
    this.format = EmoteImgFormat.WEBP,
  });
}

/// 表情图片格式
class EmoteImgFormat {
  /// gif
  static const int GIF = 0;

  /// webp
  static const int WEBP = 1;

  /// rive
  static const int RIVE = 2;
}

enum EmoteTabType {
  NORMAL,
  VIP,
}

class EmoteTab {
  EmoteTabType type;
  String name;
  String icon;

  EmoteTab(this.type, this.name, this.icon);

  static get normal => EmoteTab(EmoteTabType.NORMAL, A.room_emote_types_names[0], RoomAssets.chat_room$emote_room_emote_normal_webp);

  static get vip => EmoteTab(EmoteTabType.VIP, A.room_emote_types_names[1], RoomAssets.chat_room$emote_room_emote_normal_webp);

  static List<EmoteTab> getAll() {
    return [normal, vip];
  }
}
