// ignore_for_file: constant_identifier_names

import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';

part 'wolf_beans.g.dart';

//狼人杀游戏角色
enum WolfRole {
  None, //未参与
  Popular, //平民
  Werewolf, //狼人
  Witch, //女巫
  Seer, //预言家
  Hunter, //猎人
  Guard, //守卫
}

//狼人杀游戏状态
enum WolfState {
  Wait, //未开始
  GameStart, //游戏开始
  GetRole, //抢身份
  PublishRole, //公布身份

  Night, //天黑
  NightAction, //天黑行动（查验，杀人，守卫）需配合角色来区分
  @deprecated
  NightActionKilling, //天黑行动 选择杀人结果-实时反馈
  NightAntidote, //女巫解药
  NightPoison, //女巫毒药

  @deprecated
  PoliceStart, //开始上警环节
  PoliceJoin, //参与竞选警长
  PoliceJoinResult, //警长竞选结果
  PoliceDesc, //竞选发言
  @deprecated
  PoliceStartVote, //竞选开始投票
  PoliceVote, //竞选投票
  PoliceVoteResult, //竞选投票结果
  PolicePk, //竞选pk
  PoliceResult, //竞选结果
  PoliceDescOrder, //警长决定发言顺序阶段
  PoliceChange, //警长移交警徽阶段
  PoliceChangeResult, //警长移交警徽结果

  Daytime, //天亮
  DaytimePublishDead, //公布死亡结果
  DaytimeStartGun, //猎人技能发动阶段名
  DaytimeGun, //猎人开枪
  DaytimeGunPublishDead, //猎人开枪公布死亡结果
  DaytimeLastWords, //白天遗言
  DaytimeDesc, //白天发言
  //12人局暂时没有
  DaytimeWolfExplode, //狼人自爆
  DaytimeStartVote, //白天开始投票
  DaytimeVote, //白天投票
  DaytimeVoteResult, //投票结果
  DaytimeVotePublishDead,
  DaytimePK, //pk

  GameEnd, //游戏结束-出结束提示浮层
  End, //结束-出结果弹框
}

//狼人杀状态分类
enum WolfStateType {
  other, //其他状态
  night, //白天
  day, //夜晚
}

//狼人杀行动状态
enum WolfActionStatus {
  enable, //可行动
  disable, //不可行动
  finish, //行动结束
}

//狼人杀游戏模式
class WolfMode {
  static const int guardMode = 1; //守卫模式
  static const int hunterMode = 2; //猎人模式

  static getModeStr(int mode) {
    String modeStr = R.string('room_mode_protect');
    if (mode == guardMode) {
      modeStr = R.string('room_mode_protect');
    } else if (mode == hunterMode) {
      modeStr = R.string('room_mode_hunter');
    }
    return modeStr;
  }
}

enum PlayerType {
  player6, //6人玩法
  player9, //9人玩法
  newplayer6, //新6人玩法
  newplayer9, //新9人玩法
  player12, //12人玩法
}

enum WolfReadyState {
  notReady, //未准备
  ready, //已经准备
  none, //无状态，不显示
}

enum PoliceJoinFlag {
  join, //竞选
  giveUp, //放弃竞选
  exit, //退水
}

enum WolfDeadType {
  killDead, //被杀死：狼刀，毒杀等
  voteDead, //放逐死亡
  gunDead, //被猎人杀死
  explodeDead, //自爆
}

//狼人杀房间配置信息(独有部分)
@JsonSerializable()
class WolfConfigData {
  @JsonKey(name: 'wo_state', fromJson: WolfParseUtil.parseState)
  WolfState state;

  @JsonKey(name: 'wo_vvc', fromJson: Util.parseInt)
  int vvc;

  @JsonKey(name: 'wo_count', fromJson: Util.parseInt, defaultValue: 1)
  int count;

  @JsonKey(name: 'wo_mode', fromJson: Util.parseInt, defaultValue: 2)
  int mode;

  @JsonKey(name: 'wo_ispk', fromJson: WolfParseUtil.parseBool)
  bool ispk;

  @JsonKey(name: 'wo_start', fromJson: Util.parseInt, defaultValue: -1)
  int start;

  @JsonKey(name: 'wo_turns', fromJson: Util.parseInt)
  int turns;

  @JsonKey(name: 'wo_current', fromJson: Util.parseInt, defaultValue: -1)
  int current;

