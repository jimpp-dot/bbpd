import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../k.dart';

part 'vip_mall_second_bean.g.dart';

/// 商城二级页面model
@JsonSerializable()
class VipMallSecondBean {
  final String title;
  final List<ShopMailCommodity> items;

  @JsonKey(name: 'show_category', defaultValue: false)
  final bool showCategory; // 是否展现筛选

  @JsonKey(ignore: true)
  Map<String, List<ShopMailCommodity>>? category;

  @JsonKey(ignore: true)
  String? _selectCategory;

  VipMallSecondBean(this.title, this.items, this.showCategory);

  factory VipMallSecondBean.fromJson(Map<String, dynamic> json) =>
      _$VipMallSecondBeanFromJson(json);

  Map<String, dynamic> toJson() => _$VipMallSecondBeanToJson(this);

  Map<String, List<ShopMailCommodity>> getCategory() {
    if (category == null) {
      category = {};
      if (items.isNotEmpty) {
        for (var e in items) {
          if (e.filterTabName != null && e.filterTabName!.isNotEmpty) {
            List<ShopMailCommodity> list = category![e.filterTabName] ?? [];
            list.add(e);
            category![e.filterTabName ?? ''] = list;
          }
        }
      }
    }
    return category!;
  }

  String get selectKey {
    return Util.validStr(_selectCategory) ? _selectCategory! : K.vip_all;
  }

  set selectKey(String key) {
    _selectCategory = key;
  }

  List<ShopMailCommodity> getSelectCategories() {
    if (!displayCategory || !getCategory().containsKey(selectKey)) return items;

    return category![selectKey]!;
  }

  bool get displayCategory {
    return showCategory;
  }
}
