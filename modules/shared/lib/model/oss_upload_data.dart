import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'oss_upload_data.g.dart';

@JsonSerializable(createToJson: false)
class OssUploadDataResp extends BaseResponse {
  OssUploadData? data;

  OssUploadDataResp({super.success, super.msg, this.data});

  factory OssUploadDataResp.fromJson(Map<String, dynamic> json) =>
      _$OssUploadDataRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class OssUploadData {
  String accessid;

  String host;

  String policy;

  String signature;
  String expire;

  String callback;

  String dir;

  OssUploadData(this.accessid, this.host, this.policy, this.signature,
      this.expire, this.callback, this.dir);

  factory OssUploadData.fromJson(Map<String, dynamic> json) =>
      _$OssUploadDataFromJson(json);
}
