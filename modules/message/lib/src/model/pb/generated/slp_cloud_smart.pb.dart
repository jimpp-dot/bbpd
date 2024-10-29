///
//  Generated code. Do not modify.
//  source: slp_cloud_smart.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResImCloudTips extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResImCloudTips',
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
    ..aOM<ImCloudTipsData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ImCloudTipsData.create)
    ..hasRequiredFields = false;

  ResImCloudTips._() : super();
  factory ResImCloudTips({
    $core.bool? success,
    $core.String? msg,
    ImCloudTipsData? data,
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
  factory ResImCloudTips.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResImCloudTips.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResImCloudTips clone() => ResImCloudTips()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResImCloudTips copyWith(void Function(ResImCloudTips) updates) =>
      super.copyWith((message) => updates(message as ResImCloudTips))
          as ResImCloudTips; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResImCloudTips create() => ResImCloudTips._();
  ResImCloudTips createEmptyInstance() => create();
  static $pb.PbList<ResImCloudTips> createRepeated() =>
      $pb.PbList<ResImCloudTips>();
  @$core.pragma('dart2js:noInline')
  static ResImCloudTips getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResImCloudTips>(create);
  static ResImCloudTips? _defaultInstance;

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
  ImCloudTipsData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ImCloudTipsData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ImCloudTipsData ensureData() => $_ensure(2);
}

class ImCloudTipsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImCloudTipsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ImCloudSmartGreet>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'smartGreet',
        subBuilder: ImCloudSmartGreet.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showFate')
    ..hasRequiredFields = false;

  ImCloudTipsData._() : super();
  factory ImCloudTipsData({
    ImCloudSmartGreet? smartGreet,
    $core.bool? showFate,
  }) {
    final _result = create();
    if (smartGreet != null) {
      _result.smartGreet = smartGreet;
    }
    if (showFate != null) {
      _result.showFate = showFate;
    }
    return _result;
  }
  factory ImCloudTipsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImCloudTipsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImCloudTipsData clone() => ImCloudTipsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImCloudTipsData copyWith(void Function(ImCloudTipsData) updates) =>
      super.copyWith((message) => updates(message as ImCloudTipsData))
          as ImCloudTipsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImCloudTipsData create() => ImCloudTipsData._();
  ImCloudTipsData createEmptyInstance() => create();
  static $pb.PbList<ImCloudTipsData> createRepeated() =>
      $pb.PbList<ImCloudTipsData>();
  @$core.pragma('dart2js:noInline')
  static ImCloudTipsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImCloudTipsData>(create);
  static ImCloudTipsData? _defaultInstance;

  @$pb.TagNumber(1)
  ImCloudSmartGreet get smartGreet => $_getN(0);
  @$pb.TagNumber(1)
  set smartGreet(ImCloudSmartGreet v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSmartGreet() => $_has(0);
  @$pb.TagNumber(1)
  void clearSmartGreet() => clearField(1);
  @$pb.TagNumber(1)
  ImCloudSmartGreet ensureSmartGreet() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get showFate => $_getBF(1);
  @$pb.TagNumber(2)
  set showFate($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowFate() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowFate() => clearField(2);
}

class ImCloudSmartGreet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImCloudSmartGreet',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showPop')
    ..hasRequiredFields = false;

  ImCloudSmartGreet._() : super();
  factory ImCloudSmartGreet({
    $core.bool? showPop,
  }) {
    final _result = create();
    if (showPop != null) {
      _result.showPop = showPop;
    }
    return _result;
  }
  factory ImCloudSmartGreet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImCloudSmartGreet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImCloudSmartGreet clone() => ImCloudSmartGreet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImCloudSmartGreet copyWith(void Function(ImCloudSmartGreet) updates) =>
      super.copyWith((message) => updates(message as ImCloudSmartGreet))
          as ImCloudSmartGreet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImCloudSmartGreet create() => ImCloudSmartGreet._();
  ImCloudSmartGreet createEmptyInstance() => create();
  static $pb.PbList<ImCloudSmartGreet> createRepeated() =>
      $pb.PbList<ImCloudSmartGreet>();
  @$core.pragma('dart2js:noInline')
  static ImCloudSmartGreet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImCloudSmartGreet>(create);
  static ImCloudSmartGreet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get showPop => $_getBF(0);
  @$pb.TagNumber(1)
  set showPop($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowPop() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowPop() => clearField(1);
}
