import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mic_defend_relation_bean.g.dart';

@JsonSerializable(createToJson: false)
class MicDefendRelationBean extends BaseResponse {
  MicDefendRelationData? data;

  MicDefendRelationBean({super.success, super.msg, this.data});

  factory MicDefendRelationBean.fromJson(Map<String, dynamic> json) =>
      _$MicDefendRelationBeanFromJson(json);
}

@JsonSerializable(createToJson: false)
class MicDefendRelationData {
  @JsonKey(name: 'defend_info')
  List<DefendRelationModel> defendInfo;

  MicDefendRelationData(this.defendInfo);

  factory MicDefendRelationData.fromJson(Map<String, dynamic> json) =>
      _$MicDefendRelationDataFromJson(json);
}
