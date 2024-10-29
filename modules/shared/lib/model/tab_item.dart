import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tab_item.g.dart';

@JsonSerializable()
class TabItem {
  String? type;

  @JsonKey(name: 'title')
  String? label;
  @JsonKey(fromJson: Util.parseInt)
  int? gid;

  TabItem(this.type, this.label);

  factory TabItem.fromJson(Map<String, dynamic> json) =>
      _$TabItemFromJson(json);

  Map<String, dynamic> toJson() => _$TabItemToJson(this);

  // TabItem.fromJson(Map<String, dynamic> json) {
  //   type = json['type'];
  //   label = json['title'];
  //   gid = Util.parseInt(json['gid']);
  // }
}
