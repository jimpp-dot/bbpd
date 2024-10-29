///
//  Generated code. Do not modify.
//  source: hisong_config.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResHiSongConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHiSongConfig',
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
    ..aOM<HiSongConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HiSongConfig.create)
    ..hasRequiredFields = false;

  ResHiSongConfig._() : super();
  factory ResHiSongConfig({
    $core.bool? success,
    $core.String? msg,
    HiSongConfig? data,
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
  factory ResHiSongConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHiSongConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHiSongConfig clone() => ResHiSongConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHiSongConfig copyWith(void Function(ResHiSongConfig) updates) =>
      super.copyWith((message) => updates(message as ResHiSongConfig))
          as ResHiSongConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHiSongConfig create() => ResHiSongConfig._();
  ResHiSongConfig createEmptyInstance() => create();
  static $pb.PbList<ResHiSongConfig> createRepeated() =>
      $pb.PbList<ResHiSongConfig>();
  @$core.pragma('dart2js:noInline')
  static ResHiSongConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHiSongConfig>(create);
  static ResHiSongConfig? _defaultInstance;

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
  HiSongConfig get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HiSongConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HiSongConfig ensureData() => $_ensure(2);
}

class HiSongConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HiSongConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'novice')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newHome',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HiSongConfig._() : super();
  factory HiSongConfig({
    $core.String? novice,
    $core.int? isNew,
    $core.int? newHome,
  }) {
    final _result = create();
    if (novice != null) {
      _result.novice = novice;
    }
    if (isNew != null) {
      _result.isNew = isNew;
    }
    if (newHome != null) {
      _result.newHome = newHome;
    }
    return _result;
  }
  factory HiSongConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HiSongConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HiSongConfig clone() => HiSongConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HiSongConfig copyWith(void Function(HiSongConfig) updates) =>
      super.copyWith((message) => updates(message as HiSongConfig))
          as HiSongConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HiSongConfig create() => HiSongConfig._();
  HiSongConfig createEmptyInstance() => create();
  static $pb.PbList<HiSongConfig> createRepeated() =>
      $pb.PbList<HiSongConfig>();
  @$core.pragma('dart2js:noInline')
  static HiSongConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HiSongConfig>(create);
  static HiSongConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get novice => $_getSZ(0);
  @$pb.TagNumber(1)
  set novice($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNovice() => $_has(0);
  @$pb.TagNumber(1)
  void clearNovice() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get isNew => $_getIZ(1);
  @$pb.TagNumber(2)
  set isNew($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsNew() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsNew() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get newHome => $_getIZ(2);
  @$pb.TagNumber(3)
  set newHome($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNewHome() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewHome() => clearField(3);
}