  @JsonKey(name: 'wo_state_type', fromJson: WolfParseUtil.parseStateType)
  WolfStateType stateType;

  @JsonKey(name: 'wo_can_explode', fromJson: WolfParseUtil.parseBool)
  bool canExplode;

  @JsonKey(name: 'wo_dataMap')
  Map? currentResult; //狼人杀本轮结果数据（身份结果、投票结果、游戏结果）

  @JsonKey(
      name: 'wo_player_num_type',
      fromJson: WolfParseUtil.parsePlayerType,
      defaultValue: PlayerType.player9)
  PlayerType playerType;

  @JsonKey(name: 'wo_is_open_card', fromJson: WolfParseUtil.parseBool)
  bool publishDeal;

  WolfConfigData(
      this.state,
      this.vvc,
      this.count,
      this.mode,
      this.ispk,
      this.start,
      this.turns,
      this.current,
      this.stateType,
      this.canExplode,
      this.currentResult,
      this.playerType,
      this.publishDeal);

  factory WolfConfigData.fromJson(Map<String, dynamic> json) =>
      _$WolfConfigDataFromJson(json);
}

//狼人杀坑位信息(独有部分)
@JsonSerializable()
class WolfPositionData {
  @JsonKey(name: 'wo_origin', fromJson: Util.parseInt)
  int origin;

  @JsonKey(name: 'wo_vote', fromJson: Util.parseInt, defaultValue: -1)
  int vote;

  @JsonKey(name: 'wo_role', fromJson: WolfParseUtil.parseRole)
  WolfRole role;

  @JsonKey(name: 'wo_aid', fromJson: Util.parseInt)
  int aid;

  @JsonKey(name: 'wo_price', fromJson: Util.parseInt)
  int price;

  @JsonKey(name: 'wo_isDead', fromJson: WolfParseUtil.parseBool)
  bool isDead;

  @JsonKey(name: 'wo_isDesc', fromJson: WolfParseUtil.parseBool)
  bool isDesc;

  @JsonKey(name: 'wo_count', fromJson: Util.parseInt)
  int count;

  @JsonKey(name: 'wo_target', fromJson: Util.parseInt)
  int target;

  @deprecated
  @JsonKey(name: 'wo_can_action', fromJson: WolfParseUtil.parseBool)
  bool canAction;

  @JsonKey(name: 'wo_action_status', fromJson: WolfParseUtil.parseActionStatus)
  WolfActionStatus actionStatus;

  @JsonKey(
      name: 'wo_can_be_selected',
      fromJson: WolfParseUtil.parseBool,
      defaultValue: false)
  bool canBeSelected;

  @JsonKey(name: 'wo_action_uid', fromJson: Util.parseInt, defaultValue: 0)
  int actionUid;

  @JsonKey(
      name: 'wo_is_ready',
      fromJson: WolfParseUtil.parseReadyState,
      defaultValue: WolfReadyState.notReady)
  WolfReadyState readyState;

  @JsonKey(name: 'wo_is_police', fromJson: Util.parseInt, defaultValue: 0)
  int police;

  @JsonKey(name: 'wo_sex', fromJson: Util.parseInt, defaultValue: 1)
  int sex;

  @JsonKey(name: 'wo_title_url', defaultValue: '')
  String levelIcon;

  @JsonKey(name: 'wo_is_publish_role', fromJson: WolfParseUtil.parseBool)
  bool publishRole;

  @JsonKey(
      name: 'wo_dead_type',
      fromJson: WolfParseUtil.parseDeadType,
      defaultValue: WolfDeadType.killDead)
  WolfDeadType deadType;

  WolfPositionData(
      this.origin,
      this.vote,
      this.role,
      this.aid,
      this.price,
      this.isDead,
      this.isDesc,
      this.count,
      this.target,
      this.canAction,
      this.actionStatus,
      this.canBeSelected,
      this.actionUid,
      this.readyState,
      this.police,
      this.sex,
      this.levelIcon,
      this.publishRole,
      this.deadType);

  factory WolfPositionData.fromJson(Map<String, dynamic> json) =>
      _$WolfPositionDataFromJson(json);

  Map toJson() => _$WolfPositionDataToJson(this);
}

@JsonSerializable()
class RoleItem {
  @JsonKey(name: 'role')
  String roleKey;

  @JsonKey(name: 'role_name')
  String roleName;

  @JsonKey(name: 'num', fromJson: Util.parseInt)
  int roleCount;

