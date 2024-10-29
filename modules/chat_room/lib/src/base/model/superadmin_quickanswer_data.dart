import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'superadmin_quickanswer_data.g.dart';

@JsonSerializable(createToJson: false)
class SuperAdminQuickAnswerData {
  List<String> list;

  SuperAdminQuickAnswerData(this.list);

  factory SuperAdminQuickAnswerData.fromJson(Map<String, dynamic> json) =>
      _$SuperAdminQuickAnswerDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class SuperAdminQuickAnswerRsp extends DataRsp {
  SuperAdminQuickAnswerRsp(
      {required bool success, String? msg, SuperAdminQuickAnswerData? data})
      : super(msg: msg, success: success, data: data);

  factory SuperAdminQuickAnswerRsp.fromJson(Map<String, dynamic> json) =>
      _$SuperAdminQuickAnswerRspFromJson(json);
}
