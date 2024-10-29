import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'im_group_beans.g.dart';

@JsonSerializable(createToJson: false)
class ImGroupMember {
  int uid;

  String? name;

  String? icon;

  //是否群主，0-不是，1-是
  @JsonKey(name: "is_creator")
  bool isCreator = false;

  @JsonKey(name: 'is_manager')
  bool isManager = false;

  ImGroupMember(this.uid, this.name, this.icon, this.isCreator, this.isManager);

  ImGroupMember.uidName(this.uid, this.name);

  factory ImGroupMember.fromJson(Map<String, dynamic> json) =>
      _$ImGroupMemberFromJson(json);
}
