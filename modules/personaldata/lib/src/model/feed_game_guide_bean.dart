import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'feed_game_guide_bean.g.dart';

@JsonSerializable()
class FeedGameGuideBean {
  @JsonKey(name: 'topic_cnt')
  int topicCnt; //当天发布动态数
  @JsonKey(name: 'has_played_game')
  int hasPlayedGame; ////当日是否玩过本（有剧本杀，海龟汤，谜案馆，迷你剧本都玩具记录）,0未玩过，1已玩过

  FeedGameGuideBean(this.topicCnt, this.hasPlayedGame);

  factory FeedGameGuideBean.fromJson(Map<String, dynamic> json) =>
      _$FeedGameGuideBeanFromJson(json);
}
