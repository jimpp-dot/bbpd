///
//  Generated code. Do not modify.
//  source: ktv.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class KtvRoomTaskLevelItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskLevelItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'min',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'next',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelName',
        protoName: 'levelName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..hasRequiredFields = false;

  KtvRoomTaskLevelItem._() : super();
  factory KtvRoomTaskLevelItem({
    $fixnum.Int64? min,
    $fixnum.Int64? next,
    $core.int? level,
    $core.String? levelName,
    $core.String? url,
  }) {
    final _result = create();
    if (min != null) {
      _result.min = min;
    }
    if (next != null) {
      _result.next = next;
    }
    if (level != null) {
      _result.level = level;
    }
    if (levelName != null) {
      _result.levelName = levelName;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory KtvRoomTaskLevelItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskLevelItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskLevelItem clone() =>
      KtvRoomTaskLevelItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskLevelItem copyWith(void Function(KtvRoomTaskLevelItem) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskLevelItem))
          as KtvRoomTaskLevelItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskLevelItem create() => KtvRoomTaskLevelItem._();
  KtvRoomTaskLevelItem createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskLevelItem> createRepeated() =>
      $pb.PbList<KtvRoomTaskLevelItem>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskLevelItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskLevelItem>(create);
  static KtvRoomTaskLevelItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get min => $_getI64(0);
  @$pb.TagNumber(1)
  set min($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMin() => $_has(0);
  @$pb.TagNumber(1)
  void clearMin() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get next => $_getI64(1);
  @$pb.TagNumber(2)
  set next($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNext() => $_has(1);
  @$pb.TagNumber(2)
  void clearNext() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get levelName => $_getSZ(3);
  @$pb.TagNumber(4)
  set levelName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevelName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevelName() => clearField(4);

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

class KtvRoomTaskLevelInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskLevelInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelName',
        protoName: 'levelName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..pc<KtvRoomTaskLevelItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levels',
        $pb.PbFieldType.PM,
        subBuilder: KtvRoomTaskLevelItem.create)
    ..hasRequiredFields = false;

  KtvRoomTaskLevelInfo._() : super();
  factory KtvRoomTaskLevelInfo({
    $fixnum.Int64? current,
    $core.String? levelName,
    $core.int? level,
    $core.Iterable<KtvRoomTaskLevelItem>? levels,
  }) {
    final _result = create();
    if (current != null) {
      _result.current = current;
    }
    if (levelName != null) {
      _result.levelName = levelName;
    }
    if (level != null) {
      _result.level = level;
    }
    if (levels != null) {
      _result.levels.addAll(levels);
    }
    return _result;
  }
  factory KtvRoomTaskLevelInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskLevelInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskLevelInfo clone() =>
      KtvRoomTaskLevelInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskLevelInfo copyWith(void Function(KtvRoomTaskLevelInfo) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskLevelInfo))
          as KtvRoomTaskLevelInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskLevelInfo create() => KtvRoomTaskLevelInfo._();
  KtvRoomTaskLevelInfo createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskLevelInfo> createRepeated() =>
      $pb.PbList<KtvRoomTaskLevelInfo>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskLevelInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskLevelInfo>(create);
  static KtvRoomTaskLevelInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get current => $_getI64(0);
  @$pb.TagNumber(1)
  set current($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get levelName => $_getSZ(1);
  @$pb.TagNumber(2)
  set levelName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevelName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevelName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<KtvRoomTaskLevelItem> get levels => $_getList(3);
}

class KtvRoomTaskInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOM<KtvRoomTaskExtra>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra',
        subBuilder: KtvRoomTaskExtra.create)
    ..hasRequiredFields = false;

  KtvRoomTaskInfo._() : super();
  factory KtvRoomTaskInfo({
    $core.String? type,
    $core.int? status,
    $core.String? title,
    $core.String? desc,
    KtvRoomTaskExtra? extra,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (status != null) {
      _result.status = status;
    }
    if (title != null) {
      _result.title = title;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    return _result;
  }
  factory KtvRoomTaskInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskInfo clone() => KtvRoomTaskInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskInfo copyWith(void Function(KtvRoomTaskInfo) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskInfo))
          as KtvRoomTaskInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskInfo create() => KtvRoomTaskInfo._();
  KtvRoomTaskInfo createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskInfo> createRepeated() =>
      $pb.PbList<KtvRoomTaskInfo>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskInfo>(create);
  static KtvRoomTaskInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);

  @$pb.TagNumber(5)
  KtvRoomTaskExtra get extra => $_getN(4);
  @$pb.TagNumber(5)
  set extra(KtvRoomTaskExtra v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasExtra() => $_has(4);
  @$pb.TagNumber(5)
  void clearExtra() => clearField(5);
  @$pb.TagNumber(5)
  KtvRoomTaskExtra ensureExtra() => $_ensure(4);
}

