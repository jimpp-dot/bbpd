import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'chat_greet_user_model.g.dart';

@JsonSerializable(createToJson: false)
class ChatGreetUserModel {
  static const SEX_MALE = 1; // 男
  static const SEX_FEMALE = 2; //女

  @JsonKey(fromJson: Util.parseInt)
  int uid;

  String? name;

  @JsonKey(name: 'pic')
  String? icon;

  @JsonKey(fromJson: Util.parseInt)
  int sex;

  @JsonKey(fromJson: Util.parseInt)
  int age;

  @JsonKey(name: "vip", fromJson: Util.parseInt)
  int vipLevel; // vip等级

  @JsonKey(name: "icongray", fromJson: Util.parseBool)
  bool vipGrey;

  @JsonKey(fromJson: Util.parseInt)
  int popularity; // 人气等级

  @JsonKey(fromJson: Util.parseInt)
  int title; // 爵位

  @JsonKey(name: 'title_new', fromJson: Util.parseInt)
  int titleNew; // 爵位

  List<UserTag> tags; //关于他

  @JsonKey(name: "friend_tags")
  List<UserTag> friendTags; //交友偏好

  List<String> mark; //平台印记

  @JsonKey(name: "card")
  AudioInfo? audioInfo;

  ChatGreetUserModel(
      this.uid,
      this.name,
      this.icon,
      this.sex,
      this.age,
      this.vipLevel,
      this.vipGrey,
      this.popularity,
      this.title,
      this.titleNew,
      this.tags,
      this.friendTags,
      this.mark);

  factory ChatGreetUserModel.fromJson(Map<String, dynamic> json) =>
      _$ChatGreetUserModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserTag {
  @JsonKey(fromJson: Util.parseInt)
  int id;

  String? name;

  UserTag(this.id, this.name);

  factory UserTag.fromJson(Map<String, dynamic> json) =>
      _$UserTagFromJson(json);
}

@JsonSerializable(createToJson: false)
class AudioInfo {
  String? audio; //语音链接

  @JsonKey(fromJson: Util.parseInt)
  int duration;

  AudioInfo(this.audio, this.duration); //语音时长

  factory AudioInfo.fromJson(Map<String, dynamic> json) =>
      _$AudioInfoFromJson(json);
}
