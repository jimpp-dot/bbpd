import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
part 'relationship_beans.g.dart';

@JsonSerializable(createToJson: false)
class FamiliarResp extends BaseResponse {
  List<int>? data;
  List<int>? tmpgroup;

  FamiliarResp({super.success, super.msg, this.data, this.tmpgroup});

  factory FamiliarResp.fromJson(Map<String, dynamic> json) =>
      _$FamiliarRespFromJson(json);
}
