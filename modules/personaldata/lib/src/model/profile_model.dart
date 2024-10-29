import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:personaldata/src/model/title_role_bean.dart';
import 'package:shared/model/fans_group_model.dart';

import '../../k.dart';

part 'profile_model.g.dart';

/// 用户信息response
@JsonSerializable(createToJson: false)
class ProfileResponse extends BaseResponse {
  final ProfileBean? data;

  ProfileResponse({bool success = false, String msg = '', this.data})
      : super(msg: msg, success: success);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProfileBean {
  @JsonKey(fromJson: Util.parseInt)
  final int? uid;
  final String? name;
  final String? icon;

  @JsonKey(fromJson: Util.parseInt)
  final int? age;
  final String? birthday;
  final String? sign;
  final String? city;
  final double? latitude;
  final double? longitude;

  @JsonKey(name: 'online_status', fromJson: Util.parseInt)
  final int? onlineStatus;

  @JsonKey(name: 'online_dateline', fromJson: Util.parseInt)
  final int? onlineDateline;

  @JsonKey(name: 'online_dateline_diff')
  final String? onlineDatelineDiff;

  @JsonKey(fromJson: Util.parseInt)
  final int? job;
  @JsonKey(fromJson: Util.parseInt)
  final int? sex;
  @JsonKey(fromJson: Util.parseInt)
  final int? title;
  @JsonKey(name: 'title_new', fromJson: Util.parseInt)
  final int? titleNew;
  @JsonKey(fromJson: Util.parseInt)
  final int? star;

  @JsonKey(name: 'god_num', fromJson: Util.parseInt)
  final int? godNum;

  @JsonKey(name: 'god_category')
  final String? godCategory;
  @JsonKey(fromJson: Util.parseInt)
  final int? deleted;

  @JsonKey(name: 'block_un_auther_message', fromJson: Util.parseInt)
  final int? blockUnAutherMessage;

  final String? position;

  @JsonKey(name: 'service_pause', fromJson: Util.parseInt)
  final int? servicePause;

  @JsonKey(name: 'service_busy', fromJson: Util.parseInt)
  final int? serviceBusy;

  @JsonKey(name: 'credit_god_level', fromJson: Util.parseInt)
  final int? creditGodLevel;

  @JsonKey(name: 'credit_user_level', fromJson: Util.parseInt)
  final int? creditUserLevel;

  @JsonKey(fromJson: Util.parseInt)
  final int? tag;

  @JsonKey(name: 'friend_state', fromJson: Util.parseInt)
  final int? friendState;

  @JsonKey(name: 'has_video', fromJson: Util.parseInt)
  final int? hasVideo;
  @JsonKey(fromJson: Util.parseInt)
  final int? role;
  @JsonKey(fromJson: Util.parseInt)
  final int? vipLevel;
  @JsonKey(fromJson: Util.parseInt)
  final int? follow;
  @JsonKey(name: 'is_newer', fromJson: Util.parseInt)
  final int? isNew; // 萌新

  @JsonKey(name: 'game_success', fromJson: Util.parseInt)
  final int? gameSuccess;

  @JsonKey(name: 'game_complete', fromJson: Util.parseInt)
  final int? gameComplete;
  @JsonKey(fromJson: Util.parseInt)
  final int? authentication;
  final dynamic authenticationScore;
  final String? authenticationSign;

  // @JsonKey(fromJson: Util.parseInt)
  // final int defend;
  // final DefendRelationModel defendMax;

  @JsonKey(name: 'mark_name')
  final String? markName; // 备注名称

  @JsonKey(name: 'defend_list')
  final List<DefendRelationModel>?
      defendList; // 守护列表 数据可能会很多 只返回部分 总数取defendCount

  @JsonKey(name: 'defend_count')
  final int? defendCount;

  final List<String>? photos;
  final List<Map<dynamic, dynamic>>? videos;

  final List<GameBean>? games;

  final List<GiftBean>? gifts;
  final List<InterestBean>? interest;
  final List<SkillBean>? skill;

  final RoomBean? room;
  final FleetBean? fleet;
  final SelfBean? self;

  @JsonKey(name: 'union_info')
  final UnionBean? union;

  @JsonKey(name: 'card')
  final ChatMatchItem? cardInfo;

  @JsonKey(fromJson: Util.parseInt)
  final int? topic; // 动态数量

  @JsonKey(name: 'need_verify', fromJson: Util.parseInt)
  final int? needVerify;

  @JsonKey(name: 'need_verify_new')
  final int? needVerifyNew;

  @JsonKey(fromJson: Util.parseInt)
  final int? official;

  final Map<dynamic, int>? accompany; //陪伴榜数据 degree对应亲密度 stay_secs陪伴时间单位秒

  @JsonKey(fromJson: Util.parseInt, name: 'popularity_level')
  final int? popularityLevel;

  // 主页装扮 只支持VAP格式
  final DecorateBean? decorate;

  @JsonKey(name: 'follow_relation', fromJson: Util.parseInt)
  final int? followRelation; //0陌生人 1关注 2好友 3粉丝

  final List? mark; //印记

  final Map? accompanyFirst; //陪伴榜第一名数据

  final List<PersonalTagModel>? tags; //个人标签

  @JsonKey(name: 'friend_tags')
  final List<PersonalTagModel>? friendTags; //交友标签

  @JsonKey(fromJson: Util.parseInt)
  final int? dateline;

  // @JsonKey(name: 'attendant')
  // final List<DefendRelationModel> attendant;//拍拍关系

  final Map<String, dynamic>? marry;

  @JsonKey(name: 'game_history')
  final dynamic gameHistory;

  @JsonKey(name: 'game')
  final Map? game;

  final bool? icongray;

  final List? glist;
  @JsonKey(name: 'party_group')
  final GroupInfoList? groupInfoList;

  @JsonKey(name: 'fans_num', fromJson: Util.parseInt)
  final int? fansNum;

  @JsonKey(name: 'distance')
  final String? distance; //

  @JsonKey(name: 'accompany_num')
  final int? accompanyNum; //陪伴榜人数
  @JsonKey(name: 'business_card')
  final BusinessCard? businessCard;
  @JsonKey(name: 'business_card_new')
  final BusinessCard? businessCardNew;

  @JsonKey(name: 'ju_titles')
  final List<TitleRoleItemBean>? roleTitles; //角色称号

  @JsonKey(name: 'rookie_tag')
  final RookieTag? rookieTag;

  @JsonKey(name: 'new_noble', fromJson: Util.parseBool)
  final bool? isNewNoble; //新贵

  @JsonKey(name: 'kfg_show')
  FansGroupInfo? fansGroupInfo;

  final String? frame;

  @JsonKey(name: 'circle_count')
  final int? circleNum;

  @JsonKey(name: 'follow_num')
  final int? followNum;

  final Visitor? visitor;

  @JsonKey(name: 'fans_incre')
  final int? fansIncre;

  final int? author;

  @JsonKey(name: 'star_verify_tag')
  final int? starVerifyTag;

  ProfileBean({
    this.uid,
    this.name,
    this.icon,
    this.age,
    this.birthday,
    this.sign,
    this.city,
    this.onlineStatus,
    this.onlineDateline,
    this.onlineDatelineDiff,
    this.job,
    this.sex,
    this.title,
    this.titleNew,
    this.star,
    this.godNum,
    this.godCategory,
    this.deleted,
    this.blockUnAutherMessage,
    this.position,
    this.servicePause,
    this.serviceBusy,
    this.creditGodLevel,
    this.creditUserLevel,
    this.tag,
    this.friendState,
    this.hasVideo,
    this.role,
    this.vipLevel,
    this.follow,
    this.gameSuccess,
    this.gameComplete,
    this.authentication,
    this.authenticationScore,
    this.authenticationSign,
    // this.defend,
    this.defendList,
    this.markName,
    this.photos,
    this.videos,
    this.games,
    this.gifts,
    this.interest,
    this.skill,
    this.room,
    this.fleet,
    this.self,
    this.latitude,
    this.longitude,
    this.cardInfo,
    this.topic,
    this.needVerify,
    this.needVerifyNew,
    this.official,
    this.isNew,
    this.accompany,
    this.popularityLevel,
    this.decorate,
    this.followRelation,
    this.mark,
    this.accompanyFirst,
    this.tags,
    this.friendTags,
    this.dateline,
    // this.attendant,
    this.union,
    this.marry,
    this.gameHistory,
    this.game,
    this.icongray,
    this.glist,
    this.fansNum,
    this.distance,
    this.groupInfoList,
    this.accompanyNum,
    this.businessCard,
    this.businessCardNew,
    this.defendCount,
    this.roleTitles,
    this.rookieTag,
    this.isNewNoble,
    this.fansGroupInfo,
    this.frame,
    this.circleNum,
    this.followNum,
    this.visitor,
    this.fansIncre,
    this.author,
    this.starVerifyTag,
  });

  factory ProfileBean.fromJson(Map<String, dynamic> json) =>
      _$ProfileBeanFromJson(json);

  // Map<String, dynamic> toJson() => _$ProfileBeanToJson(this);

  String getOnlineMessage() {
    String msg = '';

    //距离
    if (distance != null && distance!.isNotEmpty) {
      msg = distance!;
    }

    //在线时间
    if (msg.isNotEmpty) {
      if (Util.parseInt(serviceBusy) > 0) {
        msg = '$msg · ${R.string('busing')}';
      } else if (Util.parseInt(onlineDateline) > 0) {
        if (Util.parseInt(onlineStatus) == 0) {
          msg = '$msg · ${R.string('online')}';
        } else if (onlineDatelineDiff != null &&
            onlineDatelineDiff!.isNotEmpty) {
          msg = '$msg · $onlineDatelineDiff';
        }
      }
    } else {
      if (Util.parseInt(serviceBusy) > 0) {
        msg = R.string('busing');
      } else if (Util.parseInt(onlineDateline) > 0) {
        if (Util.parseInt(onlineStatus) == 0) {
          msg = R.string('online');
        } else if (onlineDatelineDiff != null &&
            onlineDatelineDiff!.isNotEmpty) {
          msg = onlineDatelineDiff!;
        }
      }
    }

    //粉丝
    if (msg.isNotEmpty) {
      if (Util.parseInt(fansNum) > 0) {
        msg = '$msg · $fansNum${K.personal_fans_num}';
      }
    } else {
      if (Util.parseInt(fansNum) > 0) {
        msg = '$fansNum${K.personal_fans_num}';
      }
    }

    return msg;
  }

  // 获取展示名称，有备注名优先显示备注名
  String get displayName {
    if (markName != null && markName!.isNotEmpty) {
      return markName!;
    } else {
      return name ?? '';
    }
  }

  /// 游戏完成率
  int get completeRate {
    return (gameComplete ?? 0) > 0
        ? (100 * ((gameSuccess ?? 0) / gameComplete!)).toInt()
        : 0;
  }

  bool get hasTopic {
    return topic != null && topic! > 0;
  }

  bool get isNewer {
    return isNew != null && isNew! > 0;
  }

  bool get hasAudio {
    return cardInfo?.audio != null &&
        cardInfo!.audio!.isNotEmpty &&
        cardInfo?.duration != null &&
        cardInfo!.duration! > 0;
  }

  String get fullFramePath {
    if (frame == null || frame?.isEmpty == true) {
      return '';
    }
    if (frame?.endsWith('.png') ?? false) {
      return Util.getRemoteImgUrl(frame!);
    }

    if (!(frame?.endsWith('.webp') ?? false)) {
      return '${System.imageDomain}static/effect/$frame.png';
    } else {
      return '${System.imageDomain}static/effect/$frame';
    }
  }
}

@JsonSerializable()
class Visitor {
  @JsonKey(name: 'new')
  final int visitorNew;
  @JsonKey(name: 'total')
  final int visitorTotal;
  @JsonKey(name: 'time')
  final int visitorTime;

