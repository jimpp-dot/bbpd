import 'package:shared/shared.dart';

extension CollectionRoomStringExtension on String {
  /// 座驾
  bool get isMountsType => this == CollectionRoomUtil.mountsTypeKey;

  /// 头像框
  bool get isAvatarFrameType => this == CollectionRoomUtil.avatarFrameTypeKey;
}

class CollectionRoomUtil {
  /// 头像框
  static const String avatarFrameTypeKey = "header";

  /// 座驾
  static const String mountsTypeKey = "mounts";

  /// 聊天气泡
  static const String bubbleTypeKey = "bubble";

  /// 入场横幅
  static const String effectTypeKey = "effect";

  /// 麦上光圈
  static const String micRingTypeKey = "ring";

  /// 对外展示的收藏品发生变化
  static String messageDisplayItemsDidChange =
      "event.collectionRoom.displayItemDidChange";

  /// 进入收藏室上报
  static reportEnterCollectionRoomPage() {
    Tracker.instance.track(TrackEvent.collect_room_use, properties: {
      'uid': Session.uid,
    });
  }
}
