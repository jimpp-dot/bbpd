import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'model.g.dart';

/// 连击之前请求的接口数据
class ComboPre {
  final bool success;
  final String? msg;
  final int comboId;

  ComboPre({this.success = false, this.msg, this.comboId = 0});
}

class TabConfig extends Equatable {
  final String? name;
  final DisplayPage? tabPage;

  const TabConfig({
    this.name,
    this.tabPage,
  });

  factory TabConfig.fromJson(Map<String, dynamic> json) {
    return TabConfig(
      name: Util.parseStr(json["name"]) ?? '',
      tabPage: parseDisplayPage(json["type"]),
    );
  }

  @override
  List<Object> get props {
    if (name?.isNotEmpty == true && tabPage != null) {
      return [name!, tabPage!];
    }
    return [];
  }
}

class Model {
  int id = 0;
  int totalMoney = 0; // 账户余额
  int goldCoin = 0; // 金币
  int goldBean = 0; // 金豆
  String? company; // 公司协议说明
  bool showBuyHeader = false; // 购买头像框是否弹窗
  bool openBoxUseMoney = false; // 水晶不足时，是否允许用钱开箱子

  // 礼物
  List<Gift>? gifts;
  List<Gift>? privilegeGift; // 特权礼物
  /// 酒桌礼物
  List<Gift>? pubDrinks;
  List<KeyCommodity>? keyCommodity; // 拥有的【箱子/礼盒】对应的【钥匙/水晶】数量
  List<GlobalBox>? globalBox; // 所有的箱子礼物
  Map? chooseNumConfig; //礼物选择数量
  Map? chooseBoxNumConfig; //箱子选择数量
  List<DecorateCommodity>? decorates; // 装扮
  List<PKCommodity>? pks; // PK道具

  // 背包
  List<Bag>? bags;
  Map<int, KeyCoupon> keyCoupons = {}; // 钥匙券
  Map? globalPiece; // 集字符
  int auctionMoney = 0; //拍卖房，打赏金额
  int hitTest = 0; // 余额不足直接弹充值弹窗A/B测试
  int limitMoney = 0; // 小于多少钱，余额不足，充值弹窗
  FirstPayGift? firstPayGift; // 首充活动

  List<ShopCommodity>? shopCommodities;
  Map? keyName;

  List<TabConfig>? tabConfigList;

  int tabIndex = 0;
  List<Gift>? interactGift;