  Visitor({this.visitorNew = 0, this.visitorTotal = 0, this.visitorTime = 0});

  factory Visitor.fromJson(Map<String, dynamic> json) =>
      _$VisitorFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorToJson(this);
}

@JsonSerializable()
class BusinessCard {
  final String banner;
  final String header;

  BusinessCard({this.banner = '', this.header = ''});

  factory BusinessCard.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessCardToJson(this);
}

@JsonSerializable()
class RookieTag {
  @JsonKey(name: 'seven_new')
  final int sevenNew;

  @JsonKey(name: 'pay_level')
  final int payLevel;

  RookieTag({this.sevenNew = 0, this.payLevel = 0});

  factory RookieTag.fromJson(Map<String, dynamic> json) =>
      _$RookieTagFromJson(json);

  Map<String, dynamic> toJson() => _$RookieTagToJson(this);
}

@JsonSerializable()
class GameBean {
  final String? id;
  final String? name;
  final String? icon;
  @JsonKey(name: 'game_id')
  final String? gameId;
  final int num;

  GameBean({this.id, this.name, this.icon, this.num = 0, this.gameId});

  factory GameBean.fromJson(Map<String, dynamic> json) =>
      _$GameBeanFromJson(json);

  Map<String, dynamic> toJson() => _$GameBeanToJson(this);

