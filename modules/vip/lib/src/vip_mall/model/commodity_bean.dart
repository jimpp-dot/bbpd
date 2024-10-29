import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

import 'commodity_base.dart';

part 'commodity_bean.g.dart';

/// 购买面板数据结构
@JsonSerializable()
class CommodityBuyInfo extends ShopMailCommodity {
  final List<String> tags;

  @JsonKey(fromJson: Util.parseInt)
  final int money; // 我的存款

  @JsonKey(name: 'saling_on_shop', fromJson: Util.parseInt)
  final int salingOnShop; // 商城类型 8:点亮积分

  @JsonKey(name: 'gold_coin', fromJson: Util.parseInt)
  final int goldCoin; // 我的金币

  @JsonKey(name: 'money_coupon')
  final int goldBean; // 我的金豆

  /*
   shopType: 商城类型（注不能与moneyType等同，因为联盟商城也能用星球币），支付的时候使用，区分购买后的行为
   coin-shop-buy    金币商城
   shop-buy	        星球币商城
   piece            碎片商城
   union_silver     联盟银币商城
   union_privilege  联盟特权商城
   */
  @JsonKey(name: 'shop_type')
  final String shopType;

  // 是否活动获取
  @JsonKey(name: 'is_activity', fromJson: Util.parseInt)
  final int isActivity;

  // 活动跳转页面
  @JsonKey(name: 'jump_page')
  final String jumpPage;

  // 1 表示多sku物品 0表示单sku物品
  @JsonKey(name: 'is_multi_sku', fromJson: Util.parseInt)
  final int isMultiSku;

  @JsonKey(name: 'expire_date')
  final String expireDate;

  // 有效期说明页
  @JsonKey(name: 'expire_date_page')
  final String expireDatePage;

  @JsonKey(name: 'limit_icon')
  final String limitIcon;

  @JsonKey(name: 'limit_desc')
  final String limitDesc;

  // 限制类型 取值 vip title
  @JsonKey(name: 'limit_type')
  final String limitType;

  final List<Item> items;

  @JsonKey(name: 'items_by_score')
  final List<Item> itemsByScore;

  // 碎片余额
  @JsonKey(name: 'piece_balance', fromJson: Util.parseInt)
  final int pieceBalance;

  // 碎片icon
  @JsonKey(name: 'piece_icon')
  final String pieceIcon;

  // 碎片描述
  @JsonKey(name: 'piece_desc')
  final String pieceDesc;

  // 购买成功提示
  @JsonKey(name: 'toast_msg')
  final String toastMsg;

  // 珍珠余额
  @JsonKey(name: 'pearl_balance', fromJson: Util.parseInt)
  final int pearlBalance;

  // 珍珠icon
  @JsonKey(name: 'pearl_icon')
  final String pearlIcon;

  // 珍珠描述
  @JsonKey(name: 'pearl_desc')
  final String pearlDesc;

  @JsonKey(name: 'piece_jump_page')
  final String pieceJumpPage;

  /// 我的积分
  final int score;

  final dynamic extra;

  CommodityBuyInfo(
    int cid,
    String name,
    String type,
    String desc,
    String avatar,
    String image,
    String imageBackground,
    String cornerIcon,
    String cornerDesc,
    int isLimited,
    String bubbleDesc,
    String bubbleFontColor,
    String moneyType,
    this.tags,
    this.money,
    this.salingOnShop,
    this.goldCoin,
    this.shopType,
    this.isActivity,
    this.jumpPage,
    this.isMultiSku,
    this.expireDate,
    this.expireDatePage,
    this.items,
    this.limitIcon,
    this.limitDesc,
    this.limitType,
    this.extra,
    this.pieceBalance,
    this.pieceIcon,
    this.pieceDesc,
    this.toastMsg,
    this.pieceJumpPage,
    this.pearlBalance,
    this.pearlIcon,
    this.pearlDesc,
    this.goldBean,
    this.score,
    this.itemsByScore,
  ) : super(
          cid: cid,
          name: name,
          type: type,
          desc: desc,
          avatar: avatar,
          image: image,
          imageBackground: imageBackground,
          cornerIcon: cornerIcon,
          cornerDesc: cornerDesc,
          isLimited: isLimited,
          bubbleDesc: bubbleDesc,
          bubbleFontColor: bubbleFontColor,
          moneyType: moneyType,
        );

  factory CommodityBuyInfo.fromJson(Map<String, dynamic> json) =>
      _$CommodityBuyInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommodityBuyInfoToJson(this);

  bool get showActivity {
    return isActivity > 0;
  }

  /// 是否金币购买
  bool isGoldCoin() {
    return 'coin' == moneyType;
  }

  bool isMoney() {
    return 'money' == moneyType;
  }

  /// 是否使用点亮积分购买
  bool isLightScore() {
    return salingOnShop == 8;
  }

  bool isPiece() {
    return 'piece' == moneyType;
  }

  /// 金豆
  bool isBean() {
    return 'bean' == moneyType;
  }

