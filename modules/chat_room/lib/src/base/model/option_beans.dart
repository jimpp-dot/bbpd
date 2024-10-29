import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'option_beans.g.dart';

@JsonSerializable(createToJson: false)
class OptionsResp extends BaseResponse {
  Options? data;

  OptionsResp({super.success, super.msg, this.data});

  factory OptionsResp.fromJson(Map<String, dynamic> json) => _$OptionsRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class Options {
  @JsonKey(name: "is_member")
  bool isMember;

  @JsonKey(name: "switch_name")
  String switchName;

  @JsonKey(name: "switch_type_option")
  List<OptionItem> switchItems;

  @JsonKey(name: "second_name")
  String basicName;

  @JsonKey(name: "room_second_option")
  List<OptionItem> basicItems;

  @JsonKey(name: "third_name")
  String advancedName;

  @JsonKey(name: "room_third_option")
  List<OptionItem> advancedItems;

  Options(this.isMember, this.switchName, this.switchItems, this.basicName, this.basicItems, this.advancedName, this.advancedItems);

  factory Options.fromJson(Map<String, dynamic> json) => _$OptionsFromJson(json);
}

@JsonSerializable(createToJson: true)
class OptionItem {
  String? type;

  String? name;

  String? icon;

  @JsonKey(name: "val_type")
  String? valueType;

  @JsonKey(name: "home_icon")
  String? homeIcon; //玩法大图

  @JsonKey(name: "room_cover")
  String? roomCover; //房间封面

  @JsonKey(name: "room_cover_status")
  String? roomCoverStatus; //房间封面审核状态

  dynamic value;

  /// 仅针对狼人杀标准，和狼人杀警徽
  bool lock = false;

  @JsonKey(name: "sub_items")
  List<OptionItem>? subItems;

  OptionItem.valueType(this.valueType);

  OptionItem(
    this.type,
    this.name,
    this.icon,
    this.valueType,
    this.value,
    this.subItems,
    this.lock,
    this.homeIcon,
    this.roomCover,
    this.roomCoverStatus,
  );

  @override
  String toString() {
    return 'OptionItem{type: $type, name: $name, icon: $icon}';
  }

  factory OptionItem.fromJson(Map<String, dynamic> json) => _$OptionItemFromJson(json);

  Map<String, dynamic> toJsonPara() {
    return {"type": type, "value": value};
  }
}

class RoomSettingData {
  final List<OptionItem> list;
  final bool nameAudit;
  final bool descriptionAudit;

  RoomSettingData.fromJson(Map<String, dynamic> json)
      : list = Util.parseList(json['list'], (e) => OptionItem.fromJson(e)),
        nameAudit = Util.parseBool(json['name_audit']),
        descriptionAudit = Util.parseBool(json['description_audit']);
}

class OptionType {
  static const ROOM_LOCK = "room_lock"; //房间加锁
  static const ROOM_UNLOCK = "room_unlock"; //房间解锁
  static const ROOM_SETTING = "room_setting"; //更多设置项
  static const ROOM_EXIT = "exit"; //普通用户退出房间
  static const ROOM_PRIVATE_LEVEL = "private_level"; // 房间属性设置：公开，好友可见，私密
  static const ROOM_PLAY = "room_play"; //房间陪玩
  static const ROOM_TICKET = "room_ticket"; //房间门票
  static const LISTENSONG_THEME = 'listensong_theme'; //音乐房主题

  static const SWITCH_ROOM_TYPE_KILLER = "killer"; //切换到谁是凶手房间
  static const SWITCH_ROOM_TYPE_PUZZLE = "puzzle"; //切换到海龟汤房间
  static const SWITCH_ROOM_TYPE_TABLE_GAME = "table-game"; //切换到小游戏房间
  static const SWITCH_ROOM_TYPE_APPRAISER = 'appraiser';

  /// 需要刷新设置项的选项，打开公屏，关闭公屏，打开隐身，关闭隐身
  static const SHOULD_REFRESH_OPTIONS = <String>{"open-message", "close-message", "stealth", "unstealth"};

  static const ROOM_INVITE_SINGER_CLUB = 'invite_singer_club'; //已在歌友会的房主邀请成员加入歌友会入口
}

class OptionValueType {
  static const TEXT = "text"; //文本
  static const SWITCH = "switch"; //开关
  static const LIST = "list"; //多选项，例如房间属性：公开，好友可见，私密，
  static const THEME = 'party_sub_type'; // 切换房间主题，抽象为party_type，和room_type
  static const DIVIDER = "divider"; //分割线, 客户端自己添加的
  static const LINK = 'link'; // 自定义类型
}

class OptionItemType {
  static const SYSTEM_CONFIG = 'system_config'; // 系统配置
}
