import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'level_bean.g.dart';

/// vip
@JsonSerializable()
class VipLevelResponse extends BaseResponse {
  VipLevel? data;

  VipLevelResponse({super.success, super.msg, this.data});

  factory VipLevelResponse.fromJson(Map<String, dynamic> json) =>
      _$VipLevelResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VipLevelResponseToJson(this);
}

@JsonSerializable()
class VipLevel {
  final String name;
  final String icon;

  @JsonKey(name: 'level_icon')
  final String levelIcon;
  final String state; // vip状态 'lock' 7天未消费 锁定状态 'unlock' 正常

  @JsonKey(fromJson: Util.parseInt)
  final int level;

  @JsonKey(fromJson: Util.parseInt)
  final int start; // 等级起始值

  @JsonKey(fromJson: Util.parseInt)
  final int end; // 等级结束值

  @JsonKey(fromJson: Util.parseInt)
  final int current; // 当前等级经验值

  @JsonKey(fromJson: Util.parseInt)
  final int diff; // 距离升级差距经验值

  final List<LevelItem> list;

  @JsonKey(name: 'next_lv_tx')
  final String nextLvTx;
  @JsonKey(name: 'next_lv_list')
  final List<LevelItem> nextLvList;

  final SwitchInfo? switchInfo;

  VipLevel(
    this.name,
    this.icon,
    this.levelIcon,
    this.state,
    this.level,
    this.start,
    this.end,
    this.current,
    this.diff,
    this.list,
    this.nextLvTx,
    this.nextLvList,
    this.switchInfo,
  );

  factory VipLevel.fromJson(Map<String, dynamic> json) =>
      _$VipLevelFromJson(json);

  Map<String, dynamic> toJson() => _$VipLevelToJson(this);

  bool get isVipLock {
    return state == 'lock';
  }
}

/// 人气
@JsonSerializable()
class PopularityResponse extends BaseResponse {
  PopularityLevel? data;

  PopularityResponse({super.success, super.msg, this.data});

  factory PopularityResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularityResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PopularityResponseToJson(this);
}

@JsonSerializable()
class PopularityLevel {
  final String name;
  final String icon;

  @JsonKey(name: 'level_icon')
  final String levelIcon;

  @JsonKey(fromJson: Util.parseInt)
  final int level; // 当前人气等级

  @JsonKey(name: 'vip_level', fromJson: Util.parseInt)
  final int vipLevel;

  @JsonKey(fromJson: Util.parseInt)
  final int start; // 等级起始值

  @JsonKey(fromJson: Util.parseInt)
  final int end; // 等级结束值

  @JsonKey(fromJson: Util.parseInt)
  final int current; // 当前等级经验值

  @JsonKey(fromJson: Util.parseInt)
  final int diff; // 距离升级差距经验值

  final PopularityAwards? award;

  final List<LevelItem> list;

  final SwitchInfo? switchInfo;

  PopularityLevel(
    this.name,
    this.icon,
    this.levelIcon,
    this.level,
    this.vipLevel,
    this.start,
    this.end,
    this.current,
    this.diff,
    this.award,
    this.list,
    this.switchInfo,
  );

  factory PopularityLevel.fromJson(Map<String, dynamic> json) =>
      _$PopularityLevelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularityLevelToJson(this);

  bool get hasPopularity {
    return level > 0;
  }
}

class SwitchInfo {
  final bool can; // 能否切换
  final String? title;
  final String? content;
  final String? tip;
  final int price; // 切换花费价格

  SwitchInfo({
    required this.can,
    required this.title,
    required this.content,
    required this.tip,
    required this.price,
  });

  factory SwitchInfo.fromJson(Map<String, dynamic> json) => SwitchInfo(
        can: Util.parseBool(json['can']),
        title: Util.parseStr(json['title']),
        content: Util.parseStr(json['content']),
        tip: Util.parseStr(json['tip']),
        price: Util.parseInt(json['price']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'can': can,
        'title': title,
        'content': content,
        'tip': tip,
        'price': price,
      };
}

@JsonSerializable()
class LevelItem {
  final String name;
  final String remark;
  @JsonKey(name: 'remark_new')
  final String remarkNew;
  final String icon;

  @JsonKey(name: 'pop_icon')
  final String popIcon;

  final String description;

  final String state;

  @JsonKey(name: 'heat_remark')
  final String heatRemark;

  final int from;
  final int to;

  LevelItem(this.name, this.remark, this.icon, this.popIcon, this.description,
      this.state, this.heatRemark, this.remarkNew, this.from, this.to);

  factory LevelItem.fromJson(Map<String, dynamic> json) =>
      _$LevelItemFromJson(json);

  Map<String, dynamic> toJson() => _$LevelItemToJson(this);

