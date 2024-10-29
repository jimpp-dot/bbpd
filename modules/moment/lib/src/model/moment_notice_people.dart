import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moment_notice_people.g.dart';

@JsonSerializable()
class MomentNoticePeople {
  @JsonKey(fromJson: Util.parseInt)
  final int uid;
  final String? name;
  @JsonKey(fromJson: Util.parseInt)
  final int pos;

  MomentNoticePeople(this.uid, this.name, this.pos);

  factory MomentNoticePeople.fromJson(Map<String, dynamic> json) =>
      _$MomentNoticePeopleFromJson(json);

  Map<String, dynamic> toJson() => _$MomentNoticePeopleToJson(this);
}
