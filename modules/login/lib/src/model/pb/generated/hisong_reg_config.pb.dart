///
//  Generated code. Do not modify.
//  source: hisong_reg_config.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResHiSongRegConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHiSongRegConfig',
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
    ..aOM<HiSongRegConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HiSongRegConfig.create)
    ..hasRequiredFields = false;

  ResHiSongRegConfig._() : super();
  factory ResHiSongRegConfig({
    $core.bool? success,
    $core.String? msg,
    HiSongRegConfig? data,
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
  factory ResHiSongRegConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHiSongRegConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHiSongRegConfig clone() => ResHiSongRegConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHiSongRegConfig copyWith(void Function(ResHiSongRegConfig) updates) =>
      super.copyWith((message) => updates(message as ResHiSongRegConfig))
          as ResHiSongRegConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHiSongRegConfig create() => ResHiSongRegConfig._();
  ResHiSongRegConfig createEmptyInstance() => create();
  static $pb.PbList<ResHiSongRegConfig> createRepeated() =>
      $pb.PbList<ResHiSongRegConfig>();
  @$core.pragma('dart2js:noInline')
  static ResHiSongRegConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHiSongRegConfig>(create);
  static ResHiSongRegConfig? _defaultInstance;

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
  HiSongRegConfig get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HiSongRegConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HiSongRegConfig ensureData() => $_ensure(2);
}

class HiSongRegConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HiSongRegConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maleDefaultIcon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'femaleDefaultIcon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultSex',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'thirdName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'thirdIcon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'thirdSex',
        $pb.PbFieldType.OU3)
    ..pPS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maleRandPrefix')
    ..pPS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maleRandName')
    ..pPS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'femaleRandPrefix')
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'femaleRandName')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newHome',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HiSongRegConfig._() : super();
  factory HiSongRegConfig({
    $core.String? maleDefaultIcon,
    $core.String? femaleDefaultIcon,
    $core.int? defaultSex,
    $core.String? thirdName,
    $core.String? thirdIcon,
    $core.int? thirdSex,
    $core.Iterable<$core.String>? maleRandPrefix,
    $core.Iterable<$core.String>? maleRandName,
    $core.Iterable<$core.String>? femaleRandPrefix,
    $core.Iterable<$core.String>? femaleRandName,
    $core.int? newHome,
  }) {
    final _result = create();
    if (maleDefaultIcon != null) {
      _result.maleDefaultIcon = maleDefaultIcon;
    }
    if (femaleDefaultIcon != null) {
      _result.femaleDefaultIcon = femaleDefaultIcon;
    }
    if (defaultSex != null) {
      _result.defaultSex = defaultSex;
    }
    if (thirdName != null) {
      _result.thirdName = thirdName;
    }
    if (thirdIcon != null) {
      _result.thirdIcon = thirdIcon;
    }
    if (thirdSex != null) {
      _result.thirdSex = thirdSex;
    }
    if (maleRandPrefix != null) {
      _result.maleRandPrefix.addAll(maleRandPrefix);
    }
    if (maleRandName != null) {
      _result.maleRandName.addAll(maleRandName);
    }
    if (femaleRandPrefix != null) {
      _result.femaleRandPrefix.addAll(femaleRandPrefix);
    }
    if (femaleRandName != null) {
      _result.femaleRandName.addAll(femaleRandName);
    }
    if (newHome != null) {
      _result.newHome = newHome;
    }
    return _result;
  }
  factory HiSongRegConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HiSongRegConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HiSongRegConfig clone() => HiSongRegConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HiSongRegConfig copyWith(void Function(HiSongRegConfig) updates) =>
      super.copyWith((message) => updates(message as HiSongRegConfig))
          as HiSongRegConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HiSongRegConfig create() => HiSongRegConfig._();
  HiSongRegConfig createEmptyInstance() => create();
  static $pb.PbList<HiSongRegConfig> createRepeated() =>
      $pb.PbList<HiSongRegConfig>();
  @$core.pragma('dart2js:noInline')
  static HiSongRegConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HiSongRegConfig>(create);
  static HiSongRegConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get maleDefaultIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set maleDefaultIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMaleDefaultIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaleDefaultIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get femaleDefaultIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set femaleDefaultIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFemaleDefaultIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearFemaleDefaultIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get defaultSex => $_getIZ(2);
  @$pb.TagNumber(3)
  set defaultSex($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDefaultSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaultSex() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get thirdName => $_getSZ(3);
  @$pb.TagNumber(4)
  set thirdName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasThirdName() => $_has(3);
  @$pb.TagNumber(4)
  void clearThirdName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get thirdIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set thirdIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasThirdIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearThirdIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get thirdSex => $_getIZ(5);
  @$pb.TagNumber(6)
  set thirdSex($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasThirdSex() => $_has(5);
  @$pb.TagNumber(6)
  void clearThirdSex() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get maleRandPrefix => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.String> get maleRandName => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$core.String> get femaleRandPrefix => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$core.String> get femaleRandName => $_getList(9);

  @$pb.TagNumber(11)
  $core.int get newHome => $_getIZ(10);
  @$pb.TagNumber(11)
  set newHome($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasNewHome() => $_has(10);
  @$pb.TagNumber(11)
  void clearNewHome() => clearField(11);
}
