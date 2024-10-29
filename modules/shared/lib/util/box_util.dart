import 'package:flutter/material.dart';

import '../shared.dart';
import '../k.dart';

enum BoxGameType {
  None, // 无
}

class BoxUtil {
  static BoxGameType getBoxGameType(int star) {
    BoxGameType type = BoxGameType.None;
    return type;
  }

  // 箱子相关文案
  static String? _goldBoxName;
  static String? _silverBoxName;
  static String? _copperBoxName;
  static String? _goldKeyName;
  static String? _silverKeyName;
  static String? _copperKeyName;
  static String? _commonBoxName;
  static String? _commonKeyName;
  static String? _boxActName;

  static void initBoxKeyName() {
    Map starInfo = Session.getMap('star');
    if (starInfo['box_name'] != null && starInfo['box_name'] is Map) {
      Map boxName = starInfo['box_name'];
      if (boxName.length >= 3) {
        final keysAsc = boxName.keys.toList()..sort((a, b) => a.compareTo(b));
        _copperBoxName = boxName[keysAsc[0]];
        _silverBoxName = boxName[keysAsc[1]];
        _goldBoxName = boxName[keysAsc[2]];
      }
    }

    if (starInfo['key_name'] != null && starInfo['key_name'] is Map) {
      Map keyName = starInfo['key_name'];
      if (keyName.length >= 3) {
        final keysAsc = keyName.keys.toList()..sort((a, b) => a.compareTo(b));
        _copperKeyName = keyName[keysAsc[0]];
        _silverKeyName = keyName[keysAsc[1]];
        _goldKeyName = keyName[keysAsc[2]];
      }
    }

    if (starInfo['comm_name'] != null && starInfo['comm_name'] is Map) {
      Map commName = starInfo['comm_name'];
      _commonBoxName = Util.parseStr(commName['box']);
      _commonKeyName = Util.parseStr(commName['key']);
    }

    if (starInfo['act_name'] != null && starInfo['act_name'] is String) {
      String actName = Util.notNullStr(starInfo['act_name']);
      if (actName.isNotEmpty) {
        _boxActName = actName;
      }
    }
  }

  static String get goldBoxName {
    if (_goldBoxName != null) {
      return _goldBoxName!;
    }

    initBoxKeyName();
    return _goldBoxName ?? '';
  }

  static String get silverBoxName {
    if (_silverBoxName != null) {
      return _silverBoxName!;
    }

    initBoxKeyName();
    return _silverBoxName ?? '';
  }

  static String get copperBoxName {
    if (_copperBoxName != null) {
      return _copperBoxName!;
    }

    initBoxKeyName();
    return _copperBoxName ?? '';
  }

  static String get goldKeyName {
    if (_goldKeyName != null) {
      return _goldKeyName!;
    }

    initBoxKeyName();
    return _goldKeyName ?? '';
  }

  static String get silverKeyName {
    if (_silverKeyName != null) {
      return _silverKeyName!;
    }

    initBoxKeyName();
    return _silverKeyName ?? '';
  }

  static String get copperKeyName {
    if (_copperKeyName != null) {
      return _copperKeyName!;
    }

    initBoxKeyName();
    return _copperKeyName ?? '';
  }

  static String get commonBoxName {
    if (_commonBoxName != null) {
      return _commonBoxName!;
    }

    initBoxKeyName();
    return _commonBoxName ?? '';
  }

  static String get commonKeyName {
    if (_commonKeyName != null) {
      return _commonKeyName!;
    }

    initBoxKeyName();
    return _commonKeyName ?? K.base_common_key_name;
  }

  static String get boxActName {
    if (_boxActName != null) {
      return _boxActName!;
    }

    initBoxKeyName();
    return _boxActName ?? K.base_box_act_name;
  }

  /// 打开对应等级的游戏 giftId背包里面开箱子没有giftId 传的是0
  static void showGame(
      {required BuildContext context,
      required int giftId,
      required int starId,
      required int giftNum}) {}

  static String getKeyNameByCid(int cid) {
    if (cid == 7 || cid == 265) {
      return goldKeyName;
    } else if (cid == 6 || cid == 264) {
      return silverKeyName;
    } else {
      return copperKeyName;
    }
  }

  // 获取对应等级的钥匙图片路径
  static String getKeyIconByCid(int cid) {
    switch (cid) {
      case 5:
        return 'ic_key_copper.png';
      case 6:
        return 'ic_key_silver.png';
      case 7:
        return 'ic_key_gold.png';
      default:
        return 'ic_key_copper.png';
    }
  }

  static String getKeyIconByType(String type) {
    int cid = 5;

    if (type == 'silver') {
      cid = 6;
    } else if (type == 'gold') {
      cid = 7;
    }

    return getKeyIconByCid(cid);
  }

  static String getBoxH5({bool needFullUrl = true}) {
    String str = 'k53';

    if (needFullUrl == false) {
      return str;
    }

    return Util.getHelpUrlWithQStr(str);
  }
}