  bool get isLocked {
    return state == 'lock';
  }

  String get cover {
    return icon;
    // return Util.cover375(icon);
  }

  String get popCover {
    return popIcon;
    // return Util.cover750(popIcon);
  }
}

@JsonSerializable()
class PopularityAwards {
  @JsonKey(fromJson: Util.parseInt)
  final int level;
  final String state; // 奖励是否可以领取 lock:不可领取 unlock:可以领取

  final List<PopularityAwardItem> list;

  PopularityAwards(this.level, this.state, this.list);

  factory PopularityAwards.fromJson(Map<String, dynamic> json) =>
      _$PopularityAwardsFromJson(json);

  Map<String, dynamic> toJson() => _$PopularityAwardsToJson(this);

  bool get isLock {
    return state == 'lock';
  }
}

@JsonSerializable()
class PopularityAwardItem {
  final String name;
  final String image;

  PopularityAwardItem(this.name, this.image);

  factory PopularityAwardItem.fromJson(Map<String, dynamic> json) =>
      _$PopularityAwardItemFromJson(json);

  Map<String, dynamic> toJson() => _$PopularityAwardItemToJson(this);
}

/// 我的爵位
@JsonSerializable()
class MyTitleResponse extends BaseResponse {
  MyTitle? data;

  MyTitleResponse({super.success, super.msg, this.data});

  factory MyTitleResponse.fromJson(Map<String, dynamic> json) =>
      _$MyTitleResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MyTitleResponseToJson(this);
}

@JsonSerializable()
class MyTitle {
  @JsonKey(name: 'vip_level', fromJson: Util.parseInt)
  final int vipLevel;
  final String name;
  final String icon;

  @JsonKey(name: 'title_index', fromJson: Util.parseInt)
  final int titleIndex;

  final List<TitleInfo> list;

  MyTitle(this.name, this.icon, this.vipLevel, this.titleIndex, this.list);

  factory MyTitle.fromJson(Map<String, dynamic> json) =>
      _$MyTitleFromJson(json);

  Map<String, dynamic> toJson() => _$MyTitleToJson(this);
}

@JsonSerializable()
class TitleInfo {
  @JsonKey(fromJson: Util.parseInt)
  final int id;

  @JsonKey(fromJson: Util.parseInt)
  final int level;

  // 爵位名称
  final String name;

  @JsonKey(fromJson: Util.parseInt)
  final int price;

  // 购买赠送金额 需除100
  @JsonKey(fromJson: Util.parseInt)
  final int money;

  // 购买月份
  @JsonKey(fromJson: Util.parseInt)
  final int month;

  @JsonKey(fromJson: Util.parseInt)
  final int cid;

  // 优惠券数量
  @JsonKey(fromJson: Util.parseInt)
  final int cnum;

  // 优惠券可抵扣金额
  @JsonKey(name: 'duction_money', fromJson: Util.parseInt)
  final int ductionMoney;

  // 加速倍数
  @JsonKey(fromJson: Util.parseInt)
  final int expacc;

  // 特权文案列表
  @JsonKey(name: 'desc_list')
  final List<LevelItem> descList;

  // 状态 'ok'爵位有效 'protected'保护期 'no'无此爵位
  final String state;

  // 购买类型 'first'首次购买 'continue'续费
  @JsonKey(name: 'buy_type')
  final String buyType;

  // 过期时间
  @JsonKey(fromJson: Util.parseInt)
  final int dateline;

  // 折扣 默认六折
  @JsonKey(fromJson: Util.parseInt)
  final int discount;

  // 格式化显示过期时间
  @JsonKey(name: 'deteline_format')
  final String detelineFormat;

  // 有效天数
  @JsonKey(name: 'diff_days', fromJson: Util.parseInt)
  final int diffDays;

  // 类型
  final String ctype;

  @JsonKey(name: 'gray_icon')
  final String grayIcon;

  final String icon;

  @JsonKey(name: 'loop_icon')
  final String loopIcon;

  TitleInfo(
    this.id,
    this.level,
    this.name,
    this.price,
    this.money,
    this.month,
    this.cid,
    this.cnum,
    this.ductionMoney,
    this.expacc,
    this.descList,
    this.state,
    this.buyType,
    this.dateline,
    this.discount,
    this.detelineFormat,
    this.diffDays,
    this.ctype,
    this.grayIcon,
    this.icon,
    this.loopIcon,
  );

  factory TitleInfo.fromJson(Map<String, dynamic> json) =>
      _$TitleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TitleInfoToJson(this);

  bool get isTitleValid {
    return state != 'no';
  }

  String get animation1 {
    return icon;
  }

  String get animation2 {
    return loopIcon;
  }

  bool get showGreyIcon {
    return state != 'ok';
  }
}
