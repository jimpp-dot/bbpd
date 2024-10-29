import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'chat_star_level.g.dart';

@JsonSerializable(createToJson: false)
class ChatStarLevel {
  @JsonKey(name: "light_num", fromJson: Util.parseInt)
  int lightNum;

  @JsonKey(name: "last_chat_time", fromJson: Util.parseInt)
  int lastChatTime;

  @JsonKey(fromJson: Util.parseInt)
  int level;

  @JsonKey(fromJson: Util.parseInt)
  int light;

  ChatStarLevel(this.lightNum, this.lastChatTime, this.level, this.light);

  factory ChatStarLevel.fromJson(Map<String, dynamic> json) =>
      _$ChatStarLevelFromJson(json);

  bool grey() {
    return light == 0;
  }
}
