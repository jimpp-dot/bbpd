import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../moment.dart';

part 'circle_mood_bean.g.dart';

@JsonSerializable(explicitToJson: true)
class CircleMoodResp {
  final bool success;
  final String? msg;
  final CircleMoodData? data;

  CircleMoodResp({required this.success, this.msg, this.data});

  factory CircleMoodResp.fromJson(Map<String, dynamic> json) =>
      _$CircleMoodRespFromJson(json);

  Map<String, dynamic> toJson() => _$CircleMoodRespToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CircleMoodData {
  @JsonKey(name: 'left_num')
  final int leftNum;

  final Moment? topic;

  final CircleMoodDataRoom? room;

  CircleMoodData({required this.leftNum, this.topic, this.room});

  factory CircleMoodData.fromJson(Map<String, dynamic> json) =>
      _$CircleMoodDataFromJson(json);

  Map<String, dynamic> toJson() => _$CircleMoodDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CircleMoodDataRoom {
  final int rid;
  final int uid;
  final String? name;
  final String? icon;

  CircleMoodDataRoom(
      {required this.rid, required this.uid, this.name, this.icon});

  factory CircleMoodDataRoom.fromJson(Map<String, dynamic> json) =>
      _$CircleMoodDataRoomFromJson(json);

  Map<String, dynamic> toJson() => _$CircleMoodDataRoomToJson(this);
}
