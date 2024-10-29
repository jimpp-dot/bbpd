import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vip_mall_bean.g.dart';

@JsonSerializable()
class VipMallBean {
  final List<VipMallTab> tab;
  final List<RecommendGoods> items;

  VipMallBean({required this.tab, required this.items});

  factory VipMallBean.fromJson(Map<String, dynamic> json) =>
      _$VipMallBeanFromJson(json);

  Map<String, dynamic> toJson() => _$VipMallBeanToJson(this);
}

/// 顶部tab
@JsonSerializable()
class VipMallTab {
  final String icon;
  final String name;
  final String type;

  // 红点角标
  @JsonKey(name: 'new_commodity_icon')
  String newCommodityIcon;

  VipMallTab(this.icon, this.name, this.type, this.newCommodityIcon);

  factory VipMallTab.fromJson(Map<String, dynamic> json) =>
      _$VipMallTabFromJson(json);

  Map<String, dynamic> toJson() => _$VipMallTabToJson(this);
}

/// 首页推荐
@JsonSerializable()
class RecommendGoods {
  final String title;
  final List<ShopMailCommodity> items;

  RecommendGoods(this.title, this.items);

  factory RecommendGoods.fromJson(Map<String, dynamic> json) =>
      _$RecommendGoodsFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendGoodsToJson(this);
}
