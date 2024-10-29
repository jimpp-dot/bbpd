import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moment/k.dart';

part 'tag_bean.g.dart';

/// 普通标签
@JsonSerializable()
class TagCate {
  final int id;
  final String? name;
  final List<TagCate> sub;

  TagCate(this.id, this.name, this.sub);

  factory TagCate.fromJson(Map<String, dynamic> json) =>
      _$TagCateFromJson(json);

  Map<String, dynamic> toJson() => _$TagCateToJson(this);
}

/// 普通标签
@JsonSerializable()
class TagDetail {
  final List<String> tags;

  /// 是否朋友圈白名单用户
  @JsonKey(name: 'is_circle_white_list')
  final bool isCircleWhiteList;

  /// 是否@白名单用户，可以@好友、关注、粉丝
  @JsonKey(name: 'is_circle_at_account_white_list')
  final bool isCircleAtAccountWhiteList;

  /// 身份认证类型
  @JsonKey(name: 'need_verify_new')
  final int needVerifyNew;

  TagDetail(this.tags, this.isCircleWhiteList, this.isCircleAtAccountWhiteList,
      this.needVerifyNew);

  factory TagDetail.fromJson(Map<String, dynamic> json) =>
      _$TagDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TagDetailToJson(this);
}

/// 标签
@JsonSerializable()
class MomentTags {
  final List<String> tags;

  MomentTags({required this.tags});

  factory MomentTags.fromJson(Map<String, dynamic> json) =>
      _$MomentTagsFromJson(json);

  Map<String, dynamic> toJson() => _$MomentTagsToJson(this);
}

/// 话题信息
@JsonSerializable()
class TagInfo {
  final int id;
  final String? name;
  @JsonKey(name: 'bgimg')
  final String? bgImg;
  @JsonKey(name: 'user_num', fromJson: Util.parseInt)
  final int userNum;
  @JsonKey(name: 'icons')
  final List<String> avatarUrls;

  @JsonKey(fromJson: Util.parseInt)
  int isFollow;

  @JsonKey(name: 'rcmd_name ')
  final String? desc;

  TagInfo(this.id, this.name, this.bgImg, this.userNum, this.avatarUrls,
      this.isFollow, this.desc);

  factory TagInfo.fromJson(Map<String, dynamic> json) =>
      _$TagInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TagInfoToJson(this);

  bool get isTopicFollow {
    return isFollow > 0;
  }
}

/// 约玩标签
@JsonSerializable()
class PlayTag {
  final String? name;
  final String? mode; // 模式
  final String? srv; // 区服
  final String? level; // 段位
  final String? type; // 游戏类型
  @JsonKey(fromJson: Util.parseInt)
  final int id;

  PlayTag(this.name, this.mode, this.srv, this.level, this.type, this.id);

  factory PlayTag.fromJson(Map<String, dynamic> json) =>
      _$PlayTagFromJson(json);

  Map<String, dynamic> toJson() => _$PlayTagToJson(this);

  String get displayGameText {
    String text = '';
    if (name != null) {
      text += name!;
    }

    if (mode != null && mode != K.rush_unlimit) {
      text += ' | ${mode!}';
    }

    if (srv != null && srv != K.rush_unlimit) {
      text += ' | ${srv!}';
    }

    if (level != null && level != K.rush_unlimit) {
      text += ' | ${level!}';
    }

    return text;
  }

  String get displayTitleName {
    if (type == 'other') {
      return K.moment_tag_other;
    } else {
      return name ?? '';
    }
  }

  String get tagName {
    String text = '${name ?? ''} | 约玩';
    if (srv != null && srv != K.rush_unlimit) {
      text += ' | ${srv!}';
    } else {
      text += ' | ${K.moment_srv_unlimit}';
    }
    return text;
  }
}

/// 普通标签(话题)
@JsonSerializable()
class NormalTag {
  @JsonKey(fromJson: Util.parseInt)
  final int id;
  final String? tag;

  NormalTag(this.id, this.tag);

  factory NormalTag.fromJson(Map<String, dynamic> json) =>
      _$NormalTagFromJson(json);

  Map<String, dynamic> toJson() => _$NormalTagToJson(this);
}

/// 游戏卡
@JsonSerializable()
class Card {
  final String? gname; // 游戏名
  final String? name; // 段位名
  final String? icon; // 游戏图标
  @JsonKey(fromJson: Util.parseInt)
  final int certify; // 1 已认证
  final String? bgicon; // 卡片背景色

  Card(this.gname, this.name, this.icon, this.certify, this.bgicon);

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);

  bool get isVerify {
    return certify == 1;
  }

  String? get gameIcon {
    String? url = icon;
    if (url != null && !url.startsWith(RegExp(r'http(s?)://'))) {
      url = System.imageDomain + url;
    }
    return url;
  }
}

