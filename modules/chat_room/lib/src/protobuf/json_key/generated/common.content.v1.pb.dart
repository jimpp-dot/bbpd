///
//  Generated code. Do not modify.
//  source: common.content.v1.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CommonContentV1_Extra_At extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContentV1.Extra.At',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content.v1'),
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

  CommonContentV1_Extra_At._() : super();
  factory CommonContentV1_Extra_At({
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
  factory CommonContentV1_Extra_At.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContentV1_Extra_At.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContentV1_Extra_At clone() =>
      CommonContentV1_Extra_At()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContentV1_Extra_At copyWith(
          void Function(CommonContentV1_Extra_At) updates) =>
      super.copyWith((message) => updates(message as CommonContentV1_Extra_At))
          as CommonContentV1_Extra_At; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContentV1_Extra_At create() => CommonContentV1_Extra_At._();
  CommonContentV1_Extra_At createEmptyInstance() => create();
  static $pb.PbList<CommonContentV1_Extra_At> createRepeated() =>
      $pb.PbList<CommonContentV1_Extra_At>();
  @$core.pragma('dart2js:noInline')
  static CommonContentV1_Extra_At getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContentV1_Extra_At>(create);
  static CommonContentV1_Extra_At? _defaultInstance;

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

class CommonContentV1_Extra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContentV1.Extra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content.v1'),
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
    ..aOM<CommonContentV1_Extra_At>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'at',
        subBuilder: CommonContentV1_Extra_At.create)
    ..hasRequiredFields = false;

  CommonContentV1_Extra._() : super();
  factory CommonContentV1_Extra({
    $core.bool? icongray,
    $core.int? isGrowUser,
    $core.bool? isGuess,
    $core.int? isNewer,
    $core.int? title,
    $core.int? titleNew,
    $core.int? vip,
    $core.int? vipNew,
    CommonContentV1_Extra_At? at,
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
    return _result;
  }
  factory CommonContentV1_Extra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContentV1_Extra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContentV1_Extra clone() =>
      CommonContentV1_Extra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContentV1_Extra copyWith(
          void Function(CommonContentV1_Extra) updates) =>
      super.copyWith((message) => updates(message as CommonContentV1_Extra))
          as CommonContentV1_Extra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContentV1_Extra create() => CommonContentV1_Extra._();
  CommonContentV1_Extra createEmptyInstance() => create();
  static $pb.PbList<CommonContentV1_Extra> createRepeated() =>
      $pb.PbList<CommonContentV1_Extra>();
  @$core.pragma('dart2js:noInline')
  static CommonContentV1_Extra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContentV1_Extra>(create);
  static CommonContentV1_Extra? _defaultInstance;

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
  CommonContentV1_Extra_At get at => $_getN(8);
  @$pb.TagNumber(9)
  set at(CommonContentV1_Extra_At v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearAt() => clearField(9);
  @$pb.TagNumber(9)
  CommonContentV1_Extra_At ensureAt() => $_ensure(8);
}

class CommonContentV1_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContentV1.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content.v1'),
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

  CommonContentV1_User._() : super();
  factory CommonContentV1_User({
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
  factory CommonContentV1_User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContentV1_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContentV1_User clone() =>
      CommonContentV1_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContentV1_User copyWith(void Function(CommonContentV1_User) updates) =>
      super.copyWith((message) => updates(message as CommonContentV1_User))
          as CommonContentV1_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContentV1_User create() => CommonContentV1_User._();
  CommonContentV1_User createEmptyInstance() => create();
  static $pb.PbList<CommonContentV1_User> createRepeated() =>
      $pb.PbList<CommonContentV1_User>();
  @$core.pragma('dart2js:noInline')
  static CommonContentV1_User getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContentV1_User>(create);
  static CommonContentV1_User? _defaultInstance;

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

class CommonContentV1 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContentV1',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content.v1'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOM<CommonContentV1_Extra>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra',
        subBuilder: CommonContentV1_Extra.create)
    ..aOM<CommonContentV1_User>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: CommonContentV1_User.create)
    ..hasRequiredFields = false;

  CommonContentV1._() : super();
  factory CommonContentV1({
    $core.String? content,
    CommonContentV1_Extra? extra,
    CommonContentV1_User? user,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory CommonContentV1.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContentV1.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContentV1 clone() => CommonContentV1()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContentV1 copyWith(void Function(CommonContentV1) updates) =>
      super.copyWith((message) => updates(message as CommonContentV1))
          as CommonContentV1; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContentV1 create() => CommonContentV1._();
  CommonContentV1 createEmptyInstance() => create();
  static $pb.PbList<CommonContentV1> createRepeated() =>
      $pb.PbList<CommonContentV1>();
  @$core.pragma('dart2js:noInline')
  static CommonContentV1 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContentV1>(create);
  static CommonContentV1? _defaultInstance;

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
  CommonContentV1_Extra get extra => $_getN(1);
  @$pb.TagNumber(2)
  set extra(CommonContentV1_Extra v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExtra() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtra() => clearField(2);
  @$pb.TagNumber(2)
  CommonContentV1_Extra ensureExtra() => $_ensure(1);

  @$pb.TagNumber(3)
  CommonContentV1_User get user => $_getN(2);
  @$pb.TagNumber(3)
  set user(CommonContentV1_User v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => clearField(3);
  @$pb.TagNumber(3)
  CommonContentV1_User ensureUser() => $_ensure(2);
}
