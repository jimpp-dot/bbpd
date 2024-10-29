import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_red_packet_setting_data.g.dart';

@JsonSerializable(createToJson: false)
class RoomRedPacketSettingData {
  bool success;
  @JsonKey(fromJson: Util.parseInt)
  int money;
  _SettingConfig? config;
  _RedPacketData? data;

  RoomRedPacketSettingData(this.success, this.money, this.config, this.data);

  factory RoomRedPacketSettingData.fromJson(Map<String, dynamic> json) =>
      _$RoomRedPacketSettingDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class _SettingConfig {
  List<int> total;
  List<int> per;
  List<int> period;
  List<int> stay;

  _SettingConfig(this.total, this.per, this.period, this.stay);
  factory _SettingConfig.fromJson(Map<String, dynamic> json) =>
      _$_SettingConfigFromJson(json);
}

@JsonSerializable(createToJson: false)
class _RedPacketData {
  @JsonKey(fromJson: Util.parseInt)
  int id;
  @JsonKey(fromJson: Util.parseInt)
  int sender;
  @JsonKey(fromJson: Util.parseInt)
  int money;
  @JsonKey(fromJson: Util.parseInt, name: 'money_send')
  int moneySend;
  @JsonKey(fromJson: Util.parseInt)
  int total;
  @JsonKey(fromJson: Util.parseInt)
  int num;
  @JsonKey(fromJson: Util.parseInt, name: 'period_end')
  int periodEnd;

  _RedPacketData(this.id, this.sender, this.money, this.moneySend, this.total,
      this.num, this.periodEnd);
  factory _RedPacketData.fromJson(Map<String, dynamic> json) =>
      _$_RedPacketDataFromJson(json);
}
