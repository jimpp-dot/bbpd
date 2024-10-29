import 'package:json_annotation/json_annotation.dart';

import '../shared.dart';

part 'defend_bean.g.dart';

@JsonSerializable(createToJson: false)
class ProfileDefendResponse extends BaseResponse {
  final dynamic data; // 已经获取的守护
  final dynamic commodities; // 优惠券

  @JsonKey(name: 'defend_config')
  final List<DefendRelationModel>? defendConfigs;

  ProfileDefendResponse(
      {super.success,
      super.msg,
      this.data,
      this.defendConfigs,
      this.commodities});

  factory ProfileDefendResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileDefendResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class DefendCouponModel {
  @JsonKey(name: 'id')
  final int couponId;
  final String type;
  @JsonKey(name: 'ext_id')
  final int positionId;
  final int num;
  @JsonKey(name: 'duction_money')
  final int ductionMoney;

  DefendCouponModel(
      this.couponId, this.type, this.positionId, this.num, this.ductionMoney);

  factory DefendCouponModel.fromJson(Map<String, dynamic> json) =>
      _$DefendCouponModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DefendRelationModel {
  @JsonKey(ignore: true)
  bool fromRoomSocket = false;

  /// 守护麦位连线，接口拉取的不做动画，socket推送的需要做动画
  ///守护麦位连线表示的是被守护的人的Uid(defendUid表示守护人的Uid) 其他情况表示的事守护人的Uid
  final int uid;
  @JsonKey(name: 'defend_uid')
  final int? defendUid;
  final String? name;
  final String? icon;
  final String? expire;

  final String? title;

  /// 1CP 2小宝贝 3知己 4守卫 5队友 6跟班 7闺蜜 8兄弟
  /// 新增 23海尔兄弟 24小树洞 25羁绊
  final int? position;

  @JsonKey(name: 'defend_value')
  final String? defendValue;
  @JsonKey(name: 'border_index')
  final int? borderIndex;

  final int? money;
  final int? duration;
  @JsonKey(name: 'relation_score')
  final int? relationScore;
  DefendCouponModel? couponModel;
  @JsonKey(name: 'defend_level')
  final int? level;
  @JsonKey(name: 'defend_level_name')
  final String? levelName;

  /// 麦位连线之前动效图片
  final String lineBeforeUrl;

  /// 麦位连线图片，
  final String lineUrl;

  /// 是否隐藏守护关系
  final bool hideDefendName;

  final String? id;
  final int? direction;

  /// 关系方向：0看别人，1单向，2双向
  @JsonKey(name: 'upgrade_open')
  final bool? upgradeOpen;

  /// 该类型关系，当前是否在进阶开放时间内,true:在开放时间内

  @JsonKey(name: 'break_money')
  final int? breakMoney;

  @JsonKey(name: 'card_bg')
  final String? cardBg;

  @JsonKey(name: 'card_top')
  final String? cardTop;

  @JsonKey(name: 'start_time')
  final int? startTime;

  final int? upgrade;

  final int? category;

  /// 1-CP类，2-知己类，3-兄弟类，4-队友类

  final List<DefendAccessory>? widget;

  int? meUid;

  String? meIcon;

  String? meName;

  int? layout; // 1:横放，0:照常

  // 原价
  String get originPrice {
    return MoneyConfig.originPrice(money ?? 0);
  }

  // 折扣价
  String get couponPrice {
    return MoneyConfig.originPrice(payMoney);
  }

  int get payMoney {
    return (money ?? 0) - ((couponModel?.ductionMoney) ?? 0);
  }

  bool get hasDefendUse {
    return couponModel != null && couponModel?.type == 'defend';
  }

  bool get hasDefendCoupon {
    return couponModel != null && couponModel?.type == 'coupon';
  }

  DefendRelationModel(
    this.uid,
    this.name,
    this.icon,
    this.expire,
    this.title,
    this.defendValue,
    this.money,
    this.duration,
    this.position,
    this.borderIndex,
    this.relationScore,
    this.level,
    this.levelName,
    this.defendUid,
    this.id,
    this.direction,
    this.upgradeOpen,
    this.breakMoney,
    this.cardBg,
    this.cardTop,
    this.upgrade,
    this.category,
    this.widget,
    this.startTime, {
    this.lineBeforeUrl = '',
    this.lineUrl = '',
    this.hideDefendName = false,
  });

  factory DefendRelationModel.fromJson(Map<String, dynamic> json) =>
      _$DefendRelationModelFromJson(json);

  factory DefendRelationModel.fromBuffModel(HomeProfileDefend buffModel) =>
      DefendRelationModel(
          buffModel.uid,
          buffModel.name,
          buffModel.icon,
          '${buffModel.expire}',
          buffModel.title,
          '${buffModel.defendValue}',
          0,
          0,
          buffModel.position,
          buffModel.borderIndex,
          0,
          0,
          '',
          0,
          '',
          0,
          false,
          0,
          '',
          '',
          0,
          1,
          null,
          0);
}

@JsonSerializable(createToJson: false)
class DefendAccessory {
  @JsonKey(name: 'room_name')
  final String? roomName;

  @JsonKey(name: 'widget_name')
  final String? widgetName;

  @JsonKey(name: 'widget_area')
  final int? widgetArea;

  @JsonKey(name: 'widget_img')
  final String? widgetImg;

  @JsonKey(name: 'widget_level')
  final int? widgetLevel;

  @JsonKey(name: 'widget_send_at')
  final String? widgetSendAt;

  @JsonKey(name: 'widget_expire')
  final String? widgetExpire;

  DefendAccessory(
      {this.roomName,
      this.widgetName,
      this.widgetArea,
      this.widgetImg,
      this.widgetLevel,
      this.widgetSendAt,
      this.widgetExpire});

  factory DefendAccessory.fromJson(Map<String, dynamic> json) =>
      _$DefendAccessoryFromJson(json);
}
