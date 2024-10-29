import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_mood_reply_bean.g.dart';

@JsonSerializable(explicitToJson: true)
class CircleMoodReplyResp {
  final bool success;
  final String? msg;
  final CircleMoodReplyData? data;

  CircleMoodReplyResp({required this.success, this.msg, this.data});

  factory CircleMoodReplyResp.fromJson(Map<String, dynamic> json) =>
      _$CircleMoodReplyRespFromJson(json);

  Map<String, dynamic> toJson() => _$CircleMoodReplyRespToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CircleMoodReplyData {
  final String? msg;

  CircleMoodReplyData({this.msg});

  factory CircleMoodReplyData.fromJson(Map<String, dynamic> json) =>
      _$CircleMoodReplyDataFromJson(json);

  Map<String, dynamic> toJson() => _$CircleMoodReplyDataToJson(this);
}