  Model.fromJson(GiftScene giftScene, Map json) {
    dynamic giftList = json['data'];
    dynamic interact = json['interact_gift'];
    if (interact != null && interact is List) {
      interactGift = List<Gift>.from(interact.map((e) => Gift.fromJson(e)));
    }

    tabIndex = Util.parseInt(json['tab_index']);

    if (giftList != null && giftList is List) {
      gifts = List<Gift>.from(giftList.map((i) {
        Gift gift = Gift.fromJson(i);
        if (gift.isDiyGift) {
          /// DIY礼物二次处理
          int defaultIndex = gift.diyDefaultIndex;
          if (defaultIndex < 0 || defaultIndex >= gift.diyGift!.length) {
            defaultIndex = 0;
          }
          return gift.diyGift![defaultIndex]
              ?.copyWithDiy(gift.diyGift!, defaultIndex);
        }
        return gift;
      }));
    } else {
      gifts = [];
    }

    if (json.containsKey('tab_config')) {
      tabConfigList = Util.parseList<TabConfig>(
          json['tab_config'], (e) => TabConfig.fromJson(e));
    }

    if (json['privilegeGift'] != null && json['privilegeGift'] is List) {
      privilegeGift = List<Gift>.from(json['privilegeGift'].map((i) {
        Gift gift = Gift.fromJson(i);
        if (gift.isDiyGift) {
          /// DIY礼物二次处理
          int defaultIndex = gift.diyDefaultIndex;
          if (defaultIndex < 0 || defaultIndex >= gift.diyGift!.length) {
            defaultIndex = 0;
          }
          return gift.diyGift![defaultIndex]
              ?.copyWithDiy(gift.diyGift!, defaultIndex);
        }
        return gift;
      }));
    } else {
      privilegeGift = [];
    }

    if (json.containsKey('pub_drinks') && json['pub_drinks'] is List) {
      pubDrinks = Util.parseList(json['pub_drinks'], (e) => Gift.fromJson(e));
    } else {
      pubDrinks = const [];
    }

    if (json.containsKey('commodities') && json['commodities'] is List) {
      List list = json['commodities'];
      bags = List<Bag>.from(list.map((i) => Bag.fromJson(i)));
    }

    if (json.containsKey('decorates') && json['decorates'] is List) {
      List list = json['decorates'];
      decorates = List<DecorateCommodity>.from(
          list.map((e) => DecorateCommodity.fromJson(e)));
    }

    if (json.containsKey('live_props') && json['live_props'] is List) {
      List list = json['live_props'];
      pks = List<PKCommodity>.from(list.map((e) => PKCommodity.fromJson(e)));
    }

    goldCoin = Util.parseInt(json['gold_coin']);
    goldBean = Util.parseInt(json['money_coupon']);
    auctionMoney = Util.parseInt(json["auctionMoney"]);

    hitTest = Util.parseInt(json["hitTest"]);
    limitMoney = Util.parseInt(json["limitMoney"]);
    if (json['pay_gift'] != null && json['pay_gift'] is Map) {
      firstPayGift = FirstPayGift.fromJson(json['pay_gift']);
    } else {
      firstPayGift = null;
    }

    if (json.containsKey('choose_num_config') &&
        json['choose_num_config'] is Map) {
      chooseNumConfig = json['choose_num_config'];
    }
    if (json.containsKey('choose_box_num_coinfig') &&
        json['choose_box_num_coinfig'] is Map) {
      chooseBoxNumConfig = json['choose_box_num_coinfig'];
    }

    if (giftScene == GiftScene.order) {
      totalMoney = Util.parseInt(json['money']) + Util.parseInt(json['mo']);
    } else {
      totalMoney = Util.parseInt(json['money']);

      if (json.containsKey('company') && json['company'] is String) {
        company = json['company'];
      }
      if (json.containsKey('showBuyHeader')) {
        showBuyHeader = Util.parseInt(json['showBuyHeader']) > 0;
      }
      if (json.containsKey('openBoxUseMoney')) {
        openBoxUseMoney = Util.parseInt(json['openBoxUseMoney']) > 0;
      }

      if (json['keyCoupons'] != null && json['keyCoupons'] is Map) {
        json['keyCoupons'].forEach((dynamic cid, dynamic tmp) {
          keyCoupons[Util.parseInt(cid)] = KeyCoupon.fromJson(tmp);
        });
      }
      if (json.containsKey('globalBox') && json['globalBox'] is List) {
        List list = json['globalBox'];
        globalBox =
            List<GlobalBox>.from(list.map((i) => GlobalBox.fromJson(i)));
      }
      if (json.containsKey('keyCommodity') && json['keyCommodity'] is List) {
        List list = json['keyCommodity'];
        keyCommodity =
            List<KeyCommodity>.from(list.map((i) => KeyCommodity.fromJson(i)));
      }
      if (json.containsKey('globalPiece') && json['globalPiece'] is Map) {
        globalPiece = json['globalPiece'];
      }

      List? shopCommodityList = json['shopCommodities'];
      if (shopCommodityList != null) {
        shopCommodities = List<ShopCommodity>.from(
            shopCommodityList.map((i) => ShopCommodity.fromJson(i)));
      }

      if (json.containsKey('key_name') && json['key_name'] is Map) {
        keyName = json['key_name'];
      }
    }
  }
}

class AccountMoney {
  int totalMoney; // 账户余额
  int goldCoin; // 金币
  int goldBean; // 金豆

  AccountMoney({this.totalMoney = 0, this.goldBean = 0, this.goldCoin = 0});
}

