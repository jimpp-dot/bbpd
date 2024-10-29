///
//  Generated code. Do not modify.
//  source: mate_cloud.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MateCloudChatUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateCloudChatUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3,
        protoName: 'appId')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'city')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'degree',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderStatus',
        protoName: 'orderStatus')
    ..aOB(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconGray',
        protoName: 'iconGray')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'photoNum',
        $pb.PbFieldType.OU3,
        protoName: 'photoNum')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularity',
        $pb.PbFieldType.OU3)
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday')
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3,
        protoName: 'onlineDateline')
    ..aOB(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newUser',
        protoName: 'newUser')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3,
        protoName: 'titleNew')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starVerifyTag',
        $pb.PbFieldType.OU3,
        protoName: 'starVerifyTag')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mark')
    ..pPS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'marks')
    ..hasRequiredFields = false;

  MateCloudChatUser._() : super();
  factory MateCloudChatUser({
    $core.int? uid,
    $core.int? appId,
    $core.int? version,
    $core.int? sex,
    $core.int? title,
    $core.String? name,
    $core.String? icon,
    $core.String? city,
    $core.String? position,
    $core.int? official,
    $core.int? degree,
    $core.String? orderStatus,
    $core.bool? iconGray,
    $core.int? age,
    $core.int? photoNum,
    $core.int? vip,
    $core.int? popularity,
    $core.String? birthday,
    $core.int? onlineDateline,
    $core.bool? newUser,
    $core.int? deleted,
    $core.int? titleNew,
    $core.String? frame,
    $core.int? starVerifyTag,
    $core.String? mark,
    $core.Iterable<$core.String>? marks,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (version != null) {
      _result.version = version;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (title != null) {
      _result.title = title;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (city != null) {
      _result.city = city;
    }
    if (position != null) {
      _result.position = position;
    }
    if (official != null) {
      _result.official = official;
    }
    if (degree != null) {
      _result.degree = degree;
    }
    if (orderStatus != null) {
      _result.orderStatus = orderStatus;
    }
    if (iconGray != null) {
      _result.iconGray = iconGray;
    }
    if (age != null) {
      _result.age = age;
    }
    if (photoNum != null) {
      _result.photoNum = photoNum;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (popularity != null) {
      _result.popularity = popularity;
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (newUser != null) {
      _result.newUser = newUser;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (starVerifyTag != null) {
      _result.starVerifyTag = starVerifyTag;
    }
    if (mark != null) {
      _result.mark = mark;
    }
    if (marks != null) {
      _result.marks.addAll(marks);
    }
    return _result;
  }
  factory MateCloudChatUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateCloudChatUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateCloudChatUser clone() => MateCloudChatUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateCloudChatUser copyWith(void Function(MateCloudChatUser) updates) =>
      super.copyWith((message) => updates(message as MateCloudChatUser))
          as MateCloudChatUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateCloudChatUser create() => MateCloudChatUser._();
  MateCloudChatUser createEmptyInstance() => create();
  static $pb.PbList<MateCloudChatUser> createRepeated() =>
      $pb.PbList<MateCloudChatUser>();
  @$core.pragma('dart2js:noInline')
  static MateCloudChatUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateCloudChatUser>(create);
  static MateCloudChatUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get appId => $_getIZ(1);
  @$pb.TagNumber(2)
  set appId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAppId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get title => $_getIZ(4);
  @$pb.TagNumber(5)
  set title($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get city => $_getSZ(7);
  @$pb.TagNumber(8)
  set city($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCity() => $_has(7);
  @$pb.TagNumber(8)
  void clearCity() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get position => $_getSZ(8);
  @$pb.TagNumber(9)
  set position($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPosition() => $_has(8);
  @$pb.TagNumber(9)
  void clearPosition() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get official => $_getIZ(9);
  @$pb.TagNumber(10)
  set official($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasOfficial() => $_has(9);
  @$pb.TagNumber(10)
  void clearOfficial() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get degree => $_getIZ(10);
  @$pb.TagNumber(11)
  set degree($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasDegree() => $_has(10);
  @$pb.TagNumber(11)
  void clearDegree() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get orderStatus => $_getSZ(11);
  @$pb.TagNumber(12)
  set orderStatus($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasOrderStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearOrderStatus() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get iconGray => $_getBF(12);
  @$pb.TagNumber(13)
  set iconGray($core.bool v) {
    $_setBool(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasIconGray() => $_has(12);
  @$pb.TagNumber(13)
  void clearIconGray() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get age => $_getIZ(13);
  @$pb.TagNumber(14)
  set age($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasAge() => $_has(13);
  @$pb.TagNumber(14)
  void clearAge() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get photoNum => $_getIZ(14);
  @$pb.TagNumber(15)
  set photoNum($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasPhotoNum() => $_has(14);
  @$pb.TagNumber(15)
  void clearPhotoNum() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get vip => $_getIZ(15);
  @$pb.TagNumber(16)
  set vip($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasVip() => $_has(15);
  @$pb.TagNumber(16)
  void clearVip() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get popularity => $_getIZ(16);
  @$pb.TagNumber(17)
  set popularity($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasPopularity() => $_has(16);
  @$pb.TagNumber(17)
  void clearPopularity() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get birthday => $_getSZ(17);
  @$pb.TagNumber(18)
  set birthday($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasBirthday() => $_has(17);
  @$pb.TagNumber(18)
  void clearBirthday() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get onlineDateline => $_getIZ(18);
  @$pb.TagNumber(19)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasOnlineDateline() => $_has(18);
  @$pb.TagNumber(19)
  void clearOnlineDateline() => clearField(19);

  @$pb.TagNumber(20)
  $core.bool get newUser => $_getBF(19);
  @$pb.TagNumber(20)
  set newUser($core.bool v) {
    $_setBool(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasNewUser() => $_has(19);
  @$pb.TagNumber(20)
  void clearNewUser() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get deleted => $_getIZ(20);
  @$pb.TagNumber(21)
  set deleted($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasDeleted() => $_has(20);
  @$pb.TagNumber(21)
  void clearDeleted() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get titleNew => $_getIZ(21);
  @$pb.TagNumber(22)
  set titleNew($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasTitleNew() => $_has(21);
  @$pb.TagNumber(22)
  void clearTitleNew() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get frame => $_getSZ(22);
  @$pb.TagNumber(23)
  set frame($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasFrame() => $_has(22);
  @$pb.TagNumber(23)
  void clearFrame() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get starVerifyTag => $_getIZ(23);
  @$pb.TagNumber(24)
  set starVerifyTag($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasStarVerifyTag() => $_has(23);
  @$pb.TagNumber(24)
  void clearStarVerifyTag() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get mark => $_getSZ(24);
  @$pb.TagNumber(25)
  set mark($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasMark() => $_has(24);
  @$pb.TagNumber(25)
  void clearMark() => clearField(25);

  @$pb.TagNumber(26)
  $core.List<$core.String> get marks => $_getList(25);
}

class MateCloudRoomConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateCloudRoomConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomIcon',
        protoName: 'roomIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..pPS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyStyle',
        $pb.PbFieldType.OU3,
        protoName: 'partyStyle')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'acuteIcon',
        protoName: 'acuteIcon')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'abstractIcon',
        protoName: 'abstractIcon')
    ..pPS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeBg',
        protoName: 'typeBg')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeIcon',
        protoName: 'typeIcon')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIcon',
        protoName: 'tagIcon')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagColor',
        protoName: 'tagColor')
    ..hasRequiredFields = false;

  MateCloudRoomConfig._() : super();
  factory MateCloudRoomConfig({
    $core.int? uid,
    $core.int? online,
    $core.int? room,
    $core.String? roomIcon,
    $core.String? prefix,
    $core.int? official,
    $core.String? show,
    $core.String? label,
    $core.Iterable<$core.String>? bg,
    $core.int? partyStyle,
    $core.String? acuteIcon,
    $core.String? abstractIcon,
    $core.Iterable<$core.String>? typeBg,
    $core.String? typeIcon,
    $core.String? tagIcon,
    $core.String? tagColor,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (online != null) {
      _result.online = online;
    }
    if (room != null) {
      _result.room = room;
    }
    if (roomIcon != null) {
      _result.roomIcon = roomIcon;
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    if (official != null) {
      _result.official = official;
    }
    if (show != null) {
      _result.show = show;
    }
    if (label != null) {
      _result.label = label;
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (partyStyle != null) {
      _result.partyStyle = partyStyle;
    }
    if (acuteIcon != null) {
      _result.acuteIcon = acuteIcon;
    }
    if (abstractIcon != null) {
      _result.abstractIcon = abstractIcon;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    if (typeIcon != null) {
      _result.typeIcon = typeIcon;
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    return _result;
  }
  factory MateCloudRoomConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateCloudRoomConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateCloudRoomConfig clone() => MateCloudRoomConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateCloudRoomConfig copyWith(void Function(MateCloudRoomConfig) updates) =>
      super.copyWith((message) => updates(message as MateCloudRoomConfig))
          as MateCloudRoomConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateCloudRoomConfig create() => MateCloudRoomConfig._();
  MateCloudRoomConfig createEmptyInstance() => create();
  static $pb.PbList<MateCloudRoomConfig> createRepeated() =>
      $pb.PbList<MateCloudRoomConfig>();
  @$core.pragma('dart2js:noInline')
  static MateCloudRoomConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateCloudRoomConfig>(create);
  static MateCloudRoomConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get online => $_getIZ(1);
  @$pb.TagNumber(2)
  set online($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOnline() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnline() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get room => $_getIZ(2);
  @$pb.TagNumber(3)
  set room($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoom() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRoomIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get prefix => $_getSZ(4);
  @$pb.TagNumber(5)
  set prefix($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPrefix() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrefix() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get official => $_getIZ(5);
  @$pb.TagNumber(6)
  set official($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOfficial() => $_has(5);
  @$pb.TagNumber(6)
  void clearOfficial() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get show => $_getSZ(6);
  @$pb.TagNumber(7)
  set show($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasShow() => $_has(6);
  @$pb.TagNumber(7)
  void clearShow() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get label => $_getSZ(7);
  @$pb.TagNumber(8)
  set label($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLabel() => $_has(7);
  @$pb.TagNumber(8)
  void clearLabel() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.String> get bg => $_getList(8);

  @$pb.TagNumber(10)
  $core.int get partyStyle => $_getIZ(9);
  @$pb.TagNumber(10)
  set partyStyle($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPartyStyle() => $_has(9);
  @$pb.TagNumber(10)
  void clearPartyStyle() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get acuteIcon => $_getSZ(10);
  @$pb.TagNumber(11)
  set acuteIcon($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasAcuteIcon() => $_has(10);
  @$pb.TagNumber(11)
  void clearAcuteIcon() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get abstractIcon => $_getSZ(11);
  @$pb.TagNumber(12)
  set abstractIcon($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasAbstractIcon() => $_has(11);
  @$pb.TagNumber(12)
  void clearAbstractIcon() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.String> get typeBg => $_getList(12);

  @$pb.TagNumber(14)
  $core.String get typeIcon => $_getSZ(13);
  @$pb.TagNumber(14)
  set typeIcon($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasTypeIcon() => $_has(13);
  @$pb.TagNumber(14)
  void clearTypeIcon() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get tagIcon => $_getSZ(14);
  @$pb.TagNumber(15)
  set tagIcon($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasTagIcon() => $_has(14);
  @$pb.TagNumber(15)
  void clearTagIcon() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get tagColor => $_getSZ(15);
  @$pb.TagNumber(16)
  set tagColor($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasTagColor() => $_has(15);
  @$pb.TagNumber(16)
  void clearTagColor() => clearField(16);
}

class MateCloudGroupConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateCloudGroupConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3,
        protoName: 'groupId')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomIcon',
        protoName: 'roomIcon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MateCloudGroupConfig._() : super();
  factory MateCloudGroupConfig({
    $core.int? uid,
    $core.int? groupId,
    $core.int? online,
    $core.int? room,
    $core.String? roomIcon,
    $core.String? prefix,
    $core.int? official,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (online != null) {
      _result.online = online;
    }
    if (room != null) {
      _result.room = room;
    }
    if (roomIcon != null) {
      _result.roomIcon = roomIcon;
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    if (official != null) {
      _result.official = official;
    }
    return _result;
  }
  factory MateCloudGroupConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateCloudGroupConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateCloudGroupConfig clone() =>
      MateCloudGroupConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateCloudGroupConfig copyWith(void Function(MateCloudGroupConfig) updates) =>
      super.copyWith((message) => updates(message as MateCloudGroupConfig))
          as MateCloudGroupConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateCloudGroupConfig create() => MateCloudGroupConfig._();
  MateCloudGroupConfig createEmptyInstance() => create();
  static $pb.PbList<MateCloudGroupConfig> createRepeated() =>
      $pb.PbList<MateCloudGroupConfig>();
  @$core.pragma('dart2js:noInline')
  static MateCloudGroupConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateCloudGroupConfig>(create);
  static MateCloudGroupConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get groupId => $_getIZ(1);
  @$pb.TagNumber(2)
  set groupId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get online => $_getIZ(2);
  @$pb.TagNumber(3)
  set online($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOnline() => $_has(2);
  @$pb.TagNumber(3)
  void clearOnline() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get room => $_getIZ(3);
  @$pb.TagNumber(4)
  set room($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoom() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRoomIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get prefix => $_getSZ(5);
  @$pb.TagNumber(6)
  set prefix($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPrefix() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrefix() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get official => $_getIZ(6);
  @$pb.TagNumber(7)
  set official($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOfficial() => $_has(6);
  @$pb.TagNumber(7)
  void clearOfficial() => clearField(7);
}

class MateResCloudAll extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateResCloudAll',
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
    ..pc<MateCloudChatUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'users',
        $pb.PbFieldType.PM,
        subBuilder: MateCloudChatUser.create)
    ..pc<MateCloudRoomConfig>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        $pb.PbFieldType.PM,
        subBuilder: MateCloudRoomConfig.create)
    ..pc<MateCloudGroupConfig>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupConfig',
        $pb.PbFieldType.PM,
        protoName: 'groupConfig',
        subBuilder: MateCloudGroupConfig.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MateResCloudAll._() : super();
  factory MateResCloudAll({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<MateCloudChatUser>? users,
    $core.Iterable<MateCloudRoomConfig>? config,
    $core.Iterable<MateCloudGroupConfig>? groupConfig,
    $core.int? rid,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (users != null) {
      _result.users.addAll(users);
    }
    if (config != null) {
      _result.config.addAll(config);
    }
    if (groupConfig != null) {
      _result.groupConfig.addAll(groupConfig);
    }
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory MateResCloudAll.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateResCloudAll.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateResCloudAll clone() => MateResCloudAll()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateResCloudAll copyWith(void Function(MateResCloudAll) updates) =>
      super.copyWith((message) => updates(message as MateResCloudAll))
          as MateResCloudAll; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateResCloudAll create() => MateResCloudAll._();
  MateResCloudAll createEmptyInstance() => create();
  static $pb.PbList<MateResCloudAll> createRepeated() =>
      $pb.PbList<MateResCloudAll>();
  @$core.pragma('dart2js:noInline')
  static MateResCloudAll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateResCloudAll>(create);
  static MateResCloudAll? _defaultInstance;

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
  $core.List<MateCloudChatUser> get users => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<MateCloudRoomConfig> get config => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<MateCloudGroupConfig> get groupConfig => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get rid => $_getIZ(5);
  @$pb.TagNumber(6)
  set rid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRid() => $_has(5);
  @$pb.TagNumber(6)
  void clearRid() => clearField(6);
}

class MateProfileContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateProfileContent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..pPS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imgs')
    ..hasRequiredFields = false;

  MateProfileContent._() : super();
  factory MateProfileContent({
    $core.String? content,
    $core.Iterable<$core.String>? imgs,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (imgs != null) {
      _result.imgs.addAll(imgs);
    }
    return _result;
  }
  factory MateProfileContent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateProfileContent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateProfileContent clone() => MateProfileContent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateProfileContent copyWith(void Function(MateProfileContent) updates) =>
      super.copyWith((message) => updates(message as MateProfileContent))
          as MateProfileContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateProfileContent create() => MateProfileContent._();
  MateProfileContent createEmptyInstance() => create();
  static $pb.PbList<MateProfileContent> createRepeated() =>
      $pb.PbList<MateProfileContent>();
  @$core.pragma('dart2js:noInline')
  static MateProfileContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateProfileContent>(create);
  static MateProfileContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get imgs => $_getList(1);
}

class MateProfileRelation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateProfileRelation',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friend',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fans',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defend',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendR',
        $pb.PbFieldType.OU3,
        protoName: 'defendR')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderR',
        $pb.PbFieldType.OU3,
        protoName: 'orderR')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'familiarR',
        $pb.PbFieldType.OU3,
        protoName: 'familiarR')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'familiar',
        $pb.PbFieldType.OU3)
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSuper',
        protoName: 'isSuper')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'service',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MateProfileRelation._() : super();
  factory MateProfileRelation({
    $core.int? friend,
    $core.int? fans,
    $core.int? defend,
    $core.int? defendR,
    $core.int? orderR,
    $core.int? familiarR,
    $core.int? familiar,
    $core.bool? isSuper,
    $core.int? gid,
    $core.int? service,
  }) {
    final _result = create();
    if (friend != null) {
      _result.friend = friend;
    }
    if (fans != null) {
      _result.fans = fans;
    }
    if (defend != null) {
      _result.defend = defend;
    }
    if (defendR != null) {
      _result.defendR = defendR;
    }
    if (orderR != null) {
      _result.orderR = orderR;
    }
    if (familiarR != null) {
      _result.familiarR = familiarR;
    }
    if (familiar != null) {
      _result.familiar = familiar;
    }
    if (isSuper != null) {
      _result.isSuper = isSuper;
    }
    if (gid != null) {
      _result.gid = gid;
    }
    if (service != null) {
      _result.service = service;
    }
    return _result;
  }
  factory MateProfileRelation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateProfileRelation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateProfileRelation clone() => MateProfileRelation()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateProfileRelation copyWith(void Function(MateProfileRelation) updates) =>
      super.copyWith((message) => updates(message as MateProfileRelation))
          as MateProfileRelation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateProfileRelation create() => MateProfileRelation._();
  MateProfileRelation createEmptyInstance() => create();
  static $pb.PbList<MateProfileRelation> createRepeated() =>
      $pb.PbList<MateProfileRelation>();
  @$core.pragma('dart2js:noInline')
  static MateProfileRelation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateProfileRelation>(create);
  static MateProfileRelation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get friend => $_getIZ(0);
  @$pb.TagNumber(1)
  set friend($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFriend() => $_has(0);
  @$pb.TagNumber(1)
  void clearFriend() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get fans => $_getIZ(1);
  @$pb.TagNumber(2)
  set fans($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFans() => $_has(1);
  @$pb.TagNumber(2)
  void clearFans() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get defend => $_getIZ(2);
  @$pb.TagNumber(3)
  set defend($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDefend() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefend() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get defendR => $_getIZ(3);
  @$pb.TagNumber(4)
  set defendR($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDefendR() => $_has(3);
  @$pb.TagNumber(4)
  void clearDefendR() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get orderR => $_getIZ(4);
  @$pb.TagNumber(5)
  set orderR($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOrderR() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderR() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get familiarR => $_getIZ(5);
  @$pb.TagNumber(6)
  set familiarR($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFamiliarR() => $_has(5);
  @$pb.TagNumber(6)
  void clearFamiliarR() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get familiar => $_getIZ(6);
  @$pb.TagNumber(7)
  set familiar($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFamiliar() => $_has(6);
  @$pb.TagNumber(7)
  void clearFamiliar() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isSuper => $_getBF(7);
  @$pb.TagNumber(8)
  set isSuper($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIsSuper() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsSuper() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get gid => $_getIZ(8);
  @$pb.TagNumber(9)
  set gid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGid() => $_has(8);
  @$pb.TagNumber(9)
  void clearGid() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get service => $_getIZ(9);
  @$pb.TagNumber(10)
  set service($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasService() => $_has(9);
  @$pb.TagNumber(10)
  void clearService() => clearField(10);
}

class MateProfileFriendTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateProfileFriendTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  MateProfileFriendTag._() : super();
  factory MateProfileFriendTag({
    $core.int? id,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory MateProfileFriendTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateProfileFriendTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateProfileFriendTag clone() =>
      MateProfileFriendTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateProfileFriendTag copyWith(void Function(MateProfileFriendTag) updates) =>
      super.copyWith((message) => updates(message as MateProfileFriendTag))
          as MateProfileFriendTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateProfileFriendTag create() => MateProfileFriendTag._();
  MateProfileFriendTag createEmptyInstance() => create();
  static $pb.PbList<MateProfileFriendTag> createRepeated() =>
      $pb.PbList<MateProfileFriendTag>();
  @$core.pragma('dart2js:noInline')
  static MateProfileFriendTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateProfileFriendTag>(create);
  static MateProfileFriendTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class MateProfileGroupMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateProfileGroupMember',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  MateProfileGroupMember._() : super();
  factory MateProfileGroupMember({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory MateProfileGroupMember.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateProfileGroupMember.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateProfileGroupMember clone() =>
      MateProfileGroupMember()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateProfileGroupMember copyWith(
          void Function(MateProfileGroupMember) updates) =>
      super.copyWith((message) => updates(message as MateProfileGroupMember))
          as MateProfileGroupMember; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateProfileGroupMember create() => MateProfileGroupMember._();
  MateProfileGroupMember createEmptyInstance() => create();
  static $pb.PbList<MateProfileGroupMember> createRepeated() =>
      $pb.PbList<MateProfileGroupMember>();
  @$core.pragma('dart2js:noInline')
  static MateProfileGroupMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateProfileGroupMember>(create);
  static MateProfileGroupMember? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);
}

class MateProfileDutyWords extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateProfileDutyWords',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mark',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'words')
    ..hasRequiredFields = false;

  MateProfileDutyWords._() : super();
  factory MateProfileDutyWords({
    $core.int? mark,
    $core.String? words,
  }) {
    final _result = create();
    if (mark != null) {
      _result.mark = mark;
    }
    if (words != null) {
      _result.words = words;
    }
    return _result;
  }
  factory MateProfileDutyWords.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateProfileDutyWords.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateProfileDutyWords clone() =>
      MateProfileDutyWords()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateProfileDutyWords copyWith(void Function(MateProfileDutyWords) updates) =>
      super.copyWith((message) => updates(message as MateProfileDutyWords))
          as MateProfileDutyWords; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateProfileDutyWords create() => MateProfileDutyWords._();
  MateProfileDutyWords createEmptyInstance() => create();
  static $pb.PbList<MateProfileDutyWords> createRepeated() =>
      $pb.PbList<MateProfileDutyWords>();
  @$core.pragma('dart2js:noInline')
  static MateProfileDutyWords getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateProfileDutyWords>(create);
  static MateProfileDutyWords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get mark => $_getIZ(0);
  @$pb.TagNumber(1)
  set mark($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMark() => $_has(0);
  @$pb.TagNumber(1)
  void clearMark() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get words => $_getSZ(1);
  @$pb.TagNumber(2)
  set words($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWords() => $_has(1);
  @$pb.TagNumber(2)
  void clearWords() => clearField(2);
}

class MateProfileSkill extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateProfileSkill',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.O3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isDefault',
        $pb.PbFieldType.O3,
        protoName: 'isDefault')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.O3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uint')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon',
        protoName: 'userIcon')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skillDesc',
        protoName: 'skillDesc')
    ..pPS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skillImages',
        protoName: 'skillImages')
    ..hasRequiredFields = false;

  MateProfileSkill._() : super();
  factory MateProfileSkill({
    $core.int? cid,
    $core.int? price,
    $core.int? num,
    $core.String? description,
    $core.String? cover,
    $core.int? isDefault,
    $core.int? type,
    $core.String? name,
    $core.String? icon,
    $core.String? uint,
    $core.String? userIcon,
    $core.String? skillDesc,
    $core.Iterable<$core.String>? skillImages,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (price != null) {
      _result.price = price;
    }
    if (num != null) {
      _result.num = num;
    }
    if (description != null) {
      _result.description = description;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (isDefault != null) {
      _result.isDefault = isDefault;
    }
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (uint != null) {
      _result.uint = uint;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (skillDesc != null) {
      _result.skillDesc = skillDesc;
    }
    if (skillImages != null) {
      _result.skillImages.addAll(skillImages);
    }
    return _result;
  }
  factory MateProfileSkill.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateProfileSkill.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateProfileSkill clone() => MateProfileSkill()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateProfileSkill copyWith(void Function(MateProfileSkill) updates) =>
      super.copyWith((message) => updates(message as MateProfileSkill))
          as MateProfileSkill; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateProfileSkill create() => MateProfileSkill._();
  MateProfileSkill createEmptyInstance() => create();
  static $pb.PbList<MateProfileSkill> createRepeated() =>
      $pb.PbList<MateProfileSkill>();
  @$core.pragma('dart2js:noInline')
  static MateProfileSkill getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateProfileSkill>(create);
  static MateProfileSkill? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cover => $_getSZ(4);
  @$pb.TagNumber(5)
  set cover($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearCover() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get isDefault => $_getIZ(5);
  @$pb.TagNumber(6)
  set isDefault($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsDefault() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsDefault() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get type => $_getIZ(6);
  @$pb.TagNumber(7)
  set type($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get icon => $_getSZ(8);
  @$pb.TagNumber(9)
  set icon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get uint => $_getSZ(9);
  @$pb.TagNumber(10)
  set uint($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasUint() => $_has(9);
  @$pb.TagNumber(10)
  void clearUint() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get userIcon => $_getSZ(10);
  @$pb.TagNumber(11)
  set userIcon($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasUserIcon() => $_has(10);
  @$pb.TagNumber(11)
  void clearUserIcon() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get skillDesc => $_getSZ(11);
  @$pb.TagNumber(12)
  set skillDesc($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasSkillDesc() => $_has(11);
  @$pb.TagNumber(12)
  void clearSkillDesc() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.String> get skillImages => $_getList(12);
}

class MateCloudProfileData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateCloudProfileData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mark')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3,
        protoName: 'titleNew')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'city')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'strangerMsg',
        $pb.PbFieldType.OU3,
        protoName: 'strangerMsg')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needVerify',
        $pb.PbFieldType.OU3,
        protoName: 'needVerify')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needVerifyNew',
        $pb.PbFieldType.OU3,
        protoName: 'needVerifyNew')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'degree',
        $pb.PbFieldType.OU3)
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderStatus',
        protoName: 'orderStatus')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starVerifyTag',
        $pb.PbFieldType.OU3,
        protoName: 'starVerifyTag')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friend',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fans',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defend',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendR',
        $pb.PbFieldType.OU3,
        protoName: 'defendR')
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderR',
        $pb.PbFieldType.OU3,
        protoName: 'orderR')
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'familiarR',
        $pb.PbFieldType.OU3,
        protoName: 'familiarR')
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'familiar',
        $pb.PbFieldType.OU3)
    ..aOB(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSuper',
        protoName: 'isSuper')
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'service',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mentorShipType',
        $pb.PbFieldType.OU3,
        protoName: 'mentorShipType')
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mentorShipTaskState',
        $pb.PbFieldType.OU3,
        protoName: 'mentorShipTaskState')
    ..a<$core.int>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'profileIntegrity',
        $pb.PbFieldType.OU3,
        protoName: 'profileIntegrity')
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'intimacy',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationScore',
        $pb.PbFieldType.OU3,
        protoName: 'relationScore')
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeEmoticon',
        $pb.PbFieldType.OU3,
        protoName: 'closeEmoticon')
    ..aOS(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'distanceDesc',
        protoName: 'distanceDesc')
    ..pc<MateProfileFriendTag>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendTags',
        $pb.PbFieldType.PM,
        protoName: 'friendTags',
        subBuilder: MateProfileFriendTag.create)
    ..aOS(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..aOM<MateProfileContent>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'latestFeed',
        protoName: 'latestFeed',
        subBuilder: MateProfileContent.create)
    ..a<$core.int>(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.OU3)
    ..pc<MateProfileGroupMember>(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'memberList',
        $pb.PbFieldType.PM,
        protoName: 'memberList',
        subBuilder: MateProfileGroupMember.create)
    ..a<$core.int>(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'applyNum',
        $pb.PbFieldType.OU3,
        protoName: 'applyNum')
    ..aOS(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nickName',
        protoName: 'nickName')
    ..pc<MateProfileDutyWords>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dutyWords',
        $pb.PbFieldType.PM,
        protoName: 'dutyWords',
        subBuilder: MateProfileDutyWords.create)
    ..pc<MateProfileSkill>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skills',
        $pb.PbFieldType.PM,
        subBuilder: MateProfileSkill.create)
    ..aOM<MateProfileSkill>(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentSkill',
        protoName: 'currentSkill',
        subBuilder: MateProfileSkill.create)
    ..aOS(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..aOS(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userOriginTag',
        protoName: 'userOriginTag')
    ..aOS(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'constellation')
    ..aOS(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audio')
    ..a<$core.int>(
        52,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOB(
        53,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatMsgDisabled')
    ..a<$core.int>(
        54,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatEggId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        55,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'meDanger',
        $pb.PbFieldType.OU3,
        protoName: 'meDanger')
    ..a<$core.int>(
        56,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magicMsgEntry',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MateCloudProfileData._() : super();
  factory MateCloudProfileData({
    $core.int? uid,
    $core.int? version,
    $core.String? name,
    $core.String? mark,
    $core.String? icon,
    $core.int? sex,
    $core.int? title,
    $core.int? titleNew,
    $core.String? city,
    $core.String? position,
    $core.int? strangerMsg,
    $core.int? rid,
    $core.int? needVerify,
    $core.int? needVerifyNew,
    $core.int? official,
    $core.int? degree,
    $core.String? orderStatus,
    $core.String? frame,
    $core.int? starVerifyTag,
    $core.int? friend,
    $core.int? fans,
    $core.int? defend,
    $core.int? defendR,
    $core.int? orderR,
    $core.int? familiarR,
    $core.int? familiar,
    $core.bool? isSuper,
    $core.int? gid,
    $core.int? service,
    $core.int? mentorShipType,
    $core.int? mentorShipTaskState,
    $core.int? profileIntegrity,
    $core.int? intimacy,
    $core.int? relationScore,
    $core.int? closeEmoticon,
    $core.String? distanceDesc,
    $core.Iterable<MateProfileFriendTag>? friendTags,
    $core.String? sign,
    MateProfileContent? latestFeed,
    $core.int? members,
    $core.Iterable<MateProfileGroupMember>? memberList,
    $core.int? applyNum,
    $core.String? nickName,
    $core.Iterable<MateProfileDutyWords>? dutyWords,
    $core.Iterable<MateProfileSkill>? skills,
    MateProfileSkill? currentSkill,
    $core.String? type,
    $core.int? age,
    $core.String? userOriginTag,
    $core.String? constellation,
    $core.String? audio,
    $core.int? duration,
    $core.bool? chatMsgDisabled,
    $core.int? chatEggId,
    $core.int? meDanger,
    $core.int? magicMsgEntry,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (version != null) {
      _result.version = version;
    }
    if (name != null) {
      _result.name = name;
    }
    if (mark != null) {
      _result.mark = mark;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (title != null) {
      _result.title = title;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (city != null) {
      _result.city = city;
    }
    if (position != null) {
      _result.position = position;
    }
    if (strangerMsg != null) {
      _result.strangerMsg = strangerMsg;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (needVerify != null) {
      _result.needVerify = needVerify;
    }
    if (needVerifyNew != null) {
      _result.needVerifyNew = needVerifyNew;
    }
    if (official != null) {
      _result.official = official;
    }
    if (degree != null) {
      _result.degree = degree;
    }
    if (orderStatus != null) {
      _result.orderStatus = orderStatus;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (starVerifyTag != null) {
      _result.starVerifyTag = starVerifyTag;
    }
    if (friend != null) {
      _result.friend = friend;
    }
    if (fans != null) {
      _result.fans = fans;
    }
    if (defend != null) {
      _result.defend = defend;
    }
    if (defendR != null) {
      _result.defendR = defendR;
    }
    if (orderR != null) {
      _result.orderR = orderR;
    }
    if (familiarR != null) {
      _result.familiarR = familiarR;
    }
    if (familiar != null) {
      _result.familiar = familiar;
    }
    if (isSuper != null) {
      _result.isSuper = isSuper;
    }
    if (gid != null) {
      _result.gid = gid;
    }
    if (service != null) {
      _result.service = service;
    }
    if (mentorShipType != null) {
      _result.mentorShipType = mentorShipType;
    }
    if (mentorShipTaskState != null) {
      _result.mentorShipTaskState = mentorShipTaskState;
    }
    if (profileIntegrity != null) {
      _result.profileIntegrity = profileIntegrity;
    }
    if (intimacy != null) {
      _result.intimacy = intimacy;
    }
    if (relationScore != null) {
      _result.relationScore = relationScore;
    }
    if (closeEmoticon != null) {
      _result.closeEmoticon = closeEmoticon;
    }
    if (distanceDesc != null) {
      _result.distanceDesc = distanceDesc;
    }
    if (friendTags != null) {
      _result.friendTags.addAll(friendTags);
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (latestFeed != null) {
      _result.latestFeed = latestFeed;
    }
    if (members != null) {
      _result.members = members;
    }
    if (memberList != null) {
      _result.memberList.addAll(memberList);
    }
    if (applyNum != null) {
      _result.applyNum = applyNum;
    }
    if (nickName != null) {
      _result.nickName = nickName;
    }
    if (dutyWords != null) {
      _result.dutyWords.addAll(dutyWords);
    }
    if (skills != null) {
      _result.skills.addAll(skills);
    }
    if (currentSkill != null) {
      _result.currentSkill = currentSkill;
    }
    if (type != null) {
      _result.type = type;
    }
    if (age != null) {
      _result.age = age;
    }
    if (userOriginTag != null) {
      _result.userOriginTag = userOriginTag;
    }
    if (constellation != null) {
      _result.constellation = constellation;
    }
    if (audio != null) {
      _result.audio = audio;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (chatMsgDisabled != null) {
      _result.chatMsgDisabled = chatMsgDisabled;
    }
    if (chatEggId != null) {
      _result.chatEggId = chatEggId;
    }
    if (meDanger != null) {
      _result.meDanger = meDanger;
    }
    if (magicMsgEntry != null) {
      _result.magicMsgEntry = magicMsgEntry;
    }
    return _result;
  }
  factory MateCloudProfileData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateCloudProfileData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateCloudProfileData clone() =>
      MateCloudProfileData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateCloudProfileData copyWith(void Function(MateCloudProfileData) updates) =>
      super.copyWith((message) => updates(message as MateCloudProfileData))
          as MateCloudProfileData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateCloudProfileData create() => MateCloudProfileData._();
  MateCloudProfileData createEmptyInstance() => create();
  static $pb.PbList<MateCloudProfileData> createRepeated() =>
      $pb.PbList<MateCloudProfileData>();
  @$core.pragma('dart2js:noInline')
  static MateCloudProfileData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateCloudProfileData>(create);
  static MateCloudProfileData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);

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
  $core.String get mark => $_getSZ(3);
  @$pb.TagNumber(4)
  set mark($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMark() => $_has(3);
  @$pb.TagNumber(4)
  void clearMark() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get sex => $_getIZ(5);
  @$pb.TagNumber(6)
  set sex($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSex() => $_has(5);
  @$pb.TagNumber(6)
  void clearSex() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get title => $_getIZ(6);
  @$pb.TagNumber(7)
  set title($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get titleNew => $_getIZ(7);
  @$pb.TagNumber(8)
  set titleNew($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTitleNew() => $_has(7);
  @$pb.TagNumber(8)
  void clearTitleNew() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get city => $_getSZ(8);
  @$pb.TagNumber(9)
  set city($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCity() => $_has(8);
  @$pb.TagNumber(9)
  void clearCity() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get position => $_getSZ(9);
  @$pb.TagNumber(10)
  set position($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPosition() => $_has(9);
  @$pb.TagNumber(10)
  void clearPosition() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get strangerMsg => $_getIZ(10);
  @$pb.TagNumber(11)
  set strangerMsg($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasStrangerMsg() => $_has(10);
  @$pb.TagNumber(11)
  void clearStrangerMsg() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get rid => $_getIZ(11);
  @$pb.TagNumber(12)
  set rid($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRid() => $_has(11);
  @$pb.TagNumber(12)
  void clearRid() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get needVerify => $_getIZ(12);
  @$pb.TagNumber(13)
  set needVerify($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasNeedVerify() => $_has(12);
  @$pb.TagNumber(13)
  void clearNeedVerify() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get needVerifyNew => $_getIZ(13);
  @$pb.TagNumber(14)
  set needVerifyNew($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasNeedVerifyNew() => $_has(13);
  @$pb.TagNumber(14)
  void clearNeedVerifyNew() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get official => $_getIZ(14);
  @$pb.TagNumber(15)
  set official($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasOfficial() => $_has(14);
  @$pb.TagNumber(15)
  void clearOfficial() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get degree => $_getIZ(15);
  @$pb.TagNumber(16)
  set degree($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasDegree() => $_has(15);
  @$pb.TagNumber(16)
  void clearDegree() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get orderStatus => $_getSZ(16);
  @$pb.TagNumber(17)
  set orderStatus($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasOrderStatus() => $_has(16);
  @$pb.TagNumber(17)
  void clearOrderStatus() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get frame => $_getSZ(17);
  @$pb.TagNumber(18)
  set frame($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasFrame() => $_has(17);
  @$pb.TagNumber(18)
  void clearFrame() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get starVerifyTag => $_getIZ(18);
  @$pb.TagNumber(19)
  set starVerifyTag($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasStarVerifyTag() => $_has(18);
  @$pb.TagNumber(19)
  void clearStarVerifyTag() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get friend => $_getIZ(19);
  @$pb.TagNumber(20)
  set friend($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasFriend() => $_has(19);
  @$pb.TagNumber(20)
  void clearFriend() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get fans => $_getIZ(20);
  @$pb.TagNumber(21)
  set fans($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasFans() => $_has(20);
  @$pb.TagNumber(21)
  void clearFans() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get defend => $_getIZ(21);
  @$pb.TagNumber(22)
  set defend($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasDefend() => $_has(21);
  @$pb.TagNumber(22)
  void clearDefend() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get defendR => $_getIZ(22);
  @$pb.TagNumber(23)
  set defendR($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasDefendR() => $_has(22);
  @$pb.TagNumber(23)
  void clearDefendR() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get orderR => $_getIZ(23);
  @$pb.TagNumber(24)
  set orderR($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasOrderR() => $_has(23);
  @$pb.TagNumber(24)
  void clearOrderR() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get familiarR => $_getIZ(24);
  @$pb.TagNumber(25)
  set familiarR($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasFamiliarR() => $_has(24);
  @$pb.TagNumber(25)
  void clearFamiliarR() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get familiar => $_getIZ(25);
  @$pb.TagNumber(26)
  set familiar($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasFamiliar() => $_has(25);
  @$pb.TagNumber(26)
  void clearFamiliar() => clearField(26);

  @$pb.TagNumber(27)
  $core.bool get isSuper => $_getBF(26);
  @$pb.TagNumber(27)
  set isSuper($core.bool v) {
    $_setBool(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasIsSuper() => $_has(26);
  @$pb.TagNumber(27)
  void clearIsSuper() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get gid => $_getIZ(27);
  @$pb.TagNumber(28)
  set gid($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasGid() => $_has(27);
  @$pb.TagNumber(28)
  void clearGid() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get service => $_getIZ(28);
  @$pb.TagNumber(29)
  set service($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasService() => $_has(28);
  @$pb.TagNumber(29)
  void clearService() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get mentorShipType => $_getIZ(29);
  @$pb.TagNumber(30)
  set mentorShipType($core.int v) {
    $_setUnsignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasMentorShipType() => $_has(29);
  @$pb.TagNumber(30)
  void clearMentorShipType() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get mentorShipTaskState => $_getIZ(30);
  @$pb.TagNumber(31)
  set mentorShipTaskState($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasMentorShipTaskState() => $_has(30);
  @$pb.TagNumber(31)
  void clearMentorShipTaskState() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get profileIntegrity => $_getIZ(31);
  @$pb.TagNumber(32)
  set profileIntegrity($core.int v) {
    $_setUnsignedInt32(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasProfileIntegrity() => $_has(31);
  @$pb.TagNumber(32)
  void clearProfileIntegrity() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get intimacy => $_getIZ(32);
  @$pb.TagNumber(33)
  set intimacy($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasIntimacy() => $_has(32);
  @$pb.TagNumber(33)
  void clearIntimacy() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get relationScore => $_getIZ(33);
  @$pb.TagNumber(34)
  set relationScore($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasRelationScore() => $_has(33);
  @$pb.TagNumber(34)
  void clearRelationScore() => clearField(34);

  @$pb.TagNumber(35)
  $core.int get closeEmoticon => $_getIZ(34);
  @$pb.TagNumber(35)
  set closeEmoticon($core.int v) {
    $_setUnsignedInt32(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasCloseEmoticon() => $_has(34);
  @$pb.TagNumber(35)
  void clearCloseEmoticon() => clearField(35);

  @$pb.TagNumber(36)
  $core.String get distanceDesc => $_getSZ(35);
  @$pb.TagNumber(36)
  set distanceDesc($core.String v) {
    $_setString(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasDistanceDesc() => $_has(35);
  @$pb.TagNumber(36)
  void clearDistanceDesc() => clearField(36);

  @$pb.TagNumber(37)
  $core.List<MateProfileFriendTag> get friendTags => $_getList(36);

  @$pb.TagNumber(38)
  $core.String get sign => $_getSZ(37);
  @$pb.TagNumber(38)
  set sign($core.String v) {
    $_setString(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasSign() => $_has(37);
  @$pb.TagNumber(38)
  void clearSign() => clearField(38);

  @$pb.TagNumber(39)
  MateProfileContent get latestFeed => $_getN(38);
  @$pb.TagNumber(39)
  set latestFeed(MateProfileContent v) {
    setField(39, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasLatestFeed() => $_has(38);
  @$pb.TagNumber(39)
  void clearLatestFeed() => clearField(39);
  @$pb.TagNumber(39)
  MateProfileContent ensureLatestFeed() => $_ensure(38);

  @$pb.TagNumber(40)
  $core.int get members => $_getIZ(39);
  @$pb.TagNumber(40)
  set members($core.int v) {
    $_setUnsignedInt32(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasMembers() => $_has(39);
  @$pb.TagNumber(40)
  void clearMembers() => clearField(40);

  @$pb.TagNumber(41)
  $core.List<MateProfileGroupMember> get memberList => $_getList(40);

  @$pb.TagNumber(42)
  $core.int get applyNum => $_getIZ(41);
  @$pb.TagNumber(42)
  set applyNum($core.int v) {
    $_setUnsignedInt32(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasApplyNum() => $_has(41);
  @$pb.TagNumber(42)
  void clearApplyNum() => clearField(42);

  @$pb.TagNumber(43)
  $core.String get nickName => $_getSZ(42);
  @$pb.TagNumber(43)
  set nickName($core.String v) {
    $_setString(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasNickName() => $_has(42);
  @$pb.TagNumber(43)
  void clearNickName() => clearField(43);

  @$pb.TagNumber(44)
  $core.List<MateProfileDutyWords> get dutyWords => $_getList(43);

  @$pb.TagNumber(45)
  $core.List<MateProfileSkill> get skills => $_getList(44);

  @$pb.TagNumber(46)
  MateProfileSkill get currentSkill => $_getN(45);
  @$pb.TagNumber(46)
  set currentSkill(MateProfileSkill v) {
    setField(46, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasCurrentSkill() => $_has(45);
  @$pb.TagNumber(46)
  void clearCurrentSkill() => clearField(46);
  @$pb.TagNumber(46)
  MateProfileSkill ensureCurrentSkill() => $_ensure(45);

  @$pb.TagNumber(47)
  $core.String get type => $_getSZ(46);
  @$pb.TagNumber(47)
  set type($core.String v) {
    $_setString(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasType() => $_has(46);
  @$pb.TagNumber(47)
  void clearType() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get age => $_getIZ(47);
  @$pb.TagNumber(48)
  set age($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasAge() => $_has(47);
  @$pb.TagNumber(48)
  void clearAge() => clearField(48);

  @$pb.TagNumber(49)
  $core.String get userOriginTag => $_getSZ(48);
  @$pb.TagNumber(49)
  set userOriginTag($core.String v) {
    $_setString(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasUserOriginTag() => $_has(48);
  @$pb.TagNumber(49)
  void clearUserOriginTag() => clearField(49);

  @$pb.TagNumber(50)
  $core.String get constellation => $_getSZ(49);
  @$pb.TagNumber(50)
  set constellation($core.String v) {
    $_setString(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasConstellation() => $_has(49);
  @$pb.TagNumber(50)
  void clearConstellation() => clearField(50);

  @$pb.TagNumber(51)
  $core.String get audio => $_getSZ(50);
  @$pb.TagNumber(51)
  set audio($core.String v) {
    $_setString(50, v);
  }

  @$pb.TagNumber(51)
  $core.bool hasAudio() => $_has(50);
  @$pb.TagNumber(51)
  void clearAudio() => clearField(51);

  @$pb.TagNumber(52)
  $core.int get duration => $_getIZ(51);
  @$pb.TagNumber(52)
  set duration($core.int v) {
    $_setUnsignedInt32(51, v);
  }

  @$pb.TagNumber(52)
  $core.bool hasDuration() => $_has(51);
  @$pb.TagNumber(52)
  void clearDuration() => clearField(52);

  @$pb.TagNumber(53)
  $core.bool get chatMsgDisabled => $_getBF(52);
  @$pb.TagNumber(53)
  set chatMsgDisabled($core.bool v) {
    $_setBool(52, v);
  }

  @$pb.TagNumber(53)
  $core.bool hasChatMsgDisabled() => $_has(52);
  @$pb.TagNumber(53)
  void clearChatMsgDisabled() => clearField(53);

  @$pb.TagNumber(54)
  $core.int get chatEggId => $_getIZ(53);
  @$pb.TagNumber(54)
  set chatEggId($core.int v) {
    $_setUnsignedInt32(53, v);
  }

  @$pb.TagNumber(54)
  $core.bool hasChatEggId() => $_has(53);
  @$pb.TagNumber(54)
  void clearChatEggId() => clearField(54);

  @$pb.TagNumber(55)
  $core.int get meDanger => $_getIZ(54);
  @$pb.TagNumber(55)
  set meDanger($core.int v) {
    $_setUnsignedInt32(54, v);
  }

  @$pb.TagNumber(55)
  $core.bool hasMeDanger() => $_has(54);
  @$pb.TagNumber(55)
  void clearMeDanger() => clearField(55);

  @$pb.TagNumber(56)
  $core.int get magicMsgEntry => $_getIZ(55);
  @$pb.TagNumber(56)
  set magicMsgEntry($core.int v) {
    $_setUnsignedInt32(55, v);
  }

  @$pb.TagNumber(56)
  $core.bool hasMagicMsgEntry() => $_has(55);
  @$pb.TagNumber(56)
  void clearMagicMsgEntry() => clearField(56);
}

class MateResCloudProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateResCloudProfile',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOM<MateCloudProfileData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MateCloudProfileData.create)
    ..hasRequiredFields = false;

  MateResCloudProfile._() : super();
  factory MateResCloudProfile({
    $core.bool? success,
    $core.String? msg,
    $core.String? type,
    MateCloudProfileData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (type != null) {
      _result.type = type;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory MateResCloudProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateResCloudProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateResCloudProfile clone() => MateResCloudProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateResCloudProfile copyWith(void Function(MateResCloudProfile) updates) =>
      super.copyWith((message) => updates(message as MateResCloudProfile))
          as MateResCloudProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateResCloudProfile create() => MateResCloudProfile._();
  MateResCloudProfile createEmptyInstance() => create();
  static $pb.PbList<MateResCloudProfile> createRepeated() =>
      $pb.PbList<MateResCloudProfile>();
  @$core.pragma('dart2js:noInline')
  static MateResCloudProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateResCloudProfile>(create);
  static MateResCloudProfile? _defaultInstance;

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
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  MateCloudProfileData get data => $_getN(3);
  @$pb.TagNumber(4)
  set data(MateCloudProfileData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
  @$pb.TagNumber(4)
  MateCloudProfileData ensureData() => $_ensure(3);
}

class MateCloudTagData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateCloudTagData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..m<$core.int, $core.String>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userOriginTag',
        entryClassName: 'MateCloudTagData.UserOriginTagEntry',
        keyFieldType: $pb.PbFieldType.OU3,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('pb'))
    ..hasRequiredFields = false;

  MateCloudTagData._() : super();
  factory MateCloudTagData({
    $core.Map<$core.int, $core.String>? userOriginTag,
  }) {
    final _result = create();
    if (userOriginTag != null) {
      _result.userOriginTag.addAll(userOriginTag);
    }
    return _result;
  }
  factory MateCloudTagData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateCloudTagData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateCloudTagData clone() => MateCloudTagData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateCloudTagData copyWith(void Function(MateCloudTagData) updates) =>
      super.copyWith((message) => updates(message as MateCloudTagData))
          as MateCloudTagData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateCloudTagData create() => MateCloudTagData._();
  MateCloudTagData createEmptyInstance() => create();
  static $pb.PbList<MateCloudTagData> createRepeated() =>
      $pb.PbList<MateCloudTagData>();
  @$core.pragma('dart2js:noInline')
  static MateCloudTagData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateCloudTagData>(create);
  static MateCloudTagData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, $core.String> get userOriginTag => $_getMap(0);
}

class MateResCloudTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateResCloudTag',
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
    ..aOM<MateCloudTagData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MateCloudTagData.create)
    ..hasRequiredFields = false;

  MateResCloudTag._() : super();
  factory MateResCloudTag({
    $core.bool? success,
    $core.String? msg,
    MateCloudTagData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory MateResCloudTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateResCloudTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateResCloudTag clone() => MateResCloudTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateResCloudTag copyWith(void Function(MateResCloudTag) updates) =>
      super.copyWith((message) => updates(message as MateResCloudTag))
          as MateResCloudTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateResCloudTag create() => MateResCloudTag._();
  MateResCloudTag createEmptyInstance() => create();
  static $pb.PbList<MateResCloudTag> createRepeated() =>
      $pb.PbList<MateResCloudTag>();
  @$core.pragma('dart2js:noInline')
  static MateResCloudTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateResCloudTag>(create);
  static MateResCloudTag? _defaultInstance;

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
  MateCloudTagData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MateCloudTagData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MateCloudTagData ensureData() => $_ensure(2);
}
