///
//  Generated code. Do not modify.
//  source: viability.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResViabilityInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResViabilityInfo',
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
    ..aOM<ViabilityInfoData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ViabilityInfoData.create)
    ..hasRequiredFields = false;

  ResViabilityInfo._() : super();
  factory ResViabilityInfo({
    $core.bool? success,
    $core.String? msg,
    ViabilityInfoData? data,
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
  factory ResViabilityInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResViabilityInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResViabilityInfo clone() => ResViabilityInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResViabilityInfo copyWith(void Function(ResViabilityInfo) updates) =>
      super.copyWith((message) => updates(message as ResViabilityInfo))
          as ResViabilityInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResViabilityInfo create() => ResViabilityInfo._();
  ResViabilityInfo createEmptyInstance() => create();
  static $pb.PbList<ResViabilityInfo> createRepeated() =>
      $pb.PbList<ResViabilityInfo>();
  @$core.pragma('dart2js:noInline')
  static ResViabilityInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResViabilityInfo>(create);
  static ResViabilityInfo? _defaultInstance;

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
  ViabilityInfoData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ViabilityInfoData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ViabilityInfoData ensureData() => $_ensure(2);
}

class ViabilityInfoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ViabilityInfoData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'end',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diff',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainLevel',
        $pb.PbFieldType.O3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subLevel',
        $pb.PbFieldType.O3)
    ..pc<ViabilityTask>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tasks',
        $pb.PbFieldType.PM,
        subBuilder: ViabilityTask.create)
    ..pc<ViabilityRank>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.PM,
        subBuilder: ViabilityRank.create)
    ..aOM<ViabilityRank>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: ViabilityRank.create)
    ..hasRequiredFields = false;

  ViabilityInfoData._() : super();
  factory ViabilityInfoData({
    $core.int? start,
    $core.int? end,
    $core.int? current,
    $core.int? diff,
    $core.int? mainLevel,
    $core.String? title,
    $core.int? subLevel,
    $core.Iterable<ViabilityTask>? tasks,
    $core.Iterable<ViabilityRank>? rank,
    ViabilityRank? me,
  }) {
    final _result = create();
    if (start != null) {
      _result.start = start;
    }
    if (end != null) {
      _result.end = end;
    }
    if (current != null) {
      _result.current = current;
    }
    if (diff != null) {
      _result.diff = diff;
    }
    if (mainLevel != null) {
      _result.mainLevel = mainLevel;
    }
    if (title != null) {
      _result.title = title;
    }
    if (subLevel != null) {
      _result.subLevel = subLevel;
    }
    if (tasks != null) {
      _result.tasks.addAll(tasks);
    }
    if (rank != null) {
      _result.rank.addAll(rank);
    }
    if (me != null) {
      _result.me = me;
    }
    return _result;
  }
  factory ViabilityInfoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViabilityInfoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViabilityInfoData clone() => ViabilityInfoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViabilityInfoData copyWith(void Function(ViabilityInfoData) updates) =>
      super.copyWith((message) => updates(message as ViabilityInfoData))
          as ViabilityInfoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViabilityInfoData create() => ViabilityInfoData._();
  ViabilityInfoData createEmptyInstance() => create();
  static $pb.PbList<ViabilityInfoData> createRepeated() =>
      $pb.PbList<ViabilityInfoData>();
  @$core.pragma('dart2js:noInline')
  static ViabilityInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViabilityInfoData>(create);
  static ViabilityInfoData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get start => $_getIZ(0);
  @$pb.TagNumber(1)
  set start($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearStart() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get end => $_getIZ(1);
  @$pb.TagNumber(2)
  set end($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnd() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get current => $_getIZ(2);
  @$pb.TagNumber(3)
  set current($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCurrent() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrent() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get diff => $_getIZ(3);
  @$pb.TagNumber(4)
  set diff($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDiff() => $_has(3);
  @$pb.TagNumber(4)
  void clearDiff() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get mainLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set mainLevel($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMainLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearMainLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get subLevel => $_getIZ(6);
  @$pb.TagNumber(7)
  set subLevel($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSubLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearSubLevel() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<ViabilityTask> get tasks => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<ViabilityRank> get rank => $_getList(8);

  @$pb.TagNumber(10)
  ViabilityRank get me => $_getN(9);
  @$pb.TagNumber(10)
  set me(ViabilityRank v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMe() => $_has(9);
  @$pb.TagNumber(10)
  void clearMe() => clearField(10);
  @$pb.TagNumber(10)
  ViabilityRank ensureMe() => $_ensure(9);
}

class ViabilityTask extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ViabilityTask',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'condition')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'button')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tapToast',
        protoName: 'tapToast')
    ..hasRequiredFields = false;

  ViabilityTask._() : super();
  factory ViabilityTask({
    $core.String? condition,
    $core.String? description,
    $core.String? url,
    $core.String? button,
    $core.String? tapToast,
  }) {
    final _result = create();
    if (condition != null) {
      _result.condition = condition;
    }
    if (description != null) {
      _result.description = description;
    }
    if (url != null) {
      _result.url = url;
    }
    if (button != null) {
      _result.button = button;
    }
    if (tapToast != null) {
      _result.tapToast = tapToast;
    }
    return _result;
  }
  factory ViabilityTask.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViabilityTask.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViabilityTask clone() => ViabilityTask()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViabilityTask copyWith(void Function(ViabilityTask) updates) =>
      super.copyWith((message) => updates(message as ViabilityTask))
          as ViabilityTask; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViabilityTask create() => ViabilityTask._();
  ViabilityTask createEmptyInstance() => create();
  static $pb.PbList<ViabilityTask> createRepeated() =>
      $pb.PbList<ViabilityTask>();
  @$core.pragma('dart2js:noInline')
  static ViabilityTask getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViabilityTask>(create);
  static ViabilityTask? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get condition => $_getSZ(0);
  @$pb.TagNumber(1)
  set condition($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCondition() => $_has(0);
  @$pb.TagNumber(1)
  void clearCondition() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get button => $_getSZ(3);
  @$pb.TagNumber(4)
  set button($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasButton() => $_has(3);
  @$pb.TagNumber(4)
  void clearButton() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tapToast => $_getSZ(4);
  @$pb.TagNumber(5)
  set tapToast($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTapToast() => $_has(4);
  @$pb.TagNumber(5)
  void clearTapToast() => clearField(5);
}

class ViabilityRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ViabilityRank',
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
            : 'rank',
        $pb.PbFieldType.O3)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onRank',
        protoName: 'onRank')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'viability',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainLevel',
        $pb.PbFieldType.O3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subLevel',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ViabilityRank._() : super();
  factory ViabilityRank({
    $core.int? uid,
    $core.int? rank,
    $core.bool? onRank,
    $core.int? viability,
    $core.String? name,
    $core.String? icon,
    $core.int? mainLevel,
    $core.String? title,
    $core.int? subLevel,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (onRank != null) {
      _result.onRank = onRank;
    }
    if (viability != null) {
      _result.viability = viability;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (mainLevel != null) {
      _result.mainLevel = mainLevel;
    }
    if (title != null) {
      _result.title = title;
    }
    if (subLevel != null) {
      _result.subLevel = subLevel;
    }
    return _result;
  }
  factory ViabilityRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViabilityRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViabilityRank clone() => ViabilityRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViabilityRank copyWith(void Function(ViabilityRank) updates) =>
      super.copyWith((message) => updates(message as ViabilityRank))
          as ViabilityRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViabilityRank create() => ViabilityRank._();
  ViabilityRank createEmptyInstance() => create();
  static $pb.PbList<ViabilityRank> createRepeated() =>
      $pb.PbList<ViabilityRank>();
  @$core.pragma('dart2js:noInline')
  static ViabilityRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViabilityRank>(create);
  static ViabilityRank? _defaultInstance;

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
  $core.int get rank => $_getIZ(1);
  @$pb.TagNumber(2)
  set rank($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get onRank => $_getBF(2);
  @$pb.TagNumber(3)
  set onRank($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOnRank() => $_has(2);
  @$pb.TagNumber(3)
  void clearOnRank() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get viability => $_getIZ(3);
  @$pb.TagNumber(4)
  set viability($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasViability() => $_has(3);
  @$pb.TagNumber(4)
  void clearViability() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get mainLevel => $_getIZ(6);
  @$pb.TagNumber(7)
  set mainLevel($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMainLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearMainLevel() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get title => $_getSZ(7);
  @$pb.TagNumber(8)
  set title($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTitle() => $_has(7);
  @$pb.TagNumber(8)
  void clearTitle() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get subLevel => $_getIZ(8);
  @$pb.TagNumber(9)
  set subLevel($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSubLevel() => $_has(8);
  @$pb.TagNumber(9)
  void clearSubLevel() => clearField(9);
}

class ResViabilityBenefit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResViabilityBenefit',
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
    ..aOM<ViabilityBenefitData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ViabilityBenefitData.create)
    ..hasRequiredFields = false;

  ResViabilityBenefit._() : super();
  factory ResViabilityBenefit({
    $core.bool? success,
    $core.String? msg,
    ViabilityBenefitData? data,
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
  factory ResViabilityBenefit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResViabilityBenefit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResViabilityBenefit clone() => ResViabilityBenefit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResViabilityBenefit copyWith(void Function(ResViabilityBenefit) updates) =>
      super.copyWith((message) => updates(message as ResViabilityBenefit))
          as ResViabilityBenefit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResViabilityBenefit create() => ResViabilityBenefit._();
  ResViabilityBenefit createEmptyInstance() => create();
  static $pb.PbList<ResViabilityBenefit> createRepeated() =>
      $pb.PbList<ResViabilityBenefit>();
  @$core.pragma('dart2js:noInline')
  static ResViabilityBenefit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResViabilityBenefit>(create);
  static ResViabilityBenefit? _defaultInstance;

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
  ViabilityBenefitData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ViabilityBenefitData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ViabilityBenefitData ensureData() => $_ensure(2);
}

class ViabilityBenefitData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ViabilityBenefitData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.OU3)
    ..pc<ViabilityLevel>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levels',
        $pb.PbFieldType.PM,
        subBuilder: ViabilityLevel.create)
    ..pc<ViabilityAccumulative>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accumulative',
        $pb.PbFieldType.PM,
        subBuilder: ViabilityAccumulative.create)
    ..hasRequiredFields = false;

  ViabilityBenefitData._() : super();
  factory ViabilityBenefitData({
    $core.int? current,
    $core.Iterable<ViabilityLevel>? levels,
    $core.Iterable<ViabilityAccumulative>? accumulative,
  }) {
    final _result = create();
    if (current != null) {
      _result.current = current;
    }
    if (levels != null) {
      _result.levels.addAll(levels);
    }
    if (accumulative != null) {
      _result.accumulative.addAll(accumulative);
    }
    return _result;
  }
  factory ViabilityBenefitData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViabilityBenefitData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViabilityBenefitData clone() =>
      ViabilityBenefitData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViabilityBenefitData copyWith(void Function(ViabilityBenefitData) updates) =>
      super.copyWith((message) => updates(message as ViabilityBenefitData))
          as ViabilityBenefitData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViabilityBenefitData create() => ViabilityBenefitData._();
  ViabilityBenefitData createEmptyInstance() => create();
  static $pb.PbList<ViabilityBenefitData> createRepeated() =>
      $pb.PbList<ViabilityBenefitData>();
  @$core.pragma('dart2js:noInline')
  static ViabilityBenefitData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViabilityBenefitData>(create);
  static ViabilityBenefitData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get current => $_getIZ(0);
  @$pb.TagNumber(1)
  set current($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ViabilityLevel> get levels => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<ViabilityAccumulative> get accumulative => $_getList(2);
}

class ViabilityLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ViabilityLevel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainLevel',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..pc<SubViabilityLevel>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subLevels',
        $pb.PbFieldType.PM,
        subBuilder: SubViabilityLevel.create)
    ..pc<ViabilityAward>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awards',
        $pb.PbFieldType.PM,
        subBuilder: ViabilityAward.create)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlock')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awarded')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardOpen')
    ..hasRequiredFields = false;

  ViabilityLevel._() : super();
  factory ViabilityLevel({
    $core.int? mainLevel,
    $core.String? title,
    $core.Iterable<SubViabilityLevel>? subLevels,
    $core.Iterable<ViabilityAward>? awards,
    $core.bool? unlock,
    $core.bool? awarded,
    $core.bool? awardOpen,
  }) {
    final _result = create();
    if (mainLevel != null) {
      _result.mainLevel = mainLevel;
    }
    if (title != null) {
      _result.title = title;
    }
    if (subLevels != null) {
      _result.subLevels.addAll(subLevels);
    }
    if (awards != null) {
      _result.awards.addAll(awards);
    }
    if (unlock != null) {
      _result.unlock = unlock;
    }
    if (awarded != null) {
      _result.awarded = awarded;
    }
    if (awardOpen != null) {
      _result.awardOpen = awardOpen;
    }
    return _result;
  }
  factory ViabilityLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViabilityLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViabilityLevel clone() => ViabilityLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViabilityLevel copyWith(void Function(ViabilityLevel) updates) =>
      super.copyWith((message) => updates(message as ViabilityLevel))
          as ViabilityLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViabilityLevel create() => ViabilityLevel._();
  ViabilityLevel createEmptyInstance() => create();
  static $pb.PbList<ViabilityLevel> createRepeated() =>
      $pb.PbList<ViabilityLevel>();
  @$core.pragma('dart2js:noInline')
  static ViabilityLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViabilityLevel>(create);
  static ViabilityLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get mainLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set mainLevel($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMainLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<SubViabilityLevel> get subLevels => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<ViabilityAward> get awards => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get unlock => $_getBF(4);
  @$pb.TagNumber(5)
  set unlock($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUnlock() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnlock() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get awarded => $_getBF(5);
  @$pb.TagNumber(6)
  set awarded($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAwarded() => $_has(5);
  @$pb.TagNumber(6)
  void clearAwarded() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get awardOpen => $_getBF(6);
  @$pb.TagNumber(7)
  set awardOpen($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAwardOpen() => $_has(6);
  @$pb.TagNumber(7)
  void clearAwardOpen() => clearField(7);
}

class SubViabilityLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SubViabilityLevel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subLevel',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'need',
        $pb.PbFieldType.OU3)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'achieved')
    ..hasRequiredFields = false;

  SubViabilityLevel._() : super();
  factory SubViabilityLevel({
    $core.int? subLevel,
    $core.int? need,
    $core.bool? achieved,
  }) {
    final _result = create();
    if (subLevel != null) {
      _result.subLevel = subLevel;
    }
    if (need != null) {
      _result.need = need;
    }
    if (achieved != null) {
      _result.achieved = achieved;
    }
    return _result;
  }
  factory SubViabilityLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubViabilityLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubViabilityLevel clone() => SubViabilityLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubViabilityLevel copyWith(void Function(SubViabilityLevel) updates) =>
      super.copyWith((message) => updates(message as SubViabilityLevel))
          as SubViabilityLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubViabilityLevel create() => SubViabilityLevel._();
  SubViabilityLevel createEmptyInstance() => create();
  static $pb.PbList<SubViabilityLevel> createRepeated() =>
      $pb.PbList<SubViabilityLevel>();
  @$core.pragma('dart2js:noInline')
  static SubViabilityLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubViabilityLevel>(create);
  static SubViabilityLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get subLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set subLevel($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSubLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get need => $_getIZ(1);
  @$pb.TagNumber(2)
  set need($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNeed() => $_has(1);
  @$pb.TagNumber(2)
  void clearNeed() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get achieved => $_getBF(2);
  @$pb.TagNumber(3)
  set achieved($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAchieved() => $_has(2);
  @$pb.TagNumber(3)
  void clearAchieved() => clearField(3);
}

class ViabilityAward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ViabilityAward',
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
            : 'num',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ViabilityAward._() : super();
  factory ViabilityAward({
    $core.int? cid,
    $core.String? name,
    $core.String? icon,
    $core.int? num,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory ViabilityAward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViabilityAward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViabilityAward clone() => ViabilityAward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViabilityAward copyWith(void Function(ViabilityAward) updates) =>
      super.copyWith((message) => updates(message as ViabilityAward))
          as ViabilityAward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViabilityAward create() => ViabilityAward._();
  ViabilityAward createEmptyInstance() => create();
  static $pb.PbList<ViabilityAward> createRepeated() =>
      $pb.PbList<ViabilityAward>();
  @$core.pragma('dart2js:noInline')
  static ViabilityAward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViabilityAward>(create);
  static ViabilityAward? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

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
  $core.int get num => $_getIZ(3);
  @$pb.TagNumber(4)
  set num($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearNum() => clearField(4);
}

class ViabilityAccumulative extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ViabilityAccumulative',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'condition')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'viability',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ViabilityAccumulative._() : super();
  factory ViabilityAccumulative({
    $core.String? condition,
    $core.int? viability,
  }) {
    final _result = create();
    if (condition != null) {
      _result.condition = condition;
    }
    if (viability != null) {
      _result.viability = viability;
    }
    return _result;
  }
  factory ViabilityAccumulative.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViabilityAccumulative.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViabilityAccumulative clone() =>
      ViabilityAccumulative()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViabilityAccumulative copyWith(
          void Function(ViabilityAccumulative) updates) =>
      super.copyWith((message) => updates(message as ViabilityAccumulative))
          as ViabilityAccumulative; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViabilityAccumulative create() => ViabilityAccumulative._();
  ViabilityAccumulative createEmptyInstance() => create();
  static $pb.PbList<ViabilityAccumulative> createRepeated() =>
      $pb.PbList<ViabilityAccumulative>();
  @$core.pragma('dart2js:noInline')
  static ViabilityAccumulative getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViabilityAccumulative>(create);
  static ViabilityAccumulative? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get condition => $_getSZ(0);
  @$pb.TagNumber(1)
  set condition($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCondition() => $_has(0);
  @$pb.TagNumber(1)
  void clearCondition() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get viability => $_getIZ(1);
  @$pb.TagNumber(2)
  set viability($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasViability() => $_has(1);
  @$pb.TagNumber(2)
  void clearViability() => clearField(2);
}
