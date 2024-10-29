import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'function_center_bean.g.dart';

@JsonSerializable(createToJson: false)
class FunctionCenterBean {
  @JsonKey(name: 'data')
  List<FunctionItem> items;

  FunctionCenterBean(this.items);

  factory FunctionCenterBean.fromJson(Map<String, dynamic> json) =>
      _$FunctionCenterBeanFromJson(json);
}

@JsonSerializable(createToJson: false)
class FunctionItem {
  static const TYPE_BLANK = "blank";

  /// 任务
  static const TYPE_TASK = "task";

  /// 商城
  static const TYPE_SHOP = "shop";

  /// 背包
  static const TYPE_BAG = "bag";

  /// 爵位
  static const TYPE_TITLE = "title";

  /// 订单
  static const TYPE_ORDER = "order";

  /// 装扮
  static const TYPE_DRESS = 'dress_center';

  /// 结婚
  static const TYPE_MARRY = "marry";

  /// 成就
  static const TYPE_ACHIEVEMENT = "honor";

  /// 跳转webView
  static const TYPE_WEB = "web";

  /// 剧本
  static const TYPE_JUBEN = "juben";

  /// 捏脸
  static const TYPE_AVATAR = 'avatar';

  /// 红点
  static const TIP_TYPE_RED = "red";

  /// 数字
  static const TIP_TYPE_NUM = "num";

  /// 文本
  static const TIP_TYPE_STR = "strings";

  /// 气泡
  static const TIP_TYPE_BUBBLE = "message";

  /// 歌友会
  static const TYPE_SINGER_CLUB = "singer_club";

  String name = '';

  String type = '';

  String icon = '';

  @JsonKey(name: 'tip_type')
  String tipType = '';

  @JsonKey(name: 'tip_string')
  String tipString = '';

  String url = '';

  FunctionItem.type(this.type);

  FunctionItem(
      this.name, this.type, this.icon, this.tipType, this.tipString, this.url);

  factory FunctionItem.fromJson(Map<String, dynamic> json) =>
      _$FunctionItemFromJson(json);

  @override
  String toString() {
    return 'FunctionItem{name: $name, type: $type, icon: $icon, tipType: $tipType, tipString: $tipString}';
  }
}
