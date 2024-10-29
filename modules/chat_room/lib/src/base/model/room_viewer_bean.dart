import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_viewer_bean.g.dart';

@JsonSerializable()
class RoomViewerBean {
  @JsonKey(fromJson: Util.parseInt)
  final int uid;
  @JsonKey()
  final String name;
  @JsonKey()
  final String icon;
  @JsonKey(fromJson: Util.parseInt)
  final int sex;
  @JsonKey(fromJson: Util.parseInt)
  final int age;
  @JsonKey(name: 'is_friend')
  final bool isFriend;
  @JsonKey(name: 'popularity_level', fromJson: Util.parseInt)
  final int popularityLevel;
  @JsonKey(name: 'vip_level', fromJson: Util.parseInt)
  final int vipLevel;
  @JsonKey(fromJson: Util.parseInt)
  final int title;
  @JsonKey(name: 'title_new', fromJson: Util.parseInt)
  final int titleNew;

  RoomViewerBean(
    this.uid,
    this.name,
    this.icon,
    this.sex,
    this.age,
    this.isFriend,
    this.popularityLevel,
    this.vipLevel,
    this.title,
    this.titleNew,
  );

  factory RoomViewerBean.fromJson(Map<String, dynamic> json) =>
      _$RoomViewerBeanFromJson(json);
}
