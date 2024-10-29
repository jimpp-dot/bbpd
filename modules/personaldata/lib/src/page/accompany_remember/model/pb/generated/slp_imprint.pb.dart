///
//  Generated code. Do not modify.
//  source: slp_imprint.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResImprintLight extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResImprintLight',
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
    ..aOM<ImprintLightData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ImprintLightData.create)
    ..hasRequiredFields = false;

  ResImprintLight._() : super();
  factory ResImprintLight({
    $core.bool? success,
    $core.String? msg,
    ImprintLightData? data,
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
  factory ResImprintLight.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResImprintLight.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResImprintLight clone() => ResImprintLight()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResImprintLight copyWith(void Function(ResImprintLight) updates) =>
      super.copyWith((message) => updates(message as ResImprintLight))
          as ResImprintLight; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResImprintLight create() => ResImprintLight._();
  ResImprintLight createEmptyInstance() => create();
  static $pb.PbList<ResImprintLight> createRepeated() =>
      $pb.PbList<ResImprintLight>();
  @$core.pragma('dart2js:noInline')
  static ResImprintLight getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResImprintLight>(create);
  static ResImprintLight? _defaultInstance;

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
  ImprintLightData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ImprintLightData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ImprintLightData ensureData() => $_ensure(2);
}

class ImprintLightData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImprintLightData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightenNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalNum',
        $pb.PbFieldType.OU3)
    ..aOM<ImprintUserData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: ImprintUserData.create)
    ..pc<UserImprintLight>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: UserImprintLight.create)
    ..aOM<ImprintLevel>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        subBuilder: ImprintLevel.create)
    ..hasRequiredFields = false;

  ImprintLightData._() : super();
  factory ImprintLightData({
    $core.int? lightenNum,
    $core.int? totalNum,
    ImprintUserData? user,
    $core.Iterable<UserImprintLight>? list,
    ImprintLevel? level,
  }) {
    final _result = create();
    if (lightenNum != null) {
      _result.lightenNum = lightenNum;
    }
    if (totalNum != null) {
      _result.totalNum = totalNum;
    }
    if (user != null) {
      _result.user = user;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (level != null) {
      _result.level = level;
    }
    return _result;
  }
  factory ImprintLightData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImprintLightData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImprintLightData clone() => ImprintLightData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImprintLightData copyWith(void Function(ImprintLightData) updates) =>
      super.copyWith((message) => updates(message as ImprintLightData))
          as ImprintLightData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImprintLightData create() => ImprintLightData._();
  ImprintLightData createEmptyInstance() => create();
  static $pb.PbList<ImprintLightData> createRepeated() =>
      $pb.PbList<ImprintLightData>();
  @$core.pragma('dart2js:noInline')
  static ImprintLightData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImprintLightData>(create);
  static ImprintLightData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lightenNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set lightenNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLightenNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearLightenNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTotalNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalNum() => clearField(2);

  @$pb.TagNumber(3)
  ImprintUserData get user => $_getN(2);
  @$pb.TagNumber(3)
  set user(ImprintUserData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => clearField(3);
  @$pb.TagNumber(3)
  ImprintUserData ensureUser() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<UserImprintLight> get list => $_getList(3);

  @$pb.TagNumber(5)
  ImprintLevel get level => $_getN(4);
  @$pb.TagNumber(5)
  set level(ImprintLevel v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => clearField(5);
  @$pb.TagNumber(5)
  ImprintLevel ensureLevel() => $_ensure(4);
}

class ImprintLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImprintLevel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextLevelScore',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ImprintLevel._() : super();
  factory ImprintLevel({
    $core.int? level,
    $core.int? score,
    $core.int? nextLevelScore,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (score != null) {
      _result.score = score;
    }
    if (nextLevelScore != null) {
      _result.nextLevelScore = nextLevelScore;
    }
    return _result;
  }
  factory ImprintLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImprintLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImprintLevel clone() => ImprintLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImprintLevel copyWith(void Function(ImprintLevel) updates) =>
      super.copyWith((message) => updates(message as ImprintLevel))
          as ImprintLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImprintLevel create() => ImprintLevel._();
  ImprintLevel createEmptyInstance() => create();
  static $pb.PbList<ImprintLevel> createRepeated() =>
      $pb.PbList<ImprintLevel>();
  @$core.pragma('dart2js:noInline')
  static ImprintLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImprintLevel>(create);
  static ImprintLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get nextLevelScore => $_getIZ(2);
  @$pb.TagNumber(3)
  set nextLevelScore($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNextLevelScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextLevelScore() => clearField(3);
}

class ImprintUserData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImprintUserData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fromUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fromName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fromIcon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toIcon')
    ..hasRequiredFields = false;

  ImprintUserData._() : super();
  factory ImprintUserData({
    $core.int? fromUid,
    $core.String? fromName,
    $core.String? fromIcon,
    $core.int? toUid,
    $core.String? toName,
    $core.String? toIcon,
  }) {
    final _result = create();
    if (fromUid != null) {
      _result.fromUid = fromUid;
    }
    if (fromName != null) {
      _result.fromName = fromName;
    }
    if (fromIcon != null) {
      _result.fromIcon = fromIcon;
    }
    if (toUid != null) {
      _result.toUid = toUid;
    }
    if (toName != null) {
      _result.toName = toName;
    }
    if (toIcon != null) {
      _result.toIcon = toIcon;
    }
    return _result;
  }
  factory ImprintUserData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImprintUserData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImprintUserData clone() => ImprintUserData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImprintUserData copyWith(void Function(ImprintUserData) updates) =>
      super.copyWith((message) => updates(message as ImprintUserData))
          as ImprintUserData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImprintUserData create() => ImprintUserData._();
  ImprintUserData createEmptyInstance() => create();
  static $pb.PbList<ImprintUserData> createRepeated() =>
      $pb.PbList<ImprintUserData>();
  @$core.pragma('dart2js:noInline')
  static ImprintUserData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImprintUserData>(create);
  static ImprintUserData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fromUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set fromUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFromUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fromName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fromName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFromName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fromIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set fromIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFromIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get toUid => $_getIZ(3);
  @$pb.TagNumber(4)
  set toUid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasToUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearToUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get toName => $_getSZ(4);
  @$pb.TagNumber(5)
  set toName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasToName() => $_has(4);
  @$pb.TagNumber(5)
  void clearToName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get toIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set toIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasToIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearToIcon() => clearField(6);
}

class UserImprintLight extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserImprintLight',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imprintId',
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
            : 'description')
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'images')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lighten',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelScores',
        $pb.PbFieldType.PU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redirect')
    ..p<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompanyScores',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  UserImprintLight._() : super();
  factory UserImprintLight({
    $core.int? imprintId,
    $core.String? name,
    $core.String? description,
    $core.Iterable<$core.String>? images,
    $core.int? level,
    $core.int? lighten,
    $core.int? score,
    $core.Iterable<$core.int>? levelScores,
    $core.String? redirect,
    $core.Iterable<$core.int>? accompanyScores,
  }) {
    final _result = create();
    if (imprintId != null) {
      _result.imprintId = imprintId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (images != null) {
      _result.images.addAll(images);
    }
    if (level != null) {
      _result.level = level;
    }
    if (lighten != null) {
      _result.lighten = lighten;
    }
    if (score != null) {
      _result.score = score;
    }
    if (levelScores != null) {
      _result.levelScores.addAll(levelScores);
    }
    if (redirect != null) {
      _result.redirect = redirect;
    }
    if (accompanyScores != null) {
      _result.accompanyScores.addAll(accompanyScores);
    }
    return _result;
  }
  factory UserImprintLight.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserImprintLight.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserImprintLight clone() => UserImprintLight()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserImprintLight copyWith(void Function(UserImprintLight) updates) =>
      super.copyWith((message) => updates(message as UserImprintLight))
          as UserImprintLight; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserImprintLight create() => UserImprintLight._();
  UserImprintLight createEmptyInstance() => create();
  static $pb.PbList<UserImprintLight> createRepeated() =>
      $pb.PbList<UserImprintLight>();
  @$core.pragma('dart2js:noInline')
  static UserImprintLight getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserImprintLight>(create);
  static UserImprintLight? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get imprintId => $_getIZ(0);
  @$pb.TagNumber(1)
  set imprintId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasImprintId() => $_has(0);
  @$pb.TagNumber(1)
  void clearImprintId() => clearField(1);

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
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get images => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get level => $_getIZ(4);
  @$pb.TagNumber(5)
  set level($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get lighten => $_getIZ(5);
  @$pb.TagNumber(6)
  set lighten($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLighten() => $_has(5);
  @$pb.TagNumber(6)
  void clearLighten() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get score => $_getIZ(6);
  @$pb.TagNumber(7)
  set score($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearScore() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get levelScores => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get redirect => $_getSZ(8);
  @$pb.TagNumber(9)
  set redirect($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRedirect() => $_has(8);
  @$pb.TagNumber(9)
  void clearRedirect() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.int> get accompanyScores => $_getList(9);
}

class ResImprintUserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResImprintUserList',
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
    ..aOM<ImprintUserListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ImprintUserListData.create)
    ..hasRequiredFields = false;

  ResImprintUserList._() : super();
  factory ResImprintUserList({
    $core.bool? success,
    $core.String? msg,
    ImprintUserListData? data,
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
  factory ResImprintUserList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResImprintUserList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResImprintUserList clone() => ResImprintUserList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResImprintUserList copyWith(void Function(ResImprintUserList) updates) =>
      super.copyWith((message) => updates(message as ResImprintUserList))
          as ResImprintUserList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResImprintUserList create() => ResImprintUserList._();
  ResImprintUserList createEmptyInstance() => create();
  static $pb.PbList<ResImprintUserList> createRepeated() =>
      $pb.PbList<ResImprintUserList>();
  @$core.pragma('dart2js:noInline')
  static ResImprintUserList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResImprintUserList>(create);
  static ResImprintUserList? _defaultInstance;

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
  ImprintUserListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ImprintUserListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ImprintUserListData ensureData() => $_ensure(2);
}

class ImprintUserListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImprintUserListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ImprintUserListItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ImprintUserListItem.create)
    ..hasRequiredFields = false;

  ImprintUserListData._() : super();
  factory ImprintUserListData({
    $core.Iterable<ImprintUserListItem>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ImprintUserListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImprintUserListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImprintUserListData clone() => ImprintUserListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImprintUserListData copyWith(void Function(ImprintUserListData) updates) =>
      super.copyWith((message) => updates(message as ImprintUserListData))
          as ImprintUserListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImprintUserListData create() => ImprintUserListData._();
  ImprintUserListData createEmptyInstance() => create();
  static $pb.PbList<ImprintUserListData> createRepeated() =>
      $pb.PbList<ImprintUserListData>();
  @$core.pragma('dart2js:noInline')
  static ImprintUserListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImprintUserListData>(create);
  static ImprintUserListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ImprintUserListItem> get list => $_getList(0);
}

class ImprintUserListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImprintUserListItem',
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightenNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'degree',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'staySecs',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ImprintUserListItem._() : super();
  factory ImprintUserListItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? vipLevel,
    $core.int? lightenNum,
    $core.int? totalNum,
    $core.int? degree,
    $core.int? staySecs,
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
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (lightenNum != null) {
      _result.lightenNum = lightenNum;
    }
    if (totalNum != null) {
      _result.totalNum = totalNum;
    }
    if (degree != null) {
      _result.degree = degree;
    }
    if (staySecs != null) {
      _result.staySecs = staySecs;
    }
    return _result;
  }
  factory ImprintUserListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImprintUserListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImprintUserListItem clone() => ImprintUserListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImprintUserListItem copyWith(void Function(ImprintUserListItem) updates) =>
      super.copyWith((message) => updates(message as ImprintUserListItem))
          as ImprintUserListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImprintUserListItem create() => ImprintUserListItem._();
  ImprintUserListItem createEmptyInstance() => create();
  static $pb.PbList<ImprintUserListItem> createRepeated() =>
      $pb.PbList<ImprintUserListItem>();
  @$core.pragma('dart2js:noInline')
  static ImprintUserListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImprintUserListItem>(create);
  static ImprintUserListItem? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get vipLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVipLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearVipLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get lightenNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set lightenNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLightenNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearLightenNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get totalNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set totalNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTotalNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get degree => $_getIZ(6);
  @$pb.TagNumber(7)
  set degree($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDegree() => $_has(6);
  @$pb.TagNumber(7)
  void clearDegree() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get staySecs => $_getIZ(7);
  @$pb.TagNumber(8)
  set staySecs($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStaySecs() => $_has(7);
  @$pb.TagNumber(8)
  void clearStaySecs() => clearField(8);
}
