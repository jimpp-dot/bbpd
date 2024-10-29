// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wolf_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WolfConfigData _$WolfConfigDataFromJson(Map<String, dynamic> json) {
  return WolfConfigData(
    WolfParseUtil.parseState(json['wo_state'] as String),
    Util.parseInt(json['wo_vvc']),
    Util.parseInt(json['wo_count']) ?? 1,
    Util.parseInt(json['wo_mode']) ?? 2,
    WolfParseUtil.parseBool(json['wo_ispk']),
    Util.parseInt(json['wo_start']) ?? -1,
    Util.parseInt(json['wo_turns']),
    Util.parseInt(json['wo_current']) ?? -1,
    WolfParseUtil.parseStateType(json['wo_state_type']),
    WolfParseUtil.parseBool(json['wo_can_explode']),
    json['wo_dataMap'] as Map<String, dynamic>?,
    WolfParseUtil.parsePlayerType(json['wo_player_num_type']) ??
        PlayerType.player9,
    WolfParseUtil.parseBool(json['wo_is_open_card']),
  );
}

Map<String, dynamic> _$WolfConfigDataToJson(WolfConfigData instance) =>
    <String, dynamic>{
      'wo_state': _$WolfStateEnumMap[instance.state],
      'wo_vvc': instance.vvc,
      'wo_count': instance.count,
      'wo_mode': instance.mode,
      'wo_ispk': instance.ispk,
      'wo_start': instance.start,
      'wo_turns': instance.turns,
      'wo_current': instance.current,
      'wo_state_type': _$WolfStateTypeEnumMap[instance.stateType],
      'wo_can_explode': instance.canExplode,
      'wo_dataMap': instance.currentResult,
      'wo_player_num_type': _$PlayerTypeEnumMap[instance.playerType],
      'wo_is_open_card': instance.publishDeal,
    };

const _$WolfStateEnumMap = {
  WolfState.Wait: 'Wait',
  WolfState.GameStart: 'GameStart',
  WolfState.GetRole: 'GetRole',
  WolfState.PublishRole: 'PublishRole',
  WolfState.Night: 'Night',
  WolfState.NightAction: 'NightAction',
  WolfState.NightActionKilling: 'NightActionKilling',
  WolfState.NightAntidote: 'NightAntidote',
  WolfState.NightPoison: 'NightPoison',
  WolfState.PoliceStart: 'PoliceStart',
  WolfState.PoliceJoin: 'PoliceJoin',
  WolfState.PoliceJoinResult: 'PoliceJoinResult',
  WolfState.PoliceDesc: 'PoliceDesc',
  WolfState.PoliceStartVote: 'PoliceStartVote',
  WolfState.PoliceVote: 'PoliceVote',
  WolfState.PoliceVoteResult: 'PoliceVoteResult',
  WolfState.PolicePk: 'PolicePk',
  WolfState.PoliceResult: 'PoliceResult',
  WolfState.PoliceDescOrder: 'PoliceDescOrder',
  WolfState.PoliceChange: 'PoliceChange',
  WolfState.PoliceChangeResult: 'PoliceChangeResult',
  WolfState.Daytime: 'Daytime',
  WolfState.DaytimePublishDead: 'DaytimePublishDead',
  WolfState.DaytimeStartGun: 'DaytimeStartGun',
  WolfState.DaytimeGun: 'DaytimeGun',
  WolfState.DaytimeGunPublishDead: 'DaytimeGunPublishDead',
  WolfState.DaytimeLastWords: 'DaytimeLastWords',
  WolfState.DaytimeDesc: 'DaytimeDesc',
  WolfState.DaytimeWolfExplode: 'DaytimeWolfExplode',
  WolfState.DaytimeStartVote: 'DaytimeStartVote',
  WolfState.DaytimeVote: 'DaytimeVote',
  WolfState.DaytimeVoteResult: 'DaytimeVoteResult',
  WolfState.DaytimeVotePublishDead: 'DaytimeVotePublishDead',
  WolfState.DaytimePK: 'DaytimePK',
  WolfState.GameEnd: 'GameEnd',
  WolfState.End: 'End',
};

