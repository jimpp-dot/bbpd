///
//  Generated code. Do not modify.
//  source: room.red.packet.notice.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomRedPacketNotice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRedPacketNotice',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.red.packet.notice'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uvip',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle_new',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
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
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  RoomRedPacketNotice._() : super();
  factory RoomRedPacketNotice({
    $core.int? uvip,
    $core.String? uname,
    $core.String? utitle,
    $core.int? utitleNew,
    $core.String? uicon,
    $core.String? icon,
    $core.int? money,
    $core.String? type,
    $core.int? rid,
    $core.String? rname,
    $core.String? desc,
  }) {
    final _result = create();
    if (uvip != null) {
      _result.uvip = uvip;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (utitle != null) {
      _result.utitle = utitle;
    }
    if (utitleNew != null) {
      _result.utitleNew = utitleNew;
    }
    if (uicon != null) {
      _result.uicon = uicon;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (money != null) {
      _result.money = money;
    }
    if (type != null) {
      _result.type = type;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (rname != null) {
      _result.rname = rname;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory RoomRedPacketNotice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRedPacketNotice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRedPacketNotice clone() => RoomRedPacketNotice()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRedPacketNotice copyWith(void Function(RoomRedPacketNotice) updates) =>
      super.copyWith((message) => updates(message as RoomRedPacketNotice))
          as RoomRedPacketNotice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRedPacketNotice create() => RoomRedPacketNotice._();
  RoomRedPacketNotice createEmptyInstance() => create();
  static $pb.PbList<RoomRedPacketNotice> createRepeated() =>
      $pb.PbList<RoomRedPacketNotice>();
  @$core.pragma('dart2js:noInline')
  static RoomRedPacketNotice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRedPacketNotice>(create);
  static RoomRedPacketNotice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uvip => $_getIZ(0);
  @$pb.TagNumber(1)
  set uvip($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUvip() => $_has(0);
  @$pb.TagNumber(1)
  void clearUvip() => clearField(1);

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
  $core.String get utitle => $_getSZ(2);
  @$pb.TagNumber(3)
  set utitle($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUtitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearUtitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get utitleNew => $_getIZ(3);
  @$pb.TagNumber(4)
  set utitleNew($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUtitleNew() => $_has(3);
  @$pb.TagNumber(4)
  void clearUtitleNew() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get uicon => $_getSZ(4);
  @$pb.TagNumber(5)
  set uicon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUicon() => $_has(4);
  @$pb.TagNumber(5)
  void clearUicon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get money => $_getIZ(6);
  @$pb.TagNumber(7)
  set money($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMoney() => $_has(6);
  @$pb.TagNumber(7)
  void clearMoney() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get type => $_getSZ(7);
  @$pb.TagNumber(8)
  set type($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasType() => $_has(7);
  @$pb.TagNumber(8)
  void clearType() => clearField(8);

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

  @$pb.TagNumber(11)
  $core.String get desc => $_getSZ(10);
  @$pb.TagNumber(11)
  set desc($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasDesc() => $_has(10);
  @$pb.TagNumber(11)
  void clearDesc() => clearField(11);
}
