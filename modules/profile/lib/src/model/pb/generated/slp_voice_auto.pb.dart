///
//  Generated code. Do not modify.
//  source: slp_voice_auto.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResVoiceVerifyHome extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResVoiceVerifyHome',
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
    ..aOM<VoiceVerifyHomeData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: VoiceVerifyHomeData.create)
    ..hasRequiredFields = false;

  ResVoiceVerifyHome._() : super();
  factory ResVoiceVerifyHome({
    $core.bool? success,
    $core.String? msg,
    VoiceVerifyHomeData? data,
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
  factory ResVoiceVerifyHome.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResVoiceVerifyHome.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResVoiceVerifyHome clone() => ResVoiceVerifyHome()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResVoiceVerifyHome copyWith(void Function(ResVoiceVerifyHome) updates) =>
      super.copyWith((message) => updates(message as ResVoiceVerifyHome))
          as ResVoiceVerifyHome; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResVoiceVerifyHome create() => ResVoiceVerifyHome._();
  ResVoiceVerifyHome createEmptyInstance() => create();
  static $pb.PbList<ResVoiceVerifyHome> createRepeated() =>
      $pb.PbList<ResVoiceVerifyHome>();
  @$core.pragma('dart2js:noInline')
  static ResVoiceVerifyHome getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResVoiceVerifyHome>(create);
  static ResVoiceVerifyHome? _defaultInstance;

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
  VoiceVerifyHomeData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(VoiceVerifyHomeData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  VoiceVerifyHomeData ensureData() => $_ensure(2);
}

class VoiceVerifyHomeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VoiceVerifyHomeData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<VoiceVerifyItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: VoiceVerifyItem.create)
    ..hasRequiredFields = false;

  VoiceVerifyHomeData._() : super();
  factory VoiceVerifyHomeData({
    $core.Iterable<VoiceVerifyItem>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory VoiceVerifyHomeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VoiceVerifyHomeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VoiceVerifyHomeData clone() => VoiceVerifyHomeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VoiceVerifyHomeData copyWith(void Function(VoiceVerifyHomeData) updates) =>
      super.copyWith((message) => updates(message as VoiceVerifyHomeData))
          as VoiceVerifyHomeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoiceVerifyHomeData create() => VoiceVerifyHomeData._();
  VoiceVerifyHomeData createEmptyInstance() => create();
  static $pb.PbList<VoiceVerifyHomeData> createRepeated() =>
      $pb.PbList<VoiceVerifyHomeData>();
  @$core.pragma('dart2js:noInline')
  static VoiceVerifyHomeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoiceVerifyHomeData>(create);
  static VoiceVerifyHomeData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<VoiceVerifyItem> get list => $_getList(0);
}

class VoiceVerifyItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VoiceVerifyItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
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
            : 'color')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'verify',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  VoiceVerifyItem._() : super();
  factory VoiceVerifyItem({
    $core.int? tagId,
    $core.String? name,
    $core.String? color,
    $core.String? image,
    $core.int? verify,
  }) {
    final _result = create();
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (color != null) {
      _result.color = color;
    }
    if (image != null) {
      _result.image = image;
    }
    if (verify != null) {
      _result.verify = verify;
    }
    return _result;
  }
  factory VoiceVerifyItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VoiceVerifyItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VoiceVerifyItem clone() => VoiceVerifyItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VoiceVerifyItem copyWith(void Function(VoiceVerifyItem) updates) =>
      super.copyWith((message) => updates(message as VoiceVerifyItem))
          as VoiceVerifyItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoiceVerifyItem create() => VoiceVerifyItem._();
  VoiceVerifyItem createEmptyInstance() => create();
  static $pb.PbList<VoiceVerifyItem> createRepeated() =>
      $pb.PbList<VoiceVerifyItem>();
  @$core.pragma('dart2js:noInline')
  static VoiceVerifyItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoiceVerifyItem>(create);
  static VoiceVerifyItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

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
  $core.String get color => $_getSZ(2);
  @$pb.TagNumber(3)
  set color($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearColor() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get image => $_getSZ(3);
  @$pb.TagNumber(4)
  set image($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearImage() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get verify => $_getIZ(4);
  @$pb.TagNumber(5)
  set verify($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVerify() => $_has(4);
  @$pb.TagNumber(5)
  void clearVerify() => clearField(5);
}
