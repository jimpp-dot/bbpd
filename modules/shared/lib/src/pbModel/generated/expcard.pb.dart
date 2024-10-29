///
//  Generated code. Do not modify.
//  source: expcard.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'slp_gift.pb.dart' as $0;

class ApiExpCardCheckResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiExpCardCheckResponse',
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
    ..aOM<RspExpCardCheckUse>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RspExpCardCheckUse.create)
    ..hasRequiredFields = false;

  ApiExpCardCheckResponse._() : super();
  factory ApiExpCardCheckResponse({
    $core.bool? success,
    $core.String? message,
    RspExpCardCheckUse? data,
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
  factory ApiExpCardCheckResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiExpCardCheckResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiExpCardCheckResponse clone() =>
      ApiExpCardCheckResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiExpCardCheckResponse copyWith(
          void Function(ApiExpCardCheckResponse) updates) =>
      super.copyWith((message) => updates(message as ApiExpCardCheckResponse))
          as ApiExpCardCheckResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiExpCardCheckResponse create() => ApiExpCardCheckResponse._();
  ApiExpCardCheckResponse createEmptyInstance() => create();
  static $pb.PbList<ApiExpCardCheckResponse> createRepeated() =>
      $pb.PbList<ApiExpCardCheckResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiExpCardCheckResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiExpCardCheckResponse>(create);
  static ApiExpCardCheckResponse? _defaultInstance;

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
  RspExpCardCheckUse get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RspExpCardCheckUse v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RspExpCardCheckUse ensureData() => $_ensure(2);
}

class RspExpCardCheckUse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspExpCardCheckUse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'card',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expiredAt',
        $pb.PbFieldType.OU3,
        protoName: 'expiredAt')
    ..aOM<$0.BbGiftPanelGift>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'panelGift',
        protoName: 'panelGift',
        subBuilder: $0.BbGiftPanelGift.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RspExpCardCheckUse._() : super();
  factory RspExpCardCheckUse({
    $core.int? card,
    $core.int? num,
    $core.int? expiredAt,
    $0.BbGiftPanelGift? panelGift,
    $core.int? target,
  }) {
    final _result = create();
    if (card != null) {
      _result.card = card;
    }
    if (num != null) {
      _result.num = num;
    }
    if (expiredAt != null) {
      _result.expiredAt = expiredAt;
    }
    if (panelGift != null) {
      _result.panelGift = panelGift;
    }
    if (target != null) {
      _result.target = target;
    }
    return _result;
  }
  factory RspExpCardCheckUse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspExpCardCheckUse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspExpCardCheckUse clone() => RspExpCardCheckUse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspExpCardCheckUse copyWith(void Function(RspExpCardCheckUse) updates) =>
      super.copyWith((message) => updates(message as RspExpCardCheckUse))
          as RspExpCardCheckUse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspExpCardCheckUse create() => RspExpCardCheckUse._();
  RspExpCardCheckUse createEmptyInstance() => create();
  static $pb.PbList<RspExpCardCheckUse> createRepeated() =>
      $pb.PbList<RspExpCardCheckUse>();
  @$core.pragma('dart2js:noInline')
  static RspExpCardCheckUse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspExpCardCheckUse>(create);
  static RspExpCardCheckUse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get card => $_getIZ(0);
  @$pb.TagNumber(1)
  set card($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCard() => $_has(0);
  @$pb.TagNumber(1)
  void clearCard() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get num => $_getIZ(1);
  @$pb.TagNumber(2)
  set num($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get expiredAt => $_getIZ(2);
  @$pb.TagNumber(3)
  set expiredAt($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExpiredAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiredAt() => clearField(3);

  @$pb.TagNumber(4)
  $0.BbGiftPanelGift get panelGift => $_getN(3);
  @$pb.TagNumber(4)
  set panelGift($0.BbGiftPanelGift v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPanelGift() => $_has(3);
  @$pb.TagNumber(4)
  void clearPanelGift() => clearField(4);
  @$pb.TagNumber(4)
  $0.BbGiftPanelGift ensurePanelGift() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get target => $_getIZ(4);
  @$pb.TagNumber(5)
  set target($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTarget() => $_has(4);
  @$pb.TagNumber(5)
  void clearTarget() => clearField(5);
}
