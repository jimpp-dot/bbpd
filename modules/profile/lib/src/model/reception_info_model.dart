import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reception_info_model.g.dart';

@JsonSerializable(createToJson: false)
class ChannelInfoModel {
  String label;
  String val;
  @JsonKey(fromJson: Util.parseColor)
  Color color;
  @JsonKey(name: 'bg_img')
  String bgImg;
  int verify; //0-未申请，1-申请认证中，2-已认证
  @JsonKey(name: 'id')
  int verifyId;

  ChannelInfoModel(
      this.label, this.val, this.color, this.bgImg, this.verify, this.verifyId);

  factory ChannelInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelInfoModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ReceptionConfig {
  List<ChannelInfoModel> channel;
  int uid;
  String name;
  String icon;
  String bname;
  @JsonKey(name: 'fail_num')
  int failNum;
  String rules;

  ReceptionConfig(this.channel, this.uid, this.name, this.icon, this.bname,
      this.failNum, this.rules);

  factory ReceptionConfig.fromJson(Map<String, dynamic> json) =>
      _$ReceptionConfigFromJson(json);
}