  String get gameIcon {
    return '${System.imageDomain}$icon';
  }
}

@JsonSerializable()
class GiftBean {
  final int gid;
  final int num;
  final String name;
  final int sum;

  GiftBean(this.gid, this.num, this.name, this.sum);

  factory GiftBean.fromJson(Map<String, dynamic> json) =>
      _$GiftBeanFromJson(json);

  Map<String, dynamic> toJson() => _$GiftBeanToJson(this);
}

@JsonSerializable()
class InterestBean {
  final String? name;

  InterestBean({this.name});

  factory InterestBean.fromJson(Map<String, dynamic> json) =>
      _$InterestBeanFromJson(json);

  Map<String, dynamic> toJson() => _$InterestBeanToJson(this);
}

@JsonSerializable()
class SkillBean {
  final int cid;
  final String? rid;
  final String? name;
  final String? icon;
  final int dateline;
  final int num;

  @JsonKey(name: 'is_default')
  final int isDefault;

  @JsonKey(name: '_types')
  final List<String>? types;

  @JsonKey(name: '_level')
  final String? level;

  @JsonKey(name: '_price')
  final List<PriceBean>? price;

  @JsonKey(name: 'user_god_tag_list', defaultValue: [])
  final List<String>? godTags;

  SkillBean(
      {this.cid = 0,
      this.rid,
      this.name,
      this.icon,
      this.dateline = 0,
      this.num = 0,
      this.isDefault = 0,
      this.types,
      this.level,
      this.price,
      this.godTags});

