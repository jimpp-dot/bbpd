import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'title_role_bean.g.dart';

@JsonSerializable(createToJson: false)
class TitleRoleBean extends BaseResponse {
  @JsonKey(name: 'data')
  List<TitleRoleItemBean>? items;

  TitleRoleBean({bool success = false, String msg = '', this.items});

  factory TitleRoleBean.fromJson(Map<String, dynamic> json) =>
      _$TitleRoleBeanFromJson(json);
}

@JsonSerializable()
class TitleRoleItemBean {
  @JsonKey(name: 'tid', fromJson: Util.parseInt)
  int tid;
  String? name;
  @JsonKey(name: 'pic')
  String? icon;
  String? description;

  TitleRoleItemBean({this.tid = 0, this.name, this.icon, this.description});
  factory TitleRoleItemBean.fromBuffModel(HomeProfileJutitle buffModel) =>
      TitleRoleItemBean(
          tid: Util.parseInt(buffModel.tid),
          name: buffModel.name,
          icon: buffModel.pic);

  factory TitleRoleItemBean.fromJson(Map<String, dynamic> json) =>
      _$TitleRoleItemBeanFromJson(json);
  Map<String, dynamic> toJson() => _$TitleRoleItemBeanToJson(this);
}
