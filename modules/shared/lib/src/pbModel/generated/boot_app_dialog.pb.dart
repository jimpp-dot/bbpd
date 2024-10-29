///
//  Generated code. Do not modify.
//  source: boot_app_dialog.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'boot_app_dialog.pbenum.dart';

export 'boot_app_dialog.pbenum.dart';

class ApiBootAppResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiBootAppResponse',
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
    ..aOM<BootAppData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BootAppData.create)
    ..hasRequiredFields = false;

  ApiBootAppResponse._() : super();
  factory ApiBootAppResponse({
    $core.bool? success,
    $core.String? msg,
    BootAppData? data,
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
  factory ApiBootAppResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiBootAppResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiBootAppResponse clone() => ApiBootAppResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiBootAppResponse copyWith(void Function(ApiBootAppResponse) updates) =>
      super.copyWith((message) => updates(message as ApiBootAppResponse))
          as ApiBootAppResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiBootAppResponse create() => ApiBootAppResponse._();
  ApiBootAppResponse createEmptyInstance() => create();
  static $pb.PbList<ApiBootAppResponse> createRepeated() =>
      $pb.PbList<ApiBootAppResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiBootAppResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiBootAppResponse>(create);
  static ApiBootAppResponse? _defaultInstance;

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
  BootAppData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BootAppData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BootAppData ensureData() => $_ensure(2);
}

class BootAppData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BootAppData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<BootAppPopup>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popups',
        $pb.PbFieldType.PM,
        subBuilder: BootAppPopup.create)
    ..hasRequiredFields = false;

  BootAppData._() : super();
  factory BootAppData({
    $core.Iterable<BootAppPopup>? popups,
  }) {
    final _result = create();
    if (popups != null) {
      _result.popups.addAll(popups);
    }
    return _result;
  }
  factory BootAppData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BootAppData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BootAppData clone() => BootAppData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BootAppData copyWith(void Function(BootAppData) updates) =>
      super.copyWith((message) => updates(message as BootAppData))
          as BootAppData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BootAppData create() => BootAppData._();
  BootAppData createEmptyInstance() => create();
  static $pb.PbList<BootAppData> createRepeated() => $pb.PbList<BootAppData>();
  @$core.pragma('dart2js:noInline')
  static BootAppData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BootAppData>(create);
  static BootAppData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BootAppPopup> get popups => $_getList(0);
}

class BootAppPopup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BootAppPopup',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bizId',
        $pb.PbFieldType.OU3)
    ..e<BootAppPopupType>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pType',
        $pb.PbFieldType.OE,
        defaultOrMaker: BootAppPopupType.BootAppPopupTypeUnknown,
        valueOf: BootAppPopupType.valueOf,
        enumValues: BootAppPopupType.values)
    ..aOM<BootAppPopupCommon>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commonData',
        subBuilder: BootAppPopupCommon.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxCircleType',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BootAppPopup._() : super();
  factory BootAppPopup({
    $core.int? bizId,
    BootAppPopupType? pType,
    BootAppPopupCommon? commonData,
    $core.int? maxCount,
    $core.int? maxCircleType,
  }) {
    final _result = create();
    if (bizId != null) {
      _result.bizId = bizId;
    }
    if (pType != null) {
      _result.pType = pType;
    }
    if (commonData != null) {
      _result.commonData = commonData;
    }
    if (maxCount != null) {
      _result.maxCount = maxCount;
    }
    if (maxCircleType != null) {
      _result.maxCircleType = maxCircleType;
    }
    return _result;
  }
  factory BootAppPopup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BootAppPopup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BootAppPopup clone() => BootAppPopup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BootAppPopup copyWith(void Function(BootAppPopup) updates) =>
      super.copyWith((message) => updates(message as BootAppPopup))
          as BootAppPopup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BootAppPopup create() => BootAppPopup._();
  BootAppPopup createEmptyInstance() => create();
  static $pb.PbList<BootAppPopup> createRepeated() =>
      $pb.PbList<BootAppPopup>();
  @$core.pragma('dart2js:noInline')
  static BootAppPopup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BootAppPopup>(create);
  static BootAppPopup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get bizId => $_getIZ(0);
  @$pb.TagNumber(1)
  set bizId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBizId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBizId() => clearField(1);

  @$pb.TagNumber(2)
  BootAppPopupType get pType => $_getN(1);
  @$pb.TagNumber(2)
  set pType(BootAppPopupType v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPType() => clearField(2);

  @$pb.TagNumber(3)
  BootAppPopupCommon get commonData => $_getN(2);
  @$pb.TagNumber(3)
  set commonData(BootAppPopupCommon v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCommonData() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommonData() => clearField(3);
  @$pb.TagNumber(3)
  BootAppPopupCommon ensureCommonData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get maxCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxCount($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMaxCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxCircleType => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxCircleType($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMaxCircleType() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxCircleType() => clearField(5);
}

class BootAppPopupCommon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BootAppPopupCommon',
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
            : 'image')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'schema')
    ..hasRequiredFields = false;

  BootAppPopupCommon._() : super();
  factory BootAppPopupCommon({
    $core.String? title,
    $core.String? image,
    $core.String? schema,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (image != null) {
      _result.image = image;
    }
    if (schema != null) {
      _result.schema = schema;
    }
    return _result;
  }
  factory BootAppPopupCommon.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BootAppPopupCommon.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BootAppPopupCommon clone() => BootAppPopupCommon()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BootAppPopupCommon copyWith(void Function(BootAppPopupCommon) updates) =>
      super.copyWith((message) => updates(message as BootAppPopupCommon))
          as BootAppPopupCommon; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BootAppPopupCommon create() => BootAppPopupCommon._();
  BootAppPopupCommon createEmptyInstance() => create();
  static $pb.PbList<BootAppPopupCommon> createRepeated() =>
      $pb.PbList<BootAppPopupCommon>();
  @$core.pragma('dart2js:noInline')
  static BootAppPopupCommon getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BootAppPopupCommon>(create);
  static BootAppPopupCommon? _defaultInstance;

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
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get schema => $_getSZ(2);
  @$pb.TagNumber(3)
  set schema($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSchema() => $_has(2);
  @$pb.TagNumber(3)
  void clearSchema() => clearField(3);
}
