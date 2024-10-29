///
//  Generated code. Do not modify.
//  source: pk_super_match.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ApiPkPendantInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiPkPendantInfoResponse',
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
    ..aOM<PkPendantInfoData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PkPendantInfoData.create)
    ..hasRequiredFields = false;

  ApiPkPendantInfoResponse._() : super();
  factory ApiPkPendantInfoResponse({
    $core.bool? success,
    $core.String? message,
    PkPendantInfoData? data,
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
  factory ApiPkPendantInfoResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiPkPendantInfoResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiPkPendantInfoResponse clone() =>
      ApiPkPendantInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiPkPendantInfoResponse copyWith(
          void Function(ApiPkPendantInfoResponse) updates) =>
      super.copyWith((message) => updates(message as ApiPkPendantInfoResponse))
          as ApiPkPendantInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiPkPendantInfoResponse create() => ApiPkPendantInfoResponse._();
  ApiPkPendantInfoResponse createEmptyInstance() => create();
  static $pb.PbList<ApiPkPendantInfoResponse> createRepeated() =>
      $pb.PbList<ApiPkPendantInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiPkPendantInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiPkPendantInfoResponse>(create);
  static ApiPkPendantInfoResponse? _defaultInstance;

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
  PkPendantInfoData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PkPendantInfoData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PkPendantInfoData ensureData() => $_ensure(2);
}

class PkCycleInfoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkCycleInfoData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid1',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid2',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid1Score')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid2Score')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isHunter',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'schemaUrl')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PkCycleInfoData._() : super();
  factory PkCycleInfoData({
    $core.int? rid1,
    $core.int? rid2,
    $core.String? rid1Score,
    $core.String? rid2Score,
    $core.int? leftTime,
    $core.int? isHunter,
    $core.String? schemaUrl,
    $core.int? endTime,
  }) {
    final _result = create();
    if (rid1 != null) {
      _result.rid1 = rid1;
    }
    if (rid2 != null) {
      _result.rid2 = rid2;
    }
    if (rid1Score != null) {
      _result.rid1Score = rid1Score;
    }
    if (rid2Score != null) {
      _result.rid2Score = rid2Score;
    }
    if (leftTime != null) {
      _result.leftTime = leftTime;
    }
    if (isHunter != null) {
      _result.isHunter = isHunter;
    }
    if (schemaUrl != null) {
      _result.schemaUrl = schemaUrl;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    return _result;
  }
  factory PkCycleInfoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkCycleInfoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkCycleInfoData clone() => PkCycleInfoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkCycleInfoData copyWith(void Function(PkCycleInfoData) updates) =>
      super.copyWith((message) => updates(message as PkCycleInfoData))
          as PkCycleInfoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkCycleInfoData create() => PkCycleInfoData._();
  PkCycleInfoData createEmptyInstance() => create();
  static $pb.PbList<PkCycleInfoData> createRepeated() =>
      $pb.PbList<PkCycleInfoData>();
  @$core.pragma('dart2js:noInline')
  static PkCycleInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PkCycleInfoData>(create);
  static PkCycleInfoData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid1($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid1() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid1() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rid2 => $_getIZ(1);
  @$pb.TagNumber(2)
  set rid2($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid2() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid2() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get rid1Score => $_getSZ(2);
  @$pb.TagNumber(3)
  set rid1Score($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid1Score() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid1Score() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rid2Score => $_getSZ(3);
  @$pb.TagNumber(4)
  set rid2Score($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRid2Score() => $_has(3);
  @$pb.TagNumber(4)
  void clearRid2Score() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get leftTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set leftTime($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLeftTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearLeftTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get isHunter => $_getIZ(5);
  @$pb.TagNumber(6)
  set isHunter($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsHunter() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsHunter() => clearField(6);

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

  @$pb.TagNumber(8)
  $core.int get endTime => $_getIZ(7);
  @$pb.TagNumber(8)
  set endTime($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasEndTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndTime() => clearField(8);
}

class PkMessageData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkMessageData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'schemaText')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'schemaUrl')
    ..hasRequiredFields = false;

  PkMessageData._() : super();
  factory PkMessageData({
    $core.String? msg,
    $core.String? schemaText,
    $core.String? schemaUrl,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    if (schemaText != null) {
      _result.schemaText = schemaText;
    }
    if (schemaUrl != null) {
      _result.schemaUrl = schemaUrl;
    }
    return _result;
  }
  factory PkMessageData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkMessageData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkMessageData clone() => PkMessageData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkMessageData copyWith(void Function(PkMessageData) updates) =>
      super.copyWith((message) => updates(message as PkMessageData))
          as PkMessageData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkMessageData create() => PkMessageData._();
  PkMessageData createEmptyInstance() => create();
  static $pb.PbList<PkMessageData> createRepeated() =>
      $pb.PbList<PkMessageData>();
  @$core.pragma('dart2js:noInline')
  static PkMessageData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PkMessageData>(create);
  static PkMessageData? _defaultInstance;

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
  $core.String get schemaText => $_getSZ(1);
  @$pb.TagNumber(2)
  set schemaText($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSchemaText() => $_has(1);
  @$pb.TagNumber(2)
  void clearSchemaText() => clearField(2);

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
}

class PkRankInfoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkRankInfoData',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isHunter',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'schemaUrl')
    ..hasRequiredFields = false;

  PkRankInfoData._() : super();
  factory PkRankInfoData({
    $core.String? title,
    $core.int? rank,
    $core.String? desc,
    $core.String? score,
    $core.int? isHunter,
    $core.String? schemaUrl,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (score != null) {
      _result.score = score;
    }
    if (isHunter != null) {
      _result.isHunter = isHunter;
    }
    if (schemaUrl != null) {
      _result.schemaUrl = schemaUrl;
    }
    return _result;
  }
  factory PkRankInfoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkRankInfoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkRankInfoData clone() => PkRankInfoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkRankInfoData copyWith(void Function(PkRankInfoData) updates) =>
      super.copyWith((message) => updates(message as PkRankInfoData))
          as PkRankInfoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkRankInfoData create() => PkRankInfoData._();
  PkRankInfoData createEmptyInstance() => create();
  static $pb.PbList<PkRankInfoData> createRepeated() =>
      $pb.PbList<PkRankInfoData>();
  @$core.pragma('dart2js:noInline')
  static PkRankInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PkRankInfoData>(create);
  static PkRankInfoData? _defaultInstance;

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
  $core.int get rank => $_getIZ(1);
  @$pb.TagNumber(2)
  set rank($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => clearField(3);

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
  $core.int get isHunter => $_getIZ(4);
  @$pb.TagNumber(5)
  set isHunter($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsHunter() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsHunter() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get schemaUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set schemaUrl($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSchemaUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearSchemaUrl() => clearField(6);
}

class PkPendantInfoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkPendantInfoData',
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
        $pb.PbFieldType.O3)
    ..aOM<PkCycleInfoData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cycleData',
        subBuilder: PkCycleInfoData.create)
    ..aOM<PkMessageData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'messageData',
        subBuilder: PkMessageData.create)
    ..aOM<PkRankInfoData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankData',
        subBuilder: PkRankInfoData.create)
    ..aOM<PkFinalInfoData>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'finalData',
        subBuilder: PkFinalInfoData.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showFinalData',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  PkPendantInfoData._() : super();
  factory PkPendantInfoData({
    $core.int? type,
    PkCycleInfoData? cycleData,
    PkMessageData? messageData,
    PkRankInfoData? rankData,
    PkFinalInfoData? finalData,
    $core.int? showFinalData,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (cycleData != null) {
      _result.cycleData = cycleData;
    }
    if (messageData != null) {
      _result.messageData = messageData;
    }
    if (rankData != null) {
      _result.rankData = rankData;
    }
    if (finalData != null) {
      _result.finalData = finalData;
    }
    if (showFinalData != null) {
      _result.showFinalData = showFinalData;
    }
    return _result;
  }
  factory PkPendantInfoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkPendantInfoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkPendantInfoData clone() => PkPendantInfoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkPendantInfoData copyWith(void Function(PkPendantInfoData) updates) =>
      super.copyWith((message) => updates(message as PkPendantInfoData))
          as PkPendantInfoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkPendantInfoData create() => PkPendantInfoData._();
  PkPendantInfoData createEmptyInstance() => create();
  static $pb.PbList<PkPendantInfoData> createRepeated() =>
      $pb.PbList<PkPendantInfoData>();
  @$core.pragma('dart2js:noInline')
  static PkPendantInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PkPendantInfoData>(create);
  static PkPendantInfoData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  PkCycleInfoData get cycleData => $_getN(1);
  @$pb.TagNumber(2)
  set cycleData(PkCycleInfoData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCycleData() => $_has(1);
  @$pb.TagNumber(2)
  void clearCycleData() => clearField(2);
  @$pb.TagNumber(2)
  PkCycleInfoData ensureCycleData() => $_ensure(1);

  @$pb.TagNumber(3)
  PkMessageData get messageData => $_getN(2);
  @$pb.TagNumber(3)
  set messageData(PkMessageData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessageData() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessageData() => clearField(3);
  @$pb.TagNumber(3)
  PkMessageData ensureMessageData() => $_ensure(2);

  @$pb.TagNumber(4)
  PkRankInfoData get rankData => $_getN(3);
  @$pb.TagNumber(4)
  set rankData(PkRankInfoData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRankData() => $_has(3);
  @$pb.TagNumber(4)
  void clearRankData() => clearField(4);
  @$pb.TagNumber(4)
  PkRankInfoData ensureRankData() => $_ensure(3);

  @$pb.TagNumber(5)
  PkFinalInfoData get finalData => $_getN(4);
  @$pb.TagNumber(5)
  set finalData(PkFinalInfoData v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFinalData() => $_has(4);
  @$pb.TagNumber(5)
  void clearFinalData() => clearField(5);
  @$pb.TagNumber(5)
  PkFinalInfoData ensureFinalData() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get showFinalData => $_getIZ(5);
  @$pb.TagNumber(6)
  set showFinalData($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasShowFinalData() => $_has(5);
  @$pb.TagNumber(6)
  void clearShowFinalData() => clearField(6);
}

class PkResultInfoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkResultInfoData',
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
        $pb.PbFieldType.O3)
    ..aOM<PkCycleResultData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cycleResult',
        subBuilder: PkCycleResultData.create)
    ..aOM<PkFinalResultData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'finalResult',
        subBuilder: PkFinalResultData.create)
    ..hasRequiredFields = false;

  PkResultInfoData._() : super();
  factory PkResultInfoData({
    $core.int? type,
    PkCycleResultData? cycleResult,
    PkFinalResultData? finalResult,
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
  factory PkResultInfoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkResultInfoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkResultInfoData clone() => PkResultInfoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkResultInfoData copyWith(void Function(PkResultInfoData) updates) =>
      super.copyWith((message) => updates(message as PkResultInfoData))
          as PkResultInfoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkResultInfoData create() => PkResultInfoData._();
  PkResultInfoData createEmptyInstance() => create();
  static $pb.PbList<PkResultInfoData> createRepeated() =>
      $pb.PbList<PkResultInfoData>();
  @$core.pragma('dart2js:noInline')
  static PkResultInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PkResultInfoData>(create);
  static PkResultInfoData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  PkCycleResultData get cycleResult => $_getN(1);
  @$pb.TagNumber(2)
  set cycleResult(PkCycleResultData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCycleResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearCycleResult() => clearField(2);
  @$pb.TagNumber(2)
  PkCycleResultData ensureCycleResult() => $_ensure(1);

  @$pb.TagNumber(3)
  PkFinalResultData get finalResult => $_getN(2);
  @$pb.TagNumber(3)
  set finalResult(PkFinalResultData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFinalResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearFinalResult() => clearField(3);
  @$pb.TagNumber(3)
  PkFinalResultData ensureFinalResult() => $_ensure(2);
}

class PkCycleResultData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkCycleResultData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PkResultData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result1',
        subBuilder: PkResultData.create)
    ..aOM<PkResultData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result2',
        subBuilder: PkResultData.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winRid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PkCycleResultData._() : super();
  factory PkCycleResultData({
    PkResultData? result1,
    PkResultData? result2,
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
  factory PkCycleResultData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkCycleResultData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkCycleResultData clone() => PkCycleResultData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkCycleResultData copyWith(void Function(PkCycleResultData) updates) =>
      super.copyWith((message) => updates(message as PkCycleResultData))
          as PkCycleResultData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkCycleResultData create() => PkCycleResultData._();
  PkCycleResultData createEmptyInstance() => create();
  static $pb.PbList<PkCycleResultData> createRepeated() =>
      $pb.PbList<PkCycleResultData>();
  @$core.pragma('dart2js:noInline')
  static PkCycleResultData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PkCycleResultData>(create);
  static PkCycleResultData? _defaultInstance;

  @$pb.TagNumber(1)
  PkResultData get result1 => $_getN(0);
  @$pb.TagNumber(1)
  set result1(PkResultData v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult1() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult1() => clearField(1);
  @$pb.TagNumber(1)
  PkResultData ensureResult1() => $_ensure(0);

  @$pb.TagNumber(2)
  PkResultData get result2 => $_getN(1);
  @$pb.TagNumber(2)
  set result2(PkResultData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResult2() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult2() => clearField(2);
  @$pb.TagNumber(2)
  PkResultData ensureResult2() => $_ensure(1);

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

class PkFinalResultData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkFinalResultData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelName')
    ..pc<PkResultData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'finals',
        $pb.PbFieldType.PM,
        subBuilder: PkResultData.create)
    ..hasRequiredFields = false;

  PkFinalResultData._() : super();
  factory PkFinalResultData({
    $core.String? levelName,
    $core.Iterable<PkResultData>? finals,
  }) {
    final _result = create();
    if (levelName != null) {
      _result.levelName = levelName;
    }
    if (finals != null) {
      _result.finals.addAll(finals);
    }
    return _result;
  }
  factory PkFinalResultData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkFinalResultData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkFinalResultData clone() => PkFinalResultData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkFinalResultData copyWith(void Function(PkFinalResultData) updates) =>
      super.copyWith((message) => updates(message as PkFinalResultData))
          as PkFinalResultData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkFinalResultData create() => PkFinalResultData._();
  PkFinalResultData createEmptyInstance() => create();
  static $pb.PbList<PkFinalResultData> createRepeated() =>
      $pb.PbList<PkFinalResultData>();
  @$core.pragma('dart2js:noInline')
  static PkFinalResultData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PkFinalResultData>(create);
  static PkFinalResultData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get levelName => $_getSZ(0);
  @$pb.TagNumber(1)
  set levelName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevelName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevelName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<PkResultData> get finals => $_getList(1);
}

class PkResultData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkResultData',
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
    ..hasRequiredFields = false;

  PkResultData._() : super();
  factory PkResultData({
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    $core.String? score,
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
  factory PkResultData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkResultData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkResultData clone() => PkResultData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkResultData copyWith(void Function(PkResultData) updates) =>
      super.copyWith((message) => updates(message as PkResultData))
          as PkResultData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkResultData create() => PkResultData._();
  PkResultData createEmptyInstance() => create();
  static $pb.PbList<PkResultData> createRepeated() =>
      $pb.PbList<PkResultData>();
  @$core.pragma('dart2js:noInline')
  static PkResultData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PkResultData>(create);
  static PkResultData? _defaultInstance;

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
}

class PkFinalInfoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkFinalInfoData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime',
        $pb.PbFieldType.OU3)
    ..pc<PendantData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pks',
        $pb.PbFieldType.PM,
        subBuilder: PendantData.create)
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

  PkFinalInfoData._() : super();
  factory PkFinalInfoData({
    $core.int? endTime,
    $core.Iterable<PendantData>? pks,
    $core.String? schemaUrl,
    $core.bool? isHunter,
    $core.String? desc,
  }) {
    final _result = create();
    if (endTime != null) {
      _result.endTime = endTime;
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
  factory PkFinalInfoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkFinalInfoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkFinalInfoData clone() => PkFinalInfoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkFinalInfoData copyWith(void Function(PkFinalInfoData) updates) =>
      super.copyWith((message) => updates(message as PkFinalInfoData))
          as PkFinalInfoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkFinalInfoData create() => PkFinalInfoData._();
  PkFinalInfoData createEmptyInstance() => create();
  static $pb.PbList<PkFinalInfoData> createRepeated() =>
      $pb.PbList<PkFinalInfoData>();
  @$core.pragma('dart2js:noInline')
  static PkFinalInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PkFinalInfoData>(create);
  static PkFinalInfoData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get endTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set endTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEndTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<PendantData> get pks => $_getList(1);

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

class PendantData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PendantData',
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
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scoreMsg')
    ..hasRequiredFields = false;

  PendantData._() : super();
  factory PendantData({
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    $core.int? score,
    $core.String? scoreMsg,
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
    if (scoreMsg != null) {
      _result.scoreMsg = scoreMsg;
    }
    return _result;
  }
  factory PendantData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PendantData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PendantData clone() => PendantData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PendantData copyWith(void Function(PendantData) updates) =>
      super.copyWith((message) => updates(message as PendantData))
          as PendantData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PendantData create() => PendantData._();
  PendantData createEmptyInstance() => create();
  static $pb.PbList<PendantData> createRepeated() => $pb.PbList<PendantData>();
  @$core.pragma('dart2js:noInline')
  static PendantData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PendantData>(create);
  static PendantData? _defaultInstance;

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

  @$pb.TagNumber(5)
  $core.String get scoreMsg => $_getSZ(4);
  @$pb.TagNumber(5)
  set scoreMsg($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScoreMsg() => $_has(4);
  @$pb.TagNumber(5)
  void clearScoreMsg() => clearField(5);
}
