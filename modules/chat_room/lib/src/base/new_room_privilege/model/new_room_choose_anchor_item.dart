import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
part 'new_room_choose_anchor_item.g.dart';

@JsonSerializable(explicitToJson: true)
class NewRoomChooseAnchorItem {
  final int uid;
  final String icon;
  final String name;

  NewRoomChooseAnchorItem(
      {required this.uid, required this.icon, required this.name});

  factory NewRoomChooseAnchorItem.fromJson(Map<String, dynamic> json) =>
      _$NewRoomChooseAnchorItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewRoomChooseAnchorItemToJson(this);
}
