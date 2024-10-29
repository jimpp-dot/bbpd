import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moment_recommend.g.dart';

/// 推荐用户response
@JsonSerializable()
class MomentRecommendResponse extends BaseResponse {
  final List<RecommendUser>? data;

  @JsonKey(name: 'need_verify')
  final int
      needVerify; // 发朋友圈前是否需要做认证（0：不需要， 1：本机绑定认证，2：实人认证，3：本机认证或者手机号+验证码认证）

  MomentRecommendResponse(
      {super.success, super.msg, this.data, this.needVerify = 0});

  factory MomentRecommendResponse.fromJson(Map<String, dynamic> json) =>
      _$MomentRecommendResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MomentRecommendResponseToJson(this);
}

/// 推荐用户
@JsonSerializable()
class RecommendUser {
  final int uid;
  final String? name;
  final String? icon;
  final String? desc;

  bool follow = false;

  RecommendUser(this.uid, this.name, this.icon, this.desc);

  factory RecommendUser.fromJson(Map<String, dynamic> json) =>
      _$RecommendUserFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendUserToJson(this);

  String get userIcon {
    String url = Util.imageFullUrl(icon ?? '');
    if (!url.contains(RegExp(r'!head(\d+)')) &&
        !url.contains('x-oss-process=image/resize')) {
      url = '$url!head150';
    }

    return url;
  }
}
