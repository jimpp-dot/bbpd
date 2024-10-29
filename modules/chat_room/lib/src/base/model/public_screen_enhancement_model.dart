import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'public_screen_enhancement_model.g.dart';

@JsonSerializable()
class PublicScreenEnhancementModel extends Object {
  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'data')
  Data? data;

  PublicScreenEnhancementModel(
    this.success,
    this.data,
  );

  factory PublicScreenEnhancementModel.fromJson(Map<String, dynamic> srcJson) =>
      _$PublicScreenEnhancementModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PublicScreenEnhancementModelToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'content')
  List<String> content;

  @JsonKey(name: 'cid')
  int cid;

  Data(
    this.content,
    this.cid,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
