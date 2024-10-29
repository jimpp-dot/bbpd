import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_center_bean.g.dart';

@JsonSerializable(createToJson: false)
class TaskCenterBean {
  @JsonKey(name: 'task_level')
  int taskLevel;

  double progress;

  @JsonKey(name: 'task_name')
  String taskName;

  @JsonKey(name: 'award_name')
  String awardName;

  @JsonKey(name: 'award_count')
  String awardCount;

  String tips;

  TaskCenterBean(this.taskLevel, this.progress, this.taskName, this.awardName,
      this.awardCount, this.tips);

  factory TaskCenterBean.fromJson(Map<String, dynamic> json) =>
      _$TaskCenterBeanFromJson(json);
}
