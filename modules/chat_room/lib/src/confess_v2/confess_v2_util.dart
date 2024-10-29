import 'package:flutter/cupertino.dart';

class ConfessV2Util {
  /// 表白活动组件的整体高度
  static double widgetHeight = 604;

  /// 礼物url拼接
  static String giftUrl(int giftId) {
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
}