class GlobalBox {
  int gid = 0;
  String? image; // 开箱子礼物的icon
  String? type;

  GlobalBox.fromJson(Map json) {
    gid = Util.parseInt(json['gid']);
    image = json['image'];
    type = json['type'];
  }
}

class KeyCommodity {
  String? name;
  int num = 0;
  int extId = 0;

  KeyCommodity.fromJson(Map json) {
    name = json['name'];
    num = Util.parseInt(json['num']);
    extId = Util.parseInt(json['ext_id']);
  }
}

class Bag {
  int id = 0;
  String? name;
  int price = 0;
  int maxNum = 0;
  int num = 0;
  String? image; // 物品icon
  String? giftImage; // 开箱子/礼盒对应的礼物icon
  String? type;
  String? giftType; // 普通礼物：normal  金币礼物：coin
  String? couponType;
  int cid = 0;
  int boxNum = 0;
  int keyNum = 0;
  int keyPrice = 0;
  int ductionMoney = 0;
  int onlyNewPay = 0;
  int isContinue = 0; // 爵位是否续费
  String? extName;
  int used = 0; // 物品是否使用过
  int inUse = 0; // 物品是否正在使用
  int period = 0; // 有效期(天)
  int periodHour = 0; // 有效期(小时)
  int periodEnd = 0; // 过期时间
  int star = 0; // xxx
  int extId = 0;
  String? moneyType;

  bool tryVoice = false;
  int jumpRid = 0;
  String? jumpType;

  Bag.fromJson(Map json) {
    id = Util.parseInt(json['id']);
    name = json['name'];
    price = Util.parseInt(json['price']);
    maxNum = Util.parseInt(json['maxNum']);
    num = Util.parseInt(json['num']);
    image = json['image'];
    giftImage = json['giftImage'];
    type = json['type'];
    giftType = json['gift_type'];
    couponType = json['coupon_type'];
    cid = Util.parseInt(json['cid']);
    boxNum = Util.parseInt(json['boxNum']);
    keyNum = Util.parseInt(json['keyNum']);
    keyPrice = Util.parseInt(json['keyPrice']);
    ductionMoney = Util.parseInt(json['duction_money']);
    onlyNewPay = Util.parseInt(json['only_newpay']);
    isContinue = Util.parseInt(json['is_continue']);
    extName = json['ext_name'];
    used = Util.parseInt(json['used']);
    inUse = Util.parseInt(json['in_use']);
    period = Util.parseInt(json['period']);
    periodHour = Util.parseInt(json['period_hour']);
    periodEnd = Util.parseInt(json['period_end']);
    star = Util.parseInt(json['star']);
    extId = Util.parseInt(json['ext_id']);
    moneyType = Util.parseStr(json['money_type']) ?? '';
    tryVoice = Util.parseBool(json['try_voice']);
    jumpRid = Util.parseInt(json['jump_rid']);
    jumpType = Util.parseStr(json['jump_type']) ?? '';
  }
}

class KeyCoupon {
  int id = 0;
  String? name;
  int ductionMoney = 0;
  int onlyNewPay = 0;
  int state = 0;

  KeyCoupon.fromJson(Map json) {
    id = Util.parseInt(json['id']);
    name = json['name'];
    ductionMoney = Util.parseInt(json['duction_money']);
    onlyNewPay = Util.parseInt(json['only_newpay']);
    state = Util.parseInt(json['state']);
  }
}

@JsonSerializable(createToJson: false)
class Commodity {
  @JsonKey(fromJson: Util.parseInt)
  final int cid;
  final String type;
  final String name;

  @JsonKey(fromJson: Util.parseInt)
  final int price;

  @JsonKey(fromJson: Util.parseInt)
  final int period;

  @JsonKey(name: 'period_hour', fromJson: Util.parseInt)
  final int periodHour;

  @JsonKey(name: 'ext_id', fromJson: Util.parseInt)
  final int extId;

  final String image;

