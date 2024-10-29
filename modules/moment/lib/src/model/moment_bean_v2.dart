import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moment/moment.dart';

part 'moment_bean_v2.g.dart';

/// 动态列表response
/// 带分页
@JsonSerializable()
class MomentPageResponseV2 extends BaseResponse {
  final MomentPageV2? data;

  MomentPageResponseV2({super.success, super.msg, this.data});

  factory MomentPageResponseV2.fromJson(Map<String, dynamic> json) =>
      _$MomentPageResponseV2FromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MomentPageResponseV2ToJson(this);
}

@JsonSerializable()
class MomentPageV2 {
  @JsonKey(fromJson: Util.parseInt)
  final int next; // 翻页topic id
  final List<Moment> output;

  MomentPageV2(this.next, this.output);

  factory MomentPageV2.fromJson(Map<String, dynamic> json) =>
      _$MomentPageV2FromJson(json);

  Map<String, dynamic> toJson() => _$MomentPageV2ToJson(this);

  bool get hasMore {
    return next != 0;
  }
}
