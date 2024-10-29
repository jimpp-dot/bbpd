import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_feedback_data.g.dart';

@JsonSerializable(createToJson: false)
class ServiceFeedbackData {
  /// 标签
  final int tag;

  /// 是否已留言 1 是 0 否
  @JsonKey(name: 'leave_message')
  final int leaveMessage;

  ServiceFeedbackData(this.tag, this.leaveMessage);

  factory ServiceFeedbackData.fromJson(Map<String, dynamic> json) =>
      _$ServiceFeedbackDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class ServiceFeedbackRsp extends BaseResponse {
  final ServiceFeedbackData? data;

  ServiceFeedbackRsp({super.success, super.msg, this.data});

  factory ServiceFeedbackRsp.fromJson(Map<String, dynamic> json) =>
      _$ServiceFeedbackRspFromJson(json);
}