const _$WolfStateTypeEnumMap = {
  WolfStateType.other: 'other',
  WolfStateType.night: 'night',
  WolfStateType.day: 'day',
};

const _$PlayerTypeEnumMap = {
  PlayerType.player6: 'player6',
  PlayerType.player9: 'player9',
  PlayerType.newplayer6: 'newplayer6',
  PlayerType.newplayer9: 'newplayer9',
  PlayerType.player12: 'player12',
};

WolfPositionData _$WolfPositionDataFromJson(Map<String, dynamic> json) {
  return WolfPositionData(
    Util.parseInt(json['wo_origin']),
    Util.parseInt(json['wo_vote']) ?? -1,
    WolfParseUtil.parseRole(json['wo_role'] as String),
    Util.parseInt(json['wo_aid']),
    Util.parseInt(json['wo_price']),
    WolfParseUtil.parseBool(json['wo_isDead']),
    WolfParseUtil.parseBool(json['wo_isDesc']),
    Util.parseInt(json['wo_count']),
    Util.parseInt(json['wo_target']),
    WolfParseUtil.parseBool(json['wo_can_action']),
    WolfParseUtil.parseActionStatus(json['wo_action_status']),
    WolfParseUtil.parseBool(json['wo_can_be_selected']),
    Util.parseInt(json['wo_action_uid']),
    WolfParseUtil.parseReadyState(json['wo_is_ready']) ??
        WolfReadyState.notReady,
    Util.parseInt(json['wo_is_police']),
    Util.parseInt(json['wo_sex']) ?? 1,
    Util.parseStr(json['wo_title_url']) ?? '',
    WolfParseUtil.parseBool(json['wo_is_publish_role']),
    WolfParseUtil.parseDeadType(json['wo_dead_type'] as String) ??
        WolfDeadType.killDead,
  );
}

Map<String, dynamic> _$WolfPositionDataToJson(WolfPositionData instance) =>
    <String, dynamic>{
      'wo_origin': instance.origin,
      'wo_vote': instance.vote,
      'wo_role': _$WolfRoleEnumMap[instance.role],
      'wo_aid': instance.aid,
      'wo_price': instance.price,
      'wo_isDead': instance.isDead,
      'wo_isDesc': instance.isDesc,
      'wo_count': instance.count,
      'wo_target': instance.target,
      'wo_can_action': instance.canAction,
      'wo_action_status': _$WolfActionStatusEnumMap[instance.actionStatus],
      'wo_can_be_selected': instance.canBeSelected,
      'wo_action_uid': instance.actionUid,
      'wo_is_ready': _$WolfReadyStateEnumMap[instance.readyState],
      'wo_is_police': instance.police,
      'wo_sex': instance.sex,
      'wo_title_url': instance.levelIcon,
      'wo_is_publish_role': instance.publishRole,
      'wo_dead_type': _$WolfDeadTypeEnumMap[instance.deadType],
    };

const _$WolfRoleEnumMap = {
  WolfRole.None: 'None',
  WolfRole.Popular: 'Popular',
  WolfRole.Werewolf: 'Werewolf',
  WolfRole.Witch: 'Witch',
  WolfRole.Seer: 'Seer',
  WolfRole.Hunter: 'Hunter',
  WolfRole.Guard: 'Guard',
};

const _$WolfActionStatusEnumMap = {
  WolfActionStatus.enable: 'enable',
  WolfActionStatus.disable: 'disable',
  WolfActionStatus.finish: 'finish',
};

const _$WolfReadyStateEnumMap = {
  WolfReadyState.notReady: 'notReady',
  WolfReadyState.ready: 'ready',
  WolfReadyState.none: 'none',
};

const _$WolfDeadTypeEnumMap = {
  WolfDeadType.killDead: 'killDead',
  WolfDeadType.voteDead: 'voteDead',
  WolfDeadType.gunDead: 'gunDead',
  WolfDeadType.explodeDead: 'explodeDead',
};

RoleItem _$RoleItemFromJson(Map<String, dynamic> json) {
  return RoleItem(
    Util.parseStr(json['role']) ?? '',
    Util.parseStr(json['role_name']) ?? '',
    Util.parseInt(json['num']),
    Util.parseInt(json['price']),
  );
}

