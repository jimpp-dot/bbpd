import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'club_anchor_rank_beans.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ClubAnchorRankItem {
  int uid;
  int rank;
  String? name;
  String? icon;
  String? text;
  int titleNew;
  int vipLevel;

  ClubAnchorRankItem(this.uid, this.rank, this.name, this.icon, this.text,
      this.titleNew, this.vipLevel);

  factory ClubAnchorRankItem.fromJson(Map<String, dynamic> json) =>
      _$ClubAnchorRankItemFromJson(json);
}

@JsonSerializable()
class ClubAnchorRankResponse {
  List<ClubAnchorRankItem> items;

  ClubAnchorRankItem? me;

  String? help;

  ClubAnchorRankResponse({required this.items, this.me, this.help});

  factory ClubAnchorRankResponse.fromJson(Map<String, dynamic> json) =>
      _$ClubAnchorRankResponseFromJson(json);
}
