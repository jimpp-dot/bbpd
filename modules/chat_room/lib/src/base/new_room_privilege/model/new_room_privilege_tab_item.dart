import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
part 'new_room_privilege_tab_item.g.dart';

@JsonSerializable(explicitToJson: true)
class NewRoomPrivilegeTabItem {
  String? name;
  bool selected;

  NewRoomPrivilegeTabItem({this.name, this.selected = false});

  factory NewRoomPrivilegeTabItem.fromJson(Map<String, dynamic> json) =>
      _$NewRoomPrivilegeTabItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewRoomPrivilegeTabItemToJson(this);
}
