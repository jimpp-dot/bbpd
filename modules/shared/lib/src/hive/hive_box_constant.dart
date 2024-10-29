import 'package:hive_flutter/hive_flutter.dart';

/// Hive Box名称
class HiveBoxConstant {
  static const recRoomCloseInfo = 'recRoomCloseInfo'; // 推荐弹窗关闭信息
  static const showSignEntrance = 'showSignEntrance'; //  新手签到入口
  static const lastShowSignTime = 'lastSignShowTime'; //  新手签到面板上次弹出时间
  static const emoji_tab = 'emojiTab'; // 上次选中的表情tab
  static const refuseLocationTime = 'refuseLocationTime'; // 拒绝位置权限的时间戳
  static const showActivityDialog = 'showActivityDialog'; // 展示弹窗
}

/// 存储box名称和密钥
class HiveBoxAesCipher {
  // map来存储box名称和对应的密钥
  static final _keyMap = <String, HiveAesCipher>{};

  // 根据名称获取密钥
  static HiveAesCipher cipherForBox(String boxName) {
    return _keyMap.putIfAbsent(
        boxName, () => HiveAesCipher(Hive.generateSecureKey()));
  }
}
