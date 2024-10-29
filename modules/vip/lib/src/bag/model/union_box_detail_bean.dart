import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vip/src/bag/model/bag_bean.dart';

part 'union_box_detail_bean.g.dart';

@JsonSerializable()
class UnionBoxDetailBean extends BaseResponse {
  UnionBoxDetailData? data;

  UnionBoxDetailBean({this.data, super.success, super.msg});

  factory UnionBoxDetailBean.fromJson(Map<String, dynamic> json) =>
      _$UnionBoxDetailBeanFromJson(json);
}

@JsonSerializable()
class UnionBoxDetailData {
  BagGoods? commodity;
  ShopMailCommodity? gift;
  int poolid;

  UnionBoxDetailData({this.commodity, this.gift, required this.poolid});

  factory UnionBoxDetailData.fromJson(Map<String, dynamic> json) =>
      _$UnionBoxDetailDataFromJson(json);
}
