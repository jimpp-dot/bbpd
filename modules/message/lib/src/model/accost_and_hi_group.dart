import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accost_and_hi_group.g.dart';

@JsonSerializable(createToJson: false)
class AccostAndHiGroup {
  @JsonKey(name: 'boss_list', fromJson: Util.parseIntList)
  List<int> bossList;

  @JsonKey(name: 'gs_list', fromJson: Util.parseIntList)
  List<int> gsList;

  AccostAndHiGroup(this.bossList, this.gsList);

  factory AccostAndHiGroup.fromJson(Map<String, dynamic> json) =>
      _$AccostAndHiGroupFromJson(json);
}
