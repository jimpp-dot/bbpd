import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'party_room_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class PartyRoomGridItem {
  final int rid;
  final int uid;
  final String? name;
  final String? icon;
  final String? fixFrameUrl1;
  final String? fixFrameUrl2;
  final String? fixTagUrl1;
  final String? fixTagUrl2;
  final int? prettyRid;

  @JsonKey(name: 'live_cover_icon')
  final String? iconNew;

  @JsonKey(name: 'live_tag_icon')
  final String? tag;

  @JsonKey(name: 'hot_num')
  final int hotNum;

  @JsonKey(name: 'show_hot', fromJson: Util.parseBool)
  final bool showHot;

  @JsonKey(name: 'left_frame')
  final String? leftFrame;

  final String? leftFrameNew;

  @JsonKey(name: 'uname')
  final String? userName;

  final String? label;

  final String? property;

  @JsonKey(ignore: true)
  bool exposured = false;

  @JsonKey(ignore: true)
  final String? packetIcon; //房间红包Icon

  @JsonKey(ignore: true)
  final int? hourRank; //排行榜外露

  @JsonKey(ignore: true)
  String? operationLabel; // 运营标签

  @JsonKey(ignore: true)
  String? operationBg; // 运营标签背景

  final List<String?>? onlineUserIcons;

  PartyRoomGridItem(
    this.rid,
    this.uid,
    this.name,
    this.icon,
    this.iconNew,
    this.tag,
    this.hotNum,
    this.showHot,
    this.leftFrame,
    this.leftFrameNew,
    this.userName,
    this.label,
    this.property, {
    this.packetIcon,
    this.hourRank,
    this.operationLabel,
    this.operationBg,
    this.onlineUserIcons,
    this.fixFrameUrl1,
    this.fixFrameUrl2,
    this.fixTagUrl1,
    this.fixTagUrl2,
    this.prettyRid,
  });

  factory PartyRoomGridItem.fromJson(Map<String, dynamic> json) =>
      _$PartyRoomGridItemFromJson(json);

  String? get cover375 {
    /// 海报支持webp
    if (icon != null && icon!.endsWith('webp')) {
      return Util.getRemoteImgUrl(icon);
    }
    return Util.cover375(icon);
  }

  String? get coverNew375 {
    /// 海报支持webp
    if (iconNew != null && iconNew!.endsWith('webp')) {
      return Util.getRemoteImgUrl(iconNew);
    }
    return Util.cover375(iconNew);
  }

  String get cornerImage {
    return '${System.imageDomain}static/head/$leftFrame.png';
  }
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class FastEntryRoom {
  @JsonKey(fromJson: Util.parseColors)
  final List<Color> bgColor;

  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String? icon;

  final String? profile;

  final String? buttonTxt;

  final String? type;

  int needVerifyNew;

  @JsonKey(fromJson: Util.parseColor)
  final Color? textColor; // 按钮文字颜色

  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String bgImg; // 背景图

  FastEntryRoom(
    this.bgColor,
    this.icon,
    this.profile,
    this.buttonTxt,
    this.type,
    this.needVerifyNew,
    this.textColor,
    this.bgImg,
  );

  factory FastEntryRoom.fromJson(Map<String, dynamic> json) =>
      _$FastEntryRoomFromJson(json);
}

@JsonSerializable(createToJson: false)
class PartyRoomResponse {
  @JsonKey(name: 'list')
  final List<PartyRoomGridItem?>? items;

  @JsonKey(name: 'more', fromJson: Util.parseBool)
  final bool hasMore;

  @JsonKey(name: 'fast_entry_room')
  final FastEntryRoom? fastEntryRoom;

  PartyRoomResponse({this.items, this.hasMore = false, this.fastEntryRoom});

  factory PartyRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$PartyRoomResponseFromJson(json);
}

@JsonSerializable()
class PartyGodBean {
  final int uid;
  final int rid;
  final String? icon; // 用户头像
  final String? name;
  final String? desc;
  final int status; // 1 代表在线， 2代表在房间，3 代表秒接单
  final List<PartyGodSkillBean?>? skills;

  PartyGodBean(this.uid, this.rid, this.icon, this.name, this.desc, this.status,
      this.skills);

  factory PartyGodBean.fromJson(Map<String, dynamic> json) =>
      _$PartyGodBeanFromJson(json);

  List<String> get reportSkillNames {
    return (skills == null || skills!.isEmpty)
        ? []
        : skills!.map((e) => e?.name ?? '').toList();
  }
}

@JsonSerializable()
class PartyGodSkillBean {
  final String? icon;
  final String? name;

  PartyGodSkillBean(this.icon, this.name);

  factory PartyGodSkillBean.fromJson(Map<String, dynamic> json) =>
      _$PartyGodSkillBeanFromJson(json);
}
