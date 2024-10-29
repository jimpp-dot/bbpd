///
//  Generated code. Do not modify.
//  source: hisong_home_fast.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResHomeQuickEnter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeQuickEnter',
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
    ..aOM<HomeQuickEnterData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeQuickEnterData.create)
    ..hasRequiredFields = false;

  ResHomeQuickEnter._() : super();
  factory ResHomeQuickEnter({
    $core.bool? success,
    $core.String? msg,
    HomeQuickEnterData? data,
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
  factory ResHomeQuickEnter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeQuickEnter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeQuickEnter clone() => ResHomeQuickEnter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeQuickEnter copyWith(void Function(ResHomeQuickEnter) updates) =>
      super.copyWith((message) => updates(message as ResHomeQuickEnter))
          as ResHomeQuickEnter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeQuickEnter create() => ResHomeQuickEnter._();
  ResHomeQuickEnter createEmptyInstance() => create();
  static $pb.PbList<ResHomeQuickEnter> createRepeated() =>
      $pb.PbList<ResHomeQuickEnter>();
  @$core.pragma('dart2js:noInline')
  static ResHomeQuickEnter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeQuickEnter>(create);
  static ResHomeQuickEnter? _defaultInstance;

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
  HomeQuickEnterData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeQuickEnterData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeQuickEnterData ensureData() => $_ensure(2);
}

class HomeQuickEnterData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeQuickEnterData',
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
    ..hasRequiredFields = false;

  HomeQuickEnterData._() : super();
  factory HomeQuickEnterData({
    $core.int? rid,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory HomeQuickEnterData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeQuickEnterData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeQuickEnterData clone() => HomeQuickEnterData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeQuickEnterData copyWith(void Function(HomeQuickEnterData) updates) =>
      super.copyWith((message) => updates(message as HomeQuickEnterData))
          as HomeQuickEnterData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeQuickEnterData create() => HomeQuickEnterData._();
  HomeQuickEnterData createEmptyInstance() => create();
  static $pb.PbList<HomeQuickEnterData> createRepeated() =>
      $pb.PbList<HomeQuickEnterData>();
  @$core.pragma('dart2js:noInline')
  static HomeQuickEnterData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeQuickEnterData>(create);
  static HomeQuickEnterData? _defaultInstance;

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
}
