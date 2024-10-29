import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moment/moment.dart';

part 'rush_bean.g.dart';

/// 动态分页
@JsonSerializable()
class RushMomentPage {
  final int page; //
  final int more; // 0 代表没有下一页
  final List<Moment>? topics;

  RushMomentPage(this.page, this.more, this.topics);

  factory RushMomentPage.fromJson(Map<String, dynamic> json) =>
      _$RushMomentPageFromJson(json);

  Map<String, dynamic> toJson() => _$RushMomentPageToJson(this);
}

/// 选中的游戏信息
class SelectGame {
  Game? game;
  Item? mode; // 模式
  Item? srv; // 区服
  Item? level; // 段位
  Item? people; // 人数

  SelectGame({this.game, this.mode, this.srv, this.level, this.people});

  String get displayTag {
    String tags = '';
    if (game?.name != null) {
      tags += game!.name ?? '';
    }

    if (mode != null && mode!.hasLimit) {
      tags += ' | ${mode!.name ?? ''}';
    }

    if (srv != null && srv!.hasLimit) {
      tags += ' | ${srv!.name ?? ''}';
    }

    if (level != null && level!.hasLimit) {
      tags += ' | ${level!.name ?? ''}';
    }
    return tags;
  }
}