  factory SkillBean.fromJson(Map<String, dynamic> json) =>
      _$SkillBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SkillBeanToJson(this);

  /// 技能图标
  String get skillIcon {
    String url = icon ?? '';
    if (url.isEmpty) {
      return '';
    }

    if (!url.startsWith(RegExp(r'http(s?):\/\/'))) {
      url = System.imageDomain + url;
    }

    return url;
  }
}

@JsonSerializable()
class PriceBean {
  @JsonKey(name: 'uint')
  final String unit;
  final int price;
  final int cheap;

  PriceBean(this.unit, this.price, this.cheap);

  factory PriceBean.fromJson(Map<String, dynamic> json) =>
      _$PriceBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PriceBeanToJson(this);
}

@JsonSerializable()
class FleetBean {
  final int gid;
  final String? name;
  final String? icon;
  final int total;
  @JsonKey(name: 'creator', fromJson: Util.parseInt)
  final int creatorId;

  @JsonKey(name: 'in', fromJson: Util.parseInt)
  final int inNum;

  FleetBean(
      {this.gid = 0,
      this.name,
      this.icon,
      this.total = 0,
      this.inNum = 0,
      this.creatorId = 0});

  factory FleetBean.fromJson(Map<String, dynamic> json) =>
      _$FleetBeanFromJson(json);

  Map<String, dynamic> toJson() => _$FleetBeanToJson(this);
}

@JsonSerializable()
class UnionBean {
  @JsonKey(name: 'un_id')
  final int unionId;

  final String? name;

  @JsonKey(name: 'logo')
  final String? icon;

  @JsonKey(name: 'create_uid')
  final int creatorId;

  @JsonKey(name: 'user_title') ////管理头衔，80：无头衔，10：盟主，20：副盟主，30：长老
  final String? userTitle; //用户头衔

  @JsonKey(name: 'title_name')
  final String? titleName; //用户头衔名称

