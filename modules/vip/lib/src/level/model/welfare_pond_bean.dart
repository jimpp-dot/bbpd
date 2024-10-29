import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'welfare_pond_bean.g.dart';

@JsonSerializable()
class WelfarePondBean extends BaseResponse {
  List<ShopMailCommodity> data;

  WelfarePondBean({super.success, super.msg, required this.data});

  factory WelfarePondBean.fromJson(Map<String, dynamic> json) =>
      _$WelfarePondBeanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WelfarePondBeanToJson(this);
}
