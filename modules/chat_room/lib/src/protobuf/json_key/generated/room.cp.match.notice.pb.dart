///
//  Generated code. Do not modify.
//  source: room.cp.match.notice.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomCpMatchNotice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCpMatchNotice',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.cp.match.notice'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icongray')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_newer',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
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
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totitle')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totitle_new',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tovip',
        $pb.PbFieldType.OU3)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle_new',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uvip',
        $pb.PbFieldType.OU3)
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'word')
    ..hasRequiredFields = false;

  RoomCpMatchNotice._() : super();
  factory RoomCpMatchNotice({
    $core.String? frame,
    $core.bool? icongray,
    $core.int? isNewer,
    $core.int? level,
    $core.int? num,
    $core.int? rid,
    $core.String? rname,
    $core.String? toicon,
    $core.String? toname,
    $core.String? totitle,
    $core.int? totitleNew,
    $core.int? tovip,
    $core.String? type,
    $core.String? uicon,
    $core.String? uname,
    $core.String? utitle,
    $core.int? utitleNew,
    $core.int? uvip,
    $core.String? word,
  }) {
    final _result = create();
    if (frame != null) {
      _result.frame = frame;
    }
    if (icongray != null) {
      _result.icongray = icongray;
    }
    if (isNewer != null) {
      _result.isNewer = isNewer;
    }
    if (level != null) {
      _result.level = level;
    }
    if (num != null) {
      _result.num = num;
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
    if (totitle != null) {
      _result.totitle = totitle;
    }
    if (totitleNew != null) {
      _result.totitleNew = totitleNew;
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
    if (word != null) {
      _result.word = word;
    }
    return _result;
  }
  factory RoomCpMatchNotice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCpMatchNotice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCpMatchNotice clone() => RoomCpMatchNotice()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCpMatchNotice copyWith(void Function(RoomCpMatchNotice) updates) =>
      super.copyWith((message) => updates(message as RoomCpMatchNotice))
          as RoomCpMatchNotice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCpMatchNotice create() => RoomCpMatchNotice._();
  RoomCpMatchNotice createEmptyInstance() => create();
  static $pb.PbList<RoomCpMatchNotice> createRepeated() =>
      $pb.PbList<RoomCpMatchNotice>();
  @$core.pragma('dart2js:noInline')
  static RoomCpMatchNotice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCpMatchNotice>(create);
  static RoomCpMatchNotice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get frame => $_getSZ(0);
  @$pb.TagNumber(1)
  set frame($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrame() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrame() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get icongray => $_getBF(1);
  @$pb.TagNumber(2)
  set icongray($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIcongray() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcongray() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get isNewer => $_getIZ(2);
  @$pb.TagNumber(3)
  set isNewer($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsNewer() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsNewer() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get num => $_getIZ(4);
  @$pb.TagNumber(5)
  set num($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearNum() => clearField(5);

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
  $core.String get totitle => $_getSZ(9);
  @$pb.TagNumber(10)
  set totitle($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTotitle() => $_has(9);
  @$pb.TagNumber(10)
  void clearTotitle() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get totitleNew => $_getIZ(10);
  @$pb.TagNumber(11)
  set totitleNew($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTotitleNew() => $_has(10);
  @$pb.TagNumber(11)
  void clearTotitleNew() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get tovip => $_getIZ(11);
  @$pb.TagNumber(12)
  set tovip($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTovip() => $_has(11);
  @$pb.TagNumber(12)
  void clearTovip() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get type => $_getSZ(12);
  @$pb.TagNumber(13)
  set type($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasType() => $_has(12);
  @$pb.TagNumber(13)
  void clearType() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get uicon => $_getSZ(13);
  @$pb.TagNumber(14)
  set uicon($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUicon() => $_has(13);
  @$pb.TagNumber(14)
  void clearUicon() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get uname => $_getSZ(14);
  @$pb.TagNumber(15)
  set uname($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasUname() => $_has(14);
  @$pb.TagNumber(15)
  void clearUname() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get utitle => $_getSZ(15);
  @$pb.TagNumber(16)
  set utitle($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasUtitle() => $_has(15);
  @$pb.TagNumber(16)
  void clearUtitle() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get utitleNew => $_getIZ(16);
  @$pb.TagNumber(17)
  set utitleNew($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasUtitleNew() => $_has(16);
  @$pb.TagNumber(17)
  void clearUtitleNew() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get uvip => $_getIZ(17);
  @$pb.TagNumber(18)
  set uvip($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasUvip() => $_has(17);
  @$pb.TagNumber(18)
  void clearUvip() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get word => $_getSZ(18);
  @$pb.TagNumber(19)
  set word($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasWord() => $_has(18);
  @$pb.TagNumber(19)
  void clearWord() => clearField(19);
}
