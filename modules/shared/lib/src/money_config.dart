import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';

import '../assets.dart';

/// 默认币种: 钻和币
enum MCType {
  diamond, // 钻石  ：1分
  coin, // 币  ：1元
}

/// 账户中钱的种类
enum PriceType {
  diamond, // 钻石
  diamond_score //钻石+点亮积分
}

///
/// 现金配置
///
class MoneyConfig {
  static const int _multipleCoin = 100; // 1币等于100分
  static const int _multipleDiamond = 1; // 1钻等于1分

  static MCType _moneyType = MCType.diamond; //MCType.coin; //默认为币
  static int _multiple = _multipleDiamond; //_multipleCoin; //默认为币的基准

  static void init(MCType type) {
    _moneyType = type;
    if (_moneyType == MCType.diamond) {
      _multiple = _multipleDiamond;
    } else {
      _multiple = _multipleCoin;
    }
  }

  static int get multiple {
    return _multiple;
  }

  ///
  /// money单位为分
  ///
  static String moneyNum(int money, {int fractionDigits = 0}) {
    if (_moneyType == MCType.diamond) {
      return (money / _multiple).toStringAsFixed(0);
    }
    if (fractionDigits == 0) {
      return Util.removeDecimalZeroFormat(money / _multiple);
    }
    return (money / _multiple).toStringAsFixed(fractionDigits);
  }

  static String moneyNumOrder(int money,
      {int fractionDigits = 0, String prefix = ''}) {
    if (BaseConfig.instance.diamondShowCoupon) {
      return '$prefix${Util.removeDecimalZeroFormat(money / 100)}';
    } else {
      return moneyNum(money, fractionDigits: fractionDigits);
    }
  }

  static String get moneyIcon {
    if (_moneyType == MCType.diamond) {
      return R.imagePath('ic_money_diamond.png',
          package: ComponentManager.MANAGER_SETTINGS);
    }
    if (Platform.isIOS || Util.isLocale) {
      return R.imagePath('ic_money_ios.png',
          package: ComponentManager.MANAGER_SETTINGS);
    }
    return R.imagePath('ic_money.png',
        package: ComponentManager.MANAGER_SETTINGS);
    // return Util.moneyIcon;
  }

  /// 点亮积分
  static String get scoreIcon {
    return BaseAssets.shared$ic_union_gold_money_webp;
  }

  static String get moneyIconOrder {
    if (BaseConfig.instance.diamondShowCoupon) {
      return R.imagePath('ic_order_coupon.webp',
          package: ComponentManager.MANAGER_SETTINGS);
    } else {
      return moneyIcon;
    }
  }

  static String get moneyCharmIcon {
    if (_moneyType == MCType.diamond) {
      return R.imagePath('ic_money_diamond.png',
          package: ComponentManager.MANAGER_SETTINGS);
    }
    return R.imagePath('ic_charm.svg',
        package: ComponentManager.MANAGER_SETTINGS);
  }

  static String get moneyIconOld {
    if (Platform.isIOS || Util.isLocale) {
      return R.imagePath('ic_money_ios.png',
          package: ComponentManager.MANAGER_SETTINGS);
    }
    return R.imagePath('ic_money.png',
        package: ComponentManager.MANAGER_SETTINGS);
    // return Util.moneyIcon;
  }

  static String get goldCoinIcon {
    return R.imagePath('ic_gold_coin.png',
        package: ComponentManager.MANAGER_SETTINGS);
  }

  static String get goldBeanIcon {
    return R.imagePath('ic_gold_bean.webp',
        package: ComponentManager.MANAGER_SETTINGS);
  }

  // 币/元/钻
  static String get moneyName {
    if (_moneyType == MCType.diamond) {
      return K.base_money_diamond;
    }
    if (Platform.isIOS || Util.isLocale) {
      return K.base_coin;
    } else {
      return K.base_yuan;
    }
    // return Util.coin;
  }

  static String get moneyNameOrder {
    if (BaseConfig.instance.diamondShowCoupon) {
      return K.base_summon_coupon;
    } else {
      return moneyName;
    }
  }

  // 币/钻
  static String get moneyName1 {
    if (_moneyType == MCType.diamond) {
      return K.base_money_diamond;
    }
    return K.base_coin;
  }

  // 币/魅力值/钻 单位分
  static String get moneyName2 {
    if (_moneyType == MCType.diamond) {
      return K.base_money_diamond;
    }
    return K.base_money_coin_or_av1;
  }

  // 币/魅力值/钻 单位分
  static String get moneyName3 {
    if (_moneyType == MCType.diamond) {
      return K.base_money_diamond;
    }
    return K.base_money_coin_or_av2;
  }

  // 币/钻石
  static String get moneyName4 {
    if (_moneyType == MCType.diamond) {
      return K.base_money_diamond_w;
    }
    return K.base_coin;
  }

  // 元
  static String get moneyNameYuan {
    return K.base_yuan;
  }

  // 折扣价 单位分
  static String originPrice(int money) {
    return "${(money ~/ _multiple)}$moneyName";
  }

  // 折扣价 单位分
  static String originPrice1(int money) {
    return "${(money ~/ _multiple)}$moneyName1";
  }

  // 折扣价 单位分
  static String originPrice2(int money) {
    return "${(money ~/ _multiple)}";
  }

  /// 单位分
  static String basePrice(int money) {
    return "${moneyNum(money, fractionDigits: 0)}$moneyName";
  }

  /// 单位分
  static String basePrice1(int money) {
    return "${moneyNum(money, fractionDigits: 0)}$moneyName2";
  }

  ///显示为钻
  static bool isDiamond() {
    return _moneyType == MCType.diamond;
  }

  static String getMoneyIconByType(String moneyType) {
    if ('bean' == moneyType) {
      return goldBeanIcon;
    } else if ('coin' == moneyType) {
      return goldCoinIcon;
    } else {
      return moneyIcon;
    }
  }

  /// 金豆/金币/钻石
  static String getMoneyTxtByType(String moneyType) {
    if ('bean' == moneyType) {
      return K.base_money_gold_bean;
    } else if ('coin' == moneyType) {
      return K.base_money_gold_coin;
    } else {
      return K.base_money_diamond_w;
    }
  }
}
