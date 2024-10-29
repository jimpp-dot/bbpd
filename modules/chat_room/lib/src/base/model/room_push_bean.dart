import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_push_bean.g.dart';

@JsonSerializable(createToJson: false)
class TabModel extends Object {
  @JsonKey(name: 'tab')
  String title;
  String type;
  String filter;
  @JsonKey(name: 'default')
  int isDefault;
  TabModel(this.title, this.type, this.filter, this.isDefault);
  factory TabModel.fromJson(Map<String, dynamic> json) =>
      _$TabModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class TabsResponse extends BaseResponse {
  List<TabModel>? data;
  TabsResponse({super.success, super.msg, this.data});

  factory TabsResponse.fromJson(Map<String, dynamic> json) =>
      _$TabsResponseFromJson(json);
}
