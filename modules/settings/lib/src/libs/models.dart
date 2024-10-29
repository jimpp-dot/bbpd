import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'models.g.dart';

@JsonSerializable(createToJson: false)
class SubscribeInfo {
  @JsonKey(name: 'is_show_button')
  bool show;

  @JsonKey(name: 'is_subscribe_official')
  bool subscribed;

  @JsonKey(name: 'official_guide_url')
  String url;

  SubscribeInfo(this.show, this.subscribed, this.url);

  factory SubscribeInfo.fromJson(Map<String, dynamic> json) =>
      _$SubscribeInfoFromJson(json);
}
