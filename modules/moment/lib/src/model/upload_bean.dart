import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_bean.g.dart';

///
@JsonSerializable()
class UploadAudioBean {
  final String? audio;

  UploadAudioBean(this.audio);

  factory UploadAudioBean.fromJson(Map<String, dynamic> json) =>
      _$UploadAudioBeanFromJson(json);

  Map<String, dynamic> toJson() => _$UploadAudioBeanToJson(this);
}
