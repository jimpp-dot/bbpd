import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bean.g.dart';

/// Token校验结果
@JsonSerializable()
class OneKeyLoginBean extends BaseResponse {
  Map<String, dynamic>? data;

  OneKeyLoginBean({this.data, bool success = false, String msg = ''})
      : super(success: success, msg: msg);

  factory OneKeyLoginBean.fromJson(Map<String, dynamic> json) =>
      _$OneKeyLoginBeanFromJson(json);
}
