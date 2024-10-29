import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'super_admin_patrol_tab_data.g.dart';

@JsonSerializable(createToJson: false)
class SuperAdminPatrolSubTab {
  int id;
  String name;
  int pid;

  SuperAdminPatrolSubTab(this.id, this.name, this.pid);

  factory SuperAdminPatrolSubTab.fromJson(Map<String, dynamic> json) =>
      _$SuperAdminPatrolSubTabFromJson(json);
}

@JsonSerializable(createToJson: false)
class SuperAdminPatrolFirstTab {
  int id;
  String name;
  int pid;
  List<SuperAdminPatrolSubTab> children;

  SuperAdminPatrolFirstTab(this.id, this.name, this.pid, this.children);

  factory SuperAdminPatrolFirstTab.fromJson(Map<String, dynamic> json) =>
      _$SuperAdminPatrolFirstTabFromJson(json);
}

@JsonSerializable(createToJson: false)
class SuperAdminPatrolTabData {
  List<SuperAdminPatrolFirstTab> list;

  SuperAdminPatrolTabData(this.list);

  factory SuperAdminPatrolTabData.fromJson(Map<String, dynamic> json) =>
      _$SuperAdminPatrolTabDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class SuperAdminPatrolTabResponse extends BaseResponse {
  final SuperAdminPatrolTabData? data;

  SuperAdminPatrolTabResponse({super.success, super.msg, this.data});

  factory SuperAdminPatrolTabResponse.fromJson(Map<String, dynamic> json) =>
      _$SuperAdminPatrolTabResponseFromJson(json);
}
