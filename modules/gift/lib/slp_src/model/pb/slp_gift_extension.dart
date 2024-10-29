import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SpecialGiftSendInfo {
  int giftNum = 0; //礼物数量
  int totalNum = 0; //礼物数量 * 赠送对象数量
  List<int> selectUserId = [];
//其他特殊礼物字段自行扩展
}

extension BbGiftPanelDataAtion on BbGiftPanelData {
  int totalMoney(GiftScene giftScene) {
    if (giftScene == GiftScene.order) {
      return extend.money.toInt() + extend.moneyOrder.toInt();
    } else {
      return extend.money.toInt();
    }
  }
}

extension BbGiftPanelGiftAction on BbGiftPanelGift {
  String get giftIcon {
    return Util.validStr(icon) ? Util.parseIcon(icon) : Util.giftImgUrl(id);
  }

  String giftIconSpecialPlay(BbGiftPanelSpecialPlayItem? item) {
    if (item != null) {
      return Util.validStr(item.icon)
          ? Util.parseIcon(item.icon)
          : Util.giftImgUrl(item.newGiftId);
    } else {
      return giftIcon;
    }
  }

  bool get isLocked {
    return privilege.grantStatus == 'lock';
  }

  bool get isVipGift {
    return privilege.grantWay == 'vip';
  }

  bool get isTitleGift {
    return privilege.grantWay == 'title';
  }

  bool get isKaGift {
    return privilege.grantWay == 'ka';
  }

  bool get isKnightGift {
    return privilege.grantWay == 'knight-radio';
  }

  String get privilegeIcon {
    return privilege.grantLimitIcon;
  }

  bool get showTips {
    return (privilege.grantWay.isNotEmpty || jumpPage.isNotEmpty) &&
        (isLocked || privilege.grantStatusShow == 1);
  }

  bool get showGiftSkin {
    return hasSkin();
  }

  bool get isDiyGift {
    return diyGift.isNotEmpty;
  }

  List<String> get icons {
    return privilege.icons;
  }

  ///变声礼物
  bool get isChangeVoice =>
      !Util.isCollectionEmpty(specialPlayItems) &&
      specialPlayItems[0].isChangeVoice;

  ///变色礼物
  bool get isChangeColor =>
      !Util.isCollectionEmpty(specialPlayItems) &&
      specialPlayItems[0].isChangeColor;

  ///涂鸦礼物
  bool get isGraffiti =>
      !Util.isCollectionEmpty(specialPlayItems) &&
      specialPlayItems[0].isGraffiti;

  /// 按打赏对象解锁礼物
  bool get isReceiverLock => Util.validStr(privilege.receiverTag);

  /// 标签礼物
  bool get isTagGift =>
      !Util.isCollectionEmpty(specialPlayItems) &&
      specialPlayItems[0].isTagGift;

  /// 背景特效礼物
  bool get isBgEffectGift =>
      !Util.isCollectionEmpty(specialPlayItems) &&
      specialPlayItems[0].isBgEffectGift;
}

extension BbGiftPanelDiyGiftAction on BbGiftPanelDiyGift {
  String get giftIcon {
    return Util.validStr(icon) ? Util.parseIcon(icon) : Util.giftImgUrl(id);
  }

  bool get isLocked {
    return privilege.grantStatus == 'lock';
  }

  bool get isVipGift {
    return privilege.grantWay == 'vip';
  }

  bool get isTitleGift {
    return privilege.grantWay == 'title';
  }

  bool get isKaGift {
    return privilege.grantWay == 'ka';
  }

  bool get isKnightGift {
    return privilege.grantWay == 'knight-radio';
  }

  String get privilegeIcon {
    return privilege.grantLimitIcon;
  }

  bool get showTips {
    return (privilege.grantWay.isNotEmpty || jumpPage.isNotEmpty) &&
        (isLocked || privilege.grantStatusShow == 1);
  }

  bool get showGiftSkin {
    return skin != null;
  }

  bool get isPubRedPacket {
    return pubRedPacket > 0;
  }
}

extension BbGiftPanelExtendAction on BbGiftPanelExtend {
  int get goldBean {
    return moneyCoupon.toInt();
  }

  int get totalMoney {
    return money.toInt();
  }
}

extension BbGiftPanelTabConfigAction on BbGiftPanelTabConfig {
  GiftTabConfig get toGiftTabConfig {
    return GiftTabConfig(name: name, type: parseDisplayPage(type));
  }
}

class GiftTabConfig {
  String? name;
  DisplayPage? type;

  GiftTabConfig({this.name, this.type});
}

extension BbGiftPanelDecoratesActon on BbGiftPanelDecorates {
  String get bubbleFontColor => bubbleFrontColor;

  Color getTextColor() {
    if (bubbleFontColor.isNotEmpty) {
      return HexColor(bubbleFontColor);
    }
    return Colors.white;
  }

  String get panelTips {
    String desc = '$name$decorateTypeName';
    if (period.isNotEmpty == true) {
      desc = "$desc | $period";
    }
    return desc;
  }

  ShopMailCommodityType get getDecorateType {
    return formatGoodsType(decorateType);
  }
}

extension BbGiftPanelSpecialPlayItemAction on BbGiftPanelSpecialPlayItem {
  String get giftIcon {
    return Util.validStr(icon)
        ? Util.parseIcon(icon)
        : Util.giftImgUrl(newGiftId);
  }

  ///变声礼物
  bool get isChangeVoice => type == 'voice';

  ///变色礼物
  bool get isChangeColor => type == 'color';

  ///涂鸦礼物
  bool get isGraffiti => type == 'graffiti';

  bool get isLocked {
    return grantStatus == 'lock';
  }

  /// 标签礼物
  bool get isTagGift => type == 'impress';

  /// 背景特效礼物
  bool get isBgEffectGift => type == 'bgEffect';
}
