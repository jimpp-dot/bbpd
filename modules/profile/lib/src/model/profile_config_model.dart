import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_config_model.g.dart';

/// 个人页入口信息
///
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ProfileConfigModel {
  /// 主播周挑战，0表示不开启，1表示开启
  final int activityWeekChallenge;

  /// 空表示不开启
  final String benefitUrl;

  /// 自动搭讪，0表示不开启，1表示开启
  final int gsSayhi;

  final bool gsWarning;

  ///搭讪照片，0表示不开启，1表示开启
  final int gsUploadPic;

  final bool gsShowTool;

  final bool encounterShowThird;

  final bool showGiftCode;

  final CloudGameInfo? cloudGameCenter;

  /// 功能中心数据
  @JsonKey(name: 'func_center')
  final List<Map> functionCenter;

  final String encounter; // 邂逅8分钟入口

  ProfileConfigModel(
    this.activityWeekChallenge,
    this.benefitUrl,
    this.gsSayhi,
    this.gsWarning,
    this.gsUploadPic,
    this.cloudGameCenter,
    this.functionCenter,
    this.encounter,
    this.gsShowTool,
    this.encounterShowThird,
    this.showGiftCode,
  );

  factory ProfileConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileConfigModelFromJson(json);
}

/// 个人页云游戏时长新
///
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class CloudGameInfo {
  /// 免费时长
  final int freeDuration;

  /// 权益时长
  final int chargedDuration;

  /// 快速游戏次数
  final int quickChannelCoupon;

  final CloudCardInfo? cloudCardInfo;

  CloudGameInfo(this.freeDuration, this.chargedDuration,
      this.quickChannelCoupon, this.cloudCardInfo);

  factory CloudGameInfo.fromJson(Map<String, dynamic> json) =>
      _$CloudGameInfoFromJson(json);
}

/// 时长卡物品信息
///
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class CloudCardInfo {
  final int cid;

  final String type;

  CloudCardInfo(this.cid, this.type);

  factory CloudCardInfo.fromJson(Map<String, dynamic> json) =>
      _$CloudCardInfoFromJson(json);
}
