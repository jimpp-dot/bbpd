// ignore_for_file: constant_identifier_names

import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vip/src/ticket_detail/model/match_ticket_model.dart';

part 'bag_bean.g.dart';

/// 优惠券类型枚举
enum CouponType {
  Title, // 爵位优惠券
  Gift, // 礼物优惠券
  Defend, // 守护优惠券
  RadioDefend, // 电台守护优惠券
  Key, // 头像框优惠券
  Discount, // 童话飞船券
  Knight, // 真爱守护2天体验卡
  VipMic, // vip座位券
  EmojiDiscount, // 表情包优惠券
  Unknown,
}

/// 解析用户优惠券类型
CouponType parseCouponType(String couponType) {
  switch (couponType) {
    case 'title':
      return CouponType.Title;
    case 'gift':
      return CouponType.Gift;
    case 'defend':
      return CouponType.Defend;
    case 'radio-defend':
      return CouponType.RadioDefend;
    case 'key':
      return CouponType.Key;
    case 'discount':
      return CouponType.Discount;
    case 'knight':
      return CouponType.Knight;
    case 'vip_mic':
      return CouponType.VipMic;
    case 'emoji_discount':
      return CouponType.EmojiDiscount;
  }
  return CouponType.Unknown;
}

/// 用户背包页面tab
@JsonSerializable()
class BagTab {
  final String name;
  final String type; // tab类型
  @JsonKey(name: 'new', fromJson: Util.parseInt)
  final int isNew; //  1: 显示红点

  @JsonKey(name: 'show_detail')
  final bool showDetail;

  @JsonKey(name: 'detail_title')
  final String detailTitle;

  final List<TicketDetailTab> detail; // 查看明细tab列表

  final List<String> subTabs;

  BagTab(this.name, this.type, this.isNew, this.showDetail, this.detailTitle,
      this.detail, this.subTabs);

  factory BagTab.fromJson(Map<String, dynamic> json) => _$BagTabFromJson(json);

  Map<String, dynamic> toJson() => _$BagTabToJson(this);
}

/// 用户背包页面列表item
@JsonSerializable()
class BagGoods extends ShopMailCommodity {
  final int id; // 背包id

  @JsonKey(fromJson: Util.parseInt)
  final int using; // 1：使用中
  @JsonKey(fromJson: Util.parseInt)
  final int used; // 1：使用过
  final String coupon; // 优惠券值
  @JsonKey(fromJson: Util.parseInt)
  final int expired; // 1：已过期
  @JsonKey(name: 'use_up', fromJson: Util.parseInt)
  final int useUp; // 时间已用完
  final String explain; // 说明
  @JsonKey(name: 'left_time')
  final String leftTime; // 剩余时间
  final String expires; // 有效期
  @JsonKey(name: 'coupon_type', fromJson: parseCouponType)
  final CouponType couponType; // 优惠券类型
  @JsonKey(name: 'can_give', fromJson: Util.parseInt)
  final int canGive; // 1: 可赠送
  @JsonKey(name: 'expire_date_page')
  final String expireDatePage; // 有效期说明页

  @JsonKey(name: 'jump_rid')
  int jumpRid;

  @JsonKey(name: 'jump_type')
  String jumpType;

  @JsonKey(fromJson: Util.parseInt)
  final int salePearl;

  @JsonKey(name: 'resolvable', fromJson: Util.parseInt)
  final int canBreak; // 1: 可分解
  @JsonKey(name: 'resolve_price', fromJson: Util.parseInt)
  final int breakPrice; //分解成碎片的单价
  @JsonKey(name: 'resolve_img')
  final String breakImage; //分解成碎片对应的icon
  @JsonKey(name: 'resolve_name')
  final String breakName; //分解成碎片对应的名称
  @JsonKey(name: 'tab_title')
  final String tabTitle; //物品所属类别

  /// 靓号卡
  @JsonKey(name: 'pretty_ids')
  final List<PrettyCard> prettyIds;

  final dynamic extra;
  final String tips;

  BagGoods({
    required int cid,
    required String type,
    required String name,
    required String avatar,
    required String image,
    required String imageBackground,
    required String desc,
    required String bubbleDesc,
    required String bubbleFontColor,
    required int price,
    required String filterTabName,
    required int liveOnly,
    required String liveLabel,
    required String inUseDesc,
    required String grade,
    required String gradeIcon,
    required int unuseInvalidDuration,
    required int order,
    required int num,
    required String jumpPath,
    required this.id,
    required this.using,
    required this.used,
    required this.coupon,
    required this.expired,
    required this.useUp,
    required this.explain,
    required this.leftTime,
    required this.expires,
    required this.couponType,
    required this.canGive,
    required this.extra,
    required this.expireDatePage,
    required this.jumpRid,
    required this.jumpType,
    required this.salePearl,
    required this.canBreak,
    required this.breakPrice,
    required this.breakImage,
    required this.breakName,
    required this.tabTitle,
    required this.prettyIds,
    required this.tips,
  }) : super(
          cid: cid,
          name: name,
          type: type,
          desc: desc,
          avatar: avatar,
          image: image,
          imageBackground: imageBackground,
          bubbleDesc: bubbleDesc,
          bubbleFontColor: bubbleFontColor,
          price: price,
          filterTabName: filterTabName,
          liveOnly: liveOnly,
          liveLabel: liveLabel,
          inUseDesc: inUseDesc,
          grade: grade,
          gradeIcon: gradeIcon,
          unuseInvalidDuration: unuseInvalidDuration,
          order: order,
          num: num,
          jumpPath: jumpPath,
        );

  factory BagGoods.fromJson(Map<String, dynamic> json) =>
      _$BagGoodsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BagGoodsToJson(this);
}

/// 靓号卡
///
@JsonSerializable(fieldRename: FieldRename.snake)
class PrettyCard {
  final int prettyId;

  ///0,未使用，1.已使用
  final int status;

  PrettyCard(this.prettyId, this.status);

  factory PrettyCard.fromJson(Map<String, dynamic> json) =>
      _$PrettyCardFromJson(json);

  Map<String, dynamic> toJson() => _$PrettyCardToJson(this);

  bool get canUse => status == 0;
}
