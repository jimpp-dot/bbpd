///
//  Generated code. Do not modify.
//  source: annual_celebration.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BroadcastAnnualPartyPendant extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcastAnnualPartyPendant',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOM<BroadcastAnnualPartyRankPendant>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankData',
        subBuilder: BroadcastAnnualPartyRankPendant.create)
    ..aOM<BroadcastAnnualPartyPkPendant>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkData',
        subBuilder: BroadcastAnnualPartyPkPendant.create)
    ..aOM<BroadcastAnnualPartyMsgPendant>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msgData',
        subBuilder: BroadcastAnnualPartyMsgPendant.create)
    ..hasRequiredFields = false;

  BroadcastAnnualPartyPendant._() : super();
  factory BroadcastAnnualPartyPendant({
    $core.int? type,
    BroadcastAnnualPartyRankPendant? rankData,
    BroadcastAnnualPartyPkPendant? pkData,
    BroadcastAnnualPartyMsgPendant? msgData,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (rankData != null) {
      _result.rankData = rankData;
    }
    if (pkData != null) {
      _result.pkData = pkData;
    }
    if (msgData != null) {
      _result.msgData = msgData;
    }
    return _result;
  }
  factory BroadcastAnnualPartyPendant.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcastAnnualPartyPendant.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyPendant clone() =>
      BroadcastAnnualPartyPendant()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyPendant copyWith(
          void Function(BroadcastAnnualPartyPendant) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastAnnualPartyPendant))
          as BroadcastAnnualPartyPendant; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyPendant create() =>
      BroadcastAnnualPartyPendant._();
  BroadcastAnnualPartyPendant createEmptyInstance() => create();
  static $pb.PbList<BroadcastAnnualPartyPendant> createRepeated() =>
      $pb.PbList<BroadcastAnnualPartyPendant>();
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyPendant getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastAnnualPartyPendant>(create);
  static BroadcastAnnualPartyPendant? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  BroadcastAnnualPartyRankPendant get rankData => $_getN(1);
  @$pb.TagNumber(2)
  set rankData(BroadcastAnnualPartyRankPendant v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRankData() => $_has(1);
  @$pb.TagNumber(2)
  void clearRankData() => clearField(2);
  @$pb.TagNumber(2)
  BroadcastAnnualPartyRankPendant ensureRankData() => $_ensure(1);

  @$pb.TagNumber(3)
  BroadcastAnnualPartyPkPendant get pkData => $_getN(2);
  @$pb.TagNumber(3)
  set pkData(BroadcastAnnualPartyPkPendant v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPkData() => $_has(2);
  @$pb.TagNumber(3)
  void clearPkData() => clearField(3);
  @$pb.TagNumber(3)
  BroadcastAnnualPartyPkPendant ensurePkData() => $_ensure(2);

  @$pb.TagNumber(4)
  BroadcastAnnualPartyMsgPendant get msgData => $_getN(3);
  @$pb.TagNumber(4)
  set msgData(BroadcastAnnualPartyMsgPendant v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMsgData() => $_has(3);
  @$pb.TagNumber(4)
  void clearMsgData() => clearField(4);
  @$pb.TagNumber(4)
  BroadcastAnnualPartyMsgPendant ensureMsgData() => $_ensure(3);
}

class BroadcastAnnualPartyMsgPendant extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcastAnnualPartyMsgPendant',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
            : 'content')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'statusMsg')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'schemaUrl')
    ..hasRequiredFields = false;

  BroadcastAnnualPartyMsgPendant._() : super();
  factory BroadcastAnnualPartyMsgPendant({
    $core.String? title,
    $core.String? content,
    $core.String? statusMsg,
    $core.int? status,
    $core.String? schemaUrl,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (content != null) {
      _result.content = content;
    }
    if (statusMsg != null) {
      _result.statusMsg = statusMsg;
    }
    if (status != null) {
      _result.status = status;
    }
    if (schemaUrl != null) {
      _result.schemaUrl = schemaUrl;
    }
    return _result;
  }
  factory BroadcastAnnualPartyMsgPendant.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcastAnnualPartyMsgPendant.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyMsgPendant clone() =>
      BroadcastAnnualPartyMsgPendant()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyMsgPendant copyWith(
          void Function(BroadcastAnnualPartyMsgPendant) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastAnnualPartyMsgPendant))
          as BroadcastAnnualPartyMsgPendant; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyMsgPendant create() =>
      BroadcastAnnualPartyMsgPendant._();
  BroadcastAnnualPartyMsgPendant createEmptyInstance() => create();
  static $pb.PbList<BroadcastAnnualPartyMsgPendant> createRepeated() =>
      $pb.PbList<BroadcastAnnualPartyMsgPendant>();
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyMsgPendant getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastAnnualPartyMsgPendant>(create);
  static BroadcastAnnualPartyMsgPendant? _defaultInstance;

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
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get statusMsg => $_getSZ(2);
  @$pb.TagNumber(3)
  set statusMsg($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStatusMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatusMsg() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get status => $_getIZ(3);
  @$pb.TagNumber(4)
  set status($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get schemaUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set schemaUrl($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSchemaUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearSchemaUrl() => clearField(5);
}

class BroadcastAnnualPartyResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcastAnnualPartyResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOM<BroadcastAnnualPartyCycleResult>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cycleResult',
        subBuilder: BroadcastAnnualPartyCycleResult.create)
    ..aOM<BroadcastAnnualPartyFinalResult>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'finalResult',
        subBuilder: BroadcastAnnualPartyFinalResult.create)
    ..hasRequiredFields = false;

  BroadcastAnnualPartyResult._() : super();
  factory BroadcastAnnualPartyResult({
    $core.int? type,
    BroadcastAnnualPartyCycleResult? cycleResult,
    BroadcastAnnualPartyFinalResult? finalResult,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (cycleResult != null) {
      _result.cycleResult = cycleResult;
    }
    if (finalResult != null) {
      _result.finalResult = finalResult;
    }
    return _result;
  }
  factory BroadcastAnnualPartyResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcastAnnualPartyResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyResult clone() =>
      BroadcastAnnualPartyResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyResult copyWith(
          void Function(BroadcastAnnualPartyResult) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastAnnualPartyResult))
          as BroadcastAnnualPartyResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyResult create() => BroadcastAnnualPartyResult._();
  BroadcastAnnualPartyResult createEmptyInstance() => create();
  static $pb.PbList<BroadcastAnnualPartyResult> createRepeated() =>
      $pb.PbList<BroadcastAnnualPartyResult>();
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastAnnualPartyResult>(create);
  static BroadcastAnnualPartyResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  BroadcastAnnualPartyCycleResult get cycleResult => $_getN(1);
  @$pb.TagNumber(2)
  set cycleResult(BroadcastAnnualPartyCycleResult v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCycleResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearCycleResult() => clearField(2);
  @$pb.TagNumber(2)
  BroadcastAnnualPartyCycleResult ensureCycleResult() => $_ensure(1);

  @$pb.TagNumber(3)
  BroadcastAnnualPartyFinalResult get finalResult => $_getN(2);
  @$pb.TagNumber(3)
  set finalResult(BroadcastAnnualPartyFinalResult v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFinalResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearFinalResult() => clearField(3);
  @$pb.TagNumber(3)
  BroadcastAnnualPartyFinalResult ensureFinalResult() => $_ensure(2);
}

class BroadcastAnnualPartyCycleResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcastAnnualPartyCycleResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ApResultData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result1',
        subBuilder: ApResultData.create)
    ..aOM<ApResultData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result2',
        subBuilder: ApResultData.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winRid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BroadcastAnnualPartyCycleResult._() : super();
  factory BroadcastAnnualPartyCycleResult({
    ApResultData? result1,
    ApResultData? result2,
    $core.int? winRid,
  }) {
    final _result = create();
    if (result1 != null) {
      _result.result1 = result1;
    }
    if (result2 != null) {
      _result.result2 = result2;
    }
    if (winRid != null) {
      _result.winRid = winRid;
    }
    return _result;
  }
  factory BroadcastAnnualPartyCycleResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcastAnnualPartyCycleResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyCycleResult clone() =>
      BroadcastAnnualPartyCycleResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyCycleResult copyWith(
          void Function(BroadcastAnnualPartyCycleResult) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastAnnualPartyCycleResult))
          as BroadcastAnnualPartyCycleResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyCycleResult create() =>
      BroadcastAnnualPartyCycleResult._();
  BroadcastAnnualPartyCycleResult createEmptyInstance() => create();
  static $pb.PbList<BroadcastAnnualPartyCycleResult> createRepeated() =>
      $pb.PbList<BroadcastAnnualPartyCycleResult>();
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyCycleResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastAnnualPartyCycleResult>(
          create);
  static BroadcastAnnualPartyCycleResult? _defaultInstance;

  @$pb.TagNumber(1)
  ApResultData get result1 => $_getN(0);
  @$pb.TagNumber(1)
  set result1(ApResultData v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult1() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult1() => clearField(1);
  @$pb.TagNumber(1)
  ApResultData ensureResult1() => $_ensure(0);

  @$pb.TagNumber(2)
  ApResultData get result2 => $_getN(1);
  @$pb.TagNumber(2)
  set result2(ApResultData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResult2() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult2() => clearField(2);
  @$pb.TagNumber(2)
  ApResultData ensureResult2() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get winRid => $_getIZ(2);
  @$pb.TagNumber(3)
  set winRid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWinRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearWinRid() => clearField(3);
}

class BroadcastAnnualPartyFinalResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcastAnnualPartyFinalResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ApResultData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'finals',
        $pb.PbFieldType.PM,
        subBuilder: ApResultData.create)
    ..hasRequiredFields = false;

  BroadcastAnnualPartyFinalResult._() : super();
  factory BroadcastAnnualPartyFinalResult({
    $core.Iterable<ApResultData>? finals,
  }) {
    final _result = create();
    if (finals != null) {
      _result.finals.addAll(finals);
    }
    return _result;
  }
  factory BroadcastAnnualPartyFinalResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcastAnnualPartyFinalResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyFinalResult clone() =>
      BroadcastAnnualPartyFinalResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyFinalResult copyWith(
          void Function(BroadcastAnnualPartyFinalResult) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastAnnualPartyFinalResult))
          as BroadcastAnnualPartyFinalResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyFinalResult create() =>
      BroadcastAnnualPartyFinalResult._();
  BroadcastAnnualPartyFinalResult createEmptyInstance() => create();
  static $pb.PbList<BroadcastAnnualPartyFinalResult> createRepeated() =>
      $pb.PbList<BroadcastAnnualPartyFinalResult>();
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyFinalResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastAnnualPartyFinalResult>(
          create);
  static BroadcastAnnualPartyFinalResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ApResultData> get finals => $_getList(0);
}

