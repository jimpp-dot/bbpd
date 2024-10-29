import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_bean.g.dart';

@JsonSerializable()
class ActivityBean {
  @JsonKey(fromJson: Util.parseInt)
  final int id;
  final List<String> images;
  final String? title;
  final String? tag;
  final String? content;
  @JsonKey(name: 'user_num')
  final int userNum; // 参与人数

  ActivityBean(
      this.id, this.images, this.title, this.tag, this.content, this.userNum);

  factory ActivityBean.fromJson(Map<String, dynamic> json) =>
      _$ActivityBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityBeanToJson(this);
}
