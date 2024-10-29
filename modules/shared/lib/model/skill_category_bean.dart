import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skill_category_bean.g.dart';

/// 技能
@JsonSerializable()
class SkillCategoryResponse extends BaseResponse {
  final List<SkillCategory>? data;
  final int cid;

  SkillCategoryResponse({super.success, super.msg, this.data, this.cid = 0});

  factory SkillCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SkillCategoryResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SkillCategoryResponseToJson(this);
}

@JsonSerializable()
class SkillCategory {
  final int cid;
  final String type;
  final String name;

  SkillCategory(this.cid, this.type, this.name);

  factory SkillCategory.fromJson(Map<String, dynamic> json) =>
      _$SkillCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SkillCategoryToJson(this);
}
