///
//  Generated code. Do not modify.
//  source: auction_tip.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AuctionOchData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionOchData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'times',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'realValue',
        $pb.PbFieldType.OU3,
        protoName: 'realValue')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rate')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wish',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AuctionOchData._() : super();
  factory AuctionOchData({
    $core.int? uid,
    $core.int? times,
    $core.int? realValue,
    $core.String? rate,
    $core.int? wish,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (times != null) {
      _result.times = times;
    }
    if (realValue != null) {
      _result.realValue = realValue;
    }
    if (rate != null) {
      _result.rate = rate;
    }
    if (wish != null) {
      _result.wish = wish;
    }
    return _result;
  }
  factory AuctionOchData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionOchData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionOchData clone() => AuctionOchData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionOchData copyWith(void Function(AuctionOchData) updates) =>
      super.copyWith((message) => updates(message as AuctionOchData))
          as AuctionOchData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionOchData create() => AuctionOchData._();
  AuctionOchData createEmptyInstance() => create();
  static $pb.PbList<AuctionOchData> createRepeated() =>
      $pb.PbList<AuctionOchData>();
  @$core.pragma('dart2js:noInline')
  static AuctionOchData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionOchData>(create);
  static AuctionOchData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get times => $_getIZ(1);
  @$pb.TagNumber(2)
  set times($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTimes() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimes() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get realValue => $_getIZ(2);
  @$pb.TagNumber(3)
  set realValue($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRealValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearRealValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rate => $_getSZ(3);
  @$pb.TagNumber(4)
  set rate($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRate() => $_has(3);
  @$pb.TagNumber(4)
  void clearRate() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get wish => $_getIZ(4);
  @$pb.TagNumber(5)
  set wish($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWish() => $_has(4);
  @$pb.TagNumber(5)
  void clearWish() => clearField(5);
}

class ApiAuctionOchResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiAuctionOchResponse',
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
    ..aOM<AuctionOchData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AuctionOchData.create)
    ..hasRequiredFields = false;

  ApiAuctionOchResponse._() : super();
  factory ApiAuctionOchResponse({
    $core.bool? success,
    $core.String? message,
    AuctionOchData? data,
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
  factory ApiAuctionOchResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiAuctionOchResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiAuctionOchResponse clone() =>
      ApiAuctionOchResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiAuctionOchResponse copyWith(
          void Function(ApiAuctionOchResponse) updates) =>
      super.copyWith((message) => updates(message as ApiAuctionOchResponse))
          as ApiAuctionOchResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiAuctionOchResponse create() => ApiAuctionOchResponse._();
  ApiAuctionOchResponse createEmptyInstance() => create();
  static $pb.PbList<ApiAuctionOchResponse> createRepeated() =>
      $pb.PbList<ApiAuctionOchResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiAuctionOchResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiAuctionOchResponse>(create);
  static ApiAuctionOchResponse? _defaultInstance;

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
  AuctionOchData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AuctionOchData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AuctionOchData ensureData() => $_ensure(2);
}
