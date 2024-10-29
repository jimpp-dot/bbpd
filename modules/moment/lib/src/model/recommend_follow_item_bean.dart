import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../k.dart';

part 'recommend_follow_item_bean.g.dart';

@JsonSerializable()
class RecommendFollowItem {
  RecommendFollowItem({
    this.uid,
    this.sex,
    this.icon,
    required this.age,
    this.name,
    this.city,
    this.onlineStatus,
    this.headFrame,
    this.roomTag,
    required this.fansNum,
    this.playtip,
    this.tags,
    this.latestFeed,
    required this.titleNew,
  });

  factory RecommendFollowItem.fromJson(Map<String, dynamic> json) =>
      _$RecommendFollowItemFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendFollowItemToJson(this);

  final String? uid;
  final String? sex;
  final String? icon;
  final int age;
  @JsonKey(name: 'title_new')
  final int titleNew;
  final String? name;
  final String? city;
  @JsonKey(name: 'online_status')
  final String? onlineStatus;
  @JsonKey(name: 'head_frame')
  final String? headFrame;
  @JsonKey(name: 'roomTag')
  final String? roomTag;
  @JsonKey(name: 'fans_num')
  final int fansNum;
  final String? playtip;
  final List<String>? tags;
  @JsonKey(name: 'latest_feed')
  final LatestFeed? latestFeed;

  String get displayName {
    if (name == null || name!.isEmpty) {
      return K.moment_no_name;
    }
    return name!;
  }
}

@JsonSerializable()
class LatestFeed {
  LatestFeed({
    this.content,
    this.imgs,
  });

  factory LatestFeed.fromJson(Map<String, dynamic> json) =>
      _$LatestFeedFromJson(json);

  Map<String, dynamic> toJson() => _$LatestFeedToJson(this);

  final String? content;
  final List<String>? imgs;
}
