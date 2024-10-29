import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_bg.g.dart';

@JsonSerializable()
class RoomBg extends Object {
  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'data')
  Data? data;

  RoomBg(
    this.success,
    this.data,
  );

  factory RoomBg.fromJson(Map<String, dynamic> srcJson) =>
      _$RoomBgFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RoomBgToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'current')
  String current;

  @JsonKey(name: 'backgrounds')
  List<Background> backgrounds;

  Data(
    this.current,
    this.backgrounds,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Background extends Object {
  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'enable')
  bool enable;

  @JsonKey(name: 'message')
  String message;

  Background(
    this.type,
    this.url,
    this.enable,
    this.message,
  );

  factory Background.fromJson(Map<String, dynamic> srcJson) =>
      _$BackgroundFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BackgroundToJson(this);
}