// 案例标签
class CaseTag {
  int id;
  String? tag;
  String? icon;

  CaseTag(this.id, this.tag, this.icon);
}

// 故事标签，鉴定师
@JsonSerializable()
class AppraiserTag {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'tag')
  String? tag;

  AppraiserTag(this.id, this.tag);

  factory AppraiserTag.fromJson(Map<String, dynamic> json) {
    return AppraiserTag(
      Util.parseInt(json['id']),
      Util.parseStr(json['tag']),
    );
  }
}

// 广播标签
@JsonSerializable()
class BroadcastTag {
  @JsonKey(name: 'tag_id')
  int id;
  @JsonKey(name: 'tag_name')
  String? tag;

  BroadcastTag(this.id, this.tag);

  factory BroadcastTag.fromJson(Map<String, dynamic> json) =>
      _$BroadcastTagFromJson(json);

  Map<String, dynamic> toJson() => _$BroadcastTagToJson(this);
}

// 广播标签
@JsonSerializable()
class WeddingTag {
  @JsonKey(name: 'id', fromJson: Util.parseInt)
  final int id;
  @JsonKey(name: 'card')
  final WeddingCard? card;

  WeddingTag(this.id, this.card);

  factory WeddingTag.fromJson(Map<String, dynamic> json) =>
      _$WeddingTagFromJson(json);

  Map<String, dynamic> toJson() => _$WeddingTagToJson(this);
}

// 广播标签
@JsonSerializable()
class WeddingCard {
  @JsonKey(name: 'wid', fromJson: Util.parseInt)
  final int wid;
  @JsonKey(name: 'time', fromJson: Util.parseInt)
  final int time;

  @JsonKey(name: 'man_uid')
  final String? manUid;
  @JsonKey(name: 'man_icon')
  final String? manIcon;
  @JsonKey(name: 'man_name')
  final String? manName;
  @JsonKey(name: 'woman_uid')
  final String? womanUid;
  @JsonKey(name: 'woman_icon')
  final String? womanIcon;
  @JsonKey(name: 'woman_name')
  final String? womanName;
  @JsonKey(name: 'tag_name')
  final String? tagName;

  WeddingCard(this.wid, this.time, this.manUid, this.manIcon, this.manName,
      this.womanUid, this.womanIcon, this.womanName, this.tagName);

  factory WeddingCard.fromJson(Map<String, dynamic> json) =>
      _$WeddingCardFromJson(json);

  Map<String, dynamic> toJson() => _$WeddingCardToJson(this);
}

/// 案例卡
@JsonSerializable()
class TagsCase {
  @JsonKey(fromJson: Util.parseInt)
  final int id;
  final String? tag;
  final String? icon;
  @JsonKey(name: 'user_count', fromJson: Util.parseInt)
  final int userCount;
  @JsonKey(name: 'comment_count', fromJson: Util.parseInt)
  final int commentCount;

  TagsCase(this.id, this.tag, this.icon, this.userCount, this.commentCount);

  factory TagsCase.fromJson(Map<String, dynamic> json) =>
      _$TagsCaseFromJson(json);

  Map<String, dynamic> toJson() => _$TagsCaseToJson(this);
}

// 好声音标签
@JsonSerializable()
class GoodVoiceTag {
  @JsonKey(name: 'id', fromJson: Util.parseInt)
  final int id;
  @JsonKey(name: 'card')
  final TagsGoodVoice? card;

  GoodVoiceTag(this.id, this.card);

  factory GoodVoiceTag.fromJson(Map<String, dynamic> json) =>
      _$GoodVoiceTagFromJson(json);

  Map<String, dynamic> toJson() => _$GoodVoiceTagToJson(this);
}

/// 好声音
@JsonSerializable()
class TagsGoodVoice {
  @JsonKey(fromJson: Util.parseInt)
  final int vid;
  final String? name;
  final String? info;
  final String? icon;
  @JsonKey(name: 'v_url', fromJson: Util.parseStr)
  final String? vUrl;
  @JsonKey(name: 'tag_name', fromJson: Util.parseStr)
  final String? userName;

  TagsGoodVoice({
    required this.vid,
    this.name,
    this.info,
    this.icon,
    this.vUrl,
    this.userName,
  });

  factory TagsGoodVoice.fromJson(Map<String, dynamic> json) =>
      _$TagsGoodVoiceFromJson(json);

  Map<String, dynamic> toJson() => _$TagsGoodVoiceToJson(this);
}

enum PageType {
  Discovery, // 发现
  PlayTag, // 约玩
  Tag, // 标签，最新
  Case, //案例
  Recommend, // 推荐
  Broadcast, //动态广播
  Appraiser, // 鉴定师
  GameClub, // 游戏俱乐部
}