  @JsonKey(name: 'price', fromJson: Util.parseInt)
  int price;

  WolfRole get role {
    return WolfParseUtil.parseRole(roleKey);
  }

  RoleItem(this.roleKey, this.roleName, this.roleCount, this.price);

  RoleItem.create(WolfRole role, String roleName, int roleCount, int price,
      String skill, String target)
      : this(WolfParseUtil.encodeRole(role), roleName, roleCount, price);

  factory RoleItem.fromJson(Map<String, dynamic> json) =>
      _$RoleItemFromJson(json);
}

@JsonSerializable()
class GetRoleData {
  @JsonKey(name: 'positionGetRole')
  List<RoleResultItem> positionRoles;

  @JsonKey(name: 'roles')
  List<RoleItem> roles;

  GetRoleData(this.positionRoles, this.roles);

  factory GetRoleData.fromJson(Map<String, dynamic> json) =>
      _$GetRoleDataFromJson(json);
}

@JsonSerializable()
class RoleResultItem extends RoleItem {
  @JsonKey(name: 'uid', fromJson: Util.parseInt)
  int uid;

  @JsonKey(name: 'win_condition')
  String winCondition;

  @JsonKey(name: 'desc')
  String desc;

  RoleResultItem(String roleKey, String roleName, int roleCount, int price,
      this.uid, this.winCondition, this.desc)
      : super(roleKey, roleName, roleCount, price);

  factory RoleResultItem.fromJson(Map<String, dynamic> json) =>
      _$RoleResultItemFromJson(json);
}

@JsonSerializable()
class WitchAntidoteData {
  @JsonKey(defaultValue: false)
  bool hasAntidote; //是否有解药

  @JsonKey(defaultValue: -1)
  int killTarget; //被狼杀的uid

  WitchAntidoteData(this.hasAntidote, this.killTarget);

  factory WitchAntidoteData.fromJson(Map<String, dynamic> json) =>
      _$WitchAntidoteDataFromJson(json);
}

@JsonSerializable()
class WitchPoisonData {
  @JsonKey(defaultValue: false)
  bool hasPoison; //是否有毒药

  @JsonKey(fromJson: Util.parseInt, defaultValue: -1)
  int antidoteTarget; //使用解药的uid

  WitchPoisonData(this.hasPoison, this.antidoteTarget);

  factory WitchPoisonData.fromJson(Map<String, dynamic> json) =>
      _$WitchPoisonDataFromJson(json);
}

@JsonSerializable()
class PoliceJoinResult {
  @JsonKey(name: 'joinPosition')
  List<int> joinedUsers; //上警玩家，麦序

  @JsonKey(name: 'unJoinPosition')
  List<int> abstainUsers; //警下玩家，麦序

  PoliceJoinResult(this.joinedUsers, this.abstainUsers);

  factory PoliceJoinResult.fromJson(Map<String, dynamic> json) =>
      _$PoliceJoinResultFromJson(json);
}

@JsonSerializable()
class PoliceJoinConfig {
  List<int> joinPosition; //上警玩家，麦序

  List<int> exitPosition; //退水玩家，麦序

  bool canExit; //当前阶段 是否可退水

  PoliceJoinConfig(this.joinPosition, this.exitPosition, this.canExit);

  factory PoliceJoinConfig.fromJson(Map<String, dynamic> json) =>
      _$PoliceJoinConfigFromJson(json);
}

@JsonSerializable()
class UserExpInfo {
  int percent; //升级经验占比
  int incrExp; //增加经验
  int level; //狼人杀等级
  String title_logo; //升级的称号（图片地址）

  UserExpInfo(this.percent, this.incrExp, this.level, this.title_logo);

  factory UserExpInfo.fromJson(Map<String, dynamic> json) =>
      _$UserExpInfoFromJson(json);
}

class WolfParseUtil {
  static WolfState parseState(String? state) {
    if (state == null) return WolfState.Wait;
    try {
      String current =
          '${'WolfState'.toLowerCase()}.${state.replaceAll('.', '').toLowerCase()}';
      return WolfState.values.firstWhere((WolfState type) {
        return type.toString().toLowerCase() == current;
      });
    } catch (e) {}
    return WolfState.Wait;
  }

  static WolfStateType parseStateType(dynamic stateType) {
    int value = Util.parseInt(stateType, 0);
    if (value == 1) {
      return WolfStateType.night;
    } else if (value == 2) {
      return WolfStateType.day;
    }
    return WolfStateType.other;
  }

