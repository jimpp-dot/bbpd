///
//  Generated code. Do not modify.
//  source: common_yearbeast.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResYearBeastProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResYearBeastProgress',
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
    ..aOM<YearBeastProgressData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: YearBeastProgressData.create)
    ..hasRequiredFields = false;

  ResYearBeastProgress._() : super();
  factory ResYearBeastProgress({
    $core.bool? success,
    $core.String? msg,
    YearBeastProgressData? data,
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
  factory ResYearBeastProgress.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResYearBeastProgress.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResYearBeastProgress clone() =>
      ResYearBeastProgress()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResYearBeastProgress copyWith(void Function(ResYearBeastProgress) updates) =>
      super.copyWith((message) => updates(message as ResYearBeastProgress))
          as ResYearBeastProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResYearBeastProgress create() => ResYearBeastProgress._();
  ResYearBeastProgress createEmptyInstance() => create();
  static $pb.PbList<ResYearBeastProgress> createRepeated() =>
      $pb.PbList<ResYearBeastProgress>();
  @$core.pragma('dart2js:noInline')
  static ResYearBeastProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResYearBeastProgress>(create);
  static ResYearBeastProgress? _defaultInstance;

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

  @$pb.TagNumber(4)
  YearBeastProgressData get data => $_getN(2);
  @$pb.TagNumber(4)
  set data(YearBeastProgressData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
  @$pb.TagNumber(4)
  YearBeastProgressData ensureData() => $_ensure(2);
}

class YearBeastProgressData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'YearBeastProgressData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalBlood',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftBlood',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftSeconds',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  YearBeastProgressData._() : super();
  factory YearBeastProgressData({
    $core.bool? show,
    $core.int? totalBlood,
    $core.int? leftBlood,
    $core.int? leftSeconds,
    $core.int? version,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (totalBlood != null) {
      _result.totalBlood = totalBlood;
    }
    if (leftBlood != null) {
      _result.leftBlood = leftBlood;
    }
    if (leftSeconds != null) {
      _result.leftSeconds = leftSeconds;
    }
    if (version != null) {
      _result.version = version;
    }
    return _result;
  }
  factory YearBeastProgressData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory YearBeastProgressData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  YearBeastProgressData clone() =>
      YearBeastProgressData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  YearBeastProgressData copyWith(
          void Function(YearBeastProgressData) updates) =>
      super.copyWith((message) => updates(message as YearBeastProgressData))
          as YearBeastProgressData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static YearBeastProgressData create() => YearBeastProgressData._();
  YearBeastProgressData createEmptyInstance() => create();
  static $pb.PbList<YearBeastProgressData> createRepeated() =>
      $pb.PbList<YearBeastProgressData>();
  @$core.pragma('dart2js:noInline')
  static YearBeastProgressData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<YearBeastProgressData>(create);
  static YearBeastProgressData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get show => $_getBF(0);
  @$pb.TagNumber(1)
  set show($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalBlood => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalBlood($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTotalBlood() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalBlood() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get leftBlood => $_getIZ(2);
  @$pb.TagNumber(3)
  set leftBlood($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeftBlood() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftBlood() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get leftSeconds => $_getIZ(3);
  @$pb.TagNumber(4)
  set leftSeconds($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLeftSeconds() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeftSeconds() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get version => $_getIZ(4);
  @$pb.TagNumber(5)
  set version($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearVersion() => clearField(5);
}