  Commodity(
    this.cid,
    this.type,
    this.name,
    this.price,
    this.period,
    this.periodHour,
    this.extId,
    this.image,
  );

  factory Commodity.fromJson(Map<String, dynamic> json) =>
      _$CommodityFromJson(json);
}

@JsonSerializable(createToJson: false)
class CouponInfo extends Commodity {
  @JsonKey(fromJson: Util.parseInt)
  final int id;

  @JsonKey(fromJson: Util.parseInt)
  final int num;

  @JsonKey(name: 'coupon_type')
  final String couponType;

  @JsonKey(name: 'duction_money', fromJson: Util.parseInt)
  final int ductionMoney;

  @JsonKey(name: 'only_newpay', fromJson: Util.parseInt)
  final int onlyNewPay;

  @JsonKey(name: 'state', fromJson: Util.parseInt)
  final int state;

  CouponInfo(
    int cid,
    String type,
    String name,
    int price,
    int period,
    int periodHour,
    int extId,
    String image,
    this.id,
    this.num,
    this.couponType,
    this.ductionMoney,
    this.onlyNewPay,
    this.state,
  ) : super(cid, type, name, price, period, periodHour, extId, image);

  factory CouponInfo.fromJson(Map<String, dynamic> json) =>
      _$CouponInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class ShopCommodity extends Commodity {
  final CouponInfo coupon;

  ShopCommodity(
    int cid,
    String type,
    String name,
    int price,
    int period,
    int periodHour,
    int extId,
    String image,
    this.coupon,
  ) : super(cid, type, name, price, period, periodHour, extId, image);

  factory ShopCommodity.fromJson(Map<String, dynamic> json) =>
      _$ShopCommodityFromJson(json);
}

@JsonSerializable(createToJson: false)
class DecorateCommodity {
  @JsonKey(fromJson: Util.parseInt)
  final int id;
  final String name;
  final String desc;
  final String content;
  final String image;
  @JsonKey(name: 'decorate_type', fromJson: formatGoodsType)
  final ShopMailCommodityType decorateType;
  @JsonKey(name: 'decorate_type_name')
  final String decorateTypeName;

  @JsonKey(name: 'corner_desc')
  final String cornerDesc;

  @JsonKey(name: 'bubble_desc')
  final String bubbleDesc;

  @JsonKey(name: 'bubble_front_color')
  final String bubbleFontColor;

  // money表示 主app币 coin表示金币，piece 碎片, union_silver联盟银币， union_gold联盟金币
  @JsonKey(name: 'money_type')
  final String moneyType;

  /// 币的价格返回的分，显示的时候要除以100
  @JsonKey(fromJson: Util.parseInt)
  final int price;

  final String period; // 有效期(天)

  final CouponInfo coupon;

  // 折扣，除以100
  @JsonKey(name: 'duction_rate')
  final int ductionRate;

  DecorateCommodity(
    this.id,
    this.name,
    this.desc,
    this.content,
    this.image,
    this.decorateType,
    this.decorateTypeName,
    this.cornerDesc,
    this.bubbleDesc,
    this.bubbleFontColor,
    this.moneyType,
    this.price,
    this.period,
    this.coupon,
    this.ductionRate,
  );

  factory DecorateCommodity.fromJson(Map<String, dynamic> json) =>
      _$DecorateCommodityFromJson(json);

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
}

/// PK道具
@JsonSerializable(createToJson: false)
class PKCommodity {
  @JsonKey(name: 'pid')
  final int id;
  @JsonKey(name: 'url')
  final String? icon;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'pnum')
  final int num;
  @JsonKey(name: 'desc')
  final String? desc; // 道具描述
  @JsonKey(name: 'expired')
  final int expired; // 道具过期时间

  PKCommodity(
      {this.id = 0,
      this.icon,
      this.name,
      this.num = 0,
      this.desc,
      this.expired = 0});

  factory PKCommodity.fromJson(Map<String, dynamic> json) =>
      _$PKCommodityFromJson(json);
}
