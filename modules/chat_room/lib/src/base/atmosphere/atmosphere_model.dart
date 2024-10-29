import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'atmosphere_model.g.dart';

@JsonSerializable()
class AtmosphereResp extends BaseResponse {
  AtmosphereData? data;

  AtmosphereResp({super.success, super.msg, this.data});

  factory AtmosphereResp.fromJson(Map<String, dynamic> json) =>
      _$AtmosphereRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AtmosphereRespToJson(this);

  bool isValid() {
    return data != null &&
        data?.atmosphereList != null &&
        data!.atmosphereList!.isNotEmpty;
  }
}

@JsonSerializable()
class AtmosphereData {
  @JsonKey(name: 'atmosphere_list')
  List<AtmosphereListItem>? atmosphereList;

  @JsonKey(name: 'room_atmosphere_info')
  AtmosphereInfo? atmosphereInfo;

  AtmosphereData({this.atmosphereList, this.atmosphereInfo});

  factory AtmosphereData.fromJson(Map<String, dynamic> json) =>
      _$AtmosphereDataFromJson(json);

  Map<String, dynamic> toJson() => _$AtmosphereDataToJson(this);
}

@JsonSerializable()
class AtmosphereListItem {
  int id;
  String name;
  String cover;
  String music;

  AtmosphereListItem(
      {required this.id, this.name = '', this.cover = '', this.music = ''});

  factory AtmosphereListItem.fromJson(Map<String, dynamic> json) =>
      _$AtmosphereListItemFromJson(json);

  Map<String, dynamic> toJson() => _$AtmosphereListItemToJson(this);
}

@JsonSerializable()
class AtmosphereInfo {
  @JsonKey(name: 'atm_id')
  int atmId;
  @JsonKey(name: 'is_use_bg')
  int isUseBg;
  @JsonKey(name: 'is_use_music')
  int isUseMusic;

  AtmosphereInfo(
      {required this.atmId, required this.isUseBg, required this.isUseMusic});

  factory AtmosphereInfo.fromJson(Map<String, dynamic> json) =>
      _$AtmosphereInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AtmosphereInfoToJson(this);
}
