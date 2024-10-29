///
//  Generated code. Do not modify.
//  source: slp_cp_house_friend.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'acuteIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagColor')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIcon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyStyle',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'abstractIcon')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeIcon')
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeBg')
    ..hasRequiredFields = false;

  RoomTag._() : super();
  factory RoomTag({
    $core.String? show,
    $core.String? label,
    $core.Iterable<$core.String>? bg,
    $core.String? acuteIcon,
    $core.String? tagColor,
    $core.String? tagIcon,
    $core.int? partyStyle,
    $core.String? abstractIcon,
    $core.String? typeIcon,
    $core.Iterable<$core.String>? typeBg,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (label != null) {
      _result.label = label;
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (acuteIcon != null) {
      _result.acuteIcon = acuteIcon;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (partyStyle != null) {
      _result.partyStyle = partyStyle;
    }
    if (abstractIcon != null) {
      _result.abstractIcon = abstractIcon;
    }
    if (typeIcon != null) {
      _result.typeIcon = typeIcon;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    return _result;
  }
  factory RoomTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomTag clone() => RoomTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomTag copyWith(void Function(RoomTag) updates) =>
      super.copyWith((message) => updates(message as RoomTag))
          as RoomTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomTag create() => RoomTag._();
  RoomTag createEmptyInstance() => create();
  static $pb.PbList<RoomTag> createRepeated() => $pb.PbList<RoomTag>();
  @$core.pragma('dart2js:noInline')
  static RoomTag getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomTag>(create);
  static RoomTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get show => $_getSZ(0);
  @$pb.TagNumber(1)
  set show($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get bg => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get acuteIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set acuteIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAcuteIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearAcuteIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tagColor => $_getSZ(4);
  @$pb.TagNumber(5)
  set tagColor($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTagColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearTagColor() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get tagIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set tagIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTagIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearTagIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get partyStyle => $_getIZ(6);
  @$pb.TagNumber(7)
  set partyStyle($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPartyStyle() => $_has(6);
  @$pb.TagNumber(7)
  void clearPartyStyle() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get abstractIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set abstractIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAbstractIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearAbstractIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get typeIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set typeIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTypeIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearTypeIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get typeBg => $_getList(9);
}

class FriendUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FriendUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redpoint',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDatelineDiff')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        $pb.PbFieldType.OU3)
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomPrefix')
    ..aOM<RoomTag>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomTag',
        subBuilder: RoomTag.create)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3)
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mark')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomicon')
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipLevel',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  FriendUser._() : super();
  factory FriendUser({
    $core.String? uid,
    $core.String? appId,
    $core.String? name,
    $core.String? icon,
    $core.String? title,
    $core.String? birthday,
    $core.String? sex,
    $core.String? sign,
    $core.String? onlineStatus,
    $core.String? onlineDateline,
    $core.String? tag,
    $core.String? dateline,
    $core.String? to,
    $core.int? redpoint,
    $core.int? online,
    $core.String? onlineDatelineDiff,
    $core.int? official,
    $core.int? room,
    $core.String? roomPrefix,
    RoomTag? roomTag,
    $core.int? titleNew,
    $core.String? mark,
    $core.String? roomicon,
    $core.int? vipLevel,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (title != null) {
      _result.title = title;
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (to != null) {
      _result.to = to;
    }
    if (redpoint != null) {
      _result.redpoint = redpoint;
    }
    if (online != null) {
      _result.online = online;
    }
    if (onlineDatelineDiff != null) {
      _result.onlineDatelineDiff = onlineDatelineDiff;
    }
    if (official != null) {
      _result.official = official;
    }
    if (room != null) {
      _result.room = room;
    }
    if (roomPrefix != null) {
      _result.roomPrefix = roomPrefix;
    }
    if (roomTag != null) {
      _result.roomTag = roomTag;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (mark != null) {
      _result.mark = mark;
    }
    if (roomicon != null) {
      _result.roomicon = roomicon;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    return _result;
  }
  factory FriendUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FriendUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FriendUser clone() => FriendUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FriendUser copyWith(void Function(FriendUser) updates) =>
      super.copyWith((message) => updates(message as FriendUser))
          as FriendUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendUser create() => FriendUser._();
  FriendUser createEmptyInstance() => create();
  static $pb.PbList<FriendUser> createRepeated() => $pb.PbList<FriendUser>();
  @$core.pragma('dart2js:noInline')
  static FriendUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendUser>(create);
  static FriendUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get appId => $_getSZ(1);
  @$pb.TagNumber(2)
  set appId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAppId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get birthday => $_getSZ(5);
  @$pb.TagNumber(6)
  set birthday($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBirthday() => $_has(5);
  @$pb.TagNumber(6)
  void clearBirthday() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sex => $_getSZ(6);
  @$pb.TagNumber(7)
  set sex($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSex() => $_has(6);
  @$pb.TagNumber(7)
  void clearSex() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sign => $_getSZ(7);
  @$pb.TagNumber(8)
  set sign($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSign() => $_has(7);
  @$pb.TagNumber(8)
  void clearSign() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get onlineStatus => $_getSZ(8);
  @$pb.TagNumber(9)
  set onlineStatus($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOnlineStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearOnlineStatus() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get onlineDateline => $_getSZ(9);
  @$pb.TagNumber(10)
  set onlineDateline($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasOnlineDateline() => $_has(9);
  @$pb.TagNumber(10)
  void clearOnlineDateline() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get tag => $_getSZ(10);
  @$pb.TagNumber(11)
  set tag($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTag() => $_has(10);
  @$pb.TagNumber(11)
  void clearTag() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get dateline => $_getSZ(11);
  @$pb.TagNumber(12)
  set dateline($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasDateline() => $_has(11);
  @$pb.TagNumber(12)
  void clearDateline() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get to => $_getSZ(12);
  @$pb.TagNumber(13)
  set to($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTo() => $_has(12);
  @$pb.TagNumber(13)
  void clearTo() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get redpoint => $_getIZ(13);
  @$pb.TagNumber(14)
  set redpoint($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasRedpoint() => $_has(13);
  @$pb.TagNumber(14)
  void clearRedpoint() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get online => $_getIZ(14);
  @$pb.TagNumber(15)
  set online($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasOnline() => $_has(14);
  @$pb.TagNumber(15)
  void clearOnline() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get onlineDatelineDiff => $_getSZ(15);
  @$pb.TagNumber(16)
  set onlineDatelineDiff($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasOnlineDatelineDiff() => $_has(15);
  @$pb.TagNumber(16)
  void clearOnlineDatelineDiff() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get official => $_getIZ(16);
  @$pb.TagNumber(17)
  set official($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasOfficial() => $_has(16);
  @$pb.TagNumber(17)
  void clearOfficial() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get room => $_getIZ(17);
  @$pb.TagNumber(18)
  set room($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasRoom() => $_has(17);
  @$pb.TagNumber(18)
  void clearRoom() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get roomPrefix => $_getSZ(18);
  @$pb.TagNumber(19)
  set roomPrefix($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasRoomPrefix() => $_has(18);
  @$pb.TagNumber(19)
  void clearRoomPrefix() => clearField(19);

  @$pb.TagNumber(20)
  RoomTag get roomTag => $_getN(19);
  @$pb.TagNumber(20)
  set roomTag(RoomTag v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasRoomTag() => $_has(19);
  @$pb.TagNumber(20)
  void clearRoomTag() => clearField(20);
  @$pb.TagNumber(20)
  RoomTag ensureRoomTag() => $_ensure(19);

  @$pb.TagNumber(21)
  $core.int get titleNew => $_getIZ(20);
  @$pb.TagNumber(21)
  set titleNew($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTitleNew() => $_has(20);
  @$pb.TagNumber(21)
  void clearTitleNew() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get mark => $_getSZ(21);
  @$pb.TagNumber(22)
  set mark($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasMark() => $_has(21);
  @$pb.TagNumber(22)
  void clearMark() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get roomicon => $_getSZ(22);
  @$pb.TagNumber(23)
  set roomicon($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasRoomicon() => $_has(22);
  @$pb.TagNumber(23)
  void clearRoomicon() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get vipLevel => $_getIZ(23);
  @$pb.TagNumber(24)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasVipLevel() => $_has(23);
  @$pb.TagNumber(24)
  void clearVipLevel() => clearField(24);
}

class ResFriendData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResFriendData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..pc<FriendUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: FriendUser.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'haveForbidden',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ResFriendData._() : super();
  factory ResFriendData({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<FriendUser>? data,
    $core.int? haveForbidden,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    if (haveForbidden != null) {
      _result.haveForbidden = haveForbidden;
    }
    return _result;
  }
  factory ResFriendData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResFriendData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResFriendData clone() => ResFriendData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResFriendData copyWith(void Function(ResFriendData) updates) =>
      super.copyWith((message) => updates(message as ResFriendData))
          as ResFriendData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResFriendData create() => ResFriendData._();
  ResFriendData createEmptyInstance() => create();
  static $pb.PbList<ResFriendData> createRepeated() =>
      $pb.PbList<ResFriendData>();
  @$core.pragma('dart2js:noInline')
  static ResFriendData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResFriendData>(create);
  static ResFriendData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<FriendUser> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get haveForbidden => $_getIZ(3);
  @$pb.TagNumber(4)
  set haveForbidden($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHaveForbidden() => $_has(3);
  @$pb.TagNumber(4)
  void clearHaveForbidden() => clearField(4);
}