enum KtvRoomTaskExtra_Extra { signWeekly, online, notSet }

class KtvRoomTaskExtra extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, KtvRoomTaskExtra_Extra>
      _KtvRoomTaskExtra_ExtraByTag = {
    1: KtvRoomTaskExtra_Extra.signWeekly,
    2: KtvRoomTaskExtra_Extra.online,
    0: KtvRoomTaskExtra_Extra.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<KtvRoomTaskSignWeekly>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signWeekly',
        protoName: 'signWeekly',
        subBuilder: KtvRoomTaskSignWeekly.create)
    ..aOM<KtvRoomTaskOnline>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        subBuilder: KtvRoomTaskOnline.create)
    ..hasRequiredFields = false;

  KtvRoomTaskExtra._() : super();
  factory KtvRoomTaskExtra({
    KtvRoomTaskSignWeekly? signWeekly,
    KtvRoomTaskOnline? online,
  }) {
    final _result = create();
    if (signWeekly != null) {
      _result.signWeekly = signWeekly;
    }
    if (online != null) {
      _result.online = online;
    }
    return _result;
  }
  factory KtvRoomTaskExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskExtra clone() => KtvRoomTaskExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskExtra copyWith(void Function(KtvRoomTaskExtra) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskExtra))
          as KtvRoomTaskExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskExtra create() => KtvRoomTaskExtra._();
  KtvRoomTaskExtra createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskExtra> createRepeated() =>
      $pb.PbList<KtvRoomTaskExtra>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskExtra>(create);
  static KtvRoomTaskExtra? _defaultInstance;

  KtvRoomTaskExtra_Extra whichExtra() =>
      _KtvRoomTaskExtra_ExtraByTag[$_whichOneof(0)]!;
  void clearExtra() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  KtvRoomTaskSignWeekly get signWeekly => $_getN(0);
  @$pb.TagNumber(1)
  set signWeekly(KtvRoomTaskSignWeekly v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSignWeekly() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignWeekly() => clearField(1);
  @$pb.TagNumber(1)
  KtvRoomTaskSignWeekly ensureSignWeekly() => $_ensure(0);

  @$pb.TagNumber(2)
  KtvRoomTaskOnline get online => $_getN(1);
  @$pb.TagNumber(2)
  set online(KtvRoomTaskOnline v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOnline() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnline() => clearField(2);
  @$pb.TagNumber(2)
  KtvRoomTaskOnline ensureOnline() => $_ensure(1);
}

class KtvRoomTaskSignWeekly extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskSignWeekly',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signMonthCount',
        $pb.PbFieldType.OU3,
        protoName: 'signMonthCount')
    ..pc<KtvRoomTaskSignWeeklyItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signs',
        $pb.PbFieldType.PM,
        subBuilder: KtvRoomTaskSignWeeklyItem.create)
    ..hasRequiredFields = false;

  KtvRoomTaskSignWeekly._() : super();
  factory KtvRoomTaskSignWeekly({
    $core.int? signMonthCount,
    $core.Iterable<KtvRoomTaskSignWeeklyItem>? signs,
  }) {
    final _result = create();
    if (signMonthCount != null) {
      _result.signMonthCount = signMonthCount;
    }
    if (signs != null) {
      _result.signs.addAll(signs);
    }
    return _result;
  }
  factory KtvRoomTaskSignWeekly.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskSignWeekly.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskSignWeekly clone() =>
      KtvRoomTaskSignWeekly()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskSignWeekly copyWith(
          void Function(KtvRoomTaskSignWeekly) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskSignWeekly))
          as KtvRoomTaskSignWeekly; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskSignWeekly create() => KtvRoomTaskSignWeekly._();
  KtvRoomTaskSignWeekly createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskSignWeekly> createRepeated() =>
      $pb.PbList<KtvRoomTaskSignWeekly>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskSignWeekly getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskSignWeekly>(create);
  static KtvRoomTaskSignWeekly? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get signMonthCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set signMonthCount($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSignMonthCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignMonthCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<KtvRoomTaskSignWeeklyItem> get signs => $_getList(1);
}

class KtvRoomTaskSignWeeklyItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskSignWeeklyItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..hasRequiredFields = false;

  KtvRoomTaskSignWeeklyItem._() : super();
  factory KtvRoomTaskSignWeeklyItem({
    $core.String? tag,
    $core.bool? sign,
  }) {
    final _result = create();
    if (tag != null) {
      _result.tag = tag;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory KtvRoomTaskSignWeeklyItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskSignWeeklyItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskSignWeeklyItem clone() =>
      KtvRoomTaskSignWeeklyItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskSignWeeklyItem copyWith(
          void Function(KtvRoomTaskSignWeeklyItem) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskSignWeeklyItem))
          as KtvRoomTaskSignWeeklyItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskSignWeeklyItem create() => KtvRoomTaskSignWeeklyItem._();
  KtvRoomTaskSignWeeklyItem createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskSignWeeklyItem> createRepeated() =>
      $pb.PbList<KtvRoomTaskSignWeeklyItem>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskSignWeeklyItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskSignWeeklyItem>(create);
  static KtvRoomTaskSignWeeklyItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tag => $_getSZ(0);
  @$pb.TagNumber(1)
  set tag($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get sign => $_getBF(1);
  @$pb.TagNumber(2)
  set sign($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSign() => $_has(1);
  @$pb.TagNumber(2)
  void clearSign() => clearField(2);
}

class KtvRoomTaskOnline extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskOnline',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'min',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'max',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cur',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  KtvRoomTaskOnline._() : super();
  factory KtvRoomTaskOnline({
    $core.int? min,
    $core.int? max,
    $core.int? cur,
  }) {
    final _result = create();
    if (min != null) {
      _result.min = min;
    }
    if (max != null) {
      _result.max = max;
    }
    if (cur != null) {
      _result.cur = cur;
    }
    return _result;
  }
  factory KtvRoomTaskOnline.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskOnline.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskOnline clone() => KtvRoomTaskOnline()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskOnline copyWith(void Function(KtvRoomTaskOnline) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskOnline))
          as KtvRoomTaskOnline; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskOnline create() => KtvRoomTaskOnline._();
  KtvRoomTaskOnline createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskOnline> createRepeated() =>
      $pb.PbList<KtvRoomTaskOnline>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskOnline getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskOnline>(create);
  static KtvRoomTaskOnline? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get min => $_getIZ(0);
  @$pb.TagNumber(1)
  set min($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMin() => $_has(0);
  @$pb.TagNumber(1)
  void clearMin() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get max => $_getIZ(1);
  @$pb.TagNumber(2)
  set max($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMax() => $_has(1);
  @$pb.TagNumber(2)
  void clearMax() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cur => $_getIZ(2);
  @$pb.TagNumber(3)
  set cur($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCur() => $_has(2);
  @$pb.TagNumber(3)
  void clearCur() => clearField(3);
}

class KtvRoomTaskConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<KtvRoomTaskLevelInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        subBuilder: KtvRoomTaskLevelInfo.create)
    ..aOM<KtvRoomTaskInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign',
        subBuilder: KtvRoomTaskInfo.create)
    ..aOM<KtvRoomTaskInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftSend',
        protoName: 'giftSend',
        subBuilder: KtvRoomTaskInfo.create)
    ..aOM<KtvRoomTaskInfo>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        subBuilder: KtvRoomTaskInfo.create)
    ..aOM<KtvRoomTaskInfo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sing',
        subBuilder: KtvRoomTaskInfo.create)
    ..aOM<KtvRoomTaskInfo>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'screen',
        subBuilder: KtvRoomTaskInfo.create)
    ..hasRequiredFields = false;

  KtvRoomTaskConfig._() : super();
  factory KtvRoomTaskConfig({
    KtvRoomTaskLevelInfo? level,
    KtvRoomTaskInfo? sign,
    KtvRoomTaskInfo? giftSend,
    KtvRoomTaskInfo? online,
    KtvRoomTaskInfo? sing,
    KtvRoomTaskInfo? screen,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (giftSend != null) {
      _result.giftSend = giftSend;
    }
    if (online != null) {
      _result.online = online;
    }
    if (sing != null) {
      _result.sing = sing;
    }
    if (screen != null) {
      _result.screen = screen;
    }
    return _result;
  }
  factory KtvRoomTaskConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskConfig clone() => KtvRoomTaskConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskConfig copyWith(void Function(KtvRoomTaskConfig) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskConfig))
          as KtvRoomTaskConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskConfig create() => KtvRoomTaskConfig._();
  KtvRoomTaskConfig createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskConfig> createRepeated() =>
      $pb.PbList<KtvRoomTaskConfig>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskConfig>(create);
  static KtvRoomTaskConfig? _defaultInstance;

  @$pb.TagNumber(1)
  KtvRoomTaskLevelInfo get level => $_getN(0);
  @$pb.TagNumber(1)
  set level(KtvRoomTaskLevelInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);
  @$pb.TagNumber(1)
  KtvRoomTaskLevelInfo ensureLevel() => $_ensure(0);

  @$pb.TagNumber(2)
  KtvRoomTaskInfo get sign => $_getN(1);
  @$pb.TagNumber(2)
  set sign(KtvRoomTaskInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSign() => $_has(1);
  @$pb.TagNumber(2)
  void clearSign() => clearField(2);
  @$pb.TagNumber(2)
  KtvRoomTaskInfo ensureSign() => $_ensure(1);

  @$pb.TagNumber(3)
  KtvRoomTaskInfo get giftSend => $_getN(2);
  @$pb.TagNumber(3)
  set giftSend(KtvRoomTaskInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftSend() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftSend() => clearField(3);
  @$pb.TagNumber(3)
  KtvRoomTaskInfo ensureGiftSend() => $_ensure(2);

  @$pb.TagNumber(4)
  KtvRoomTaskInfo get online => $_getN(3);
  @$pb.TagNumber(4)
  set online(KtvRoomTaskInfo v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOnline() => $_has(3);
  @$pb.TagNumber(4)
  void clearOnline() => clearField(4);
  @$pb.TagNumber(4)
  KtvRoomTaskInfo ensureOnline() => $_ensure(3);

  @$pb.TagNumber(5)
  KtvRoomTaskInfo get sing => $_getN(4);
  @$pb.TagNumber(5)
  set sing(KtvRoomTaskInfo v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSing() => $_has(4);
  @$pb.TagNumber(5)
  void clearSing() => clearField(5);
  @$pb.TagNumber(5)
  KtvRoomTaskInfo ensureSing() => $_ensure(4);

  @$pb.TagNumber(6)
  KtvRoomTaskInfo get screen => $_getN(5);
  @$pb.TagNumber(6)
  set screen(KtvRoomTaskInfo v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasScreen() => $_has(5);
  @$pb.TagNumber(6)
  void clearScreen() => clearField(6);
  @$pb.TagNumber(6)
  KtvRoomTaskInfo ensureScreen() => $_ensure(5);
}

class ApiKtvRoomTaskConfigResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiKtvRoomTaskConfigResponse',
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
            : 'message')
    ..aOM<KtvRoomTaskConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: KtvRoomTaskConfig.create)
    ..hasRequiredFields = false;

  ApiKtvRoomTaskConfigResponse._() : super();
  factory ApiKtvRoomTaskConfigResponse({
    $core.bool? success,
    $core.String? message,
    KtvRoomTaskConfig? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiKtvRoomTaskConfigResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiKtvRoomTaskConfigResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiKtvRoomTaskConfigResponse clone() =>
      ApiKtvRoomTaskConfigResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiKtvRoomTaskConfigResponse copyWith(
          void Function(ApiKtvRoomTaskConfigResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiKtvRoomTaskConfigResponse))
          as ApiKtvRoomTaskConfigResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiKtvRoomTaskConfigResponse create() =>
      ApiKtvRoomTaskConfigResponse._();
  ApiKtvRoomTaskConfigResponse createEmptyInstance() => create();
  static $pb.PbList<ApiKtvRoomTaskConfigResponse> createRepeated() =>
      $pb.PbList<ApiKtvRoomTaskConfigResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiKtvRoomTaskConfigResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiKtvRoomTaskConfigResponse>(create);
  static ApiKtvRoomTaskConfigResponse? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  KtvRoomTaskConfig get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(KtvRoomTaskConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  KtvRoomTaskConfig ensureData() => $_ensure(2);
}

class KtvRoomTaskBenefitItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskBenefitItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..hasRequiredFields = false;

  KtvRoomTaskBenefitItem._() : super();
  factory KtvRoomTaskBenefitItem({
    $core.String? type,
    $core.String? desc,
    $core.int? num,
    $core.String? url,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (num != null) {
      _result.num = num;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory KtvRoomTaskBenefitItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskBenefitItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskBenefitItem clone() =>
      KtvRoomTaskBenefitItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskBenefitItem copyWith(
          void Function(KtvRoomTaskBenefitItem) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskBenefitItem))
          as KtvRoomTaskBenefitItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskBenefitItem create() => KtvRoomTaskBenefitItem._();
  KtvRoomTaskBenefitItem createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskBenefitItem> createRepeated() =>
      $pb.PbList<KtvRoomTaskBenefitItem>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskBenefitItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskBenefitItem>(create);
  static KtvRoomTaskBenefitItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => clearField(4);
}

class KtvRoomTaskLevelBenefit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskLevelBenefit',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<KtvRoomTaskBenefitItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'benefit',
        $pb.PbFieldType.PM,
        subBuilder: KtvRoomTaskBenefitItem.create)
    ..hasRequiredFields = false;

  KtvRoomTaskLevelBenefit._() : super();
  factory KtvRoomTaskLevelBenefit({
    $core.Iterable<KtvRoomTaskBenefitItem>? benefit,
  }) {
    final _result = create();
    if (benefit != null) {
      _result.benefit.addAll(benefit);
    }
    return _result;
  }
  factory KtvRoomTaskLevelBenefit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskLevelBenefit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskLevelBenefit clone() =>
      KtvRoomTaskLevelBenefit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskLevelBenefit copyWith(
          void Function(KtvRoomTaskLevelBenefit) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskLevelBenefit))
          as KtvRoomTaskLevelBenefit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskLevelBenefit create() => KtvRoomTaskLevelBenefit._();
  KtvRoomTaskLevelBenefit createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskLevelBenefit> createRepeated() =>
      $pb.PbList<KtvRoomTaskLevelBenefit>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskLevelBenefit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskLevelBenefit>(create);
  static KtvRoomTaskLevelBenefit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KtvRoomTaskBenefitItem> get benefit => $_getList(0);
}

class KtvRoomTaskBenefitInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvRoomTaskBenefitInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..m<$core.int, KtvRoomTaskLevelBenefit>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'benefits',
        entryClassName: 'KtvRoomTaskBenefitInfo.BenefitsEntry',
        keyFieldType: $pb.PbFieldType.OU3,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: KtvRoomTaskLevelBenefit.create,
        packageName: const $pb.PackageName('pb'))
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskStatus',
        $pb.PbFieldType.OU3,
        protoName: 'taskStatus')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receivedStatus',
        $pb.PbFieldType.OU3,
        protoName: 'receivedStatus')
    ..aOM<KtvRoomTaskLevelInfo>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        subBuilder: KtvRoomTaskLevelInfo.create)
    ..hasRequiredFields = false;

  KtvRoomTaskBenefitInfo._() : super();
  factory KtvRoomTaskBenefitInfo({
    $core.Map<$core.int, KtvRoomTaskLevelBenefit>? benefits,
    $core.int? taskStatus,
    $core.int? receivedStatus,
    KtvRoomTaskLevelInfo? level,
  }) {
    final _result = create();
    if (benefits != null) {
      _result.benefits.addAll(benefits);
    }
    if (taskStatus != null) {
      _result.taskStatus = taskStatus;
    }
    if (receivedStatus != null) {
      _result.receivedStatus = receivedStatus;
    }
    if (level != null) {
      _result.level = level;
    }
    return _result;
  }
  factory KtvRoomTaskBenefitInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvRoomTaskBenefitInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvRoomTaskBenefitInfo clone() =>
      KtvRoomTaskBenefitInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvRoomTaskBenefitInfo copyWith(
          void Function(KtvRoomTaskBenefitInfo) updates) =>
      super.copyWith((message) => updates(message as KtvRoomTaskBenefitInfo))
          as KtvRoomTaskBenefitInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskBenefitInfo create() => KtvRoomTaskBenefitInfo._();
  KtvRoomTaskBenefitInfo createEmptyInstance() => create();
  static $pb.PbList<KtvRoomTaskBenefitInfo> createRepeated() =>
      $pb.PbList<KtvRoomTaskBenefitInfo>();
  @$core.pragma('dart2js:noInline')
  static KtvRoomTaskBenefitInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvRoomTaskBenefitInfo>(create);
  static KtvRoomTaskBenefitInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, KtvRoomTaskLevelBenefit> get benefits => $_getMap(0);

  @$pb.TagNumber(2)
  $core.int get taskStatus => $_getIZ(1);
  @$pb.TagNumber(2)
  set taskStatus($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTaskStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get receivedStatus => $_getIZ(2);
  @$pb.TagNumber(3)
  set receivedStatus($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReceivedStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceivedStatus() => clearField(3);

  @$pb.TagNumber(4)
  KtvRoomTaskLevelInfo get level => $_getN(3);
  @$pb.TagNumber(4)
  set level(KtvRoomTaskLevelInfo v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);
  @$pb.TagNumber(4)
  KtvRoomTaskLevelInfo ensureLevel() => $_ensure(3);
}

class ApiKtvRoomBenefitResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiKtvRoomBenefitResponse',
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
            : 'message')
    ..aOM<KtvRoomTaskBenefitInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: KtvRoomTaskBenefitInfo.create)
    ..hasRequiredFields = false;

  ApiKtvRoomBenefitResponse._() : super();
  factory ApiKtvRoomBenefitResponse({
    $core.bool? success,
    $core.String? message,
    KtvRoomTaskBenefitInfo? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiKtvRoomBenefitResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiKtvRoomBenefitResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiKtvRoomBenefitResponse clone() =>
      ApiKtvRoomBenefitResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiKtvRoomBenefitResponse copyWith(
          void Function(ApiKtvRoomBenefitResponse) updates) =>
      super.copyWith((message) => updates(message as ApiKtvRoomBenefitResponse))
          as ApiKtvRoomBenefitResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiKtvRoomBenefitResponse create() => ApiKtvRoomBenefitResponse._();
  ApiKtvRoomBenefitResponse createEmptyInstance() => create();
  static $pb.PbList<ApiKtvRoomBenefitResponse> createRepeated() =>
      $pb.PbList<ApiKtvRoomBenefitResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiKtvRoomBenefitResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiKtvRoomBenefitResponse>(create);
  static ApiKtvRoomBenefitResponse? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  KtvRoomTaskBenefitInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(KtvRoomTaskBenefitInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  KtvRoomTaskBenefitInfo ensureData() => $_ensure(2);
}
