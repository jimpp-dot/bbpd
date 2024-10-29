///
//  Generated code. Do not modify.
//  source: gs_config.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'gift_handbook.pb.dart' as $0;

class ConfigProfileData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfigProfileData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'anchorShow',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gsSayhi',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isNewInvite',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'anchorMatchShow',
        $pb.PbFieldType.OU3)
    ..aOM<$0.GiftBookBriefInfo>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'briefInfo',
        subBuilder: $0.GiftBookBriefInfo.create)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isTone')
    ..hasRequiredFields = false;

  ConfigProfileData._() : super();
  factory ConfigProfileData({
    $fixnum.Int64? anchorShow,
    $core.int? gsSayhi,
    $core.int? isNewInvite,
    $core.int? anchorMatchShow,
    $0.GiftBookBriefInfo? briefInfo,
    $core.bool? isTone,
  }) {
    final _result = create();
    if (anchorShow != null) {
      _result.anchorShow = anchorShow;
    }
    if (gsSayhi != null) {
      _result.gsSayhi = gsSayhi;
    }
    if (isNewInvite != null) {
      _result.isNewInvite = isNewInvite;
    }
    if (anchorMatchShow != null) {
      _result.anchorMatchShow = anchorMatchShow;
    }
    if (briefInfo != null) {
      _result.briefInfo = briefInfo;
    }
    if (isTone != null) {
      _result.isTone = isTone;
    }
    return _result;
  }
  factory ConfigProfileData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigProfileData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigProfileData clone() => ConfigProfileData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigProfileData copyWith(void Function(ConfigProfileData) updates) =>
      super.copyWith((message) => updates(message as ConfigProfileData))
          as ConfigProfileData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigProfileData create() => ConfigProfileData._();
  ConfigProfileData createEmptyInstance() => create();
  static $pb.PbList<ConfigProfileData> createRepeated() =>
      $pb.PbList<ConfigProfileData>();
  @$core.pragma('dart2js:noInline')
  static ConfigProfileData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigProfileData>(create);
  static ConfigProfileData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get anchorShow => $_getI64(0);
  @$pb.TagNumber(1)
  set anchorShow($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAnchorShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearAnchorShow() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get gsSayhi => $_getIZ(1);
  @$pb.TagNumber(3)
  set gsSayhi($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGsSayhi() => $_has(1);
  @$pb.TagNumber(3)
  void clearGsSayhi() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get isNewInvite => $_getIZ(2);
  @$pb.TagNumber(4)
  set isNewInvite($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsNewInvite() => $_has(2);
  @$pb.TagNumber(4)
  void clearIsNewInvite() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get anchorMatchShow => $_getIZ(3);
  @$pb.TagNumber(5)
  set anchorMatchShow($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAnchorMatchShow() => $_has(3);
  @$pb.TagNumber(5)
  void clearAnchorMatchShow() => clearField(5);

  @$pb.TagNumber(6)
  $0.GiftBookBriefInfo get briefInfo => $_getN(4);
  @$pb.TagNumber(6)
  set briefInfo($0.GiftBookBriefInfo v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBriefInfo() => $_has(4);
  @$pb.TagNumber(6)
  void clearBriefInfo() => clearField(6);
  @$pb.TagNumber(6)
  $0.GiftBookBriefInfo ensureBriefInfo() => $_ensure(4);

  @$pb.TagNumber(7)
  $core.bool get isTone => $_getBF(5);
  @$pb.TagNumber(7)
  set isTone($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsTone() => $_has(5);
  @$pb.TagNumber(7)
  void clearIsTone() => clearField(7);
}

class BriefInfoRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BriefInfoRsp',
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
    ..aOM<$0.GiftBookBriefInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: $0.GiftBookBriefInfo.create)
    ..hasRequiredFields = false;

  BriefInfoRsp._() : super();
  factory BriefInfoRsp({
    $core.bool? success,
    $core.String? msg,
    $0.GiftBookBriefInfo? data,
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
  factory BriefInfoRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BriefInfoRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BriefInfoRsp clone() => BriefInfoRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BriefInfoRsp copyWith(void Function(BriefInfoRsp) updates) =>
      super.copyWith((message) => updates(message as BriefInfoRsp))
          as BriefInfoRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BriefInfoRsp create() => BriefInfoRsp._();
  BriefInfoRsp createEmptyInstance() => create();
  static $pb.PbList<BriefInfoRsp> createRepeated() =>
      $pb.PbList<BriefInfoRsp>();
  @$core.pragma('dart2js:noInline')
  static BriefInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BriefInfoRsp>(create);
  static BriefInfoRsp? _defaultInstance;

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
  $0.GiftBookBriefInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($0.GiftBookBriefInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $0.GiftBookBriefInfo ensureData() => $_ensure(2);
}

class ResConfigProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResConfigProfile',
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
    ..aOM<ConfigProfileData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ConfigProfileData.create)
    ..hasRequiredFields = false;

  ResConfigProfile._() : super();
  factory ResConfigProfile({
    $core.bool? success,
    $core.String? msg,
    ConfigProfileData? data,
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
  factory ResConfigProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResConfigProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResConfigProfile clone() => ResConfigProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResConfigProfile copyWith(void Function(ResConfigProfile) updates) =>
      super.copyWith((message) => updates(message as ResConfigProfile))
          as ResConfigProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResConfigProfile create() => ResConfigProfile._();
  ResConfigProfile createEmptyInstance() => create();
  static $pb.PbList<ResConfigProfile> createRepeated() =>
      $pb.PbList<ResConfigProfile>();
  @$core.pragma('dart2js:noInline')
  static ResConfigProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResConfigProfile>(create);
  static ResConfigProfile? _defaultInstance;

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
  ConfigProfileData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ConfigProfileData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ConfigProfileData ensureData() => $_ensure(2);
}
