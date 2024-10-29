import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tagCategoryModel.g.dart';

@JsonSerializable()
class TagCategoryModel {
  final String id;
  final String icon;
  final String name;
  final List<PersonalTagModel> detail;

  TagCategoryModel(this.id, this.icon, this.name, this.detail);
  factory TagCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TagCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$TagCategoryModelToJson(this);
}

@JsonSerializable()
class PersonalTagModel {
  final String id;
  final String icon;
  final String name;
  @JsonKey(fromJson: Util.parseBool)
  final bool selected;
  PersonalTagModel(this.id, this.icon, this.name, this.selected);

  factory PersonalTagModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalTagModelFromJson(json);
  Map<String, dynamic> toJson() => _$PersonalTagModelToJson(this);
}
