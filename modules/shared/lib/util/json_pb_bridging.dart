import 'dart:ui';
import 'package:shared/shared.dart';

/// 本类用于将 Union 中用到的 PBModel 和 JsonModel 进行桥接转换
class UnionJsonPbBridging {
  static ShopMailCommodity commodityFromReward(UnionNormalReward reward) {
    GiftColorConfig colorConfig = GiftColorConfig(
        bgColor: reward.colorConfig.bgColors,
        textColor: reward.colorConfig.textColor,
        itemBgColor: reward.colorConfig.itemBgColor);

    List<CommodityGift> gifts = <CommodityGift>[];
    for (UnionCommodityGift uGift in reward.gifts) {
      CommodityGift cGift = CommodityGift(
          id: uGift.id,
          cid: uGift.cid,
          cType: uGift.ctype,
          groupId: uGift.groupId,
          subType: uGift.subType,
          cNum: uGift.cNum,
          image: uGift.image,
          name: uGift.name,
          type: uGift.name,
          bubbleDesc: uGift.bubbleDesc,
          avatar: uGift.avatar,
          bubbleFontColor: uGift.bubbleFontColor,
          desc: uGift.desc,
          imageBg: uGift.imageBg,
          price: uGift.price,
          period: uGift.period);
      gifts.add(cGift);
    }

    var commodity = ShopMailCommodity(
        cid: reward.cid,
        boxType: reward.boxType,
        name: reward.name,
        type: reward.type,
        desc: reward.desc,
        content: reward.content,
        avatar: reward.avatar,
        image: reward.image,
        imagePop: reward.imagePop,
        imageBackground: reward.imageBg,
        isLimited: reward.isLimited,
        cornerIcon: reward.cornerIcon,
        cornerDesc: reward.cornerDesc,
        bubbleDesc: reward.bubbleDesc,
        bubbleFontColor: reward.bubbleFrontColor,
        cType: reward.cType,
        cNum: reward.cNum,
        moneyType: reward.moneyType,
        price: reward.price,
        num: reward.num,
        subType: reward.subType,
        returnNum: reward.returnNum,
        filterTabName: reward.filterTabName,
        colorConfig: colorConfig,
        gifts: gifts,
        liveOnly: reward.liveOnly,
        liveLabel: reward.liveLabel,
        jumpPath: reward.jumpPath,
        inUseDesc: reward.inUseDesc);
    return commodity;
  }

  static UnionNormalReward rewardFromCommodity(ShopMailCommodity commodity) {
    var colorConfig = UnionGiftColorConfig(
        bgColors: commodity.colorConfig?.bgColor ?? '',
        textColor: commodity.colorConfig?.textColor ?? '',
        itemBgColor: commodity.colorConfig?.itemBgColor ?? '');

    List<UnionCommodityGift> gifts = <UnionCommodityGift>[];
    if (commodity.gifts != null) {
      for (CommodityGift uGift in commodity.gifts!) {
        var cGift = UnionCommodityGift(
            id: uGift.id,
            cid: uGift.cid,
            ctype: uGift.cType,
            groupId: uGift.groupId,
            subType: uGift.subType,
            cNum: uGift.cNum,
            image: uGift.image,
            name: uGift.name,
            type: uGift.name,
            bubbleDesc: uGift.bubbleDesc,
            avatar: uGift.avatar,
            bubbleFontColor: uGift.bubbleFontColor,
            desc: uGift.desc,
            imageBg: uGift.imageBg,
            price: uGift.price,
            period: uGift.period);
        gifts.add(cGift);
      }
    }

    var reward = UnionNormalReward(
        cid: commodity.cid,
        boxType: commodity.boxType,
        name: commodity.name,
        type: commodity.type,
        desc: commodity.desc,
        content: commodity.content,
        avatar: commodity.avatar,
        image: commodity.image,
        imagePop: commodity.imagePop,
        imageBg: commodity.imageBackground,
        isLimited: commodity.isLimited,
        cornerIcon: commodity.cornerIcon,
        cornerDesc: commodity.cornerDesc,
        bubbleDesc: commodity.bubbleDesc,
        bubbleFrontColor: commodity.bubbleFontColor,
        cType: commodity.cType,
        cNum: commodity.cNum,
        moneyType: commodity.moneyType,
        price: commodity.price,
        num: commodity.num,
        subType: commodity.subType,
        returnNum: commodity.returnNum,
        filterTabName: commodity.filterTabName,
        colorConfig: colorConfig,
        gifts: gifts,
        liveOnly: commodity.liveOnly,
        liveLabel: commodity.liveLabel,
        jumpPath: commodity.jumpPath,
        inUseDesc: commodity.inUseDesc);
    return reward;
  }

  static ShopMailCommodity commodityFromUnionGift(UnionCommodityGift gift) {
    var commodity = ShopMailCommodity(
        cid: gift.cid,
        boxType: null,
        name: gift.name,
        type: gift.type,
        desc: gift.desc,
        content: null,
        avatar: gift.avatar,
        image: gift.image,
        imagePop: null,
        imageBackground: gift.imageBg,
        isLimited: null,
        cornerIcon: null,
        cornerDesc: null,
        bubbleDesc: gift.bubbleDesc,
        bubbleFontColor: gift.bubbleFontColor,
        cType: gift.ctype,
        cNum: gift.cNum,
        moneyType: gift.period,
        price: gift.price,
        num: null,
        subType: gift.subType,
        returnNum: null,
        filterTabName: null,
        colorConfig: null,
        gifts: null,
        liveOnly: 0,
        liveLabel: null,
        jumpPath: null,
        inUseDesc: null);
    return commodity;
  }

  static CommodityGift giftFromUnionGift(UnionCommodityGift gift) {
    return CommodityGift(
        id: gift.id,
        cid: gift.cid,
        cType: gift.ctype,
        groupId: gift.groupId,
        subType: gift.subType,
        cNum: gift.cNum,
        image: gift.image,
        name: gift.name,
        type: gift.type,
        bubbleDesc: gift.bubbleDesc,
        avatar: gift.avatar,
        bubbleFontColor: gift.bubbleFontColor,
        desc: gift.desc,
        imageBg: gift.imageBg,
        price: gift.price,
        period: gift.period);
  }
}

extension ColorParsing on UnionBoxListResp_List {
  Color get backgroundColor =>
      Util.parseColor(colorConfig.bgColors, HexColor('#FFD988'))!;

  Color get allTextColor =>
      Util.parseColor(colorConfig.textColor, HexColor('#553817'))!;

  Color get itemBackgroundColor =>
      Util.parseColor(colorConfig.itemBgColor, HexColor('#493B1F'))!;
}
