import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'ktv_pk_rank.g.dart';

@JsonSerializable(createToJson: false)
class KtvPkRankConfig {
  @JsonKey(name: 'pk_mode')
  int pkMode;

  @JsonKey(name: 'on_mic_uid')
  int onMicUid;

  @JsonKey(name: 'before_score')
  int beforeScore;

  @JsonKey(name: 'current_score')
  int currentScore;

  @JsonKey(name: 'chorus_uid')
  int chorusUid;

  @JsonKey(name: 'chorus_before_score')
  int chorusBeforeScore;

  @JsonKey(name: 'chorus_current_score')
  int chorusCurrentScore;

  KtvPkRankConfig(
    this.pkMode,
    this.onMicUid,
    this.beforeScore,
    this.currentScore,
    this.chorusUid,
    this.chorusBeforeScore,
    this.chorusCurrentScore,
  );

  factory KtvPkRankConfig.fromJson(Map<String, dynamic> json) =>
      _$KtvPkRankConfigFromJson(json);

  bool get isPkModeOpen => pkMode == 1;
}

@JsonSerializable(createToJson: false)
class KtvPkRankEventData {
  @JsonKey(name: 'anim_img')
  String animImg;

  List<KtvPkRankEventItem> list;

  KtvPkRankEventData(this.animImg, this.list);

  factory KtvPkRankEventData.fromJson(Map<String, dynamic> json) =>
      _$KtvPkRankEventDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class KtvPkRankEventItem {
  int uid = 0;

  String name = '';

  String icon = '';

  int rank;

  int score = 0;

  KtvPkRankEventItem(this.uid, this.name, this.icon, this.rank, this.score);

  factory KtvPkRankEventItem.fromJson(Map<String, dynamic> json) =>
      _$KtvPkRankEventItemFromJson(json);

  KtvPkRankEventItem.rank(this.rank);
}

@JsonSerializable(createToJson: false)
class KtvPkScoreEventData {
  @JsonKey(name: 'on_mic_uid')
  int uid;

  @JsonKey(name: 'before_score')
  int beforeScore;

  @JsonKey(name: 'current_score')
  int currentScore;

  KtvPkScoreEventData(this.uid, this.beforeScore, this.currentScore);

  factory KtvPkScoreEventData.fromJson(Map<String, dynamic> json) =>
      _$KtvPkScoreEventDataFromJson(json);
}
