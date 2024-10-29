///
//  Generated code. Do not modify.
//  source: room.emperor.notice.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomEmperorNotice_FansLabel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomEmperorNotice.FansLabel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.emperor.notice'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'credit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomEmperorNotice_FansLabel._() : super();
  factory RoomEmperorNotice_FansLabel({
    $core.String? label,
    $core.int? credit,
    $core.int? level,
  }) {
    final _result = create();
    if (label != null) {
      _result.label = label;
    }
    if (credit != null) {
      _result.credit = credit;
    }
    if (level != null) {
      _result.level = level;
    }
    return _result;
  }
  factory RoomEmperorNotice_FansLabel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomEmperorNotice_FansLabel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomEmperorNotice_FansLabel clone() =>
      RoomEmperorNotice_FansLabel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomEmperorNotice_FansLabel copyWith(
          void Function(RoomEmperorNotice_FansLabel) updates) =>
      super.copyWith(
              (message) => updates(message as RoomEmperorNotice_FansLabel))
          as RoomEmperorNotice_FansLabel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomEmperorNotice_FansLabel create() =>
      RoomEmperorNotice_FansLabel._();
  RoomEmperorNotice_FansLabel createEmptyInstance() => create();
  static $pb.PbList<RoomEmperorNotice_FansLabel> createRepeated() =>
      $pb.PbList<RoomEmperorNotice_FansLabel>();
  @$core.pragma('dart2js:noInline')
  static RoomEmperorNotice_FansLabel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEmperorNotice_FansLabel>(create);
  static RoomEmperorNotice_FansLabel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get credit => $_getIZ(1);
  @$pb.TagNumber(2)
  set credit($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCredit() => $_has(1);
  @$pb.TagNumber(2)
  void clearCredit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);
}

