///
//  Generated code. Do not modify.
//  source: core_data_check.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ClientDataCheckerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ClientDataCheckerResponse',
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
    ..aOM<CheckData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CheckData.create)
    ..hasRequiredFields = false;

  ClientDataCheckerResponse._() : super();
  factory ClientDataCheckerResponse({
    $core.bool? success,
    $core.String? message,
    CheckData? data,
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
  factory ClientDataCheckerResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClientDataCheckerResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ClientDataCheckerResponse clone() =>
      ClientDataCheckerResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ClientDataCheckerResponse copyWith(
          void Function(ClientDataCheckerResponse) updates) =>
      super.copyWith((message) => updates(message as ClientDataCheckerResponse))
          as ClientDataCheckerResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientDataCheckerResponse create() => ClientDataCheckerResponse._();
  ClientDataCheckerResponse createEmptyInstance() => create();
  static $pb.PbList<ClientDataCheckerResponse> createRepeated() =>
      $pb.PbList<ClientDataCheckerResponse>();
  @$core.pragma('dart2js:noInline')
  static ClientDataCheckerResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientDataCheckerResponse>(create);
  static ClientDataCheckerResponse? _defaultInstance;

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
  CheckData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CheckData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CheckData ensureData() => $_ensure(2);
}

class CheckData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CheckData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'modifyTime')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isGlobal')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'invalidImgUrls')
    ..hasRequiredFields = false;

  CheckData._() : super();
  factory CheckData({
    $fixnum.Int64? modifyTime,
    $core.bool? isGlobal,
    $core.Iterable<$core.String>? invalidImgUrls,
  }) {
    final _result = create();
    if (modifyTime != null) {
      _result.modifyTime = modifyTime;
    }
    if (isGlobal != null) {
      _result.isGlobal = isGlobal;
    }
    if (invalidImgUrls != null) {
      _result.invalidImgUrls.addAll(invalidImgUrls);
    }
    return _result;
  }
  factory CheckData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CheckData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CheckData clone() => CheckData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CheckData copyWith(void Function(CheckData) updates) =>
      super.copyWith((message) => updates(message as CheckData))
          as CheckData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckData create() => CheckData._();
  CheckData createEmptyInstance() => create();
  static $pb.PbList<CheckData> createRepeated() => $pb.PbList<CheckData>();
  @$core.pragma('dart2js:noInline')
  static CheckData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckData>(create);
  static CheckData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get modifyTime => $_getI64(0);
  @$pb.TagNumber(1)
  set modifyTime($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasModifyTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearModifyTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isGlobal => $_getBF(1);
  @$pb.TagNumber(2)
  set isGlobal($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsGlobal() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsGlobal() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get invalidImgUrls => $_getList(2);
}
