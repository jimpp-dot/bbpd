import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bonus_beans.g.dart';

///房间红包数据
@JsonSerializable(fieldRename: FieldRename.snake)
class BonusData {
  int count; //剩余待开始红包个数

  @JsonKey(name: 'packet')
  BonusInfo? curBonus; //当前红包

  BonusData(this.count, this.curBonus);

  factory BonusData.fromJson(Map<String, dynamic> json) =>
      _$BonusDataFromJson(json);
}

///红包信息
@JsonSerializable(fieldRename: FieldRename.snake)
class BonusInfo {
  int id; //红包ID

  @JsonKey(fromJson: Util.parseIcon)
  String? icon; //红包图标
  BonusState? state; //红包状态

  @JsonKey(name: 'time')
  int grabTime; //红包开枪时间

  String? sign; //口令红包的内容，仅当为口令红包时有值

  bool grabbed; //当前用户是否抢过

  BonusInfo(
      this.id, this.icon, this.state, this.grabTime, this.sign, this.grabbed);

  factory BonusInfo.fromJson(Map<String, dynamic> json) =>
      _$BonusInfoFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BonusPreview extends BonusInfo {
  BonusUser? creator;
  @JsonKey(name: 'cond')
  BonusCondition? condition; //红包条件
  bool match; //是否满足红包条件
  String? content; //剩余红包描述
  String? desc; //抢红包按钮文案
  int giftId; // 粉丝团红包 打赏礼物ID

  BonusPreview(
      int id,
      String? icon,
      BonusState? state,
      int grabTime,
      String? sign,
      bool grabbed,
      this.creator,
      this.condition,
      this.match,
      this.content,
      this.desc,
      this.giftId)
      : super(id, icon, state, grabTime, sign, grabbed);

  factory BonusPreview.fromJson(Map<String, dynamic> json) =>
      _$BonusPreviewFromJson(json);
}

///红包配置信息
@JsonSerializable(fieldRename: FieldRename.snake)
class BonusConfig {
  @JsonKey(name: 'float')
  int notifyMoney; //发全服通知的红包金额

  int giftId; //加入粉丝团需要打赏的礼物id

  @JsonKey(name: 'config')
  List<BonusCreateCondition> conditions; //抢红包条件配置信息，创建红包页面使用

  @JsonKey(name: 'money')
  int availableMoney; //账号余额

  List<BonusIconType> icons; //红包icon及最小money配置

  BonusConfig(this.notifyMoney, this.giftId, this.conditions,
      this.availableMoney, this.icons);

  factory BonusConfig.fromJson(Map<String, dynamic> json) {
    BonusConfig config = _$BonusConfigFromJson(json);
    config.icons.sort((first, second) => second.min.compareTo(first.min));
    return config;
  }
}

///红包用户信息
@JsonSerializable(fieldRename: FieldRename.snake)
class BonusUser {
  int uid; //用户ID

  @JsonKey(fromJson: Util.parseIcon)
  String? icon; //用户头像
  String? name; //用户名称

  BonusUser(this.uid, this.icon, this.name);

  factory BonusUser.fromJson(Map<String, dynamic> json) =>
      _$BonusUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BonusCreateCondition {
  String? name;
  String? desc;
  BonusConditionType? type;

  BonusCreateCondition(this.name, this.desc, this.type);

  factory BonusCreateCondition.fromJson(Map<String, dynamic> json) =>
      _$BonusCreateConditionFromJson(json);
}

///抢红包记录
@JsonSerializable(fieldRename: FieldRename.snake)
class BonusGrabItem extends BonusUser {
  int money; //抢到的金额

  BonusGrabItem(int uid, String icon, String name, this.money)
      : super(uid, icon, name);

  factory BonusGrabItem.fromJson(Map<String, dynamic> json) =>
      _$BonusGrabItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BonusResult {
  BonusUser? creator; //发红包的人
  List<BonusGrabItem> list; //抢到红包的列表
  int money; //当前用户抢到的金额
  String? cont; //当前用户抢到的结果描述，和money互斥
  String? desc; //红包描述

  BonusResult(this.creator, this.list, this.money, this.cont, this.desc);

  factory BonusResult.fromJson(Map<String, dynamic> json) =>
      _$BonusResultFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BonusCondition {
  bool matched; //是否满足红包条件

  @JsonKey(name: 'cont')
  String? content; //红包条件内容，目前公屏消息的红包需要
  BonusConditionType? type; //红包条件类型

  BonusCondition(this.matched, this.content, this.type);

  factory BonusCondition.fromJson(Map<String, dynamic> json) =>
      _$BonusConditionFromJson(json);
}

@JsonSerializable()
class BonusIconType {
  int min;

  @JsonKey(fromJson: Util.parseIcon)
  String? icon;

  BonusIconType(this.min, this.icon);

  factory BonusIconType.fromJson(Map<String, dynamic> json) =>
      _$BonusIconTypeFromJson(json);
}

enum BonusState {
  pending, //待抢
  grab, //可抢
  finish, //结束
  expire, //过期
}

enum BonusType {
  random, //拼手气红包
  equals, //等红包
}

enum BonusConditionType {
  none, //无门槛
  follow, //关注
  fans, //加入粉丝团
  share, //分享
  sign, //口令红包
}