class ApResultData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApResultData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
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
            : 'score')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ApResultData._() : super();
  factory ApResultData({
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    $core.String? score,
    $core.int? value,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
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
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ApResultData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApResultData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApResultData clone() => ApResultData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApResultData copyWith(void Function(ApResultData) updates) =>
      super.copyWith((message) => updates(message as ApResultData))
          as ApResultData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApResultData create() => ApResultData._();
  ApResultData createEmptyInstance() => create();
  static $pb.PbList<ApResultData> createRepeated() =>
      $pb.PbList<ApResultData>();
  @$core.pragma('dart2js:noInline')
  static ApResultData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApResultData>(create);
  static ApResultData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

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
  $core.String get score => $_getSZ(3);
  @$pb.TagNumber(4)
  set score($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get value => $_getIZ(4);
  @$pb.TagNumber(5)
  set value($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearValue() => clearField(5);
}

class BroadcastAnnualPartyRankPendant extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcastAnnualPartyRankPendant',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
            : 'rank')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'statusMsg')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'schemaUrl')
    ..hasRequiredFields = false;

  BroadcastAnnualPartyRankPendant._() : super();
  factory BroadcastAnnualPartyRankPendant({
    $core.String? title,
    $core.String? rank,
    $core.String? score,
    $core.String? desc,
    $core.int? status,
    $core.String? statusMsg,
    $core.String? schemaUrl,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (status != null) {
      _result.status = status;
    }
    if (statusMsg != null) {
      _result.statusMsg = statusMsg;
    }
    if (schemaUrl != null) {
      _result.schemaUrl = schemaUrl;
    }
    return _result;
  }
  factory BroadcastAnnualPartyRankPendant.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcastAnnualPartyRankPendant.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyRankPendant clone() =>
      BroadcastAnnualPartyRankPendant()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyRankPendant copyWith(
          void Function(BroadcastAnnualPartyRankPendant) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastAnnualPartyRankPendant))
          as BroadcastAnnualPartyRankPendant; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyRankPendant create() =>
      BroadcastAnnualPartyRankPendant._();
  BroadcastAnnualPartyRankPendant createEmptyInstance() => create();
  static $pb.PbList<BroadcastAnnualPartyRankPendant> createRepeated() =>
      $pb.PbList<BroadcastAnnualPartyRankPendant>();
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyRankPendant getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastAnnualPartyRankPendant>(
          create);
  static BroadcastAnnualPartyRankPendant? _defaultInstance;

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
  $core.String get rank => $_getSZ(1);
  @$pb.TagNumber(2)
  set rank($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get score => $_getSZ(2);
  @$pb.TagNumber(3)
  set score($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);

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
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get statusMsg => $_getSZ(5);
  @$pb.TagNumber(6)
  set statusMsg($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStatusMsg() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatusMsg() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get schemaUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set schemaUrl($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSchemaUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearSchemaUrl() => clearField(7);
}

class BroadcastAnnualPartyPkPendant extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcastAnnualPartyPkPendant',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left',
        $pb.PbFieldType.OU3)
    ..pc<ApPendantData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pks',
        $pb.PbFieldType.PM,
        subBuilder: ApPendantData.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'schemaUrl')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isHunter')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  BroadcastAnnualPartyPkPendant._() : super();
  factory BroadcastAnnualPartyPkPendant({
    $core.int? left,
    $core.Iterable<ApPendantData>? pks,
    $core.String? schemaUrl,
    $core.bool? isHunter,
    $core.String? desc,
  }) {
    final _result = create();
    if (left != null) {
      _result.left = left;
    }
    if (pks != null) {
      _result.pks.addAll(pks);
    }
    if (schemaUrl != null) {
      _result.schemaUrl = schemaUrl;
    }
    if (isHunter != null) {
      _result.isHunter = isHunter;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory BroadcastAnnualPartyPkPendant.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcastAnnualPartyPkPendant.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyPkPendant clone() =>
      BroadcastAnnualPartyPkPendant()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyPkPendant copyWith(
          void Function(BroadcastAnnualPartyPkPendant) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastAnnualPartyPkPendant))
          as BroadcastAnnualPartyPkPendant; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyPkPendant create() =>
      BroadcastAnnualPartyPkPendant._();
  BroadcastAnnualPartyPkPendant createEmptyInstance() => create();
  static $pb.PbList<BroadcastAnnualPartyPkPendant> createRepeated() =>
      $pb.PbList<BroadcastAnnualPartyPkPendant>();
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyPkPendant getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastAnnualPartyPkPendant>(create);
  static BroadcastAnnualPartyPkPendant? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get left => $_getIZ(0);
  @$pb.TagNumber(1)
  set left($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeft() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeft() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ApPendantData> get pks => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get schemaUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set schemaUrl($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSchemaUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearSchemaUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isHunter => $_getBF(3);
  @$pb.TagNumber(4)
  set isHunter($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsHunter() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsHunter() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get desc => $_getSZ(4);
  @$pb.TagNumber(5)
  set desc($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearDesc() => clearField(5);
}

class ApPendantData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApPendantData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
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

  ApPendantData._() : super();
  factory ApPendantData({
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    $core.int? score,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
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
  factory ApPendantData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApPendantData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApPendantData clone() => ApPendantData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApPendantData copyWith(void Function(ApPendantData) updates) =>
      super.copyWith((message) => updates(message as ApPendantData))
          as ApPendantData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApPendantData create() => ApPendantData._();
  ApPendantData createEmptyInstance() => create();
  static $pb.PbList<ApPendantData> createRepeated() =>
      $pb.PbList<ApPendantData>();
  @$core.pragma('dart2js:noInline')
  static ApPendantData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApPendantData>(create);
  static ApPendantData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

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

class ApiAnnualPartyPendantInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiAnnualPartyPendantInfoResponse',
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
    ..aOM<BroadcastAnnualPartyPendant>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pendantInfo',
        subBuilder: BroadcastAnnualPartyPendant.create)
    ..hasRequiredFields = false;

  ApiAnnualPartyPendantInfoResponse._() : super();
  factory ApiAnnualPartyPendantInfoResponse({
    $core.bool? success,
    $core.String? message,
    BroadcastAnnualPartyPendant? pendantInfo,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (pendantInfo != null) {
      _result.pendantInfo = pendantInfo;
    }
    return _result;
  }
  factory ApiAnnualPartyPendantInfoResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiAnnualPartyPendantInfoResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiAnnualPartyPendantInfoResponse clone() =>
      ApiAnnualPartyPendantInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiAnnualPartyPendantInfoResponse copyWith(
          void Function(ApiAnnualPartyPendantInfoResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ApiAnnualPartyPendantInfoResponse))
          as ApiAnnualPartyPendantInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiAnnualPartyPendantInfoResponse create() =>
      ApiAnnualPartyPendantInfoResponse._();
  ApiAnnualPartyPendantInfoResponse createEmptyInstance() => create();
  static $pb.PbList<ApiAnnualPartyPendantInfoResponse> createRepeated() =>
      $pb.PbList<ApiAnnualPartyPendantInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiAnnualPartyPendantInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiAnnualPartyPendantInfoResponse>(
          create);
  static ApiAnnualPartyPendantInfoResponse? _defaultInstance;

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
  BroadcastAnnualPartyPendant get pendantInfo => $_getN(2);
  @$pb.TagNumber(3)
  set pendantInfo(BroadcastAnnualPartyPendant v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPendantInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearPendantInfo() => clearField(3);
  @$pb.TagNumber(3)
  BroadcastAnnualPartyPendant ensurePendantInfo() => $_ensure(2);
}
