///
//  Generated code. Do not modify.
//  source: room.screen.welcome.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'room.refresh.mic.on.pb.dart' as $0;

class WelcomePopup_GiftResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WelcomePopup.GiftResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'screen.msg.pull'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.double>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OF)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftType')
    ..pc<$0.MicData>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micData',
        $pb.PbFieldType.PM,
        subBuilder: $0.MicData.create)
    ..hasRequiredFields = false;

  WelcomePopup_GiftResponse._() : super();
  factory WelcomePopup_GiftResponse({
    $core.int? id,
    $core.String? name,
    $core.double? price,
    $core.String? giftType,
    $core.Iterable<$0.MicData>? micData,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    if (micData != null) {
      _result.micData.addAll(micData);
    }
    return _result;
  }
  factory WelcomePopup_GiftResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WelcomePopup_GiftResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WelcomePopup_GiftResponse clone() =>
      WelcomePopup_GiftResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WelcomePopup_GiftResponse copyWith(
          void Function(WelcomePopup_GiftResponse) updates) =>
      super.copyWith((message) => updates(message as WelcomePopup_GiftResponse))
          as WelcomePopup_GiftResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WelcomePopup_GiftResponse create() => WelcomePopup_GiftResponse._();
  WelcomePopup_GiftResponse createEmptyInstance() => create();
  static $pb.PbList<WelcomePopup_GiftResponse> createRepeated() =>
      $pb.PbList<WelcomePopup_GiftResponse>();
  @$core.pragma('dart2js:noInline')
  static WelcomePopup_GiftResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WelcomePopup_GiftResponse>(create);
  static WelcomePopup_GiftResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

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
  $core.double get price => $_getN(2);
  @$pb.TagNumber(3)
  set price($core.double v) {
    $_setFloat(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get giftType => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftType() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftType() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$0.MicData> get micData => $_getList(4);
}

class WelcomePopup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WelcomePopup',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'screen.msg.pull'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'welcome')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wordsResponse',
        protoName: 'wordsResponse')
    ..aOM<WelcomePopup_GiftResponse>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftResponse',
        protoName: 'giftResponse',
        subBuilder: WelcomePopup_GiftResponse.create)
    ..hasRequiredFields = false;

  WelcomePopup._() : super();
  factory WelcomePopup({
    $core.String? welcome,
    $core.String? wordsResponse,
    WelcomePopup_GiftResponse? giftResponse,
  }) {
    final _result = create();
    if (welcome != null) {
      _result.welcome = welcome;
    }
    if (wordsResponse != null) {
      _result.wordsResponse = wordsResponse;
    }
    if (giftResponse != null) {
      _result.giftResponse = giftResponse;
    }
    return _result;
  }
  factory WelcomePopup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WelcomePopup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WelcomePopup clone() => WelcomePopup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WelcomePopup copyWith(void Function(WelcomePopup) updates) =>
      super.copyWith((message) => updates(message as WelcomePopup))
          as WelcomePopup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WelcomePopup create() => WelcomePopup._();
  WelcomePopup createEmptyInstance() => create();
  static $pb.PbList<WelcomePopup> createRepeated() =>
      $pb.PbList<WelcomePopup>();
  @$core.pragma('dart2js:noInline')
  static WelcomePopup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WelcomePopup>(create);
  static WelcomePopup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get welcome => $_getSZ(0);
  @$pb.TagNumber(1)
  set welcome($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWelcome() => $_has(0);
  @$pb.TagNumber(1)
  void clearWelcome() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get wordsResponse => $_getSZ(1);
  @$pb.TagNumber(2)
  set wordsResponse($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWordsResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearWordsResponse() => clearField(2);

  @$pb.TagNumber(3)
  WelcomePopup_GiftResponse get giftResponse => $_getN(2);
  @$pb.TagNumber(3)
  set giftResponse(WelcomePopup_GiftResponse v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftResponse() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftResponse() => clearField(3);
  @$pb.TagNumber(3)
  WelcomePopup_GiftResponse ensureGiftResponse() => $_ensure(2);
}
