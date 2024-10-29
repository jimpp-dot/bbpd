import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moment/k.dart';

part 'rush_config_bean.g.dart';

@JsonSerializable()
class RushConfigBean {
  final List<Game> games;
  final Map<String, GameInfo>? options;
  final int online; // 在线人数。type=black时输出
  final DefaultConfig? selected;
  final String? status; // 当前开黑状态

  @JsonKey(name: 'qq_group')
  final String? qqGroup;

  RushConfigBean(this.games, this.options, this.online, this.selected,
      this.qqGroup, this.status);

  factory RushConfigBean.fromJson(Map<String, dynamic> json) =>
      _$RushConfigBeanFromJson(json);

  Map<String, dynamic> toJson() => _$RushConfigBeanToJson(this);
}

@JsonSerializable()
class DefaultConfig {
  final String? game;
  final String? mode;
  final String? srv;
  final String? level;
  final int ppnum;

  DefaultConfig(this.game, this.mode, this.srv, this.level, this.ppnum);

  factory DefaultConfig.fromJson(Map<String, dynamic> json) =>
      _$DefaultConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultConfigToJson(this);
}

@JsonSerializable()
class Game {
  final int id;
  final String? name;
  final String? type; // black,desktop,other
  final String? icon;
  final String? round_icon;
  final String? color;

  Game(
      {this.name,
      this.type,
      this.id = 0,
      this.icon,
      this.color,
      this.round_icon});

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);

  GameType get gameType {
    if (type == 'black') {
      return GameType.black;
    } else if (type == 'desktop') {
      return GameType.desktop;
    } else if (type == 'other') {
      return GameType.other;
    } else {
      return GameType.None;
    }
  }

  String get displayName {
//    if (type == 'other') {
//      return K.moment_tag_other;
//    } else {
//      return name;
//    }

    return name ?? '';
  }
}

@JsonSerializable()
class GameInfo {
  final Mode? mode; // 模式
  final Mode? srv; // 区服
  final Mode? level; // 等级
  @JsonKey(name: 'ppnum')
  final Mode? people; // 人数

  GameInfo(
    this.mode,
    this.srv,
    this.level,
    this.people,
  );

  factory GameInfo.fromJson(Map<String, dynamic> json) =>
      _$GameInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GameInfoToJson(this);
}

@JsonSerializable()
class Mode {
  final String? title;
  final List<Item> list;

  Mode(this.title, this.list);

  factory Mode.fromJson(Map<String, dynamic> json) => _$ModeFromJson(json);

  Map<String, dynamic> toJson() => _$ModeToJson(this);
}

@JsonSerializable()
class Item {
  final int id;
  final String? name;

  Item(this.id, this.name);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  bool get hasLimit {
    return name != K.rush_unlimit;
  }
}

/// 游戏类型
enum GameType {
  None,
  black,
  desktop,
  other,
}
