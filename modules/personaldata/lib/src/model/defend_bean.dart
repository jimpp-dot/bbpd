import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'defend_bean.g.dart';

/// 守护列表response
@JsonSerializable(createToJson: false)
class DefendListResponse extends BaseResponse {
  final List<DefendRelationModel>? data;

  @JsonKey(fromJson: Util.parseBool)
  final bool more;

  DefendListResponse(
      {bool success = false, String msg = '', this.data, this.more = false})
      : super(msg: msg, success: success);

  factory DefendListResponse.fromJson(Map<String, dynamic> json) =>
      _$DefendListResponseFromJson(json);
}
