///
//  Generated code. Do not modify.
//  source: confess.together.fly.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ConfessTogetherFly extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfessTogetherFly',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'confess.together.fly'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'back_img')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3,
        protoName: 'giftId')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toicon')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toname')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rname')
    ..hasRequiredFields = false;

  ConfessTogetherFly._() : super();
  factory ConfessTogetherFly({
    $core.String? backImg,
    $core.String? type,
    $core.String? uicon,
    $core.String? uname,
    $core.int? giftId,
    $core.String? desc,
    $core.String? toicon,
    $core.String? toname,
    $core.int? rid,
    $core.String? rname,
  }) {
    final _result = create();
    if (backImg != null) {
      _result.backImg = backImg;
    }
    if (type != null) {
      _result.type = type;
    }
    if (uicon != null) {
      _result.uicon = uicon;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (toicon != null) {
      _result.toicon = toicon;
    }
    if (toname != null) {
      _result.toname = toname;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (rname != null) {
      _result.rname = rname;
    }
    return _result;
  }
  factory ConfessTogetherFly.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfessTogetherFly.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfessTogetherFly clone() => ConfessTogetherFly()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfessTogetherFly copyWith(void Function(ConfessTogetherFly) updates) =>
      super.copyWith((message) => updates(message as ConfessTogetherFly))
          as ConfessTogetherFly; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfessTogetherFly create() => ConfessTogetherFly._();
  ConfessTogetherFly createEmptyInstance() => create();
  static $pb.PbList<ConfessTogetherFly> createRepeated() =>
      $pb.PbList<ConfessTogetherFly>();
  @$core.pragma('dart2js:noInline')
  static ConfessTogetherFly getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfessTogetherFly>(create);
  static ConfessTogetherFly? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backImg => $_getSZ(0);
  @$pb.TagNumber(1)
  set backImg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBackImg() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackImg() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uicon => $_getSZ(2);
  @$pb.TagNumber(3)
  set uicon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUicon() => $_has(2);
  @$pb.TagNumber(3)
  void clearUicon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uname => $_getSZ(3);
  @$pb.TagNumber(4)
  set uname($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUname() => $_has(3);
  @$pb.TagNumber(4)
  void clearUname() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get giftId => $_getIZ(4);
  @$pb.TagNumber(5)
  set giftId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftId() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get toicon => $_getSZ(6);
  @$pb.TagNumber(7)
  set toicon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasToicon() => $_has(6);
  @$pb.TagNumber(7)
  void clearToicon() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get toname => $_getSZ(7);
  @$pb.TagNumber(8)
  set toname($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasToname() => $_has(7);
  @$pb.TagNumber(8)
  void clearToname() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get rid => $_getIZ(8);
  @$pb.TagNumber(9)
  set rid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRid() => $_has(8);
  @$pb.TagNumber(9)
  void clearRid() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get rname => $_getSZ(9);
  @$pb.TagNumber(10)
  set rname($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRname() => $_has(9);
  @$pb.TagNumber(10)
  void clearRname() => clearField(10);
}
