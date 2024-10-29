// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rush_config_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RushConfigBean _$RushConfigBeanFromJson(Map<String, dynamic> json) {
  return RushConfigBean(
    Util.parseList(
        json['games'], (e) => Game.fromJson(e as Map<String, dynamic>)),
    (json['options'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, GameInfo.fromJson(e as Map<String, dynamic>)),
    ),
    Util.parseInt(json['online']),
    json['selected'] == null
        ? null
        : DefaultConfig.fromJson(json['selected'] as Map<String, dynamic>),
    Util.parseStr(json['qq_group']),
    Util.parseStr(json['status']),
  );
}

Map<String, dynamic> _$RushConfigBeanToJson(RushConfigBean instance) =>
    <String, dynamic>{
      'games': instance.games,
      'options': instance.options,
      'online': instance.online,
      'selected': instance.selected,
      'status': instance.status,
      'qq_group': instance.qqGroup,
    };

DefaultConfig _$DefaultConfigFromJson(Map<String, dynamic> json) {
  return DefaultConfig(
    Util.parseStr(json['game']),
    Util.parseStr(json['mode']),
    Util.parseStr(json['srv']),
    Util.parseStr(json['level']),
    Util.parseInt(json['ppnum']),
  );
}

Map<String, dynamic> _$DefaultConfigToJson(DefaultConfig instance) =>
    <String, dynamic>{
      'game': instance.game,
      'mode': instance.mode,
      'srv': instance.srv,
      'level': instance.level,
      'ppnum': instance.ppnum,
    };

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    name: Util.parseStr(json['name']),
    type: Util.parseStr(json['type']),
    id: Util.parseInt(json['id']),
    icon: Util.parseStr(json['icon']),
    color: Util.parseStr(json['color']),
    round_icon: Util.parseStr(json['round_icon']),
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'icon': instance.icon,
      'round_icon': instance.round_icon,
      'color': instance.color,
    };

GameInfo _$GameInfoFromJson(Map<String, dynamic> json) {
  return GameInfo(
    json['mode'] == null
        ? null
        : Mode.fromJson(json['mode'] as Map<String, dynamic>),
    json['srv'] == null
        ? null
        : Mode.fromJson(json['srv'] as Map<String, dynamic>),
    json['level'] == null
        ? null
        : Mode.fromJson(json['level'] as Map<String, dynamic>),
    json['ppnum'] == null
        ? null
        : Mode.fromJson(json['ppnum'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GameInfoToJson(GameInfo instance) => <String, dynamic>{
      'mode': instance.mode,
      'srv': instance.srv,
      'level': instance.level,
      'ppnum': instance.people,
    };

Mode _$ModeFromJson(Map<String, dynamic> json) {
  return Mode(
    Util.parseStr(json['title']),
    Util.parseList(
        json['list'], (e) => Item.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$ModeToJson(Mode instance) => <String, dynamic>{
      'title': instance.title,
      'list': instance.list,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
