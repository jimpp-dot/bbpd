import 'dart:core';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic_bean.g.dart';

@JsonSerializable()
class TopicTab {
  final String? name;
  @JsonKey(fromJson: Util.parseInt)
  final int id;
  final String? type;

  TopicTab(this.name, this.id, this.type);

  factory TopicTab.fromJson(Map<String, dynamic> json) =>
      _$TopicTabFromJson(json);

  Map<String, dynamic> toJson() => _$TopicTabToJson(this);
}

@JsonSerializable()
class TopicSquareListResponse extends BaseResponse
    with PageListResponse<Topic> {
  final TopicSquareListData? data;

  TopicSquareListResponse({super.success, super.msg, this.data});

  factory TopicSquareListResponse.fromJson(Map<String, dynamic> json) =>
      _$TopicSquareListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TopicSquareListResponseToJson(this);

  @override
  List<Topic>? get items => data?.topicList;

  @override
  bool get hasMore => data?.more == 1;
}

@JsonSerializable()
class TopicSquareListData {
  @JsonKey(name: 'output')
  final List<Topic> topicList;
  @JsonKey(fromJson: Util.parseInt)
  final int more;

  TopicSquareListData(this.topicList, this.more);

  factory TopicSquareListData.fromJson(Map<String, dynamic> json) =>
      _$TopicSquareListDataFromJson(json);

  Map<String, dynamic> toJson() => _$TopicSquareListDataToJson(this);
}

/// 话题
@JsonSerializable()
class Topic {
  @JsonKey(fromJson: Util.parseInt)
  final int id;
  final String? name;
  final String? icon;
  final String? content;
  final String? prefix;
  final String? url;
  final String? color;
  final String? desc;
  final bool? isActivity;

  @JsonKey(fromJson: Util.parseInt)
  int isFollow; // 1:已关注

  Topic(this.id, this.name, this.icon, this.content,
      {this.prefix,
      this.url,
      this.isFollow = 0,
      this.color,
      this.desc,
      this.isActivity});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);

  String get topicName {
    return '${prefix ?? ''}$name';
  }

  Color get bgColor {
    if (color != null && color!.isNotEmpty) {
      return HexColor(color!);
    }
    return R.color.secondBgColor;
  }
}
