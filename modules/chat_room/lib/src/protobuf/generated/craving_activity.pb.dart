///
//  Generated code. Do not modify.
//  source: craving_activity.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ApiCravingProgressResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiCravingProgressResponse',
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
    ..aOM<CravingProgress>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CravingProgress.create)
    ..hasRequiredFields = false;

  ApiCravingProgressResponse._() : super();
  factory ApiCravingProgressResponse({
    $core.bool? success,
    $core.String? message,
    CravingProgress? data,
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
  factory ApiCravingProgressResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiCravingProgressResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiCravingProgressResponse clone() =>
      ApiCravingProgressResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiCravingProgressResponse copyWith(
          void Function(ApiCravingProgressResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiCravingProgressResponse))
          as ApiCravingProgressResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiCravingProgressResponse create() => ApiCravingProgressResponse._();
  ApiCravingProgressResponse createEmptyInstance() => create();
  static $pb.PbList<ApiCravingProgressResponse> createRepeated() =>
      $pb.PbList<ApiCravingProgressResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiCravingProgressResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiCravingProgressResponse>(create);
  static ApiCravingProgressResponse? _defaultInstance;

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
  CravingProgress get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CravingProgress v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CravingProgress ensureData() => $_ensure(2);
}

class CravingProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CravingProgress',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<CravingProgressData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'processData',
        subBuilder: CravingProgressData.create)
    ..aOM<CravingResource>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'resource',
        subBuilder: CravingResource.create)
    ..hasRequiredFields = false;

  CravingProgress._() : super();
  factory CravingProgress({
    CravingProgressData? processData,
    CravingResource? resource,
  }) {
    final _result = create();
    if (processData != null) {
      _result.processData = processData;
    }
    if (resource != null) {
      _result.resource = resource;
    }
    return _result;
  }
  factory CravingProgress.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CravingProgress.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CravingProgress clone() => CravingProgress()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CravingProgress copyWith(void Function(CravingProgress) updates) =>
      super.copyWith((message) => updates(message as CravingProgress))
          as CravingProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CravingProgress create() => CravingProgress._();
  CravingProgress createEmptyInstance() => create();
  static $pb.PbList<CravingProgress> createRepeated() =>
      $pb.PbList<CravingProgress>();
  @$core.pragma('dart2js:noInline')
  static CravingProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CravingProgress>(create);
  static CravingProgress? _defaultInstance;

  @$pb.TagNumber(1)
  CravingProgressData get processData => $_getN(0);
  @$pb.TagNumber(1)
  set processData(CravingProgressData v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProcessData() => $_has(0);
  @$pb.TagNumber(1)
  void clearProcessData() => clearField(1);
  @$pb.TagNumber(1)
  CravingProgressData ensureProcessData() => $_ensure(0);

  @$pb.TagNumber(2)
  CravingResource get resource => $_getN(1);
  @$pb.TagNumber(2)
  set resource(CravingResource v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearResource() => clearField(2);
  @$pb.TagNumber(2)
  CravingResource ensureResource() => $_ensure(1);
}

class CravingResource extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CravingResource',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'entranceBg')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icExpandBar')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icTimer')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icBlood')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icAttack')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpUrl')
    ..hasRequiredFields = false;

  CravingResource._() : super();
  factory CravingResource({
    $core.String? entranceBg,
    $core.String? icExpandBar,
    $core.String? icTimer,
    $core.String? icBlood,
    $core.String? icAttack,
    $core.String? jumpUrl,
  }) {
    final _result = create();
    if (entranceBg != null) {
      _result.entranceBg = entranceBg;
    }
    if (icExpandBar != null) {
      _result.icExpandBar = icExpandBar;
    }
    if (icTimer != null) {
      _result.icTimer = icTimer;
    }
    if (icBlood != null) {
      _result.icBlood = icBlood;
    }
    if (icAttack != null) {
      _result.icAttack = icAttack;
    }
    if (jumpUrl != null) {
      _result.jumpUrl = jumpUrl;
    }
    return _result;
  }
  factory CravingResource.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CravingResource.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CravingResource clone() => CravingResource()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CravingResource copyWith(void Function(CravingResource) updates) =>
      super.copyWith((message) => updates(message as CravingResource))
          as CravingResource; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CravingResource create() => CravingResource._();
  CravingResource createEmptyInstance() => create();
  static $pb.PbList<CravingResource> createRepeated() =>
      $pb.PbList<CravingResource>();
  @$core.pragma('dart2js:noInline')
  static CravingResource getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CravingResource>(create);
  static CravingResource? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get entranceBg => $_getSZ(0);
  @$pb.TagNumber(1)
  set entranceBg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEntranceBg() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntranceBg() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icExpandBar => $_getSZ(1);
  @$pb.TagNumber(2)
  set icExpandBar($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIcExpandBar() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcExpandBar() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icTimer => $_getSZ(2);
  @$pb.TagNumber(3)
  set icTimer($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcTimer() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcTimer() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icBlood => $_getSZ(3);
  @$pb.TagNumber(4)
  set icBlood($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcBlood() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcBlood() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icAttack => $_getSZ(4);
  @$pb.TagNumber(5)
  set icAttack($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcAttack() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcAttack() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get jumpUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set jumpUrl($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasJumpUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearJumpUrl() => clearField(6);
}

class CravingProgressData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CravingProgressData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'monsterId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'monsterLevel',
        $pb.PbFieldType.OU3)
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'monsterMaxHp')
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'monsterCurrentHp')
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'monsterStartAt')
    ..aInt64(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'monsterEndAt')
    ..aInt64(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'monsterCurrentState')
    ..aInt64(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activityStartAt')
    ..aInt64(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activityEndAt')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'monsterUrl')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prevLevelMonsterDead',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CravingProgressData._() : super();
  factory CravingProgressData({
    $core.int? monsterId,
    $core.int? monsterLevel,
    $fixnum.Int64? monsterMaxHp,
    $fixnum.Int64? monsterCurrentHp,
    $fixnum.Int64? monsterStartAt,
    $fixnum.Int64? monsterEndAt,
    $fixnum.Int64? monsterCurrentState,
    $fixnum.Int64? activityStartAt,
    $fixnum.Int64? activityEndAt,
    $core.String? monsterUrl,
    $core.int? prevLevelMonsterDead,
  }) {
    final _result = create();
    if (monsterId != null) {
      _result.monsterId = monsterId;
    }
    if (monsterLevel != null) {
      _result.monsterLevel = monsterLevel;
    }
    if (monsterMaxHp != null) {
      _result.monsterMaxHp = monsterMaxHp;
    }
    if (monsterCurrentHp != null) {
      _result.monsterCurrentHp = monsterCurrentHp;
    }
    if (monsterStartAt != null) {
      _result.monsterStartAt = monsterStartAt;
    }
    if (monsterEndAt != null) {
      _result.monsterEndAt = monsterEndAt;
    }
    if (monsterCurrentState != null) {
      _result.monsterCurrentState = monsterCurrentState;
    }
    if (activityStartAt != null) {
      _result.activityStartAt = activityStartAt;
    }
    if (activityEndAt != null) {
      _result.activityEndAt = activityEndAt;
    }
    if (monsterUrl != null) {
      _result.monsterUrl = monsterUrl;
    }
    if (prevLevelMonsterDead != null) {
      _result.prevLevelMonsterDead = prevLevelMonsterDead;
    }
    return _result;
  }
  factory CravingProgressData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CravingProgressData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CravingProgressData clone() => CravingProgressData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CravingProgressData copyWith(void Function(CravingProgressData) updates) =>
      super.copyWith((message) => updates(message as CravingProgressData))
          as CravingProgressData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CravingProgressData create() => CravingProgressData._();
  CravingProgressData createEmptyInstance() => create();
  static $pb.PbList<CravingProgressData> createRepeated() =>
      $pb.PbList<CravingProgressData>();
  @$core.pragma('dart2js:noInline')
  static CravingProgressData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CravingProgressData>(create);
  static CravingProgressData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get monsterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set monsterId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMonsterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMonsterId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get monsterLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set monsterLevel($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMonsterLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonsterLevel() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get monsterMaxHp => $_getI64(2);
  @$pb.TagNumber(3)
  set monsterMaxHp($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMonsterMaxHp() => $_has(2);
  @$pb.TagNumber(3)
  void clearMonsterMaxHp() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get monsterCurrentHp => $_getI64(3);
  @$pb.TagNumber(4)
  set monsterCurrentHp($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMonsterCurrentHp() => $_has(3);
  @$pb.TagNumber(4)
  void clearMonsterCurrentHp() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get monsterStartAt => $_getI64(4);
  @$pb.TagNumber(5)
  set monsterStartAt($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMonsterStartAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearMonsterStartAt() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get monsterEndAt => $_getI64(5);
  @$pb.TagNumber(6)
  set monsterEndAt($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMonsterEndAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearMonsterEndAt() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get monsterCurrentState => $_getI64(6);
  @$pb.TagNumber(7)
  set monsterCurrentState($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMonsterCurrentState() => $_has(6);
  @$pb.TagNumber(7)
  void clearMonsterCurrentState() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get activityStartAt => $_getI64(7);
  @$pb.TagNumber(8)
  set activityStartAt($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasActivityStartAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearActivityStartAt() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get activityEndAt => $_getI64(8);
  @$pb.TagNumber(9)
  set activityEndAt($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasActivityEndAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearActivityEndAt() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get monsterUrl => $_getSZ(9);
  @$pb.TagNumber(10)
  set monsterUrl($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMonsterUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearMonsterUrl() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get prevLevelMonsterDead => $_getIZ(10);
  @$pb.TagNumber(11)
  set prevLevelMonsterDead($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPrevLevelMonsterDead() => $_has(10);
  @$pb.TagNumber(11)
  void clearPrevLevelMonsterDead() => clearField(11);
}
