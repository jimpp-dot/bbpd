import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
part 'room_create_bean.g.dart';

@JsonSerializable()
class RoomCreateResponse extends BaseResponse {
  final RoomCreate? data;

  RoomCreateResponse({this.data});

  factory RoomCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomCreateResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoomCreateResponseToJson(this);
}

@JsonSerializable()
class RoomCreate {
  @JsonKey(name: 'game_room')
  final List<RoomCreateItem>? gameRooms;
  @JsonKey(name: 'party_room')
  final List<RoomCreateItem>? partyRooms;

  RoomCreate({this.gameRooms, this.partyRooms});

  factory RoomCreate.fromJson(Map<String, dynamic> json) =>
      _$RoomCreateFromJson(json);

  Map<String, dynamic> toJson() => _$RoomCreateToJson(this);
}

@JsonSerializable()
class RoomCreateItem {
  final String name;
  final String icon;
  @JsonKey(name: 'back_image')
  final String bg;
  @JsonKey(name: 'type_label')
  final String label;
  @JsonKey(name: 'type')
  final List<RoomCreateItemType> types;

  RoomCreateItem(
      {required this.name,
      required this.icon,
      required this.bg,
      required this.label,
      required this.types});

  factory RoomCreateItem.fromJson(Map<String, dynamic> json) =>
      _$RoomCreateItemFromJson(json);

  Map<String, dynamic> toJson() => _$RoomCreateItemToJson(this);
}

@JsonSerializable()
class RoomCreateItemType {
  @JsonKey(name: 'type')
  final String typeKey;
  @JsonKey(name: 'type_name')
  final String typeName;

  RoomCreateItemType({required this.typeKey, required this.typeName});

  factory RoomCreateItemType.fromJson(Map<String, dynamic> json) =>
      _$RoomCreateItemTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RoomCreateItemTypeToJson(this);
}