Map<String, dynamic> _$RoleItemToJson(RoleItem instance) => <String, dynamic>{
      'role': instance.roleKey,
      'role_name': instance.roleName,
      'num': instance.roleCount,
      'price': instance.price,
    };

GetRoleData _$GetRoleDataFromJson(Map<String, dynamic> json) {
  return GetRoleData(
    Util.parseList(json['positionGetRole'],
        (e) => RoleResultItem.fromJson(e as Map<String, dynamic>)),
    Util.parseList(
        json['roles'], (e) => RoleItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$GetRoleDataToJson(GetRoleData instance) =>
    <String, dynamic>{
      'positionGetRole': instance.positionRoles,
      'roles': instance.roles,
    };

RoleResultItem _$RoleResultItemFromJson(Map<String, dynamic> json) {
  return RoleResultItem(
    Util.parseStr(json['role']) ?? '',
    Util.parseStr(json['role_name']) ?? '',
    Util.parseInt(json['num']),
    Util.parseInt(json['price']),
    Util.parseInt(json['uid']),
    Util.parseStr(json['win_condition']) ?? '',
    Util.parseStr(json['desc']) ?? '',
  );
}

Map<String, dynamic> _$RoleResultItemToJson(RoleResultItem instance) =>
    <String, dynamic>{
      'role': instance.roleKey,
      'role_name': instance.roleName,
      'num': instance.roleCount,
      'price': instance.price,
      'uid': instance.uid,
      'win_condition': instance.winCondition,
      'desc': instance.desc,
    };

WitchAntidoteData _$WitchAntidoteDataFromJson(Map<String, dynamic> json) {
  return WitchAntidoteData(
    Util.parseBool(json['hasAntidote']),
    Util.parseInt(json['killTarget']) ?? -1,
  );
}

Map<String, dynamic> _$WitchAntidoteDataToJson(WitchAntidoteData instance) =>
    <String, dynamic>{
      'hasAntidote': instance.hasAntidote,
      'killTarget': instance.killTarget,
    };

WitchPoisonData _$WitchPoisonDataFromJson(Map<String, dynamic> json) {
  return WitchPoisonData(
    Util.parseBool(json['hasPoison']),
    Util.parseInt(json['antidoteTarget']) ?? -1,
  );
}

Map<String, dynamic> _$WitchPoisonDataToJson(WitchPoisonData instance) =>
    <String, dynamic>{
      'hasPoison': instance.hasPoison,
      'antidoteTarget': instance.antidoteTarget,
    };

PoliceJoinResult _$PoliceJoinResultFromJson(Map<String, dynamic> json) {
  return PoliceJoinResult(
    Util.parseList(json['joinPosition'], (e) => Util.parseInt(e)),
    Util.parseList(json['unJoinPosition'], (e) => Util.parseInt(e)),
  );
}

Map<String, dynamic> _$PoliceJoinResultToJson(PoliceJoinResult instance) =>
    <String, dynamic>{
      'joinPosition': instance.joinedUsers,
      'unJoinPosition': instance.abstainUsers,
    };

PoliceJoinConfig _$PoliceJoinConfigFromJson(Map<String, dynamic> json) {
  return PoliceJoinConfig(
    Util.parseList(json['joinPosition'], (e) => Util.parseInt(e)),
    Util.parseList(json['exitPosition'], (e) => Util.parseInt(e)),
    Util.parseBool(json['canExit']),
  );
}

Map<String, dynamic> _$PoliceJoinConfigToJson(PoliceJoinConfig instance) =>
    <String, dynamic>{
      'joinPosition': instance.joinPosition,
      'exitPosition': instance.exitPosition,
      'canExit': instance.canExit,
    };

UserExpInfo _$UserExpInfoFromJson(Map<String, dynamic> json) {
  return UserExpInfo(
    Util.parseInt(json['percent']),
    Util.parseInt(json['incrExp']),
    Util.parseInt(json['level']),
    Util.parseStr(json['title_logo']) ?? '',
  );
}

Map<String, dynamic> _$UserExpInfoToJson(UserExpInfo instance) =>
    <String, dynamic>{
      'percent': instance.percent,
      'incrExp': instance.incrExp,
      'level': instance.level,
      'title_logo': instance.title_logo,
    };
