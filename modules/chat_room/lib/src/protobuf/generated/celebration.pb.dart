///
//  Generated code. Do not modify.
//  source: celebration.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CelebrationProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationProgress',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CelebrationProgress._() : super();
  factory CelebrationProgress({
    $core.String? level,
    $core.String? image,
    $core.int? total,
    $core.int? score,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (image != null) {
      _result.image = image;
    }
    if (total != null) {
      _result.total = total;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory CelebrationProgress.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationProgress.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationProgress clone() => CelebrationProgress()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationProgress copyWith(void Function(CelebrationProgress) updates) =>
      super.copyWith((message) => updates(message as CelebrationProgress))
          as CelebrationProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationProgress create() => CelebrationProgress._();
  CelebrationProgress createEmptyInstance() => create();
  static $pb.PbList<CelebrationProgress> createRepeated() =>
      $pb.PbList<CelebrationProgress>();
  @$core.pragma('dart2js:noInline')
  static CelebrationProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationProgress>(create);
  static CelebrationProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get level => $_getSZ(0);
  @$pb.TagNumber(1)
  set level($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);
}

class CelebrationEffect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationEffect',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effectSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operation',
        $pb.PbFieldType.OU3)
    ..aOM<CelebrationProgress>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        subBuilder: CelebrationProgress.create)
    ..hasRequiredFields = false;

  CelebrationEffect._() : super();
  factory CelebrationEffect({
    $core.String? title,
    $core.String? effect,
    $core.int? effectSize,
    $core.int? operation,
    CelebrationProgress? progress,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (effect != null) {
      _result.effect = effect;
    }
    if (effectSize != null) {
      _result.effectSize = effectSize;
    }
    if (operation != null) {
      _result.operation = operation;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    return _result;
  }
  factory CelebrationEffect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationEffect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationEffect clone() => CelebrationEffect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationEffect copyWith(void Function(CelebrationEffect) updates) =>
      super.copyWith((message) => updates(message as CelebrationEffect))
          as CelebrationEffect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationEffect create() => CelebrationEffect._();
  CelebrationEffect createEmptyInstance() => create();
  static $pb.PbList<CelebrationEffect> createRepeated() =>
      $pb.PbList<CelebrationEffect>();
  @$core.pragma('dart2js:noInline')
  static CelebrationEffect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationEffect>(create);
  static CelebrationEffect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get effect => $_getSZ(1);
  @$pb.TagNumber(2)
  set effect($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEffect() => $_has(1);
  @$pb.TagNumber(2)
  void clearEffect() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get effectSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set effectSize($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEffectSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearEffectSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get operation => $_getIZ(3);
  @$pb.TagNumber(4)
  set operation($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOperation() => $_has(3);
  @$pb.TagNumber(4)
  void clearOperation() => clearField(4);

  @$pb.TagNumber(5)
  CelebrationProgress get progress => $_getN(4);
  @$pb.TagNumber(5)
  set progress(CelebrationProgress v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProgress() => $_has(4);
  @$pb.TagNumber(5)
  void clearProgress() => clearField(5);
  @$pb.TagNumber(5)
  CelebrationProgress ensureProgress() => $_ensure(4);
}

class CelebrationConfigData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationConfigData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operation',
        $pb.PbFieldType.OU3)
    ..aOM<CelebrationProgress>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        subBuilder: CelebrationProgress.create)
    ..hasRequiredFields = false;

  CelebrationConfigData._() : super();
  factory CelebrationConfigData({
    $core.String? title,
    $core.int? operation,
    CelebrationProgress? progress,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (operation != null) {
      _result.operation = operation;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    return _result;
  }
  factory CelebrationConfigData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationConfigData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationConfigData clone() =>
      CelebrationConfigData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationConfigData copyWith(
          void Function(CelebrationConfigData) updates) =>
      super.copyWith((message) => updates(message as CelebrationConfigData))
          as CelebrationConfigData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationConfigData create() => CelebrationConfigData._();
  CelebrationConfigData createEmptyInstance() => create();
  static $pb.PbList<CelebrationConfigData> createRepeated() =>
      $pb.PbList<CelebrationConfigData>();
  @$core.pragma('dart2js:noInline')
  static CelebrationConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationConfigData>(create);
  static CelebrationConfigData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get operation => $_getIZ(1);
  @$pb.TagNumber(2)
  set operation($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => clearField(2);

  @$pb.TagNumber(3)
  CelebrationProgress get progress => $_getN(2);
  @$pb.TagNumber(3)
  set progress(CelebrationProgress v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProgress() => $_has(2);
  @$pb.TagNumber(3)
  void clearProgress() => clearField(3);
  @$pb.TagNumber(3)
  CelebrationProgress ensureProgress() => $_ensure(2);
}

class CelebrationSwitch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationSwitch',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operation',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CelebrationSwitch._() : super();
  factory CelebrationSwitch({
    $core.int? operation,
  }) {
    final _result = create();
    if (operation != null) {
      _result.operation = operation;
    }
    return _result;
  }
  factory CelebrationSwitch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationSwitch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationSwitch clone() => CelebrationSwitch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationSwitch copyWith(void Function(CelebrationSwitch) updates) =>
      super.copyWith((message) => updates(message as CelebrationSwitch))
          as CelebrationSwitch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationSwitch create() => CelebrationSwitch._();
  CelebrationSwitch createEmptyInstance() => create();
  static $pb.PbList<CelebrationSwitch> createRepeated() =>
      $pb.PbList<CelebrationSwitch>();
  @$core.pragma('dart2js:noInline')
  static CelebrationSwitch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationSwitch>(create);
  static CelebrationSwitch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get operation => $_getIZ(0);
  @$pb.TagNumber(1)
  set operation($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOperation() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperation() => clearField(1);
}

class ResCelebrationConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResCelebrationConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOM<CelebrationConfigData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CelebrationConfigData.create)
    ..hasRequiredFields = false;

  ResCelebrationConfig._() : super();
  factory ResCelebrationConfig({
    $core.String? msg,
    $core.bool? success,
    CelebrationConfigData? data,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    if (success != null) {
      _result.success = success;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResCelebrationConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResCelebrationConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResCelebrationConfig clone() =>
      ResCelebrationConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResCelebrationConfig copyWith(void Function(ResCelebrationConfig) updates) =>
      super.copyWith((message) => updates(message as ResCelebrationConfig))
          as ResCelebrationConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResCelebrationConfig create() => ResCelebrationConfig._();
  ResCelebrationConfig createEmptyInstance() => create();
  static $pb.PbList<ResCelebrationConfig> createRepeated() =>
      $pb.PbList<ResCelebrationConfig>();
  @$core.pragma('dart2js:noInline')
  static ResCelebrationConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResCelebrationConfig>(create);
  static ResCelebrationConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(3)
  CelebrationConfigData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CelebrationConfigData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CelebrationConfigData ensureData() => $_ensure(2);
}

class CelebrationLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationLevel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
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
            : 'cur')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'curProgress',
        $pb.PbFieldType.OU3)
    ..pc<CelebrationLevelItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: CelebrationLevelItem.create)
    ..hasRequiredFields = false;

  CelebrationLevel._() : super();
  factory CelebrationLevel({
    $core.String? name,
    $core.String? cur,
    $core.int? curProgress,
    $core.Iterable<CelebrationLevelItem>? items,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (cur != null) {
      _result.cur = cur;
    }
    if (curProgress != null) {
      _result.curProgress = curProgress;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory CelebrationLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationLevel clone() => CelebrationLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationLevel copyWith(void Function(CelebrationLevel) updates) =>
      super.copyWith((message) => updates(message as CelebrationLevel))
          as CelebrationLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationLevel create() => CelebrationLevel._();
  CelebrationLevel createEmptyInstance() => create();
  static $pb.PbList<CelebrationLevel> createRepeated() =>
      $pb.PbList<CelebrationLevel>();
  @$core.pragma('dart2js:noInline')
  static CelebrationLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationLevel>(create);
  static CelebrationLevel? _defaultInstance;

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
  $core.String get cur => $_getSZ(1);
  @$pb.TagNumber(2)
  set cur($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCur() => $_has(1);
  @$pb.TagNumber(2)
  void clearCur() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get curProgress => $_getIZ(2);
  @$pb.TagNumber(3)
  set curProgress($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCurProgress() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurProgress() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<CelebrationLevelItem> get items => $_getList(3);
}

class CelebrationLevelItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationLevelItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rangeStart',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rangeEnd',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardIcon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardName')
    ..hasRequiredFields = false;

  CelebrationLevelItem._() : super();
  factory CelebrationLevelItem({
    $core.String? level,
    $core.String? image,
    $core.int? rangeStart,
    $core.int? rangeEnd,
    $core.String? awardIcon,
    $core.String? awardName,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (image != null) {
      _result.image = image;
    }
    if (rangeStart != null) {
      _result.rangeStart = rangeStart;
    }
    if (rangeEnd != null) {
      _result.rangeEnd = rangeEnd;
    }
    if (awardIcon != null) {
      _result.awardIcon = awardIcon;
    }
    if (awardName != null) {
      _result.awardName = awardName;
    }
    return _result;
  }
  factory CelebrationLevelItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationLevelItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationLevelItem clone() =>
      CelebrationLevelItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationLevelItem copyWith(void Function(CelebrationLevelItem) updates) =>
      super.copyWith((message) => updates(message as CelebrationLevelItem))
          as CelebrationLevelItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationLevelItem create() => CelebrationLevelItem._();
  CelebrationLevelItem createEmptyInstance() => create();
  static $pb.PbList<CelebrationLevelItem> createRepeated() =>
      $pb.PbList<CelebrationLevelItem>();
  @$core.pragma('dart2js:noInline')
  static CelebrationLevelItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationLevelItem>(create);
  static CelebrationLevelItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get level => $_getSZ(0);
  @$pb.TagNumber(1)
  set level($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rangeStart => $_getIZ(2);
  @$pb.TagNumber(3)
  set rangeStart($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRangeStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearRangeStart() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get rangeEnd => $_getIZ(3);
  @$pb.TagNumber(4)
  set rangeEnd($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRangeEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearRangeEnd() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get awardIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set awardIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAwardIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearAwardIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get awardName => $_getSZ(5);
  @$pb.TagNumber(6)
  set awardName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAwardName() => $_has(5);
  @$pb.TagNumber(6)
  void clearAwardName() => clearField(6);
}

class CelebrationContributorItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationContributorItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
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
            : 'score',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CelebrationContributorItem._() : super();
  factory CelebrationContributorItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? score,
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
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory CelebrationContributorItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationContributorItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationContributorItem clone() =>
      CelebrationContributorItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationContributorItem copyWith(
          void Function(CelebrationContributorItem) updates) =>
      super.copyWith(
              (message) => updates(message as CelebrationContributorItem))
          as CelebrationContributorItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationContributorItem create() => CelebrationContributorItem._();
  CelebrationContributorItem createEmptyInstance() => create();
  static $pb.PbList<CelebrationContributorItem> createRepeated() =>
      $pb.PbList<CelebrationContributorItem>();
  @$core.pragma('dart2js:noInline')
  static CelebrationContributorItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationContributorItem>(create);
  static CelebrationContributorItem? _defaultInstance;

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
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);
}

class CelebrationContributor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationContributor',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kingImage')
    ..pc<CelebrationContributorItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: CelebrationContributorItem.create)
    ..hasRequiredFields = false;

  CelebrationContributor._() : super();
  factory CelebrationContributor({
    $core.String? kingImage,
    $core.Iterable<CelebrationContributorItem>? items,
  }) {
    final _result = create();
    if (kingImage != null) {
      _result.kingImage = kingImage;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory CelebrationContributor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationContributor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationContributor clone() =>
      CelebrationContributor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationContributor copyWith(
          void Function(CelebrationContributor) updates) =>
      super.copyWith((message) => updates(message as CelebrationContributor))
          as CelebrationContributor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationContributor create() => CelebrationContributor._();
  CelebrationContributor createEmptyInstance() => create();
  static $pb.PbList<CelebrationContributor> createRepeated() =>
      $pb.PbList<CelebrationContributor>();
  @$core.pragma('dart2js:noInline')
  static CelebrationContributor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationContributor>(create);
  static CelebrationContributor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get kingImage => $_getSZ(0);
  @$pb.TagNumber(1)
  set kingImage($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKingImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearKingImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<CelebrationContributorItem> get items => $_getList(1);
}

class CelebrationWallItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationWallItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blessWord')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CelebrationWallItem._() : super();
  factory CelebrationWallItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? blessWord,
    $core.int? giftId,
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
    if (blessWord != null) {
      _result.blessWord = blessWord;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    return _result;
  }
  factory CelebrationWallItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationWallItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationWallItem clone() => CelebrationWallItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationWallItem copyWith(void Function(CelebrationWallItem) updates) =>
      super.copyWith((message) => updates(message as CelebrationWallItem))
          as CelebrationWallItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationWallItem create() => CelebrationWallItem._();
  CelebrationWallItem createEmptyInstance() => create();
  static $pb.PbList<CelebrationWallItem> createRepeated() =>
      $pb.PbList<CelebrationWallItem>();
  @$core.pragma('dart2js:noInline')
  static CelebrationWallItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationWallItem>(create);
  static CelebrationWallItem? _defaultInstance;

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
  $core.String get blessWord => $_getSZ(3);
  @$pb.TagNumber(4)
  set blessWord($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBlessWord() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlessWord() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get giftId => $_getIZ(4);
  @$pb.TagNumber(5)
  set giftId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftId() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftId() => clearField(5);
}

class CelebrationWall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationWall',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultBlessWord')
    ..pc<CelebrationWallItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: CelebrationWallItem.create)
    ..hasRequiredFields = false;

  CelebrationWall._() : super();
  factory CelebrationWall({
    $core.String? defaultBlessWord,
    $core.Iterable<CelebrationWallItem>? items,
  }) {
    final _result = create();
    if (defaultBlessWord != null) {
      _result.defaultBlessWord = defaultBlessWord;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory CelebrationWall.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationWall.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationWall clone() => CelebrationWall()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationWall copyWith(void Function(CelebrationWall) updates) =>
      super.copyWith((message) => updates(message as CelebrationWall))
          as CelebrationWall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationWall create() => CelebrationWall._();
  CelebrationWall createEmptyInstance() => create();
  static $pb.PbList<CelebrationWall> createRepeated() =>
      $pb.PbList<CelebrationWall>();
  @$core.pragma('dart2js:noInline')
  static CelebrationWall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationWall>(create);
  static CelebrationWall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get defaultBlessWord => $_getSZ(0);
  @$pb.TagNumber(1)
  set defaultBlessWord($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDefaultBlessWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearDefaultBlessWord() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<CelebrationWallItem> get items => $_getList(1);
}

class CelebrationDetailData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationDetailData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOM<CelebrationLevel>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        subBuilder: CelebrationLevel.create)
    ..aOM<CelebrationContributor>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contributor',
        subBuilder: CelebrationContributor.create)
    ..aOM<CelebrationWall>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wall',
        subBuilder: CelebrationWall.create)
    ..hasRequiredFields = false;

  CelebrationDetailData._() : super();
  factory CelebrationDetailData({
    CelebrationLevel? level,
    CelebrationContributor? contributor,
    CelebrationWall? wall,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (contributor != null) {
      _result.contributor = contributor;
    }
    if (wall != null) {
      _result.wall = wall;
    }
    return _result;
  }
  factory CelebrationDetailData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationDetailData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationDetailData clone() =>
      CelebrationDetailData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationDetailData copyWith(
          void Function(CelebrationDetailData) updates) =>
      super.copyWith((message) => updates(message as CelebrationDetailData))
          as CelebrationDetailData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationDetailData create() => CelebrationDetailData._();
  CelebrationDetailData createEmptyInstance() => create();
  static $pb.PbList<CelebrationDetailData> createRepeated() =>
      $pb.PbList<CelebrationDetailData>();
  @$core.pragma('dart2js:noInline')
  static CelebrationDetailData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationDetailData>(create);
  static CelebrationDetailData? _defaultInstance;

  @$pb.TagNumber(1)
  CelebrationLevel get level => $_getN(0);
  @$pb.TagNumber(1)
  set level(CelebrationLevel v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);
  @$pb.TagNumber(1)
  CelebrationLevel ensureLevel() => $_ensure(0);

  @$pb.TagNumber(2)
  CelebrationContributor get contributor => $_getN(1);
  @$pb.TagNumber(2)
  set contributor(CelebrationContributor v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContributor() => $_has(1);
  @$pb.TagNumber(2)
  void clearContributor() => clearField(2);
  @$pb.TagNumber(2)
  CelebrationContributor ensureContributor() => $_ensure(1);

  @$pb.TagNumber(3)
  CelebrationWall get wall => $_getN(2);
  @$pb.TagNumber(3)
  set wall(CelebrationWall v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWall() => $_has(2);
  @$pb.TagNumber(3)
  void clearWall() => clearField(3);
  @$pb.TagNumber(3)
  CelebrationWall ensureWall() => $_ensure(2);
}

class ResCelebrationDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResCelebrationDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOM<CelebrationDetailData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CelebrationDetailData.create)
    ..hasRequiredFields = false;

  ResCelebrationDetail._() : super();
  factory ResCelebrationDetail({
    $core.String? msg,
    $core.bool? success,
    CelebrationDetailData? data,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    if (success != null) {
      _result.success = success;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResCelebrationDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResCelebrationDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResCelebrationDetail clone() =>
      ResCelebrationDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResCelebrationDetail copyWith(void Function(ResCelebrationDetail) updates) =>
      super.copyWith((message) => updates(message as ResCelebrationDetail))
          as ResCelebrationDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResCelebrationDetail create() => ResCelebrationDetail._();
  ResCelebrationDetail createEmptyInstance() => create();
  static $pb.PbList<ResCelebrationDetail> createRepeated() =>
      $pb.PbList<ResCelebrationDetail>();
  @$core.pragma('dart2js:noInline')
  static ResCelebrationDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResCelebrationDetail>(create);
  static ResCelebrationDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(3)
  CelebrationDetailData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CelebrationDetailData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CelebrationDetailData ensureData() => $_ensure(2);
}

class CelebrationStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationStat',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'peopleCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wordCount',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CelebrationStat._() : super();
  factory CelebrationStat({
    $core.int? peopleCount,
    $core.int? wordCount,
    $core.String? level,
    $core.int? createTime,
  }) {
    final _result = create();
    if (peopleCount != null) {
      _result.peopleCount = peopleCount;
    }
    if (wordCount != null) {
      _result.wordCount = wordCount;
    }
    if (level != null) {
      _result.level = level;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    return _result;
  }
  factory CelebrationStat.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationStat.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationStat clone() => CelebrationStat()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationStat copyWith(void Function(CelebrationStat) updates) =>
      super.copyWith((message) => updates(message as CelebrationStat))
          as CelebrationStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationStat create() => CelebrationStat._();
  CelebrationStat createEmptyInstance() => create();
  static $pb.PbList<CelebrationStat> createRepeated() =>
      $pb.PbList<CelebrationStat>();
  @$core.pragma('dart2js:noInline')
  static CelebrationStat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationStat>(create);
  static CelebrationStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get peopleCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set peopleCount($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPeopleCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeopleCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get wordCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set wordCount($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWordCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearWordCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get level => $_getSZ(2);
  @$pb.TagNumber(3)
  set level($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get createTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set createTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCreateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateTime() => clearField(4);
}

class CelebrationRetrospectData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationRetrospectData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOM<CelebrationStat>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stat',
        subBuilder: CelebrationStat.create)
    ..aOM<CelebrationContributor>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contributor',
        subBuilder: CelebrationContributor.create)
    ..pc<CelebrationWallItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'words',
        $pb.PbFieldType.PM,
        subBuilder: CelebrationWallItem.create)
    ..hasRequiredFields = false;

  CelebrationRetrospectData._() : super();
  factory CelebrationRetrospectData({
    CelebrationStat? stat,
    CelebrationContributor? contributor,
    $core.Iterable<CelebrationWallItem>? words,
  }) {
    final _result = create();
    if (stat != null) {
      _result.stat = stat;
    }
    if (contributor != null) {
      _result.contributor = contributor;
    }
    if (words != null) {
      _result.words.addAll(words);
    }
    return _result;
  }
  factory CelebrationRetrospectData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationRetrospectData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationRetrospectData clone() =>
      CelebrationRetrospectData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationRetrospectData copyWith(
          void Function(CelebrationRetrospectData) updates) =>
      super.copyWith((message) => updates(message as CelebrationRetrospectData))
          as CelebrationRetrospectData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationRetrospectData create() => CelebrationRetrospectData._();
  CelebrationRetrospectData createEmptyInstance() => create();
  static $pb.PbList<CelebrationRetrospectData> createRepeated() =>
      $pb.PbList<CelebrationRetrospectData>();
  @$core.pragma('dart2js:noInline')
  static CelebrationRetrospectData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationRetrospectData>(create);
  static CelebrationRetrospectData? _defaultInstance;

  @$pb.TagNumber(1)
  CelebrationStat get stat => $_getN(0);
  @$pb.TagNumber(1)
  set stat(CelebrationStat v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStat() => $_has(0);
  @$pb.TagNumber(1)
  void clearStat() => clearField(1);
  @$pb.TagNumber(1)
  CelebrationStat ensureStat() => $_ensure(0);

  @$pb.TagNumber(2)
  CelebrationContributor get contributor => $_getN(1);
  @$pb.TagNumber(2)
  set contributor(CelebrationContributor v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContributor() => $_has(1);
  @$pb.TagNumber(2)
  void clearContributor() => clearField(2);
  @$pb.TagNumber(2)
  CelebrationContributor ensureContributor() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<CelebrationWallItem> get words => $_getList(2);
}

class ResCelebrationRetrospect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResCelebrationRetrospect',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOM<CelebrationRetrospectData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CelebrationRetrospectData.create)
    ..hasRequiredFields = false;

  ResCelebrationRetrospect._() : super();
  factory ResCelebrationRetrospect({
    $core.String? msg,
    $core.bool? success,
    CelebrationRetrospectData? data,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    if (success != null) {
      _result.success = success;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResCelebrationRetrospect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResCelebrationRetrospect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResCelebrationRetrospect clone() =>
      ResCelebrationRetrospect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResCelebrationRetrospect copyWith(
          void Function(ResCelebrationRetrospect) updates) =>
      super.copyWith((message) => updates(message as ResCelebrationRetrospect))
          as ResCelebrationRetrospect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResCelebrationRetrospect create() => ResCelebrationRetrospect._();
  ResCelebrationRetrospect createEmptyInstance() => create();
  static $pb.PbList<ResCelebrationRetrospect> createRepeated() =>
      $pb.PbList<ResCelebrationRetrospect>();
  @$core.pragma('dart2js:noInline')
  static ResCelebrationRetrospect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResCelebrationRetrospect>(create);
  static ResCelebrationRetrospect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(3)
  CelebrationRetrospectData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CelebrationRetrospectData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CelebrationRetrospectData ensureData() => $_ensure(2);
}

class CelebrationHistoryData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CelebrationHistoryData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'celebrationId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOM<CelebrationContributor>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contributor',
        subBuilder: CelebrationContributor.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CelebrationHistoryData._() : super();
  factory CelebrationHistoryData({
    $core.int? celebrationId,
    $core.String? level,
    $core.String? image,
    $core.String? name,
    CelebrationContributor? contributor,
    $core.int? createTime,
  }) {
    final _result = create();
    if (celebrationId != null) {
      _result.celebrationId = celebrationId;
    }
    if (level != null) {
      _result.level = level;
    }
    if (image != null) {
      _result.image = image;
    }
    if (name != null) {
      _result.name = name;
    }
    if (contributor != null) {
      _result.contributor = contributor;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    return _result;
  }
  factory CelebrationHistoryData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelebrationHistoryData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CelebrationHistoryData clone() =>
      CelebrationHistoryData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CelebrationHistoryData copyWith(
          void Function(CelebrationHistoryData) updates) =>
      super.copyWith((message) => updates(message as CelebrationHistoryData))
          as CelebrationHistoryData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CelebrationHistoryData create() => CelebrationHistoryData._();
  CelebrationHistoryData createEmptyInstance() => create();
  static $pb.PbList<CelebrationHistoryData> createRepeated() =>
      $pb.PbList<CelebrationHistoryData>();
  @$core.pragma('dart2js:noInline')
  static CelebrationHistoryData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CelebrationHistoryData>(create);
  static CelebrationHistoryData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get celebrationId => $_getIZ(0);
  @$pb.TagNumber(1)
  set celebrationId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCelebrationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCelebrationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get level => $_getSZ(1);
  @$pb.TagNumber(2)
  set level($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  CelebrationContributor get contributor => $_getN(4);
  @$pb.TagNumber(5)
  set contributor(CelebrationContributor v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasContributor() => $_has(4);
  @$pb.TagNumber(5)
  void clearContributor() => clearField(5);
  @$pb.TagNumber(5)
  CelebrationContributor ensureContributor() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get createTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set createTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);
}

class ResCelebrationHistory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResCelebrationHistory',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.celebration'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..pc<CelebrationHistoryData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: CelebrationHistoryData.create)
    ..hasRequiredFields = false;

  ResCelebrationHistory._() : super();
  factory ResCelebrationHistory({
    $core.String? msg,
    $core.bool? success,
    $core.Iterable<CelebrationHistoryData>? data,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    if (success != null) {
      _result.success = success;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory ResCelebrationHistory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResCelebrationHistory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResCelebrationHistory clone() =>
      ResCelebrationHistory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResCelebrationHistory copyWith(
          void Function(ResCelebrationHistory) updates) =>
      super.copyWith((message) => updates(message as ResCelebrationHistory))
          as ResCelebrationHistory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResCelebrationHistory create() => ResCelebrationHistory._();
  ResCelebrationHistory createEmptyInstance() => create();
  static $pb.PbList<ResCelebrationHistory> createRepeated() =>
      $pb.PbList<ResCelebrationHistory>();
  @$core.pragma('dart2js:noInline')
  static ResCelebrationHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResCelebrationHistory>(create);
  static ResCelebrationHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<CelebrationHistoryData> get data => $_getList(2);
}
