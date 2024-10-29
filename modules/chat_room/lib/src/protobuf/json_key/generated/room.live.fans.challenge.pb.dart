///
//  Generated code. Do not modify.
//  source: room.live.fans.challenge.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomLiveFansChanllenge extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomLiveFansChanllenge',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.live.fans.challenge'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uvip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rname')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomLiveFansChanllenge._() : super();
  factory RoomLiveFansChanllenge({
    $core.String? type,
    $core.String? uname,
    $core.String? uicon,
    $core.int? uvip,
    $core.int? rid,
    $core.String? rname,
    $core.int? level,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (uicon != null) {
      _result.uicon = uicon;
    }
    if (uvip != null) {
      _result.uvip = uvip;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (rname != null) {
      _result.rname = rname;
    }
    if (level != null) {
      _result.level = level;
    }
    return _result;
  }
  factory RoomLiveFansChanllenge.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomLiveFansChanllenge.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomLiveFansChanllenge clone() =>
      RoomLiveFansChanllenge()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomLiveFansChanllenge copyWith(
          void Function(RoomLiveFansChanllenge) updates) =>
      super.copyWith((message) => updates(message as RoomLiveFansChanllenge))
          as RoomLiveFansChanllenge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomLiveFansChanllenge create() => RoomLiveFansChanllenge._();
  RoomLiveFansChanllenge createEmptyInstance() => create();
  static $pb.PbList<RoomLiveFansChanllenge> createRepeated() =>
      $pb.PbList<RoomLiveFansChanllenge>();
  @$core.pragma('dart2js:noInline')
  static RoomLiveFansChanllenge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomLiveFansChanllenge>(create);
  static RoomLiveFansChanllenge? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uname => $_getSZ(1);
  @$pb.TagNumber(2)
  set uname($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUname() => $_has(1);
  @$pb.TagNumber(2)
  void clearUname() => clearField(2);

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
  $core.int get uvip => $_getIZ(3);
  @$pb.TagNumber(4)
  set uvip($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUvip() => $_has(3);
  @$pb.TagNumber(4)
  void clearUvip() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rid => $_getIZ(4);
  @$pb.TagNumber(5)
  set rid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRid() => $_has(4);
  @$pb.TagNumber(5)
  void clearRid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get rname => $_getSZ(5);
  @$pb.TagNumber(6)
  set rname($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRname() => $_has(5);
  @$pb.TagNumber(6)
  void clearRname() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get level => $_getIZ(6);
  @$pb.TagNumber(7)
  set level($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearLevel() => clearField(7);
}
