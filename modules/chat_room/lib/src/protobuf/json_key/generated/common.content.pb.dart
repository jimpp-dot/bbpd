///
//  Generated code. Do not modify.
//  source: common.content.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/struct.pb.dart' as $0;

class CommonContent_Extra_UserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContent.Extra.UserInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOM<$0.Value>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        subBuilder: $0.Value.create)
    ..hasRequiredFields = false;

  CommonContent_Extra_UserInfo._() : super();
  factory CommonContent_Extra_UserInfo({
    $core.String? name,
    $core.String? icon,
    $0.Value? sex,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory CommonContent_Extra_UserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContent_Extra_UserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContent_Extra_UserInfo clone() =>
      CommonContent_Extra_UserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContent_Extra_UserInfo copyWith(
          void Function(CommonContent_Extra_UserInfo) updates) =>
      super.copyWith(
              (message) => updates(message as CommonContent_Extra_UserInfo))
          as CommonContent_Extra_UserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContent_Extra_UserInfo create() =>
      CommonContent_Extra_UserInfo._();
  CommonContent_Extra_UserInfo createEmptyInstance() => create();
  static $pb.PbList<CommonContent_Extra_UserInfo> createRepeated() =>
      $pb.PbList<CommonContent_Extra_UserInfo>();
  @$core.pragma('dart2js:noInline')
  static CommonContent_Extra_UserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContent_Extra_UserInfo>(create);
  static CommonContent_Extra_UserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

  @$pb.TagNumber(3)
  $0.Value get sex => $_getN(2);
  @$pb.TagNumber(3)
  set sex($0.Value v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSex() => clearField(3);
  @$pb.TagNumber(3)
  $0.Value ensureSex() => $_ensure(2);
}

class CommonContent_Extra_At extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContent.Extra.At',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content'),
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
    ..hasRequiredFields = false;

  CommonContent_Extra_At._() : super();
  factory CommonContent_Extra_At({
    $core.int? uid,
    $core.String? name,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory CommonContent_Extra_At.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContent_Extra_At.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContent_Extra_At clone() =>
      CommonContent_Extra_At()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContent_Extra_At copyWith(
          void Function(CommonContent_Extra_At) updates) =>
      super.copyWith((message) => updates(message as CommonContent_Extra_At))
          as CommonContent_Extra_At; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContent_Extra_At create() => CommonContent_Extra_At._();
  CommonContent_Extra_At createEmptyInstance() => create();
  static $pb.PbList<CommonContent_Extra_At> createRepeated() =>
      $pb.PbList<CommonContent_Extra_At>();
  @$core.pragma('dart2js:noInline')
  static CommonContent_Extra_At getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContent_Extra_At>(create);
  static CommonContent_Extra_At? _defaultInstance;

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
}

class CommonContent_Extra_Gift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContent.Extra.Gift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'flyingTime',
        $pb.PbFieldType.OU3,
        protoName: 'flyingTime')
    ..aOM<$0.Value>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fromUid',
        protoName: 'fromUid',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3,
        protoName: 'giftId')
    ..a<$core.double>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OD,
        protoName: 'toUid')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..hasRequiredFields = false;

  CommonContent_Extra_Gift._() : super();
  factory CommonContent_Extra_Gift({
    $core.int? flyingTime,
    $0.Value? fromUid,
    $core.int? giftId,
    $core.double? toUid,
    $core.String? url,
  }) {
    final _result = create();
    if (flyingTime != null) {
      _result.flyingTime = flyingTime;
    }
    if (fromUid != null) {
      _result.fromUid = fromUid;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (toUid != null) {
      _result.toUid = toUid;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory CommonContent_Extra_Gift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContent_Extra_Gift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContent_Extra_Gift clone() =>
      CommonContent_Extra_Gift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContent_Extra_Gift copyWith(
          void Function(CommonContent_Extra_Gift) updates) =>
      super.copyWith((message) => updates(message as CommonContent_Extra_Gift))
          as CommonContent_Extra_Gift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContent_Extra_Gift create() => CommonContent_Extra_Gift._();
  CommonContent_Extra_Gift createEmptyInstance() => create();
  static $pb.PbList<CommonContent_Extra_Gift> createRepeated() =>
      $pb.PbList<CommonContent_Extra_Gift>();
  @$core.pragma('dart2js:noInline')
  static CommonContent_Extra_Gift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContent_Extra_Gift>(create);
  static CommonContent_Extra_Gift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get flyingTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set flyingTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFlyingTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlyingTime() => clearField(1);

  @$pb.TagNumber(2)
  $0.Value get fromUid => $_getN(1);
  @$pb.TagNumber(2)
  set fromUid($0.Value v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFromUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromUid() => clearField(2);
  @$pb.TagNumber(2)
  $0.Value ensureFromUid() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get giftId => $_getIZ(2);
  @$pb.TagNumber(3)
  set giftId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftId() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get toUid => $_getN(3);
  @$pb.TagNumber(4)
  set toUid($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasToUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearToUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(5)
  set url($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearUrl() => clearField(5);
}

class CommonContent_Extra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContent.Extra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icongray')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_grow_user',
        $pb.PbFieldType.OU3)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_guess')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_newer',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title_new',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip_new',
        $pb.PbFieldType.OU3)
    ..aOM<CommonContent_Extra_At>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'at',
        subBuilder: CommonContent_Extra_At.create)
    ..aOM<CommonContent_Extra_Gift>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        subBuilder: CommonContent_Extra_Gift.create)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuid')
    ..aOM<CommonContent_Extra_UserInfo>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artist',
        subBuilder: CommonContent_Extra_UserInfo.create)
    ..aOM<CommonContent_Extra_UserInfo>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'agent',
        subBuilder: CommonContent_Extra_UserInfo.create)
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect_url')
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularity_level',
        $pb.PbFieldType.OU3)
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message_background')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background_new')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubble_front_color')
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOB(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_welcome_bubble')
    ..hasRequiredFields = false;

  CommonContent_Extra._() : super();
  factory CommonContent_Extra({
    $core.bool? icongray,
    $core.int? isGrowUser,
    $core.bool? isGuess,
    $core.int? isNewer,
    $core.int? title,
    $core.int? titleNew,
    $core.int? vip,
    $core.int? vipNew,
    CommonContent_Extra_At? at,
    CommonContent_Extra_Gift? gift,
    $core.String? type,
    $core.String? uuid,
    CommonContent_Extra_UserInfo? artist,
    CommonContent_Extra_UserInfo? agent,
    $core.String? icon,
    $core.String? from,
    $core.String? message,
    $core.int? uid,
    $core.String? effectUrl,
    $core.int? popularityLevel,
    $core.String? messageBackground,
    $core.String? backgroundNew,
    $core.String? bubbleFrontColor,
    $core.String? frame,
    $core.bool? showWelcomeBubble,
  }) {
    final _result = create();
    if (icongray != null) {
      _result.icongray = icongray;
    }
    if (isGrowUser != null) {
      _result.isGrowUser = isGrowUser;
    }
    if (isGuess != null) {
      _result.isGuess = isGuess;
    }
    if (isNewer != null) {
      _result.isNewer = isNewer;
    }
    if (title != null) {
      _result.title = title;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (vipNew != null) {
      _result.vipNew = vipNew;
    }
    if (at != null) {
      _result.at = at;
    }
    if (gift != null) {
      _result.gift = gift;
    }
    if (type != null) {
      _result.type = type;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (artist != null) {
      _result.artist = artist;
    }
    if (agent != null) {
      _result.agent = agent;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (from != null) {
      _result.from = from;
    }
    if (message != null) {
      _result.message = message;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (effectUrl != null) {
      _result.effectUrl = effectUrl;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (messageBackground != null) {
      _result.messageBackground = messageBackground;
    }
    if (backgroundNew != null) {
      _result.backgroundNew = backgroundNew;
    }
    if (bubbleFrontColor != null) {
      _result.bubbleFrontColor = bubbleFrontColor;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (showWelcomeBubble != null) {
      _result.showWelcomeBubble = showWelcomeBubble;
    }
    return _result;
  }
  factory CommonContent_Extra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContent_Extra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContent_Extra clone() => CommonContent_Extra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContent_Extra copyWith(void Function(CommonContent_Extra) updates) =>
      super.copyWith((message) => updates(message as CommonContent_Extra))
          as CommonContent_Extra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContent_Extra create() => CommonContent_Extra._();
  CommonContent_Extra createEmptyInstance() => create();
  static $pb.PbList<CommonContent_Extra> createRepeated() =>
      $pb.PbList<CommonContent_Extra>();
  @$core.pragma('dart2js:noInline')
  static CommonContent_Extra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContent_Extra>(create);
  static CommonContent_Extra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get icongray => $_getBF(0);
  @$pb.TagNumber(1)
  set icongray($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcongray() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcongray() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get isGrowUser => $_getIZ(1);
  @$pb.TagNumber(2)
  set isGrowUser($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsGrowUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsGrowUser() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isGuess => $_getBF(2);
  @$pb.TagNumber(3)
  set isGuess($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsGuess() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsGuess() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get isNewer => $_getIZ(3);
  @$pb.TagNumber(4)
  set isNewer($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsNewer() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsNewer() => clearField(4);

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
  $core.int get titleNew => $_getIZ(5);
  @$pb.TagNumber(6)
  set titleNew($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTitleNew() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitleNew() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get vip => $_getIZ(6);
  @$pb.TagNumber(7)
  set vip($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasVip() => $_has(6);
  @$pb.TagNumber(7)
  void clearVip() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get vipNew => $_getIZ(7);
  @$pb.TagNumber(8)
  set vipNew($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVipNew() => $_has(7);
  @$pb.TagNumber(8)
  void clearVipNew() => clearField(8);

  @$pb.TagNumber(9)
  CommonContent_Extra_At get at => $_getN(8);
  @$pb.TagNumber(9)
  set at(CommonContent_Extra_At v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearAt() => clearField(9);
  @$pb.TagNumber(9)
  CommonContent_Extra_At ensureAt() => $_ensure(8);

  @$pb.TagNumber(10)
  CommonContent_Extra_Gift get gift => $_getN(9);
  @$pb.TagNumber(10)
  set gift(CommonContent_Extra_Gift v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGift() => $_has(9);
  @$pb.TagNumber(10)
  void clearGift() => clearField(10);
  @$pb.TagNumber(10)
  CommonContent_Extra_Gift ensureGift() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get type => $_getSZ(10);
  @$pb.TagNumber(11)
  set type($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasType() => $_has(10);
  @$pb.TagNumber(11)
  void clearType() => clearField(11);

  @$pb.TagNumber(14)
  $core.String get uuid => $_getSZ(11);
  @$pb.TagNumber(14)
  set uuid($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUuid() => $_has(11);
  @$pb.TagNumber(14)
  void clearUuid() => clearField(14);

  @$pb.TagNumber(15)
  CommonContent_Extra_UserInfo get artist => $_getN(12);
  @$pb.TagNumber(15)
  set artist(CommonContent_Extra_UserInfo v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasArtist() => $_has(12);
  @$pb.TagNumber(15)
  void clearArtist() => clearField(15);
  @$pb.TagNumber(15)
  CommonContent_Extra_UserInfo ensureArtist() => $_ensure(12);

  @$pb.TagNumber(16)
  CommonContent_Extra_UserInfo get agent => $_getN(13);
  @$pb.TagNumber(16)
  set agent(CommonContent_Extra_UserInfo v) {
    setField(16, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasAgent() => $_has(13);
  @$pb.TagNumber(16)
  void clearAgent() => clearField(16);
  @$pb.TagNumber(16)
  CommonContent_Extra_UserInfo ensureAgent() => $_ensure(13);

  @$pb.TagNumber(17)
  $core.String get icon => $_getSZ(14);
  @$pb.TagNumber(17)
  set icon($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasIcon() => $_has(14);
  @$pb.TagNumber(17)
  void clearIcon() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get from => $_getSZ(15);
  @$pb.TagNumber(18)
  set from($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasFrom() => $_has(15);
  @$pb.TagNumber(18)
  void clearFrom() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get message => $_getSZ(16);
  @$pb.TagNumber(19)
  set message($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasMessage() => $_has(16);
  @$pb.TagNumber(19)
  void clearMessage() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get uid => $_getIZ(17);
  @$pb.TagNumber(20)
  set uid($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasUid() => $_has(17);
  @$pb.TagNumber(20)
  void clearUid() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get effectUrl => $_getSZ(18);
  @$pb.TagNumber(21)
  set effectUrl($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasEffectUrl() => $_has(18);
  @$pb.TagNumber(21)
  void clearEffectUrl() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get popularityLevel => $_getIZ(19);
  @$pb.TagNumber(22)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasPopularityLevel() => $_has(19);
  @$pb.TagNumber(22)
  void clearPopularityLevel() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get messageBackground => $_getSZ(20);
  @$pb.TagNumber(23)
  set messageBackground($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasMessageBackground() => $_has(20);
  @$pb.TagNumber(23)
  void clearMessageBackground() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get backgroundNew => $_getSZ(21);
  @$pb.TagNumber(24)
  set backgroundNew($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasBackgroundNew() => $_has(21);
  @$pb.TagNumber(24)
  void clearBackgroundNew() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get bubbleFrontColor => $_getSZ(22);
  @$pb.TagNumber(25)
  set bubbleFrontColor($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasBubbleFrontColor() => $_has(22);
  @$pb.TagNumber(25)
  void clearBubbleFrontColor() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get frame => $_getSZ(23);
  @$pb.TagNumber(26)
  set frame($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasFrame() => $_has(23);
  @$pb.TagNumber(26)
  void clearFrame() => clearField(26);

  @$pb.TagNumber(27)
  $core.bool get showWelcomeBubble => $_getBF(24);
  @$pb.TagNumber(27)
  set showWelcomeBubble($core.bool v) {
    $_setBool(24, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasShowWelcomeBubble() => $_has(24);
  @$pb.TagNumber(27)
  void clearShowWelcomeBubble() => clearField(27);
}

class CommonContent_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContent.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background_new')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubble_front_color')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message_background')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularity_level',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'portraitUri',
        protoName: 'portraitUri')
    ..hasRequiredFields = false;

  CommonContent_User._() : super();
  factory CommonContent_User({
    $core.String? backgroundNew,
    $core.String? bubbleFrontColor,
    $core.String? frame,
    $core.int? id,
    $core.String? messageBackground,
    $core.String? name,
    $core.int? popularityLevel,
    $core.String? portraitUri,
  }) {
    final _result = create();
    if (backgroundNew != null) {
      _result.backgroundNew = backgroundNew;
    }
    if (bubbleFrontColor != null) {
      _result.bubbleFrontColor = bubbleFrontColor;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (id != null) {
      _result.id = id;
    }
    if (messageBackground != null) {
      _result.messageBackground = messageBackground;
    }
    if (name != null) {
      _result.name = name;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (portraitUri != null) {
      _result.portraitUri = portraitUri;
    }
    return _result;
  }
  factory CommonContent_User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContent_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContent_User clone() => CommonContent_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContent_User copyWith(void Function(CommonContent_User) updates) =>
      super.copyWith((message) => updates(message as CommonContent_User))
          as CommonContent_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContent_User create() => CommonContent_User._();
  CommonContent_User createEmptyInstance() => create();
  static $pb.PbList<CommonContent_User> createRepeated() =>
      $pb.PbList<CommonContent_User>();
  @$core.pragma('dart2js:noInline')
  static CommonContent_User getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContent_User>(create);
  static CommonContent_User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backgroundNew => $_getSZ(0);
  @$pb.TagNumber(1)
  set backgroundNew($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBackgroundNew() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackgroundNew() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bubbleFrontColor => $_getSZ(1);
  @$pb.TagNumber(2)
  set bubbleFrontColor($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBubbleFrontColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearBubbleFrontColor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get frame => $_getSZ(2);
  @$pb.TagNumber(3)
  set frame($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFrame() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrame() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get id => $_getIZ(3);
  @$pb.TagNumber(4)
  set id($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get messageBackground => $_getSZ(4);
  @$pb.TagNumber(5)
  set messageBackground($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMessageBackground() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessageBackground() => clearField(5);

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
  $core.int get popularityLevel => $_getIZ(6);
  @$pb.TagNumber(7)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPopularityLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearPopularityLevel() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get portraitUri => $_getSZ(7);
  @$pb.TagNumber(8)
  set portraitUri($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPortraitUri() => $_has(7);
  @$pb.TagNumber(8)
  void clearPortraitUri() => clearField(8);
}

class CommonContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOM<CommonContent_Extra>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra',
        subBuilder: CommonContent_Extra.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOM<CommonContent_User>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: CommonContent_User.create)
    ..a<$fixnum.Int64>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'messageId',
        $pb.PbFieldType.OU6,
        protoName: 'messageId',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  CommonContent._() : super();
  factory CommonContent({
    $core.String? content,
    CommonContent_Extra? extra,
    $core.String? name,
    CommonContent_User? user,
    $fixnum.Int64? messageId,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    if (name != null) {
      _result.name = name;
    }
    if (user != null) {
      _result.user = user;
    }
    if (messageId != null) {
      _result.messageId = messageId;
    }
    return _result;
  }
  factory CommonContent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContent clone() => CommonContent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContent copyWith(void Function(CommonContent) updates) =>
      super.copyWith((message) => updates(message as CommonContent))
          as CommonContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContent create() => CommonContent._();
  CommonContent createEmptyInstance() => create();
  static $pb.PbList<CommonContent> createRepeated() =>
      $pb.PbList<CommonContent>();
  @$core.pragma('dart2js:noInline')
  static CommonContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContent>(create);
  static CommonContent? _defaultInstance;

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
  CommonContent_Extra get extra => $_getN(1);
  @$pb.TagNumber(2)
  set extra(CommonContent_Extra v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExtra() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtra() => clearField(2);
  @$pb.TagNumber(2)
  CommonContent_Extra ensureExtra() => $_ensure(1);

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
  CommonContent_User get user => $_getN(3);
  @$pb.TagNumber(4)
  set user(CommonContent_User v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearUser() => clearField(4);
  @$pb.TagNumber(4)
  CommonContent_User ensureUser() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get messageId => $_getI64(4);
  @$pb.TagNumber(5)
  set messageId($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMessageId() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessageId() => clearField(5);
}