  static PlayerType parsePlayerType(dynamic playerType) {
    int type = Util.parseInt(playerType);
    switch (type) {
      case 1:
        return PlayerType.player9;
      case 2:
        return PlayerType.player6;
      case 3:
        return PlayerType.player12;
      case 4:
        return PlayerType.newplayer9;
      default:
        return PlayerType.newplayer6;
    }
  }

  static WolfRole parseRole(String role) {
    switch (role) {
      case 'none':
        return WolfRole.None;
      case 'popular':
        return WolfRole.Popular;
      case 'wolf':
        return WolfRole.Werewolf;
      case 'witch':
        return WolfRole.Witch;
      case 'seer':
        return WolfRole.Seer;
      case 'hunter':
        return WolfRole.Hunter;
      case 'guard':
        return WolfRole.Guard;
      default:
        return WolfRole.None;
    }
  }

  static String encodeRole(WolfRole role) {
    switch (role) {
      case WolfRole.None:
        return 'none';
      case WolfRole.Popular:
        return 'popular';
      case WolfRole.Werewolf:
        return 'wolf';
      case WolfRole.Witch:
        return 'witch';
      case WolfRole.Seer:
        return 'seer';
      case WolfRole.Hunter:
        return 'hunter';
      case WolfRole.Guard:
        return 'guard';
      default:
        return 'none';
    }
  }

  static WolfReadyState parseReadyState(dynamic readyState) {
    int state = Util.parseInt(readyState);
    switch (state) {
      case 0:
        return WolfReadyState.notReady;
      case 1:
        return WolfReadyState.ready;
      case 2:
        return WolfReadyState.none;
      default:
        return WolfReadyState.none;
    }
  }

  static bool parseBool(dynamic value) {
    return Util.parseInt(value, 0) > 0;
  }

  static String parseRoleName(WolfRole role, {bool isShort = false}) {
    switch (role) {
      case WolfRole.Werewolf:
        return isShort
            ? R.array('room_short_identitys')[2]
            : R.array('room_identitys')[2];
      case WolfRole.Witch:
        return isShort
            ? R.array('room_short_identitys')[1]
            : R.array('room_identitys')[1];
      case WolfRole.Seer:
        return isShort
            ? R.array('room_short_identitys')[0]
            : R.array('room_identitys')[0];
      case WolfRole.Hunter:
        return isShort
            ? R.array('room_short_identitys')[5]
            : R.array('room_identitys')[5];
      case WolfRole.Guard:
        return isShort
            ? R.array('room_short_identitys')[4]
            : R.array('room_identitys')[4];
      case WolfRole.Popular:
        return isShort
            ? R.array('room_short_identitys')[3]
            : R.array('room_identitys')[3];
      default:
        return '';
    }
  }

  static WolfActionStatus parseActionStatus(dynamic status) {
    int actionStatus = Util.parseInt(status);
    switch (actionStatus) {
      case 0:
        return WolfActionStatus.disable;
      case 1:
        return WolfActionStatus.enable;
      case 2:
        return WolfActionStatus.finish;
      default:
        return WolfActionStatus.disable;
    }
  }

  static String encodePosition(dynamic position, RoomPosition? selfPosition) {
    if (position == null) return '';

    int pos = Util.parseInt(position);
    if (pos == -1) {
      return K.vote_abstain;
    } else if (pos == selfPosition?.position) {
      return K.room_wolf_yourself;
    } else {
      return '${pos + 1}';
    }
  }

  static Map<String, List<String>> parseVoteResult(
      Map? voteResList, RoomPosition? selfPosition) {
    Map<String, List<String>> voteResult = {};
    if (voteResList == null) return voteResult;

    parsePosition(_) => encodePosition(_, selfPosition);
    voteResList.forEach((key, value) {
      if (value is List) {
        voteResult[parsePosition(key)] =
            value.map(parsePosition).cast<String>().toList();
      }
    });
    return voteResult;
  }

  static WolfDeadType parseDeadType(String deadType) {
    Log.d('parseDeadType deadType=$deadType');
    switch (deadType) {
      case 'kill_dead':
        return WolfDeadType.killDead;
      case 'vote_dead':
        return WolfDeadType.voteDead;
      case 'gun_dead':
        return WolfDeadType.gunDead;
      case 'explode_dead':
        return WolfDeadType.explodeDead;
      default:
        return WolfDeadType.killDead;
    }
  }
}
