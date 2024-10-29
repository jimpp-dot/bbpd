///
//  Generated code. Do not modify.
//  source: common_room_heartrace.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResHeartRaceConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHeartRaceConfig',
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
    ..aOM<HeartRaceConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        subBuilder: HeartRaceConfig.create)
    ..hasRequiredFields = false;

  ResHeartRaceConfig._() : super();
  factory ResHeartRaceConfig({
    $core.bool? success,
    $core.String? msg,
    HeartRaceConfig? config,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (config != null) {
      _result.config = config;
    }
    return _result;
  }
  factory ResHeartRaceConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHeartRaceConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHeartRaceConfig clone() => ResHeartRaceConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHeartRaceConfig copyWith(void Function(ResHeartRaceConfig) updates) =>
      super.copyWith((message) => updates(message as ResHeartRaceConfig))
          as ResHeartRaceConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHeartRaceConfig create() => ResHeartRaceConfig._();
  ResHeartRaceConfig createEmptyInstance() => create();
  static $pb.PbList<ResHeartRaceConfig> createRepeated() =>
      $pb.PbList<ResHeartRaceConfig>();
  @$core.pragma('dart2js:noInline')
  static ResHeartRaceConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHeartRaceConfig>(create);
  static ResHeartRaceConfig? _defaultInstance;

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
  HeartRaceConfig get config => $_getN(2);
  @$pb.TagNumber(3)
  set config(HeartRaceConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasConfig() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfig() => clearField(3);
  @$pb.TagNumber(3)
  HeartRaceConfig ensureConfig() => $_ensure(2);
}

class ResHeartRaceRelationConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHeartRaceRelationConfig',
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
    ..aOM<HeartRelaionConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        subBuilder: HeartRelaionConfig.create)
    ..hasRequiredFields = false;

  ResHeartRaceRelationConfig._() : super();
  factory ResHeartRaceRelationConfig({
    $core.bool? success,
    $core.String? msg,
    HeartRelaionConfig? config,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (config != null) {
      _result.config = config;
    }
    return _result;
  }
  factory ResHeartRaceRelationConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHeartRaceRelationConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHeartRaceRelationConfig clone() =>
      ResHeartRaceRelationConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHeartRaceRelationConfig copyWith(
          void Function(ResHeartRaceRelationConfig) updates) =>
      super.copyWith(
              (message) => updates(message as ResHeartRaceRelationConfig))
          as ResHeartRaceRelationConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHeartRaceRelationConfig create() => ResHeartRaceRelationConfig._();
  ResHeartRaceRelationConfig createEmptyInstance() => create();
  static $pb.PbList<ResHeartRaceRelationConfig> createRepeated() =>
      $pb.PbList<ResHeartRaceRelationConfig>();
  @$core.pragma('dart2js:noInline')
  static ResHeartRaceRelationConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHeartRaceRelationConfig>(create);
  static ResHeartRaceRelationConfig? _defaultInstance;

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
  HeartRelaionConfig get config => $_getN(2);
  @$pb.TagNumber(3)
  set config(HeartRelaionConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasConfig() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfig() => clearField(3);
  @$pb.TagNumber(3)
  HeartRelaionConfig ensureConfig() => $_ensure(2);
}

class HeartRelaionConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HeartRelaionConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<HeartRelationItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationList',
        $pb.PbFieldType.PM,
        subBuilder: HeartRelationItem.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationDuration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HeartRelaionConfig._() : super();
  factory HeartRelaionConfig({
    $core.Iterable<HeartRelationItem>? relationList,
    $core.int? relationDuration,
  }) {
    final _result = create();
    if (relationList != null) {
      _result.relationList.addAll(relationList);
    }
    if (relationDuration != null) {
      _result.relationDuration = relationDuration;
    }
    return _result;
  }
  factory HeartRelaionConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HeartRelaionConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HeartRelaionConfig clone() => HeartRelaionConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HeartRelaionConfig copyWith(void Function(HeartRelaionConfig) updates) =>
      super.copyWith((message) => updates(message as HeartRelaionConfig))
          as HeartRelaionConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartRelaionConfig create() => HeartRelaionConfig._();
  HeartRelaionConfig createEmptyInstance() => create();
  static $pb.PbList<HeartRelaionConfig> createRepeated() =>
      $pb.PbList<HeartRelaionConfig>();
  @$core.pragma('dart2js:noInline')
  static HeartRelaionConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartRelaionConfig>(create);
  static HeartRelaionConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<HeartRelationItem> get relationList => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get relationDuration => $_getIZ(1);
  @$pb.TagNumber(2)
  set relationDuration($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRelationDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelationDuration() => clearField(2);
}

class HeartRelationItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HeartRelationItem',
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

  HeartRelationItem._() : super();
  factory HeartRelationItem({
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
  factory HeartRelationItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HeartRelationItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HeartRelationItem clone() => HeartRelationItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HeartRelationItem copyWith(void Function(HeartRelationItem) updates) =>
      super.copyWith((message) => updates(message as HeartRelationItem))
          as HeartRelationItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartRelationItem create() => HeartRelationItem._();
  HeartRelationItem createEmptyInstance() => create();
  static $pb.PbList<HeartRelationItem> createRepeated() =>
      $pb.PbList<HeartRelationItem>();
  @$core.pragma('dart2js:noInline')
  static HeartRelationItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartRelationItem>(create);
  static HeartRelationItem? _defaultInstance;

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

class HeartRaceConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HeartRaceConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stateDeadline',
        $pb.PbFieldType.OU3)
    ..pc<MicPair>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micPair',
        $pb.PbFieldType.PM,
        subBuilder: MicPair.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isLockSec')
    ..aOM<HeartRaceAward>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardConfig',
        subBuilder: HeartRaceAward.create)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasHat')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapUrl')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HeartRaceConfig._() : super();
  factory HeartRaceConfig({
    $core.String? state,
    $core.int? stateDeadline,
    $core.Iterable<MicPair>? micPair,
    $core.int? level,
    $core.bool? isLockSec,
    HeartRaceAward? awardConfig,
    $core.bool? hasHat,
    $core.String? vapUrl,
    $core.int? vapSize,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (stateDeadline != null) {
      _result.stateDeadline = stateDeadline;
    }
    if (micPair != null) {
      _result.micPair.addAll(micPair);
    }
    if (level != null) {
      _result.level = level;
    }
    if (isLockSec != null) {
      _result.isLockSec = isLockSec;
    }
    if (awardConfig != null) {
      _result.awardConfig = awardConfig;
    }
    if (hasHat != null) {
      _result.hasHat = hasHat;
    }
    if (vapUrl != null) {
      _result.vapUrl = vapUrl;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    return _result;
  }
  factory HeartRaceConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HeartRaceConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HeartRaceConfig clone() => HeartRaceConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HeartRaceConfig copyWith(void Function(HeartRaceConfig) updates) =>
      super.copyWith((message) => updates(message as HeartRaceConfig))
          as HeartRaceConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartRaceConfig create() => HeartRaceConfig._();
  HeartRaceConfig createEmptyInstance() => create();
  static $pb.PbList<HeartRaceConfig> createRepeated() =>
      $pb.PbList<HeartRaceConfig>();
  @$core.pragma('dart2js:noInline')
  static HeartRaceConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartRaceConfig>(create);
  static HeartRaceConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get state => $_getSZ(0);
  @$pb.TagNumber(1)
  set state($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get stateDeadline => $_getIZ(1);
  @$pb.TagNumber(2)
  set stateDeadline($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStateDeadline() => $_has(1);
  @$pb.TagNumber(2)
  void clearStateDeadline() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<MicPair> get micPair => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isLockSec => $_getBF(4);
  @$pb.TagNumber(5)
  set isLockSec($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsLockSec() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsLockSec() => clearField(5);

  @$pb.TagNumber(6)
  HeartRaceAward get awardConfig => $_getN(5);
  @$pb.TagNumber(6)
  set awardConfig(HeartRaceAward v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAwardConfig() => $_has(5);
  @$pb.TagNumber(6)
  void clearAwardConfig() => clearField(6);
  @$pb.TagNumber(6)
  HeartRaceAward ensureAwardConfig() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.bool get hasHat => $_getBF(6);
  @$pb.TagNumber(7)
  set hasHat($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHasHat() => $_has(6);
  @$pb.TagNumber(7)
  void clearHasHat() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get vapUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set vapUrl($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVapUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearVapUrl() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get vapSize => $_getIZ(8);
  @$pb.TagNumber(9)
  set vapSize($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasVapSize() => $_has(8);
  @$pb.TagNumber(9)
  void clearVapSize() => clearField(9);
}

class HeartRaceAward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HeartRaceAward',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardIcons')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diffNumTips')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardDays',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardLevel',
        $pb.PbFieldType.OU3)
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardNames')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progressStart',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progressEnd',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HeartRaceAward._() : super();
  factory HeartRaceAward({
    $core.Iterable<$core.String>? awardIcons,
    $core.String? diffNumTips,
    $core.int? progress,
    $core.int? awardDays,
    $core.int? awardLevel,
    $core.Iterable<$core.String>? awardNames,
    $core.int? progressStart,
    $core.int? progressEnd,
  }) {
    final _result = create();
    if (awardIcons != null) {
      _result.awardIcons.addAll(awardIcons);
    }
    if (diffNumTips != null) {
      _result.diffNumTips = diffNumTips;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    if (awardDays != null) {
      _result.awardDays = awardDays;
    }
    if (awardLevel != null) {
      _result.awardLevel = awardLevel;
    }
    if (awardNames != null) {
      _result.awardNames.addAll(awardNames);
    }
    if (progressStart != null) {
      _result.progressStart = progressStart;
    }
    if (progressEnd != null) {
      _result.progressEnd = progressEnd;
    }
    return _result;
  }
  factory HeartRaceAward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HeartRaceAward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HeartRaceAward clone() => HeartRaceAward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HeartRaceAward copyWith(void Function(HeartRaceAward) updates) =>
      super.copyWith((message) => updates(message as HeartRaceAward))
          as HeartRaceAward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartRaceAward create() => HeartRaceAward._();
  HeartRaceAward createEmptyInstance() => create();
  static $pb.PbList<HeartRaceAward> createRepeated() =>
      $pb.PbList<HeartRaceAward>();
  @$core.pragma('dart2js:noInline')
  static HeartRaceAward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartRaceAward>(create);
  static HeartRaceAward? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get awardIcons => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get diffNumTips => $_getSZ(1);
  @$pb.TagNumber(2)
  set diffNumTips($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDiffNumTips() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiffNumTips() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get progress => $_getIZ(2);
  @$pb.TagNumber(3)
  set progress($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProgress() => $_has(2);
  @$pb.TagNumber(3)
  void clearProgress() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get awardDays => $_getIZ(3);
  @$pb.TagNumber(4)
  set awardDays($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAwardDays() => $_has(3);
  @$pb.TagNumber(4)
  void clearAwardDays() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get awardLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set awardLevel($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAwardLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearAwardLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get awardNames => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get progressStart => $_getIZ(6);
  @$pb.TagNumber(7)
  set progressStart($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasProgressStart() => $_has(6);
  @$pb.TagNumber(7)
  void clearProgressStart() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get progressEnd => $_getIZ(7);
  @$pb.TagNumber(8)
  set progressEnd($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasProgressEnd() => $_has(7);
  @$pb.TagNumber(8)
  void clearProgressEnd() => clearField(8);
}

class MicItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MicItem',
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
            : 'package',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MicItem._() : super();
  factory MicItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? package,
    $core.int? sex,
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
    if (package != null) {
      _result.package = package;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory MicItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MicItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MicItem clone() => MicItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MicItem copyWith(void Function(MicItem) updates) =>
      super.copyWith((message) => updates(message as MicItem))
          as MicItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MicItem create() => MicItem._();
  MicItem createEmptyInstance() => create();
  static $pb.PbList<MicItem> createRepeated() => $pb.PbList<MicItem>();
  @$core.pragma('dart2js:noInline')
  static MicItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MicItem>(create);
  static MicItem? _defaultInstance;

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
  $core.int get package => $_getIZ(3);
  @$pb.TagNumber(4)
  set package($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPackage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPackage() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sex => $_getIZ(4);
  @$pb.TagNumber(5)
  set sex($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSex() => clearField(5);
}

class MicPair extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MicPair',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<MicItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left',
        subBuilder: MicItem.create)
    ..aOM<MicItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'right',
        subBuilder: MicItem.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'package',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationTips')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationState',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MicPair._() : super();
  factory MicPair({
    MicItem? left,
    MicItem? right,
    $core.int? package,
    $core.String? relationTips,
    $core.int? relationState,
  }) {
    final _result = create();
    if (left != null) {
      _result.left = left;
    }
    if (right != null) {
      _result.right = right;
    }
    if (package != null) {
      _result.package = package;
    }
    if (relationTips != null) {
      _result.relationTips = relationTips;
    }
    if (relationState != null) {
      _result.relationState = relationState;
    }
    return _result;
  }
  factory MicPair.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MicPair.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MicPair clone() => MicPair()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MicPair copyWith(void Function(MicPair) updates) =>
      super.copyWith((message) => updates(message as MicPair))
          as MicPair; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MicPair create() => MicPair._();
  MicPair createEmptyInstance() => create();
  static $pb.PbList<MicPair> createRepeated() => $pb.PbList<MicPair>();
  @$core.pragma('dart2js:noInline')
  static MicPair getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MicPair>(create);
  static MicPair? _defaultInstance;

  @$pb.TagNumber(1)
  MicItem get left => $_getN(0);
  @$pb.TagNumber(1)
  set left(MicItem v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeft() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeft() => clearField(1);
  @$pb.TagNumber(1)
  MicItem ensureLeft() => $_ensure(0);

  @$pb.TagNumber(2)
  MicItem get right => $_getN(1);
  @$pb.TagNumber(2)
  set right(MicItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRight() => $_has(1);
  @$pb.TagNumber(2)
  void clearRight() => clearField(2);
  @$pb.TagNumber(2)
  MicItem ensureRight() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get package => $_getIZ(2);
  @$pb.TagNumber(3)
  set package($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPackage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPackage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get relationTips => $_getSZ(3);
  @$pb.TagNumber(4)
  set relationTips($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRelationTips() => $_has(3);
  @$pb.TagNumber(4)
  void clearRelationTips() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get relationState => $_getIZ(4);
  @$pb.TagNumber(5)
  set relationState($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRelationState() => $_has(4);
  @$pb.TagNumber(5)
  void clearRelationState() => clearField(5);
}

class ResHeartRaceRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHeartRaceRank',
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
    ..pc<HeartRaceRank>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.PM,
        subBuilder: HeartRaceRank.create)
    ..hasRequiredFields = false;

  ResHeartRaceRank._() : super();
  factory ResHeartRaceRank({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<HeartRaceRank>? rank,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (rank != null) {
      _result.rank.addAll(rank);
    }
    return _result;
  }
  factory ResHeartRaceRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHeartRaceRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHeartRaceRank clone() => ResHeartRaceRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHeartRaceRank copyWith(void Function(ResHeartRaceRank) updates) =>
      super.copyWith((message) => updates(message as ResHeartRaceRank))
          as ResHeartRaceRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHeartRaceRank create() => ResHeartRaceRank._();
  ResHeartRaceRank createEmptyInstance() => create();
  static $pb.PbList<ResHeartRaceRank> createRepeated() =>
      $pb.PbList<ResHeartRaceRank>();
  @$core.pragma('dart2js:noInline')
  static ResHeartRaceRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHeartRaceRank>(create);
  static ResHeartRaceRank? _defaultInstance;

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
  $core.List<HeartRaceRank> get rank => $_getList(2);
}

class HeartRaceRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HeartRaceRank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftUid',
        $pb.PbFieldType.OU3,
        protoName: 'leftUid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftName',
        protoName: 'leftName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftIcon',
        protoName: 'leftIcon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftSex',
        $pb.PbFieldType.OU3,
        protoName: 'leftSex')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightUid',
        $pb.PbFieldType.OU3,
        protoName: 'rightUid')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightName',
        protoName: 'rightName')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightIcon',
        protoName: 'rightIcon')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightSex',
        $pb.PbFieldType.OU3,
        protoName: 'rightSex')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalPackage',
        $pb.PbFieldType.OU3,
        protoName: 'totalPackage')
    ..hasRequiredFields = false;

  HeartRaceRank._() : super();
  factory HeartRaceRank({
    $core.int? leftUid,
    $core.String? leftName,
    $core.String? leftIcon,
    $core.int? leftSex,
    $core.int? rightUid,
    $core.String? rightName,
    $core.String? rightIcon,
    $core.int? rightSex,
    $core.String? time,
    $core.int? level,
    $core.int? totalPackage,
  }) {
    final _result = create();
    if (leftUid != null) {
      _result.leftUid = leftUid;
    }
    if (leftName != null) {
      _result.leftName = leftName;
    }
    if (leftIcon != null) {
      _result.leftIcon = leftIcon;
    }
    if (leftSex != null) {
      _result.leftSex = leftSex;
    }
    if (rightUid != null) {
      _result.rightUid = rightUid;
    }
    if (rightName != null) {
      _result.rightName = rightName;
    }
    if (rightIcon != null) {
      _result.rightIcon = rightIcon;
    }
    if (rightSex != null) {
      _result.rightSex = rightSex;
    }
    if (time != null) {
      _result.time = time;
    }
    if (level != null) {
      _result.level = level;
    }
    if (totalPackage != null) {
      _result.totalPackage = totalPackage;
    }
    return _result;
  }
  factory HeartRaceRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HeartRaceRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HeartRaceRank clone() => HeartRaceRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HeartRaceRank copyWith(void Function(HeartRaceRank) updates) =>
      super.copyWith((message) => updates(message as HeartRaceRank))
          as HeartRaceRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartRaceRank create() => HeartRaceRank._();
  HeartRaceRank createEmptyInstance() => create();
  static $pb.PbList<HeartRaceRank> createRepeated() =>
      $pb.PbList<HeartRaceRank>();
  @$core.pragma('dart2js:noInline')
  static HeartRaceRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartRaceRank>(create);
  static HeartRaceRank? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get leftUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set leftUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeftUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get leftName => $_getSZ(1);
  @$pb.TagNumber(2)
  set leftName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeftName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeftName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get leftIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set leftIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeftIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get leftSex => $_getIZ(3);
  @$pb.TagNumber(4)
  set leftSex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLeftSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeftSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rightUid => $_getIZ(4);
  @$pb.TagNumber(5)
  set rightUid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRightUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearRightUid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get rightName => $_getSZ(5);
  @$pb.TagNumber(6)
  set rightName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRightName() => $_has(5);
  @$pb.TagNumber(6)
  void clearRightName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get rightIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set rightIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRightIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearRightIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get rightSex => $_getIZ(7);
  @$pb.TagNumber(8)
  set rightSex($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRightSex() => $_has(7);
  @$pb.TagNumber(8)
  void clearRightSex() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get time => $_getSZ(8);
  @$pb.TagNumber(9)
  set time($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearTime() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get level => $_getIZ(9);
  @$pb.TagNumber(10)
  set level($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasLevel() => $_has(9);
  @$pb.TagNumber(10)
  void clearLevel() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get totalPackage => $_getIZ(10);
  @$pb.TagNumber(11)
  set totalPackage($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTotalPackage() => $_has(10);
  @$pb.TagNumber(11)
  void clearTotalPackage() => clearField(11);
}
