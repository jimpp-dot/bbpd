///
//  Generated code. Do not modify.
//  source: room.auction.upgrade.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomAuctionUpgrade extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomAuctionUpgrade',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.auction.upgrade'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendLevel',
        $pb.PbFieldType.OU3,
        protoName: 'defendLevel')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendTitle',
        protoName: 'defendTitle')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icongray')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_newer',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rname')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toicon')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toname')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tovip',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle_new',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uvip',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomAuctionUpgrade._() : super();
  factory RoomAuctionUpgrade({
    $core.int? defendLevel,
    $core.String? defendTitle,
    $core.String? frame,
    $core.bool? icongray,
    $core.int? isNewer,
    $core.int? rid,
    $core.String? rname,
    $core.String? toicon,
    $core.String? toname,
    $core.int? tovip,
    $core.String? type,
    $core.String? uicon,
    $core.String? uname,
    $core.String? utitle,
    $core.int? utitleNew,
    $core.int? uvip,
  }) {
    final _result = create();
    if (defendLevel != null) {
      _result.defendLevel = defendLevel;
    }
    if (defendTitle != null) {
      _result.defendTitle = defendTitle;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (icongray != null) {
      _result.icongray = icongray;
    }
    if (isNewer != null) {
      _result.isNewer = isNewer;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (rname != null) {
      _result.rname = rname;
    }
    if (toicon != null) {
      _result.toicon = toicon;
    }
    if (toname != null) {
      _result.toname = toname;
    }
    if (tovip != null) {
      _result.tovip = tovip;
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
    if (utitle != null) {
      _result.utitle = utitle;
    }
    if (utitleNew != null) {
      _result.utitleNew = utitleNew;
    }
    if (uvip != null) {
      _result.uvip = uvip;
    }
    return _result;
  }
  factory RoomAuctionUpgrade.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomAuctionUpgrade.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomAuctionUpgrade clone() => RoomAuctionUpgrade()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomAuctionUpgrade copyWith(void Function(RoomAuctionUpgrade) updates) =>
      super.copyWith((message) => updates(message as RoomAuctionUpgrade))
          as RoomAuctionUpgrade; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomAuctionUpgrade create() => RoomAuctionUpgrade._();
  RoomAuctionUpgrade createEmptyInstance() => create();
  static $pb.PbList<RoomAuctionUpgrade> createRepeated() =>
      $pb.PbList<RoomAuctionUpgrade>();
  @$core.pragma('dart2js:noInline')
  static RoomAuctionUpgrade getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomAuctionUpgrade>(create);
  static RoomAuctionUpgrade? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get defendLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set defendLevel($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDefendLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearDefendLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get defendTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set defendTitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDefendTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefendTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get frame => $_getSZ(2);
  @$pb.TagNumber(3)
  set frame($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFrame() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrame() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get icongray => $_getBF(3);
  @$pb.TagNumber(4)
  set icongray($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcongray() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcongray() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get isNewer => $_getIZ(4);
  @$pb.TagNumber(5)
  set isNewer($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsNewer() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsNewer() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get rid => $_getIZ(5);
  @$pb.TagNumber(6)
  set rid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRid() => $_has(5);
  @$pb.TagNumber(6)
  void clearRid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get rname => $_getSZ(6);
  @$pb.TagNumber(7)
  set rname($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRname() => $_has(6);
  @$pb.TagNumber(7)
  void clearRname() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get toicon => $_getSZ(7);
  @$pb.TagNumber(8)
  set toicon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasToicon() => $_has(7);
  @$pb.TagNumber(8)
  void clearToicon() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get toname => $_getSZ(8);
  @$pb.TagNumber(9)
  set toname($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasToname() => $_has(8);
  @$pb.TagNumber(9)
  void clearToname() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get tovip => $_getIZ(9);
  @$pb.TagNumber(10)
  set tovip($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTovip() => $_has(9);
  @$pb.TagNumber(10)
  void clearTovip() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get type => $_getSZ(10);
  @$pb.TagNumber(11)
  set type($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasType() => $_has(10);
  @$pb.TagNumber(11)
  void clearType() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get uicon => $_getSZ(11);
  @$pb.TagNumber(12)
  set uicon($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasUicon() => $_has(11);
  @$pb.TagNumber(12)
  void clearUicon() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get uname => $_getSZ(12);
  @$pb.TagNumber(13)
  set uname($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasUname() => $_has(12);
  @$pb.TagNumber(13)
  void clearUname() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get utitle => $_getSZ(13);
  @$pb.TagNumber(14)
  set utitle($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUtitle() => $_has(13);
  @$pb.TagNumber(14)
  void clearUtitle() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get utitleNew => $_getIZ(14);
  @$pb.TagNumber(15)
  set utitleNew($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasUtitleNew() => $_has(14);
  @$pb.TagNumber(15)
  void clearUtitleNew() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get uvip => $_getIZ(15);
  @$pb.TagNumber(16)
  set uvip($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasUvip() => $_has(15);
  @$pb.TagNumber(16)
  void clearUvip() => clearField(16);
}