class RoomEmperorNotice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomEmperorNotice',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.emperor.notice'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bless_words')
    ..aOM<RoomEmperorNotice_FansLabel>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fans_label',
        subBuilder: RoomEmperorNotice_FansLabel.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3,
        protoName: 'giftId')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        $pb.PbFieldType.OU3,
        protoName: 'giftNum')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icongray')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rname')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toname')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tovip',
        $pb.PbFieldType.OU3)
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
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle',
        $pb.PbFieldType.OU3)
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
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_newer',
        $pb.PbFieldType.OU3)
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toicon')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'glory_naming')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_name')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from_outstanding_box',
        $pb.PbFieldType.OU3)
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ricon')
    ..hasRequiredFields = false;

  RoomEmperorNotice._() : super();
  factory RoomEmperorNotice({
    $core.String? blessWords,
    RoomEmperorNotice_FansLabel? fansLabel,
    $core.String? frame,
    $core.int? giftId,
    $core.int? giftNum,
    $core.bool? icongray,
    $core.int? money,
    $core.int? rid,
    $core.String? rname,
    $core.String? toname,
    $core.int? tovip,
    $core.String? uicon,
    $core.String? uname,
    $core.int? utitle,
    $core.int? utitleNew,
    $core.int? uvip,
    $core.int? isNewer,
    $core.String? toicon,
    $core.String? gloryNaming,
    $core.String? giftName,
    $core.int? fromOutstandingBox,
    $core.String? ricon,
  }) {
    final _result = create();
    if (blessWords != null) {
      _result.blessWords = blessWords;
    }
    if (fansLabel != null) {
      _result.fansLabel = fansLabel;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (icongray != null) {
      _result.icongray = icongray;
    }
    if (money != null) {
      _result.money = money;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (rname != null) {
      _result.rname = rname;
    }
    if (toname != null) {
      _result.toname = toname;
    }
    if (tovip != null) {
      _result.tovip = tovip;
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
    if (isNewer != null) {
      _result.isNewer = isNewer;
    }
    if (toicon != null) {
      _result.toicon = toicon;
    }
    if (gloryNaming != null) {
      _result.gloryNaming = gloryNaming;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (fromOutstandingBox != null) {
      _result.fromOutstandingBox = fromOutstandingBox;
    }
    if (ricon != null) {
      _result.ricon = ricon;
    }
    return _result;
  }
  factory RoomEmperorNotice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomEmperorNotice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomEmperorNotice clone() => RoomEmperorNotice()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomEmperorNotice copyWith(void Function(RoomEmperorNotice) updates) =>
      super.copyWith((message) => updates(message as RoomEmperorNotice))
          as RoomEmperorNotice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomEmperorNotice create() => RoomEmperorNotice._();
  RoomEmperorNotice createEmptyInstance() => create();
  static $pb.PbList<RoomEmperorNotice> createRepeated() =>
      $pb.PbList<RoomEmperorNotice>();
  @$core.pragma('dart2js:noInline')
  static RoomEmperorNotice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEmperorNotice>(create);
  static RoomEmperorNotice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get blessWords => $_getSZ(0);
  @$pb.TagNumber(1)
  set blessWords($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBlessWords() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlessWords() => clearField(1);

  @$pb.TagNumber(2)
  RoomEmperorNotice_FansLabel get fansLabel => $_getN(1);
  @$pb.TagNumber(2)
  set fansLabel(RoomEmperorNotice_FansLabel v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFansLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearFansLabel() => clearField(2);
  @$pb.TagNumber(2)
  RoomEmperorNotice_FansLabel ensureFansLabel() => $_ensure(1);

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
  $core.int get giftId => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get giftNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set giftNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get icongray => $_getBF(5);
  @$pb.TagNumber(6)
  set icongray($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcongray() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcongray() => clearField(6);

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
  $core.int get rid => $_getIZ(7);
  @$pb.TagNumber(8)
  set rid($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRid() => $_has(7);
  @$pb.TagNumber(8)
  void clearRid() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get rname => $_getSZ(8);
  @$pb.TagNumber(9)
  set rname($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRname() => $_has(8);
  @$pb.TagNumber(9)
  void clearRname() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get toname => $_getSZ(9);
  @$pb.TagNumber(10)
  set toname($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasToname() => $_has(9);
  @$pb.TagNumber(10)
  void clearToname() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get tovip => $_getIZ(10);
  @$pb.TagNumber(11)
  set tovip($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTovip() => $_has(10);
  @$pb.TagNumber(11)
  void clearTovip() => clearField(11);

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
  $core.int get utitle => $_getIZ(13);
  @$pb.TagNumber(14)
  set utitle($core.int v) {
    $_setUnsignedInt32(13, v);
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

  @$pb.TagNumber(17)
  $core.int get isNewer => $_getIZ(16);
  @$pb.TagNumber(17)
  set isNewer($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasIsNewer() => $_has(16);
  @$pb.TagNumber(17)
  void clearIsNewer() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get toicon => $_getSZ(17);
  @$pb.TagNumber(18)
  set toicon($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasToicon() => $_has(17);
  @$pb.TagNumber(18)
  void clearToicon() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get gloryNaming => $_getSZ(18);
  @$pb.TagNumber(19)
  set gloryNaming($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasGloryNaming() => $_has(18);
  @$pb.TagNumber(19)
  void clearGloryNaming() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get giftName => $_getSZ(19);
  @$pb.TagNumber(20)
  set giftName($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasGiftName() => $_has(19);
  @$pb.TagNumber(20)
  void clearGiftName() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get fromOutstandingBox => $_getIZ(20);
  @$pb.TagNumber(21)
  set fromOutstandingBox($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasFromOutstandingBox() => $_has(20);
  @$pb.TagNumber(21)
  void clearFromOutstandingBox() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get ricon => $_getSZ(21);
  @$pb.TagNumber(22)
  set ricon($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasRicon() => $_has(21);
  @$pb.TagNumber(22)
  void clearRicon() => clearField(22);
}
