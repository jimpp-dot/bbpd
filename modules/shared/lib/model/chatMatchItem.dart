import 'package:shared/src/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'chatMatchItem.g.dart';

@JsonSerializable()
class ChatMatchItem {
  @JsonKey(fromJson: Util.parseInt)
  int? uid;

  String? name;
  String? icon;

  @JsonKey(fromJson: Util.parseInt)
  int? sex;

  String? audio;

  @JsonKey(fromJson: Util.parseInt)
  int? duration;

  String? desc;

  @JsonKey(fromJson: Util.parseInt)
  int age;

  @JsonKey(name: 'has_like')
  bool liked;

  @JsonKey(fromJson: Util.parseInt)
  int liked_num;

  @JsonKey(name: 'isfollow', fromJson: Util.parseInt)
  int isFollow; // 0 未关注，1已关注

  @JsonKey(defaultValue: false)
  bool hasExpand;

  List<TagItem>? tags;

  DialogData? dialog;

  String? audioIcon;

  List<TagColor>? color;

  @JsonKey(fromJson: Util.parseInt)
  int height;

  String? industry;

  String? education;

  @JsonKey(name: 'hometown_city')
  String? hometownCity; //城市名字

  @JsonKey(name: 'hometown_city_code', fromJson: Util.parseInt)
  int hometownCityCode = 0; //城市编码 武汉027 服务端返回27

  ChatMatchItem(
    this.uid,
    this.name,
    this.icon,
    this.sex,
    this.audio,
    this.duration,
    this.desc,
    this.age,
    this.liked,
    this.liked_num,
    this.isFollow,
    this.hasExpand,
    this.tags,
    this.audioIcon,
    this.dialog,
    this.color,
    this.height,
    this.industry,
    this.education,
  );

  factory ChatMatchItem.fromJson(Map<String, dynamic> json) =>
      _$ChatMatchItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMatchItemToJson(this);

  Sex get userSex {
    if (sex == 1) {
      return Sex.Male;
    } else if (sex == 2) {
      return Sex.Female;
    } else {
      return Sex.Female;
    }
  }
}

@JsonSerializable()
class TagItem {
  final String name;
  final String icon;

  TagItem(this.name, this.icon);

  factory TagItem.fromJson(Map<String, dynamic> json) =>
      _$TagItemFromJson(json);

  Map<String, dynamic> toJson() => _$TagItemToJson(this);
}

@JsonSerializable()
class DialogData {
  final String title;
  final String subtitle;
  final String content;

  DialogData(this.title, this.subtitle, this.content);

  factory DialogData.fromJson(Map<String, dynamic> json) =>
      _$DialogDataFromJson(json);

  Map<String, dynamic> toJson() => _$DialogDataToJson(this);
}

@JsonSerializable()
class TagColor {
  @JsonKey(name: 'bg_start')
  final String bgStart;
  @JsonKey(name: 'bg_end')
  final String bgEnd;
  @JsonKey(name: 'border_start')
  final String borderStart;
  @JsonKey(name: 'border_end')
  final String borderEnd;

  TagColor(this.bgStart, this.bgEnd, this.borderStart, this.borderEnd);

  factory TagColor.fromJson(Map<String, dynamic> json) =>
      _$TagColorFromJson(json);

  Map<String, dynamic> toJson() => _$TagColorToJson(this);
}