  UnionBean(
      {this.unionId = 0,
      this.name,
      this.icon,
      this.creatorId = 0,
      this.userTitle,
      this.titleName});

  factory UnionBean.fromJson(Map<String, dynamic> json) =>
      _$UnionBeanFromJson(json);

  Map<String, dynamic> toJson() => _$UnionBeanToJson(this);
}

@JsonSerializable()
class SelfBean {
  final bool video;
  @JsonKey(name: 'pay_num')
  final int payNum;

  SelfBean({this.video = false, this.payNum = 0});

  factory SelfBean.fromJson(Map<String, dynamic> json) =>
      _$SelfBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SelfBeanToJson(this);
}

@JsonSerializable()
class RoomBean {
  final String? rid;
  final String? prefix;
  final int uid;
  final String? name;
  final String? type;
  final String? weight;
  final String? types;

  @JsonKey(name: 'online_num')
  final int onlineNum;
  final String? icon;
  final int version;
  final String? dateline;
  final int password;
  @JsonKey(name: 'boss_uid')
  final String? bossUid;
  final String? uname;
  final String? utitle;

  @JsonKey(name: 'pay_room_money')
  final String? payRoomMoney;

  final int deleted;
  final int vip;
  final TypeNameBean? typeName;
  final int guestEnable;
  final String? tag;
  final int real;
  final String? property;
  @JsonKey(name: 'onmic_num', fromJson: Util.parseInt)
  final int onMicNum;

  @JsonKey(defaultValue: '')
  final String? role; //creator 创建者 admin 管理员

  RoomBean(
      {this.rid,
      this.prefix,
      this.uid = 0,
      this.name,
      this.type,
      this.weight,
      this.types,
      this.onlineNum = 0,
      this.icon,
      this.version = 0,
      this.dateline,
      this.password = 0,
      this.bossUid,
      this.uname,
      this.utitle,
      this.payRoomMoney,
      this.deleted = 0,
      this.vip = 0,
      this.typeName,
      this.guestEnable = 0,
      this.tag,
      this.real = 0,
      this.property,
      this.onMicNum = 0,
      this.role});

  factory RoomBean.fromJson(Map<String, dynamic> json) =>
      _$RoomBeanFromJson(json);

  Map<String, dynamic> toJson() => _$RoomBeanToJson(this);
}

@JsonSerializable()
class TypeNameBean {
  final String? label;
  final String? val;
  final String? color;
  final String? show;

  TypeNameBean({
    this.label,
    this.val,
    this.color,
    this.show,
  });

  factory TypeNameBean.fromJson(Map<String, dynamic> json) =>
      _$TypeNameBeanFromJson(json);

  Map<String, dynamic> toJson() => _$TypeNameBeanToJson(this);
}

@JsonSerializable()
class DecorateBean {
  @JsonKey(name: 'gift_id')
  final int giftId;
  @JsonKey(name: 'vap_size')
  final int vapSize;

  DecorateBean(this.giftId, this.vapSize);

  factory DecorateBean.fromJson(Map<String, dynamic> json) =>
      _$DecorateBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DecorateBeanToJson(this);

  bool hasDecorate() {
    return giftId > 0 && vapSize > 0;
  }
}

@JsonSerializable(createToJson: false)
class ProfileUnionInfo {
  int level;
  String icon;
  String name;
  String role;

  ProfileUnionInfo(this.level, this.icon, this.name, this.role);

  factory ProfileUnionInfo.fromJson(Map<String, dynamic> json) =>
      _$ProfileUnionInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupInfoList {
  int total;
  List<GroupInfoItem> list;

  GroupInfoList(this.total, this.list);

  factory GroupInfoList.fromJson(Map<String, dynamic> json) =>
      _$GroupInfoListFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupInfoItem {
  @JsonKey(name: 'group_id')
  int groupId;

  String name;
  String cover;

  @JsonKey(name: 'member_num')
  String memberNum;

  @JsonKey(name: 'in')
  bool inGroup;

  bool official;

  GroupInfoItem(this.groupId, this.name, this.cover, this.memberNum,
      this.inGroup, this.official);

  factory GroupInfoItem.fromJson(Map<String, dynamic> json) =>
      _$GroupInfoItemFromJson(json);
}
