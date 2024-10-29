// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_follow_item_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendFollowItem _$RecommendFollowItemFromJson(Map<String, dynamic> json) {
  return RecommendFollowItem(
    uid: Util.parseStr(json['uid']),
    sex: Util.parseStr(json['sex']),
    icon: Util.parseStr(json['icon']),
    age: Util.parseInt(json['age']),
    name: Util.parseStr(json['name']),
    city: Util.parseStr(json['city']),
    onlineStatus: Util.parseStr(json['online_status']),
    headFrame: Util.parseStr(json['head_frame']),
    roomTag: Util.parseStr(json['roomTag']),
    fansNum: Util.parseInt(json['fans_num']),
    playtip: Util.parseStr(json['playtip']),
    tags: Util.parseList(json['tags'], (e) => Util.parseStr(e) ?? ''),
    latestFeed: json['latest_feed'] == null
        ? null
        : LatestFeed.fromJson(json['latest_feed'] as Map<String, dynamic>),
    titleNew: Util.parseInt(json['title_new']),
  );
}

Map<String, dynamic> _$RecommendFollowItemToJson(
        RecommendFollowItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'sex': instance.sex,
      'icon': instance.icon,
      'age': instance.age,
      'title_new': instance.titleNew,
      'name': instance.name,
      'city': instance.city,
      'online_status': instance.onlineStatus,
      'head_frame': instance.headFrame,
      'roomTag': instance.roomTag,
      'fans_num': instance.fansNum,
      'playtip': instance.playtip,
      'tags': instance.tags,
      'latest_feed': instance.latestFeed,
    };

LatestFeed _$LatestFeedFromJson(Map<String, dynamic> json) {
  return LatestFeed(
    content: Util.parseStr(json['content']),
    imgs: Util.parseList(json['imgs'], (e) => Util.parseStr(e) ?? ''),
  );
}

Map<String, dynamic> _$LatestFeedToJson(LatestFeed instance) =>
    <String, dynamic>{
      'content': instance.content,
      'imgs': instance.imgs,
    };
