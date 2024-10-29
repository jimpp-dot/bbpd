// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_game_guide_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedGameGuideBean _$FeedGameGuideBeanFromJson(Map<String, dynamic> json) {
  return FeedGameGuideBean(
    Util.parseInt(json['topic_cnt']),
    Util.parseInt(json['has_played_game']),
  );
}

Map<String, dynamic> _$FeedGameGuideBeanToJson(FeedGameGuideBean instance) =>
    <String, dynamic>{
      'topic_cnt': instance.topicCnt,
      'has_played_game': instance.hasPlayedGame,
    };
