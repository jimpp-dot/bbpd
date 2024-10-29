import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:json_annotation/json_annotation.dart';
part 'defend_relation_detail_bean.g.dart';

/// 守护详情response
@JsonSerializable(createToJson: false)
class DefendRelationDetailResponse extends BaseResponse {
  final DefendRelationDetailBean? data;

  DefendRelationDetailResponse(
      {bool success = false, String msg = '', this.data})
      : super(msg: msg, success: success);

  factory DefendRelationDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DefendRelationDetailResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class DefendRelationDetailBean extends DefendRelationModel {
  @JsonKey(name: 'upgrade_money')
  int upgradeMoney;

  /// 进阶需要的金额（分/钻）

  @JsonKey(name: 'normal_privilege')
  List<DefendPrivilege> normalPrivilege;

  /// 普通版

  @JsonKey(name: 'upgrade_privilege')
  List<DefendPrivilege> upgradePrivilege;

  /// 进阶版

  @JsonKey(name: 'upgrade_tips')
  String upgradeTips;

  @JsonKey(name: 'to_uid')
  int toUid = 0;

  @JsonKey(name: 'to_name')
  String? toName;

  @JsonKey(name: 'to_icon')
  String? toIcon;

  @JsonKey(name: 'diy_name')
  String diyName;

  @JsonKey(name: 'diy_status')
  int diyStatus;

  @JsonKey(name: 'diy_fail_reason')
  String diyFailReason;

  DefendRelationDetailBean(
    int uid,
    String name,
    String icon,
    String expire,
    String title,
    String defendValue,
    int money,
    int duration,
    int position,
    int borderIndex,
    int relationScore,
    int level,
    String levelName,
    int defendUid,
    String id,
    int direction,
    bool upgradeOpen,
    int breakMoney,
    String cardBg,
    String cardTop,
    int upgrade,
    int category,
    List<DefendAccessory> widget,
    this.upgradeMoney,
    this.normalPrivilege,
    this.upgradePrivilege,
    this.upgradeTips,
    this.diyName,
    this.diyStatus,
    this.diyFailReason,
    int startTime,
  ) : super(
            uid,
            name,
            icon,
            expire,
            title,
            defendValue,
            money,
            duration,
            position,
            borderIndex,
            relationScore,
            level,
            levelName,
            defendUid,
            id,
            direction,
            upgradeOpen,
            breakMoney,
            cardBg,
            cardTop,
            upgrade,
            category,
            widget,
            startTime);

  factory DefendRelationDetailBean.fromJson(Map<String, dynamic> json) =>
      _$DefendRelationDetailBeanFromJson(json);
}

@JsonSerializable(createToJson: false)
class DefendPrivilege {
  @JsonKey(name: 'defend_level')
  int defendLevel;
  String background;
  String desc;

  DefendPrivilege({this.defendLevel = 0, this.desc = '', this.background = ''});

  factory DefendPrivilege.fromJson(Map<String, dynamic> json) =>
      _$DefendPrivilegeFromJson(json);
}
