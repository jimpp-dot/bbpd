///
//  Generated code. Do not modify.
//  source: auction.gift.received.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AuctionGiftReceived extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionGiftReceived',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'auction.gift.received'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'c_name')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'c_num',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'c_url')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..hasRequiredFields = false;

  AuctionGiftReceived._() : super();
  factory AuctionGiftReceived({
    $core.String? cName,
    $core.int? cNum,
    $core.String? cUrl,
    $core.String? cid,
    $core.String? icon,
    $core.String? name,
    $core.int? rid,
    $core.String? sex,
    $core.String? uid,
  }) {
    final _result = create();
    if (cName != null) {
      _result.cName = cName;
    }
    if (cNum != null) {
      _result.cNum = cNum;
    }
    if (cUrl != null) {
      _result.cUrl = cUrl;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory AuctionGiftReceived.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionGiftReceived.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionGiftReceived clone() => AuctionGiftReceived()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionGiftReceived copyWith(void Function(AuctionGiftReceived) updates) =>
      super.copyWith((message) => updates(message as AuctionGiftReceived))
          as AuctionGiftReceived; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionGiftReceived create() => AuctionGiftReceived._();
  AuctionGiftReceived createEmptyInstance() => create();
  static $pb.PbList<AuctionGiftReceived> createRepeated() =>
      $pb.PbList<AuctionGiftReceived>();
  @$core.pragma('dart2js:noInline')
  static AuctionGiftReceived getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionGiftReceived>(create);
  static AuctionGiftReceived? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cName => $_getSZ(0);
  @$pb.TagNumber(1)
  set cName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCName() => $_has(0);
  @$pb.TagNumber(1)
  void clearCName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set cNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearCNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set cUrl($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearCUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cid => $_getSZ(3);
  @$pb.TagNumber(4)
  set cid($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCid() => $_has(3);
  @$pb.TagNumber(4)
  void clearCid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get rid => $_getIZ(6);
  @$pb.TagNumber(7)
  set rid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRid() => $_has(6);
  @$pb.TagNumber(7)
  void clearRid() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sex => $_getSZ(7);
  @$pb.TagNumber(8)
  set sex($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSex() => $_has(7);
  @$pb.TagNumber(8)
  void clearSex() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get uid => $_getSZ(8);
  @$pb.TagNumber(9)
  set uid($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasUid() => $_has(8);
  @$pb.TagNumber(9)
  void clearUid() => clearField(9);
}
