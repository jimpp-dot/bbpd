// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_feedback_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceFeedbackData _$ServiceFeedbackDataFromJson(Map<String, dynamic> json) {
  return ServiceFeedbackData(
    Util.parseInt(json['tag']),
    Util.parseInt(json['leave_message']),
  );
}

ServiceFeedbackRsp _$ServiceFeedbackRspFromJson(Map<String, dynamic> json) {
  return ServiceFeedbackRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : ServiceFeedbackData.fromJson(json['data'] as Map<String, dynamic>),
  );
}