  /// 珍珠
  bool isPearl() {
    return 'pearl' == moneyType;
  }

  /// 积分商品
  bool isScore() {
    return 'score' == moneyType;
  }

  bool showJumpPage() {
    return Util.validStr(pieceJumpPage);
  }

  /// 多sku物品
  bool get isCategorySelect {
    return isMultiSku > 0;
  }

  bool get isVipLimit {
    return 'vip' == limitType;
  }

  bool get isTitleLimit {
    return 'title' == limitType;
  }

  bool get isDecorate {
    return commodityType == ShopMailCommodityType.Decorate;
  }

  String get buyType {
    // 优先使用shopType，联盟商城有各种moneyType，不能根据moneyType
    if (Util.validStr(shopType)) {
      return shopType;
    }

    if (moneyType == 'coin') {
      return 'coin-shop-buy';
    } else if ('money' == moneyType) {
      return 'shop-buy';
    } else {
      return moneyType ?? '';
    }
  }

  BubbleCommodity? getBubbleCommodity() {
    return extra != null ? BubbleCommodity.fromJson(extra) : null;
  }

  EffectCommodity? getEffectCommodity() {
    return extra != null ? EffectCommodity.fromJson(extra) : null;
  }

  DecorateCommodity? getDecorateCommodity() {
    return extra != null ? DecorateCommodity.fromJson(extra) : null;
  }
}

/// 购买面板商品
@JsonSerializable()
class Item {
  @JsonKey(fromJson: Util.parseInt)
  final int cid;

  @JsonKey(name: 'unit_price', fromJson: Util.parseInt)
  final int unitPrice; // 物品单价

  @JsonKey(name: 'light_score', fromJson: Util.parseInt)
  final int lightScore; // 点亮积分

  @JsonKey(name: 'coupon_id', fromJson: Util.parseInt)
  final int couponId; // 优惠券id

  @JsonKey(name: 'coupon_money', fromJson: Util.parseInt)
  final int couponMoney; // 优惠券金额

  @JsonKey(name: 'coupon_only_newpay', fromJson: Util.parseInt)
  final int couponOnlyNewPay; // 新支付券

  @JsonKey(name: 'coupon_state', fromJson: Util.parseInt)
  final int couponState; // 新支付券状态 0未激活

  /// 优惠券文案
  @JsonKey(name: 'duction_icon_coupon_desc')
  final String ductionIconCouponDesc;

  @JsonKey(name: 'duction_desc')
  final String ductionDesc; // 单价下方的文案 示例 最多以此优惠购买2件

  @JsonKey(name: 'duction_icon_multi_desc')
  final String ductionIconMultiDesc; // 3个以上打8折

  @JsonKey(name: 'duction_rate', fromJson: Util.parseInt)
  final int ductionRate;

  @JsonKey(name: 'duction_extra')
  final String ductionExtra; // 总价下方的文案 示例 额外赠送同等数量的黄水晶

  @JsonKey(name: 'can_be_give', fromJson: Util.parseInt)
  final int canBeGive; // 该物品能否被赠送。用来控制“赠送”按钮是否显示

  @JsonKey(name: 'duction_limit_min', fromJson: Util.parseInt)
  final int ductionLimitMin; // 最少买几件可享受折扣优惠

  @JsonKey(name: 'duction_limit_max', fromJson: Util.parseInt)
  final int ductionLimitMax; // 最多可以买几件 为0时，表示没有限制

  @JsonKey(name: 'coupon_discount', fromJson: Util.parseInt)
  final int couponDiscount;

  @JsonKey(name: 'coupon_icon')
  final String couponIcon;

  final String period; // 过期时间

  @JsonKey(name: 'grade_icon')
  final String gradeIcon; // 等级图标

  Item(
    this.cid,
    this.unitPrice,
    this.lightScore,
    this.couponMoney,
    this.couponId,
    this.ductionDesc,
    this.ductionRate,
    this.ductionExtra,
    this.canBeGive,
    this.ductionLimitMin,
    this.ductionLimitMax,
    this.period,
    this.ductionIconCouponDesc,
    this.ductionIconMultiDesc,
    this.couponOnlyNewPay,
    this.couponState,
    this.gradeIcon,
    this.couponDiscount,
    this.couponIcon,
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  /// 新手券是否有效
  bool isNewPayInvalid() {
    return couponOnlyNewPay > 0 && couponState == 0;
  }
}

/// 商城优惠券提示
@JsonSerializable()
class CouponTip {
  @JsonKey(fromJson: Util.parseInt)
  final int ucid;

  @JsonKey(name: 'explain_url')
  final String explainUrl; // 帮助URL

  final String icon; // 提示图标

  final String tips; // 提示文案

  CouponTip(
    this.ucid,
    this.icon,
    this.tips,
    this.explainUrl,
  );

  factory CouponTip.fromJson(Map<String, dynamic> json) =>
      _$CouponTipFromJson(json);

  Map<String, dynamic> toJson() => _$CouponTipToJson(this);
}
